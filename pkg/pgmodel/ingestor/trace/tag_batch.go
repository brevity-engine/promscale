// This file and its contents are licensed under the Apache License 2.0.
// Please see the included NOTICE for copyright information and
// LICENSE for a copy of the license.

package trace

import (
	"context"
	"encoding/json"
	"fmt"
	"sort"

	"github.com/timescale/promscale/pkg/pgmodel/common/schema"
	"github.com/timescale/promscale/pkg/pgxconn"
)

const (
	insertTagKeySQL = "SELECT %s.put_tag_key($1, $2::%s.tag_type)"
	insertTagSQL    = "SELECT %s.put_tag($1, $2, $3::%s.tag_type)"
)

type tag struct {
	key   string
	value string
	typ   TagType
}

type tagIDs struct {
	keyID   int64
	valueID int64
}

//tagBatch queues up items to send to the db but it sorts before sending
//this avoids deadlocks in the db. It also avoids sending the same tags repeatedly.
type tagBatch map[tag]tagIDs

func newTagBatch() tagBatch {
	return make(map[tag]tagIDs)
}

func (batch tagBatch) Queue(tags map[string]interface{}, typ TagType) error {
	for k, v := range tags {
		byteVal, err := json.Marshal(v)
		if err != nil {
			return err
		}
		batch[tag{k, string(byteVal), typ}] = tagIDs{}
	}
	return nil
}

func (batch tagBatch) SendBatch(ctx context.Context, conn pgxconn.PgxConn) error {
	tags := make([]tag, len(batch))
	i := 0
	for op := range batch {
		tags[i] = op
		i++
	}
	sort.Slice(tags, func(i, j int) bool {
		if tags[i].key == tags[j].key {
			if tags[i].value == tags[j].value {
				return tags[i].typ < tags[j].typ
			}
			return tags[i].value < tags[j].value
		}
		return tags[i].key < tags[j].key
	})

	dbBatch := conn.NewBatch()
	for _, tag := range tags {
		dbBatch.Queue(fmt.Sprintf(insertTagKeySQL, schema.TracePublic, schema.TracePublic), tag.key, tag.typ)
		dbBatch.Queue(fmt.Sprintf(insertTagSQL, schema.TracePublic, schema.TracePublic),
			tag.key,
			tag.value,
			tag.typ,
		)
	}

	br, err := conn.SendBatch(ctx, dbBatch)
	if err != nil {
		return err
	}
	for _, tag := range tags {
		var keyID int64
		var valueID int64
		if err := br.QueryRow().Scan(&keyID); err != nil {
			return err
		}
		if err := br.QueryRow().Scan(&valueID); err != nil {
			return err
		}
		batch[tag] = tagIDs{keyID: keyID, valueID: valueID}
	}
	if err = br.Close(); err != nil {
		return err
	}
	return nil
}

func (batch tagBatch) GetTagMapJSON(tags map[string]interface{}, typ TagType) ([]byte, error) {
	tagMap := make(map[int64]int64)
	for k, v := range tags {
		byteVal, err := json.Marshal(v)
		if err != nil {
			return nil, err
		}
		ids, ok := batch[tag{k, string(byteVal), typ}]
		if !ok || ids.keyID == 0 || ids.valueID == 0 {
			return nil, fmt.Errorf("tag id not found: %s %v(rendered as %s) %v", k, v, string(byteVal), typ)

		}
		tagMap[ids.keyID] = ids.valueID
	}

	jsonBytes, err := json.Marshal(tagMap)
	if err != nil {
		return nil, err
	}
	return jsonBytes, nil
}