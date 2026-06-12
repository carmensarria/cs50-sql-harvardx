-- Create a temporary table matching the CSV structure
CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" TEXT,
    "year" NUMERIC,
    "lat" NUMERIC,
    "long" NUMERIC
);

-- Import data from the CSV file
.import --csv --skip 1 meteorites.csv meteorites_temp

-- Convert empty values to NULL
UPDATE "meteorites_temp" SET "mass" = NULL
WHERE "mass" = '';

UPDATE "meteorites_temp" SET "year" = NULL
WHERE "year" = '';

UPDATE "meteorites_temp" SET "lat" = NULL
WHERE "lat" = '';

UPDATE "meteorites_temp" SET "long" = NULL
WHERE "long" = '';

-- Round decimal values to two decimal places
UPDATE "meteorites_temp"
SET "mass" = ROUND("mass", 2)
WHERE "mass" IS NOT NULL;

UPDATE "meteorites_temp"
SET "lat" = ROUND("lat", 2)
WHERE "lat" IS NOT NULL;

UPDATE "meteorites_temp"
SET "long" = ROUND("long", 2)
WHERE "long" IS NOT NULL;

-- Create the final cleaned table
CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY ("id")
);

-- Insert cleaned data
-- Exclude meteorites classified as Relict
-- Sort by year and then by name
INSERT INTO "meteorites"(
    "name",
    "class",
    "mass",
    "discovery",
    "year",
    "lat",
    "long"
)
SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
FROM "meteorites_temp"
WHERE "nametype" != 'Relict'
ORDER BY "year" ASC, "name" ASC;

-- Remove temporary table
DROP TABLE "meteorites_temp";
