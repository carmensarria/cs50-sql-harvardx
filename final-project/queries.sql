-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database.


-- Read operations

-- Find all recall events associated with a specific firm.
SELECT
    "event"."event_id",
    "event"."status",
    "event"."recall_initiation_date",
    "event"."report_date"
FROM "event"
JOIN "firm"
    ON "event"."firm_id" = "firm"."firm_id"
WHERE "firm"."name" = 'Siemens Medical Solutions USA, Inc.';


-- Count recall records by FDA classification.
SELECT
    "classification",
    COUNT(*) AS "recall_records"
FROM "recall_record"
GROUP BY "classification"
ORDER BY "recall_records" DESC;


-- Find firms associated with the highest number of recall events.
SELECT
    "firm"."name",
    COUNT("event"."event_id") AS "events"
FROM "firm"
JOIN "event"
    ON "firm"."firm_id" = "event"."firm_id"
GROUP BY "firm"."firm_id"
ORDER BY "events" DESC
LIMIT 10;


-- Find recall events associated with the highest number of recall records.
SELECT
    "event_id",
    COUNT(*) AS "recall_records"
FROM "recall_record"
GROUP BY "event_id"
ORDER BY "recall_records" DESC
LIMIT 10;


-- Find recall records initiated within a specified date range.
SELECT
    "recall_record"."recall_number",
    "event"."event_id",
    "event"."recall_initiation_date",
    "firm"."name",
    "recall_record"."classification"
FROM "recall_record"
JOIN "event"
    ON "recall_record"."event_id" = "event"."event_id"
JOIN "firm"
    ON "event"."firm_id" = "firm"."firm_id"
WHERE "event"."recall_initiation_date"
    BETWEEN '2026-01-01' AND '2026-12-31'
ORDER BY "event"."recall_initiation_date" DESC;


-- Find ongoing Class I recall records, ordered from most recent to oldest event.
SELECT
    "recall_record"."recall_number",
    "event"."event_id",
    "event"."recall_initiation_date",
    "firm"."name",
    "recall_record"."classification"
FROM "recall_record"
JOIN "event"
    ON "recall_record"."event_id" = "event"."event_id"
JOIN "firm"
    ON "event"."firm_id" = "firm"."firm_id"
WHERE "event"."status" = 'Ongoing'
AND "recall_record"."classification" = 'Class I'
ORDER BY "event"."recall_initiation_date" DESC;


-- Summarize recall records by event status and recall classification.
SELECT
    "event"."status",
    "recall_record"."classification",
    COUNT(*) AS "recall_records"
FROM "event"
JOIN "recall_record"
    ON "event"."event_id" = "recall_record"."event_id"
GROUP BY
    "event"."status",
    "recall_record"."classification"
ORDER BY
    "event"."status",
    "recall_records" DESC;


-- Write operations
--
-- The following statements demonstrate how the database can be modified
-- through INSERT, UPDATE, and DELETE operations.
--
-- These statements are executed inside a transaction and rolled back
-- so that running this file does not modify the validated FDA snapshot.
--
-- In a production application, these operations would be committed when
-- the corresponding change is intentional and authorized.


BEGIN TRANSACTION;


-- Add a new recall record associated with an existing recall event.
INSERT INTO "recall_record" (
    "recall_number",
    "event_id",
    "classification",
    "product_description",
    "product_quantity",
    "reason_for_recall",
    "center_classification_date",
    "code_info",
    "more_code_info"
)
VALUES (
    'Z-DEMO-2026',
    99573,
    'Class II',
    'Demonstration medical device',
    NULL,
    'Demonstration record for database maintenance.',
    NULL,
    NULL,
    NULL
);


-- Update the status of an existing recall event.
UPDATE "event"
SET "status" = 'Completed'
WHERE "event_id" = 99573;


-- Delete the demonstration recall record.
DELETE FROM "recall_record"
WHERE "recall_number" = 'Z-DEMO-2026';


-- Roll back the demonstration changes to preserve the FDA snapshot.
ROLLBACK;
