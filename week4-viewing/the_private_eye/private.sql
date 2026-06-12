CREATE VIEW "message" AS
WITH "cipher" AS (
    SELECT 14 AS "sentence_id", 98 AS "start", 4 AS "length"
    UNION ALL
    SELECT 114, 3, 5
    UNION ALL
    SELECT 618, 72, 9
    UNION ALL
    SELECT 630, 7, 3
    UNION ALL
    SELECT 932, 12, 5
    UNION ALL
    SELECT 2230, 50, 7
    UNION ALL
    SELECT 2346, 44, 10
    UNION ALL
    SELECT 3041, 14, 5
)
SELECT substr("sentences"."sentence", "cipher"."start", "cipher"."length") AS "phrase"
FROM "cipher"
JOIN "sentences" ON "cipher"."sentence_id" = "sentences"."id";
