/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : PostgreSQL
 Source Server Version : 140002
 Source Host           : localhost:5432
 Source Catalog        : chirpstack_as
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140002
 File Encoding         : 65001

 Date: 25/04/2022 15:58:18
*/


-- ----------------------------
-- Sequence structure for application_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."application_id_seq";
CREATE SEQUENCE "public"."application_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."application_id_seq" OWNER TO "kerry";

-- ----------------------------
-- Sequence structure for application_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."application_user_id_seq";
CREATE SEQUENCE "public"."application_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."application_user_id_seq" OWNER TO "kerry";

-- ----------------------------
-- Sequence structure for device_activation_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."device_activation_id_seq";
CREATE SEQUENCE "public"."device_activation_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."device_activation_id_seq" OWNER TO "kerry";

-- ----------------------------
-- Sequence structure for device_queue_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."device_queue_id_seq";
CREATE SEQUENCE "public"."device_queue_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."device_queue_id_seq" OWNER TO "kerry";

-- ----------------------------
-- Sequence structure for device_queue_mapping_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."device_queue_mapping_id_seq";
CREATE SEQUENCE "public"."device_queue_mapping_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."device_queue_mapping_id_seq" OWNER TO "kerry";

-- ----------------------------
-- Sequence structure for downlink_queue_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."downlink_queue_id_seq";
CREATE SEQUENCE "public"."downlink_queue_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."downlink_queue_id_seq" OWNER TO "kerry";

-- ----------------------------
-- Sequence structure for gateway_ping_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gateway_ping_id_seq";
CREATE SEQUENCE "public"."gateway_ping_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."gateway_ping_id_seq" OWNER TO "kerry";

-- ----------------------------
-- Sequence structure for gateway_ping_rx_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gateway_ping_rx_id_seq";
CREATE SEQUENCE "public"."gateway_ping_rx_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."gateway_ping_rx_id_seq" OWNER TO "kerry";

-- ----------------------------
-- Sequence structure for integration_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."integration_id_seq";
CREATE SEQUENCE "public"."integration_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."integration_id_seq" OWNER TO "kerry";

-- ----------------------------
-- Sequence structure for network_server_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."network_server_id_seq";
CREATE SEQUENCE "public"."network_server_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."network_server_id_seq" OWNER TO "kerry";

-- ----------------------------
-- Sequence structure for organization_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."organization_id_seq";
CREATE SEQUENCE "public"."organization_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."organization_id_seq" OWNER TO "kerry";

-- ----------------------------
-- Sequence structure for organization_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."organization_user_id_seq";
CREATE SEQUENCE "public"."organization_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."organization_user_id_seq" OWNER TO "kerry";

-- ----------------------------
-- Sequence structure for user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_id_seq";
CREATE SEQUENCE "public"."user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."user_id_seq" OWNER TO "kerry";

-- ----------------------------
-- Table structure for api_key
-- ----------------------------
DROP TABLE IF EXISTS "public"."api_key";
CREATE TABLE "public"."api_key" (
  "id" uuid NOT NULL,
  "created_at" timestamptz(6) NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "is_admin" bool NOT NULL DEFAULT false,
  "organization_id" int8,
  "application_id" int8
)
;
ALTER TABLE "public"."api_key" OWNER TO "postgres";

-- ----------------------------
-- Records of api_key
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS "public"."application";
CREATE TABLE "public"."application" (
  "id" int8 NOT NULL DEFAULT nextval('application_id_seq'::regclass),
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default" NOT NULL,
  "organization_id" int8 NOT NULL,
  "service_profile_id" uuid,
  "payload_codec" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "payload_encoder_script" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "payload_decoder_script" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text
)
;
ALTER TABLE "public"."application" OWNER TO "kerry";

-- ----------------------------
-- Records of application
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for application_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."application_user";
CREATE TABLE "public"."application_user" (
  "id" int8 NOT NULL DEFAULT nextval('application_user_id_seq'::regclass),
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL,
  "user_id" int8 NOT NULL,
  "application_id" int8 NOT NULL,
  "is_admin" bool NOT NULL
)
;
ALTER TABLE "public"."application_user" OWNER TO "kerry";

-- ----------------------------
-- Records of application_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS "public"."device";
CREATE TABLE "public"."device" (
  "dev_eui" bytea NOT NULL,
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL,
  "application_id" int8 NOT NULL,
  "device_profile_id" uuid NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default" NOT NULL,
  "last_seen_at" timestamptz(6),
  "device_status_battery" int4,
  "device_status_margin" int4,
  "dr" int2
)
;
ALTER TABLE "public"."device" OWNER TO "kerry";

-- ----------------------------
-- Records of device
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for device_activation
-- ----------------------------
DROP TABLE IF EXISTS "public"."device_activation";
CREATE TABLE "public"."device_activation" (
  "id" int8 NOT NULL DEFAULT nextval('device_activation_id_seq'::regclass),
  "created_at" timestamptz(6) NOT NULL,
  "dev_eui" bytea NOT NULL,
  "dev_addr" bytea NOT NULL,
  "app_s_key" bytea NOT NULL,
  "nwk_s_key" bytea NOT NULL
)
;
ALTER TABLE "public"."device_activation" OWNER TO "kerry";

-- ----------------------------
-- Records of device_activation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for device_keys
-- ----------------------------
DROP TABLE IF EXISTS "public"."device_keys";
CREATE TABLE "public"."device_keys" (
  "dev_eui" bytea NOT NULL,
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL,
  "app_key" bytea NOT NULL,
  "join_nonce" int4 NOT NULL
)
;
ALTER TABLE "public"."device_keys" OWNER TO "kerry";

-- ----------------------------
-- Records of device_keys
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for device_profile
-- ----------------------------
DROP TABLE IF EXISTS "public"."device_profile";
CREATE TABLE "public"."device_profile" (
  "device_profile_id" uuid NOT NULL,
  "network_server_id" int8 NOT NULL,
  "organization_id" int8 NOT NULL,
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "uplink_interval" int8 NOT NULL
)
;
ALTER TABLE "public"."device_profile" OWNER TO "kerry";

-- ----------------------------
-- Records of device_profile
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for device_queue
-- ----------------------------
DROP TABLE IF EXISTS "public"."device_queue";
CREATE TABLE "public"."device_queue" (
  "id" int8 NOT NULL DEFAULT nextval('device_queue_id_seq'::regclass),
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL,
  "reference" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "dev_eui" bytea NOT NULL,
  "confirmed" bool NOT NULL DEFAULT false,
  "pending" bool NOT NULL DEFAULT false,
  "fport" int2 NOT NULL,
  "data" bytea NOT NULL
)
;
ALTER TABLE "public"."device_queue" OWNER TO "kerry";

-- ----------------------------
-- Records of device_queue
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for device_queue_mapping
-- ----------------------------
DROP TABLE IF EXISTS "public"."device_queue_mapping";
CREATE TABLE "public"."device_queue_mapping" (
  "id" int8 NOT NULL DEFAULT nextval('device_queue_mapping_id_seq'::regclass),
  "created_at" timestamptz(6) NOT NULL,
  "reference" text COLLATE "pg_catalog"."default" NOT NULL,
  "dev_eui" bytea NOT NULL,
  "f_cnt" int4 NOT NULL
)
;
ALTER TABLE "public"."device_queue_mapping" OWNER TO "kerry";

-- ----------------------------
-- Records of device_queue_mapping
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for downlink_queue
-- ----------------------------
DROP TABLE IF EXISTS "public"."downlink_queue";
CREATE TABLE "public"."downlink_queue" (
  "id" int8 NOT NULL DEFAULT nextval('downlink_queue_id_seq'::regclass),
  "reference" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "dev_eui" bytea NOT NULL,
  "confirmed" bool NOT NULL DEFAULT false,
  "pending" bool NOT NULL DEFAULT false,
  "fport" int2 NOT NULL,
  "data" bytea NOT NULL
)
;
ALTER TABLE "public"."downlink_queue" OWNER TO "kerry";

-- ----------------------------
-- Records of downlink_queue
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gateway
-- ----------------------------
DROP TABLE IF EXISTS "public"."gateway";
CREATE TABLE "public"."gateway" (
  "mac" bytea NOT NULL,
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default" NOT NULL,
  "organization_id" int8 NOT NULL,
  "ping" bool NOT NULL DEFAULT false,
  "last_ping_id" int8,
  "last_ping_sent_at" timestamptz(6),
  "network_server_id" int8,
  "first_seen_at" timestamptz(6),
  "last_seen_at" timestamptz(6),
  "latitude" float8 NOT NULL,
  "longitude" float8 NOT NULL,
  "altitude" float8 NOT NULL,
  "gateway_profile_id" uuid
)
;
ALTER TABLE "public"."gateway" OWNER TO "kerry";

-- ----------------------------
-- Records of gateway
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gateway_ping
-- ----------------------------
DROP TABLE IF EXISTS "public"."gateway_ping";
CREATE TABLE "public"."gateway_ping" (
  "id" int8 NOT NULL DEFAULT nextval('gateway_ping_id_seq'::regclass),
  "created_at" timestamptz(6) NOT NULL,
  "gateway_mac" bytea NOT NULL,
  "frequency" int4 NOT NULL,
  "dr" int4 NOT NULL
)
;
ALTER TABLE "public"."gateway_ping" OWNER TO "kerry";

-- ----------------------------
-- Records of gateway_ping
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gateway_ping_rx
-- ----------------------------
DROP TABLE IF EXISTS "public"."gateway_ping_rx";
CREATE TABLE "public"."gateway_ping_rx" (
  "id" int8 NOT NULL DEFAULT nextval('gateway_ping_rx_id_seq'::regclass),
  "created_at" timestamptz(6) NOT NULL,
  "ping_id" int8 NOT NULL,
  "gateway_mac" bytea NOT NULL,
  "received_at" timestamptz(6),
  "rssi" int4 NOT NULL,
  "lora_snr" numeric(3,1) NOT NULL,
  "location" point,
  "altitude" float8
)
;
ALTER TABLE "public"."gateway_ping_rx" OWNER TO "kerry";

-- ----------------------------
-- Records of gateway_ping_rx
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gateway_profile
-- ----------------------------
DROP TABLE IF EXISTS "public"."gateway_profile";
CREATE TABLE "public"."gateway_profile" (
  "gateway_profile_id" uuid NOT NULL,
  "network_server_id" int8 NOT NULL,
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "stats_interval" int8 NOT NULL
)
;
ALTER TABLE "public"."gateway_profile" OWNER TO "postgres";

-- ----------------------------
-- Records of gateway_profile
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for integration
-- ----------------------------
DROP TABLE IF EXISTS "public"."integration";
CREATE TABLE "public"."integration" (
  "id" int8 NOT NULL DEFAULT nextval('integration_id_seq'::regclass),
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL,
  "application_id" int8 NOT NULL,
  "kind" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "settings" jsonb
)
;
ALTER TABLE "public"."integration" OWNER TO "kerry";

-- ----------------------------
-- Records of integration
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for network_server
-- ----------------------------
DROP TABLE IF EXISTS "public"."network_server";
CREATE TABLE "public"."network_server" (
  "id" int8 NOT NULL DEFAULT nextval('network_server_id_seq'::regclass),
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "server" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "ca_cert" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "tls_cert" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "tls_key" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "routing_profile_ca_cert" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "routing_profile_tls_cert" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "routing_profile_tls_key" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "gateway_discovery_enabled" bool NOT NULL DEFAULT false,
  "gateway_discovery_interval" int4 NOT NULL DEFAULT 0,
  "gateway_discovery_tx_frequency" int4 NOT NULL DEFAULT 0,
  "gateway_discovery_dr" int2 NOT NULL DEFAULT 0
)
;
ALTER TABLE "public"."network_server" OWNER TO "kerry";

-- ----------------------------
-- Records of network_server
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for node
-- ----------------------------
DROP TABLE IF EXISTS "public"."node";
CREATE TABLE "public"."node" (
  "dev_eui" bytea NOT NULL,
  "app_eui" bytea NOT NULL,
  "app_key" bytea NOT NULL,
  "used_dev_nonces" bytea,
  "rx_delay" int2 NOT NULL,
  "rx1_dr_offset" int2 NOT NULL,
  "rx_window" int2 NOT NULL DEFAULT 0,
  "rx2_dr" int2 NOT NULL DEFAULT 0,
  "app_s_key" bytea NOT NULL DEFAULT '\x00000000000000000000000000000000'::bytea,
  "nwk_s_key" bytea NOT NULL DEFAULT '\x00000000000000000000000000000000'::bytea,
  "dev_addr" bytea NOT NULL DEFAULT '\x00000000'::bytea,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "relax_fcnt" bool NOT NULL DEFAULT false,
  "adr_interval" int4 NOT NULL DEFAULT 0,
  "installation_margin" numeric(5,2) NOT NULL DEFAULT 0,
  "application_id" int8 NOT NULL,
  "description" text COLLATE "pg_catalog"."default" NOT NULL,
  "is_abp" bool NOT NULL DEFAULT false,
  "is_class_c" bool NOT NULL DEFAULT false,
  "use_application_settings" bool NOT NULL DEFAULT false
)
;
ALTER TABLE "public"."node" OWNER TO "kerry";

-- ----------------------------
-- Records of node
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS "public"."organization";
CREATE TABLE "public"."organization" (
  "id" int8 NOT NULL DEFAULT nextval('organization_id_seq'::regclass),
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "display_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "can_have_gateways" bool NOT NULL
)
;
ALTER TABLE "public"."organization" OWNER TO "kerry";

-- ----------------------------
-- Records of organization
-- ----------------------------
BEGIN;
INSERT INTO "public"."organization" ("id", "created_at", "updated_at", "name", "display_name", "can_have_gateways") VALUES (1, '2022-04-25 15:38:36.970322+08', '2022-04-25 15:38:36.970322+08', 'chirpstack', 'ChirpStack', 't');
COMMIT;

-- ----------------------------
-- Table structure for organization_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."organization_user";
CREATE TABLE "public"."organization_user" (
  "id" int8 NOT NULL DEFAULT nextval('organization_user_id_seq'::regclass),
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL,
  "user_id" int8 NOT NULL,
  "organization_id" int8 NOT NULL,
  "is_admin" bool NOT NULL,
  "is_device_admin" bool NOT NULL,
  "is_gateway_admin" bool NOT NULL
)
;
ALTER TABLE "public"."organization_user" OWNER TO "kerry";

-- ----------------------------
-- Records of organization_user
-- ----------------------------
BEGIN;
INSERT INTO "public"."organization_user" ("id", "created_at", "updated_at", "user_id", "organization_id", "is_admin", "is_device_admin", "is_gateway_admin") VALUES (1, '2022-04-25 15:38:36.970322+08', '2022-04-25 15:38:36.970322+08', 1, 1, 't', 'f', 'f');
COMMIT;

-- ----------------------------
-- Table structure for schema_migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."schema_migrations";
CREATE TABLE "public"."schema_migrations" (
  "version" int8 NOT NULL,
  "dirty" bool NOT NULL
)
;
ALTER TABLE "public"."schema_migrations" OWNER TO "kerry";

-- ----------------------------
-- Records of schema_migrations
-- ----------------------------
BEGIN;
INSERT INTO "public"."schema_migrations" ("version", "dirty") VALUES (27, 't');
COMMIT;

-- ----------------------------
-- Table structure for service_profile
-- ----------------------------
DROP TABLE IF EXISTS "public"."service_profile";
CREATE TABLE "public"."service_profile" (
  "service_profile_id" uuid NOT NULL,
  "organization_id" int8 NOT NULL,
  "network_server_id" int8 NOT NULL,
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."service_profile" OWNER TO "kerry";

-- ----------------------------
-- Records of service_profile
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS "public"."user";
CREATE TABLE "public"."user" (
  "id" int8 NOT NULL DEFAULT nextval('user_id_seq'::regclass),
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL,
  "username" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "password_hash" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "session_ttl" int8 NOT NULL,
  "is_active" bool NOT NULL,
  "is_admin" bool NOT NULL,
  "email" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "note" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text
)
;
ALTER TABLE "public"."user" OWNER TO "kerry";

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO "public"."user" ("id", "created_at", "updated_at", "username", "password_hash", "session_ttl", "is_active", "is_admin", "email", "note") VALUES (1, '2022-04-25 15:38:36.961692+08', '2022-04-25 15:38:36.961692+08', 'admin', 'PBKDF2$sha512$1$l8zGKtxRESq3PA2kFhHRWA==$H3lGMxOt55wjwoc+myeOoABofJY9oDpldJa7fhqdjbh700V6FLPML75UmBOt9J5VFNjAL1AvqCozA1HJM0QVGA==', 0, 't', 't', 'admin', '');
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."application_id_seq"
OWNED BY "public"."application"."id";
SELECT setval('"public"."application_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."application_user_id_seq"
OWNED BY "public"."application_user"."id";
SELECT setval('"public"."application_user_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."device_activation_id_seq"
OWNED BY "public"."device_activation"."id";
SELECT setval('"public"."device_activation_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."device_queue_id_seq"
OWNED BY "public"."device_queue"."id";
SELECT setval('"public"."device_queue_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."device_queue_mapping_id_seq"
OWNED BY "public"."device_queue_mapping"."id";
SELECT setval('"public"."device_queue_mapping_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."downlink_queue_id_seq"
OWNED BY "public"."downlink_queue"."id";
SELECT setval('"public"."downlink_queue_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."gateway_ping_id_seq"
OWNED BY "public"."gateway_ping"."id";
SELECT setval('"public"."gateway_ping_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."gateway_ping_rx_id_seq"
OWNED BY "public"."gateway_ping_rx"."id";
SELECT setval('"public"."gateway_ping_rx_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."integration_id_seq"
OWNED BY "public"."integration"."id";
SELECT setval('"public"."integration_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."network_server_id_seq"
OWNED BY "public"."network_server"."id";
SELECT setval('"public"."network_server_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."organization_id_seq"
OWNED BY "public"."organization"."id";
SELECT setval('"public"."organization_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."organization_user_id_seq"
OWNED BY "public"."organization_user"."id";
SELECT setval('"public"."organization_user_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."user_id_seq"
OWNED BY "public"."user"."id";
SELECT setval('"public"."user_id_seq"', 1, true);

-- ----------------------------
-- Indexes structure for table api_key
-- ----------------------------
CREATE INDEX "idx_api_key_application_id" ON "public"."api_key" USING btree (
  "application_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_api_key_organization_id" ON "public"."api_key" USING btree (
  "organization_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table api_key
-- ----------------------------
ALTER TABLE "public"."api_key" ADD CONSTRAINT "api_key_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table application
-- ----------------------------
CREATE INDEX "idx_application_name" ON "public"."application" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_application_organization_id" ON "public"."application" USING btree (
  "organization_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_application_service_profile_id" ON "public"."application" USING btree (
  "service_profile_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table application
-- ----------------------------
ALTER TABLE "public"."application" ADD CONSTRAINT "application_name_organization_id_key" UNIQUE ("name", "organization_id");

-- ----------------------------
-- Primary Key structure for table application
-- ----------------------------
ALTER TABLE "public"."application" ADD CONSTRAINT "application_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table application_user
-- ----------------------------
CREATE INDEX "idx_application_user_application_id" ON "public"."application_user" USING btree (
  "application_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_application_user_user_id" ON "public"."application_user" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table application_user
-- ----------------------------
ALTER TABLE "public"."application_user" ADD CONSTRAINT "application_user_user_id_application_id_key" UNIQUE ("user_id", "application_id");

-- ----------------------------
-- Primary Key structure for table application_user
-- ----------------------------
ALTER TABLE "public"."application_user" ADD CONSTRAINT "application_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table device
-- ----------------------------
CREATE INDEX "idx_device_application_id" ON "public"."device" USING btree (
  "application_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_device_created_at" ON "public"."device" USING btree (
  "created_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_device_dev_eui_prefix" ON "public"."device" USING btree (
  encode(dev_eui, 'hex'::text) COLLATE "pg_catalog"."default" "pg_catalog"."varchar_pattern_ops" ASC NULLS LAST
);
CREATE INDEX "idx_device_device_profile_id" ON "public"."device" USING btree (
  "device_profile_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "idx_device_name_prefix" ON "public"."device" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."varchar_pattern_ops" ASC NULLS LAST
);
CREATE INDEX "idx_device_updated_at" ON "public"."device" USING btree (
  "updated_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table device
-- ----------------------------
ALTER TABLE "public"."device" ADD CONSTRAINT "device_pkey" PRIMARY KEY ("dev_eui");

-- ----------------------------
-- Indexes structure for table device_activation
-- ----------------------------
CREATE INDEX "idx_device_activation_created_at" ON "public"."device_activation" USING btree (
  "created_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_device_activation_dev_eui" ON "public"."device_activation" USING btree (
  "dev_eui" "pg_catalog"."bytea_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table device_activation
-- ----------------------------
ALTER TABLE "public"."device_activation" ADD CONSTRAINT "device_activation_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table device_keys
-- ----------------------------
CREATE INDEX "idx_device_keys_created_at" ON "public"."device_keys" USING btree (
  "created_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_device_keys_updated_at" ON "public"."device_keys" USING btree (
  "updated_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table device_keys
-- ----------------------------
ALTER TABLE "public"."device_keys" ADD CONSTRAINT "device_keys_pkey" PRIMARY KEY ("dev_eui");

-- ----------------------------
-- Indexes structure for table device_profile
-- ----------------------------
CREATE INDEX "idx_device_profile_created_at" ON "public"."device_profile" USING btree (
  "created_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_device_profile_network_server_id" ON "public"."device_profile" USING btree (
  "network_server_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_device_profile_organization_id" ON "public"."device_profile" USING btree (
  "organization_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_device_profile_updated_at" ON "public"."device_profile" USING btree (
  "updated_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table device_profile
-- ----------------------------
ALTER TABLE "public"."device_profile" ADD CONSTRAINT "device_profile_pkey" PRIMARY KEY ("device_profile_id");

-- ----------------------------
-- Indexes structure for table device_queue
-- ----------------------------
CREATE INDEX "idx_device_queue_created_at" ON "public"."device_queue" USING btree (
  "created_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_device_queue_dev_eui" ON "public"."device_queue" USING btree (
  "dev_eui" "pg_catalog"."bytea_ops" ASC NULLS LAST
);
CREATE INDEX "idx_device_queue_updated_at" ON "public"."device_queue" USING btree (
  "updated_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table device_queue
-- ----------------------------
ALTER TABLE "public"."device_queue" ADD CONSTRAINT "device_queue_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table device_queue_mapping
-- ----------------------------
CREATE INDEX "device_queue_mapping_created_at" ON "public"."device_queue_mapping" USING btree (
  "created_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "device_queue_mapping_dev_eui" ON "public"."device_queue_mapping" USING btree (
  "dev_eui" "pg_catalog"."bytea_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table device_queue_mapping
-- ----------------------------
ALTER TABLE "public"."device_queue_mapping" ADD CONSTRAINT "device_queue_mapping_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table downlink_queue
-- ----------------------------
CREATE INDEX "downlink_queue_dev_eui" ON "public"."downlink_queue" USING btree (
  "dev_eui" "pg_catalog"."bytea_ops" ASC NULLS LAST
);

-- ----------------------------
-- Indexes structure for table gateway
-- ----------------------------
CREATE INDEX "idx_gateway_gateway_profile_id" ON "public"."gateway" USING btree (
  "gateway_profile_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "idx_gateway_last_ping_sent_at" ON "public"."gateway" USING btree (
  "last_ping_sent_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_gateway_network_server_id" ON "public"."gateway" USING btree (
  "network_server_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_gateway_organization_id" ON "public"."gateway" USING btree (
  "organization_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_gateway_ping" ON "public"."gateway" USING btree (
  "ping" "pg_catalog"."bool_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table gateway
-- ----------------------------
ALTER TABLE "public"."gateway" ADD CONSTRAINT "gateway_name_organization_id_key" UNIQUE ("name", "organization_id");

-- ----------------------------
-- Primary Key structure for table gateway
-- ----------------------------
ALTER TABLE "public"."gateway" ADD CONSTRAINT "gateway_pkey" PRIMARY KEY ("mac");

-- ----------------------------
-- Indexes structure for table gateway_ping
-- ----------------------------
CREATE INDEX "idx_gateway_ping_created_at" ON "public"."gateway_ping" USING btree (
  "created_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_gateway_ping_gateway_mac" ON "public"."gateway_ping" USING btree (
  "gateway_mac" "pg_catalog"."bytea_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table gateway_ping
-- ----------------------------
ALTER TABLE "public"."gateway_ping" ADD CONSTRAINT "gateway_ping_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table gateway_ping_rx
-- ----------------------------
CREATE INDEX "idx_gateway_ping_rx_created_at" ON "public"."gateway_ping_rx" USING btree (
  "created_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_gateway_ping_rx_gateway_mac" ON "public"."gateway_ping_rx" USING btree (
  "gateway_mac" "pg_catalog"."bytea_ops" ASC NULLS LAST
);
CREATE INDEX "idx_gateway_ping_rx_ping_id" ON "public"."gateway_ping_rx" USING btree (
  "ping_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table gateway_ping_rx
-- ----------------------------
ALTER TABLE "public"."gateway_ping_rx" ADD CONSTRAINT "gateway_ping_rx_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table gateway_profile
-- ----------------------------
CREATE INDEX "idx_gateway_profile_created_at" ON "public"."gateway_profile" USING btree (
  "created_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_gateway_profile_network_server_id" ON "public"."gateway_profile" USING btree (
  "network_server_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_gateway_profile_updated_at" ON "public"."gateway_profile" USING btree (
  "updated_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table gateway_profile
-- ----------------------------
ALTER TABLE "public"."gateway_profile" ADD CONSTRAINT "gateway_profile_pkey" PRIMARY KEY ("gateway_profile_id");

-- ----------------------------
-- Indexes structure for table integration
-- ----------------------------
CREATE INDEX "idx_integration_application_id" ON "public"."integration" USING btree (
  "application_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_integration_kind" ON "public"."integration" USING btree (
  "kind" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table integration
-- ----------------------------
ALTER TABLE "public"."integration" ADD CONSTRAINT "integration_kind_application_id" UNIQUE ("kind", "application_id");

-- ----------------------------
-- Primary Key structure for table integration
-- ----------------------------
ALTER TABLE "public"."integration" ADD CONSTRAINT "integration_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table network_server
-- ----------------------------
CREATE INDEX "idx_network_server_created_at" ON "public"."network_server" USING btree (
  "created_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_network_server_updated_at" ON "public"."network_server" USING btree (
  "updated_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table network_server
-- ----------------------------
ALTER TABLE "public"."network_server" ADD CONSTRAINT "network_server_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table node
-- ----------------------------
CREATE INDEX "idx_node_application_id" ON "public"."node" USING btree (
  "application_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_node_dev_eui_prefix" ON "public"."node" USING btree (
  encode(dev_eui, 'hex'::text) COLLATE "pg_catalog"."default" "pg_catalog"."varchar_pattern_ops" ASC NULLS LAST
);
CREATE INDEX "idx_node_name" ON "public"."node" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_node_name_prefix" ON "public"."node" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."varchar_pattern_ops" ASC NULLS LAST
);
CREATE INDEX "node_app_eui" ON "public"."node" USING btree (
  "app_eui" "pg_catalog"."bytea_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table node
-- ----------------------------
ALTER TABLE "public"."node" ADD CONSTRAINT "node_application_id_name_key" UNIQUE ("application_id", "name");

-- ----------------------------
-- Primary Key structure for table node
-- ----------------------------
ALTER TABLE "public"."node" ADD CONSTRAINT "node_pkey" PRIMARY KEY ("dev_eui");

-- ----------------------------
-- Indexes structure for table organization
-- ----------------------------
CREATE INDEX "idx_organization_display_name_prefix" ON "public"."organization" USING btree (
  lower(display_name::text) COLLATE "pg_catalog"."default" "pg_catalog"."varchar_pattern_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "idx_organization_name" ON "public"."organization" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table organization
-- ----------------------------
ALTER TABLE "public"."organization" ADD CONSTRAINT "organization_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table organization_user
-- ----------------------------
CREATE INDEX "idx_organization_user_organization_id" ON "public"."organization_user" USING btree (
  "organization_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_organization_user_user_id" ON "public"."organization_user" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table organization_user
-- ----------------------------
ALTER TABLE "public"."organization_user" ADD CONSTRAINT "organization_user_user_id_organization_id_key" UNIQUE ("user_id", "organization_id");

-- ----------------------------
-- Primary Key structure for table organization_user
-- ----------------------------
ALTER TABLE "public"."organization_user" ADD CONSTRAINT "organization_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table schema_migrations
-- ----------------------------
ALTER TABLE "public"."schema_migrations" ADD CONSTRAINT "schema_migrations_pkey" PRIMARY KEY ("version");

-- ----------------------------
-- Indexes structure for table service_profile
-- ----------------------------
CREATE INDEX "idx_service_profile_created_at" ON "public"."service_profile" USING btree (
  "created_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_service_profile_network_server_id" ON "public"."service_profile" USING btree (
  "network_server_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_service_profile_organization_id" ON "public"."service_profile" USING btree (
  "organization_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_service_profile_updated_at" ON "public"."service_profile" USING btree (
  "updated_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table service_profile
-- ----------------------------
ALTER TABLE "public"."service_profile" ADD CONSTRAINT "service_profile_pkey" PRIMARY KEY ("service_profile_id");

-- ----------------------------
-- Indexes structure for table user
-- ----------------------------
CREATE INDEX "idx_user_username_prefix" ON "public"."user" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."varchar_pattern_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table user
-- ----------------------------
ALTER TABLE "public"."user" ADD CONSTRAINT "user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table api_key
-- ----------------------------
ALTER TABLE "public"."api_key" ADD CONSTRAINT "api_key_application_id_fkey" FOREIGN KEY ("application_id") REFERENCES "public"."application" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."api_key" ADD CONSTRAINT "api_key_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "public"."organization" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table application
-- ----------------------------
ALTER TABLE "public"."application" ADD CONSTRAINT "application_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "public"."organization" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."application" ADD CONSTRAINT "application_service_profile_id_fkey" FOREIGN KEY ("service_profile_id") REFERENCES "public"."service_profile" ("service_profile_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table application_user
-- ----------------------------
ALTER TABLE "public"."application_user" ADD CONSTRAINT "application_user_application_id_fkey" FOREIGN KEY ("application_id") REFERENCES "public"."application" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."application_user" ADD CONSTRAINT "application_user_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."user" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table device
-- ----------------------------
ALTER TABLE "public"."device" ADD CONSTRAINT "device_application_id_fkey" FOREIGN KEY ("application_id") REFERENCES "public"."application" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."device" ADD CONSTRAINT "device_device_profile_id_fkey" FOREIGN KEY ("device_profile_id") REFERENCES "public"."device_profile" ("device_profile_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table device_activation
-- ----------------------------
ALTER TABLE "public"."device_activation" ADD CONSTRAINT "device_activation_dev_eui_fkey" FOREIGN KEY ("dev_eui") REFERENCES "public"."device" ("dev_eui") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table device_keys
-- ----------------------------
ALTER TABLE "public"."device_keys" ADD CONSTRAINT "device_keys_dev_eui_fkey" FOREIGN KEY ("dev_eui") REFERENCES "public"."device" ("dev_eui") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table device_profile
-- ----------------------------
ALTER TABLE "public"."device_profile" ADD CONSTRAINT "device_profile_network_server_id_fkey" FOREIGN KEY ("network_server_id") REFERENCES "public"."network_server" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."device_profile" ADD CONSTRAINT "device_profile_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "public"."organization" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table device_queue
-- ----------------------------
ALTER TABLE "public"."device_queue" ADD CONSTRAINT "device_queue_dev_eui_fkey" FOREIGN KEY ("dev_eui") REFERENCES "public"."device" ("dev_eui") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table device_queue_mapping
-- ----------------------------
ALTER TABLE "public"."device_queue_mapping" ADD CONSTRAINT "device_queue_mapping_dev_eui_fkey" FOREIGN KEY ("dev_eui") REFERENCES "public"."device" ("dev_eui") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table downlink_queue
-- ----------------------------
ALTER TABLE "public"."downlink_queue" ADD CONSTRAINT "downlink_queue_dev_eui_fkey" FOREIGN KEY ("dev_eui") REFERENCES "public"."node" ("dev_eui") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table gateway
-- ----------------------------
ALTER TABLE "public"."gateway" ADD CONSTRAINT "gateway_gateway_profile_id_fkey" FOREIGN KEY ("gateway_profile_id") REFERENCES "public"."gateway_profile" ("gateway_profile_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."gateway" ADD CONSTRAINT "gateway_last_ping_id_fkey" FOREIGN KEY ("last_ping_id") REFERENCES "public"."gateway_ping" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."gateway" ADD CONSTRAINT "gateway_network_server_id_fkey" FOREIGN KEY ("network_server_id") REFERENCES "public"."network_server" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."gateway" ADD CONSTRAINT "gateway_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "public"."organization" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table gateway_ping
-- ----------------------------
ALTER TABLE "public"."gateway_ping" ADD CONSTRAINT "gateway_ping_gateway_mac_fkey" FOREIGN KEY ("gateway_mac") REFERENCES "public"."gateway" ("mac") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table gateway_ping_rx
-- ----------------------------
ALTER TABLE "public"."gateway_ping_rx" ADD CONSTRAINT "gateway_ping_rx_gateway_mac_fkey" FOREIGN KEY ("gateway_mac") REFERENCES "public"."gateway" ("mac") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."gateway_ping_rx" ADD CONSTRAINT "gateway_ping_rx_ping_id_fkey" FOREIGN KEY ("ping_id") REFERENCES "public"."gateway_ping" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table gateway_profile
-- ----------------------------
ALTER TABLE "public"."gateway_profile" ADD CONSTRAINT "gateway_profile_network_server_id_fkey" FOREIGN KEY ("network_server_id") REFERENCES "public"."network_server" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table integration
-- ----------------------------
ALTER TABLE "public"."integration" ADD CONSTRAINT "integration_application_id_fkey" FOREIGN KEY ("application_id") REFERENCES "public"."application" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table node
-- ----------------------------
ALTER TABLE "public"."node" ADD CONSTRAINT "node_application_id_fkey" FOREIGN KEY ("application_id") REFERENCES "public"."application" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table organization_user
-- ----------------------------
ALTER TABLE "public"."organization_user" ADD CONSTRAINT "organization_user_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "public"."organization" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."organization_user" ADD CONSTRAINT "organization_user_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."user" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table service_profile
-- ----------------------------
ALTER TABLE "public"."service_profile" ADD CONSTRAINT "service_profile_network_server_id_fkey" FOREIGN KEY ("network_server_id") REFERENCES "public"."network_server" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."service_profile" ADD CONSTRAINT "service_profile_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "public"."organization" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
