/*
    15 = resource | span | event | link
*/
INSERT INTO SCHEMA_TRACING.tag_key (id, key, tag_type)
OVERRIDING SYSTEM VALUE
VALUES
    (1, 'service.name', 15),
    (2, 'service.namespace', 15),
    (3, 'service.instance.id', 15),
    (4, 'service.version', 15),
    (5, 'telemetry.sdk.name', 15),
    (6, 'telemetry.sdk.language', 15),
    (7, 'telemetry.sdk.version', 15),
    (8, 'telemetry.auto.version', 15),
    (9, 'container.name', 15),
    (10, 'container.id', 15),
    (11, 'container.runtime', 15),
    (12, 'container.image.name', 15),
    (13, 'container.image.tag', 15),
    (14, 'faas.name', 15),
    (15, 'faas.id', 15),
    (16, 'faas.version', 15),
    (17, 'faas.instance', 15),
    (18, 'faas.max_memory', 15),
    (19, 'process.pid', 15),
    (20, 'process.executable.name', 15),
    (21, 'process.executable.path', 15),
    (22, 'process.command', 15),
    (23, 'process.command_line', 15),
    (24, 'process.command_args', 15),
    (25, 'process.owner', 15),
    (26, 'process.runtime.name', 15),
    (27, 'process.runtime.version', 15),
    (28, 'process.runtime.description', 15),
    (29, 'webengine.name', 15),
    (30, 'webengine.version', 15),
    (31, 'webengine.description', 15),
    (32, 'host.id', 15),
    (33, 'host.name', 15),
    (34, 'host.type', 15),
    (35, 'host.arch', 15),
    (36, 'host.image.name', 15),
    (37, 'host.image.id', 15),
    (38, 'host.image.version', 15),
    (39, 'os.type', 15),
    (40, 'os.description', 15),
    (41, 'os.name', 15),
    (42, 'os.version', 15),
    (43, 'device.id', 15),
    (44, 'device.model.identifier', 15),
    (45, 'device.model.name', 15),
    (46, 'cloud.provider', 15),
    (47, 'cloud.account.id', 15),
    (48, 'cloud.region', 15),
    (49, 'cloud.availability_zone', 15),
    (50, 'cloud.platform', 15),
    (51, 'deployment.environment', 15),
    (52, 'k8s.cluster', 15),
    (53, 'k8s.node.name', 15),
    (54, 'k8s.node.uid', 15),
    (55, 'k8s.namespace.name', 15),
    (56, 'k8s.pod.uid', 15),
    (57, 'k8s.pod.name', 15),
    (58, 'k8s.container.name', 15),
    (59, 'k8s.replicaset.uid', 15),
    (60, 'k8s.replicaset.name', 15),
    (61, 'k8s.deployment.uid', 15),
    (62, 'k8s.deployment.name', 15),
    (63, 'k8s.statefulset.uid', 15),
    (64, 'k8s.statefulset.name', 15),
    (65, 'k8s.daemonset.uid', 15),
    (66, 'k8s.daemonset.name', 15),
    (67, 'k8s.job.uid', 15),
    (68, 'k8s.job.name', 15),
    (69, 'k8s.cronjob.uid', 15),
    (70, 'k8s.cronjob.name', 15),
    (71, 'net.transport', 15),
    (72, 'net.peer.ip', 15),
    (73, 'net.peer.port', 15),
    (74, 'net.peer.name', 15),
    (75, 'net.host.ip', 15),
    (76, 'net.host.port', 15),
    (77, 'net.host.name', 15),
    (78, 'net.host.connection.type', 15),
    (79, 'net.host.connection.subtype', 15),
    (80, 'net.host.carrier.name', 15),
    (81, 'net.host.carrier.mcc', 15),
    (82, 'net.host.carrier.mnc', 15),
    (83, 'net.host.carrier.icc', 15),
    (84, 'peer.service', 15),
    (85, 'enduser.id', 15),
    (86, 'enduser.role', 15),
    (87, 'enduser.scope', 15),
    (88, 'thread.id', 15),
    (89, 'thread.name', 15),
    (90, 'code.function', 15),
    (91, 'code.namespace', 15),
    (92, 'code.filepath', 15),
    (93, 'code.lineno', 15),
    (94, 'http.method', 15),
    (95, 'http.url', 15),
    (96, 'http.target', 15),
    (97, 'http.host', 15),
    (98, 'http.scheme', 15),
    (99, 'http.status_code', 15),
    (100, 'http.flavor', 15),
    (101, 'http.user_agent', 15),
    (102, 'http.request_content_length', 15),
    (103, 'http.request_content_length_uncompressed', 15),
    (104, 'http.response_content_length', 15),
    (105, 'http.response_content_length_uncompressed', 15),
    (106, 'http.server_name', 15),
    (107, 'http.route', 15),
    (108, 'http.client_ip', 15),
    (109, 'db.system', 15),
    (110, 'db.connection_string', 15),
    (111, 'db.user', 15),
    (112, 'db.jdbc.driver_classname', 15),
    (113, 'db.mssql.instance_name', 15),
    (114, 'db.name', 15),
    (115, 'db.statement', 15),
    (116, 'db.operation', 15),
    (117, 'db.hbase.namespace', 15),
    (118, 'db.redis.database_index', 15),
    (119, 'db.mongodb.collection', 15),
    (120, 'db.sql.table', 15),
    (121, 'db.cassandra.keyspace', 15),
    (122, 'db.cassandra.page_size', 15),
    (123, 'db.cassandra.consistency_level', 15),
    (124, 'db.cassandra.table', 15),
    (125, 'db.cassandra.idempotence', 15),
    (126, 'db.cassandra.speculative_execution_count', 15),
    (127, 'db.cassandra.coordinator.id', 15),
    (128, 'db.cassandra.coordinator.dc', 15),
    (129, 'rpc.system', 15),
    (130, 'rpc.service', 15),
    (131, 'rpc.method', 15),
    (132, 'rpc.grpc.status_code', 15),
    (133, 'message.type', 15),
    (134, 'message.id', 15),
    (135, 'message.compressed_size', 15),
    (136, 'message.uncompressed_size', 15),
    (137, 'rpc.jsonrpc.version', 15),
    (138, 'rpc.jsonrpc.request_id', 15),
    (139, 'rpc.jsonrpc.error_code', 15),
    (140, 'rpc.jsonrpc.error_message', 15),
    (141, 'messaging.system', 15),
    (142, 'messaging.destination', 15),
    (143, 'messaging.destination_kind', 15),
    (144, 'messaging.temp_destination', 15),
    (145, 'messaging.protocol', 15),
    (146, 'messaging.url', 15),
    (147, 'messaging.message_id', 15),
    (148, 'messaging.conversation_id', 15),
    (149, 'messaging.message_payload_size_bytes', 15),
    (150, 'messaging.message_payload_compressed_size_bytes', 15),
    (151, 'messaging.operation', 15),
    (152, 'messaging.consumer_id', 15),
    (153, 'messaging.rabbitmq.routing_key', 15),
    (154, 'messaging.kafka.message_key', 15),
    (155, 'messaging.kafka.consumer_group', 15),
    (156, 'messaging.kafka.client_id', 15),
    (157, 'messaging.kafka.partition', 15),
    (158, 'messaging.kafka.tombstone', 15),
    (159, 'faas.trigger', 15),
    (160, 'faas.speculative_execution_count', 15),
    (161, 'faas.coldstart', 15),
    (162, 'faas.invoked_name', 15),
    (163, 'faas.invoked_provider', 15),
    (164, 'faas.invoked_region', 15),
    (165, 'faas.document.collection', 15),
    (166, 'faas.document.operation', 15),
    (167, 'faas.document.time', 15),
    (168, 'faas.document.name', 15),
    (169, 'faas.time', 15),
    (170, 'faas.cron', 15),
    (171, 'exception.type', 15),
    (172, 'exception.message', 15),
    (173, 'exception.stacktrace', 15),
    (174, 'exception.escaped', 15)
;
SELECT setval('SCHEMA_TRACING.tag_key_id_seq', 1000);
