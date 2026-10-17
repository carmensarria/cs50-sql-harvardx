-- In this SQL file, write (and comment!) the schema of your database, including
-- the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it.


-- Stores the medical device firms associated with recall events.
CREATE TABLE IF NOT EXISTS "firm" (
    "firm_id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY ("firm_id")
);


-- Stores recall events reported by the FDA.
-- Each event is associated with one recalling firm.
CREATE TABLE IF NOT EXISTS "event" (
    "event_id" INTEGER,
    "firm_id" INTEGER NOT NULL,
    "status" TEXT NOT NULL,
    "address_1" TEXT,
    "address_2" TEXT,
    "city" TEXT,
    "state" TEXT,
    "country" TEXT,
    "postal_code" TEXT,
    "voluntary_mandated" TEXT NOT NULL,
    "initial_firm_notification" TEXT NOT NULL,
    "distribution_pattern" TEXT,
    "recall_initiation_date" TEXT NOT NULL,
    "report_date" TEXT NOT NULL,
    PRIMARY KEY ("event_id"),
    FOREIGN KEY ("firm_id") REFERENCES "firm"("firm_id")
);


-- Stores individual recall records associated with FDA recall events.
CREATE TABLE IF NOT EXISTS "recall_record" (
    "recall_id" INTEGER,
    "recall_number" TEXT UNIQUE,
    "event_id" INTEGER NOT NULL,
    "classification" TEXT NOT NULL,
    "product_description" TEXT NOT NULL,
    "product_quantity" TEXT,
    "reason_for_recall" TEXT NOT NULL,
    "center_classification_date" TEXT,
    "code_info" TEXT,
    "more_code_info" TEXT,
    PRIMARY KEY ("recall_id"),
    FOREIGN KEY ("event_id") REFERENCES "event"("event_id")
);


-- Supports date-range filtering and ordering of recall events.
CREATE INDEX IF NOT EXISTS "idx_event_recall_initiation_date"
ON "event" ("recall_initiation_date");


-- Supports joins between recall records and their parent events.
CREATE INDEX IF NOT EXISTS "idx_recall_record_event_id"
ON "recall_record" ("event_id");
