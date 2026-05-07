
-- *** The Lost Letter ***
-- Step 1: Find the package sent from Anneke to Varsha
SELECT "id", "contents" FROM "packages"
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '900 Somerville Avenue'
)
AND "to_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" LIKE '2 Finn%'
);
-- package_id = 384
-- Step 2: Find where the package was last delivered.
SELECT "address", "type" FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '900 Somerville Avenue'
        )
        AND "to_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '2 Finn%'
        )
    )
    ORDER BY "timestamp" DESC LIMIT 1
);
-- *** The Devious Delivery ***
-- Step 1: Find packages that match the clue (duck-related item)
-- I use the package content as the starting point
SELECT "id", "contents" FROM "packages"
WHERE "contents" LIKE '%duck%';
-- Step 2: Track where the package has been scanned
SELECT "address_id", "action", "timestamp" FROM "scans"
WHERE "package_id" = (
    SELECT "id" FROM "packages"
    WHERE "contents" LIKE 'Duck debugger'
)
ORDER BY "timestamp";
-- Step 3: Get the final delivery location from last scan
SELECT "address", "type" FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "contents" LIKE 'Duck debugger'
    )
    ORDER BY "timestamp" DESC LIMIT 1
);

-- *** The Forgotten Gift ***
-- Step 1: Find the package sent from the grandfather to his granddaughter
-- I relate addresses with packages using subqueries
SELECT "id", "contents" FROM "packages"
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '109 Tileston Street'
)
AND "to_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '728 Maple Place'
);

-- Step 2: Check the latest scan to determine the current state of the package.
-- If the last action is "Pick", the package is with a driver.
SELECT "driver_id", "address_id", "action", "timestamp" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
    )
    AND "to_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
    )
)
ORDER BY "timestamp" DESC
LIMIT 1;
-- action = Pick → package is not at the address, it is with the driver

-- Step 3: Find the name of the driver who has the package.
SELECT "name" FROM "drivers" WHERE "id" = (
    SELECT "driver_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages" WHERE "from_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
        )
        AND "to_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
        )
    )
    ORDER BY "timestamp" DESC
    LIMIT 1
);
