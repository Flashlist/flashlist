BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "flashlist_app_user" (
    "id" serial PRIMARY KEY,
    "userId" integer NOT NULL,
    "username" text NOT NULL,
    "email" text NOT NULL,
    "imageSrc" text
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "flashlist_app_user"
    ADD CONSTRAINT "flashlist_app_user_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;


--
-- MIGRATION VERSION FOR flashlist
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('flashlist', '20240312175157010', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240312175157010', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240115074239642', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074239642', "timestamp" = now();


COMMIT;
