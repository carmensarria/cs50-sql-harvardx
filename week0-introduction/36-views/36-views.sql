-- =========================================
-- 36 Views - CS50 SQL Week 0
-- =========================================

-- Question 1: write a SQL query that a translator might take interest in: list, side by side, the Japanese title and the English title for each print. Ensure the Japanese title is the first column, followed by the English title.
SELECT "japanese_title", "english_title" FROM "views";

-- Question 2:  write a SQL query to list the average colors of prints by Hokusai that include “river” in the English title.
SELECT "average_color" FROM "views" WHERE "artist" = 'Hokusai' AND "english_title" LIKE '%river%';

-- Question 3: write a SQL query to count how many prints by Hokusai include “Fuji” in the English title. Though all of Hokusai’s prints focused on Mt. Fuji, in how many did “Fuji” make it into the title?
SELECT COUNT(*) FROM "views" WHERE "artist" = 'Hokusai' AND "english_title" LIKE '%Fuji%';

-- Question 4: write a SQL query to count how many prints by Hiroshige have English titles that refer to the “Eastern Capital”. Hiroshige’s prints were created in Japan’s “Edo period,” referencing the eastern capital city of Edo, now Tokyo.
SELECT COUNT(*) FROM "views" WHERE "artist" = 'Hiroshige' AND "english_title" LIKE '%Eastern Capital%';

-- Question 5: write a SQL query to find the highest contrast value of prints by Hokusai. Name the column “Maximum Contrast”
SELECT MAX("contrast") AS "Maximum Contrast" FROM "views" WHERE "artist" = 'Hokusai';

-- Question 6: write a SQL query to find the average entropy of prints by Hiroshige, rounded to two decimal places. Call the resulting column “Hiroshige Average Entropy”.
SELECT ROUND(AVG ("entropy"),2) AS "Hiroshige Average Entropy" FROM "views" WHERE "artist" = 'Hiroshige';

-- Question 7: write a SQL query to list the English titles of the 5 brightest prints by Hiroshige, from most to least bright.
SELECT "english_title" FROM "views" WHERE "artist" = 'Hiroshige' ORDER BY "brightness" DESC LIMIT 5;

-- Question 8: write a SQL query to list the English titles of the 5 prints with the least contrast by Hokusai, from least to highest contrast.
SELECT "english_title" FROM "views" WHERE "artist" = 'Hokusai' ORDER BY "contrast" LIMIT 5;

-- Question 9: write a SQL query to find the English title and artist of the print with the highest brightness.
SELECT "english_title", "artist" FROM "views" ORDER BY "brightness" DESC LIMIT 1;

-- Question 10: write a SQL query to answer a question of your choice about the prints. The query should:
-- Make use of AS to rename a column
-- Involve at least one condition, using WHERE
-- Sort by at least one column, using ORDER BY
SELECT "english_title" AS "High Entropy Prints", "artist", "entropy" FROM "views" WHERE "entropy" > 6 ORDER BY "entropy" DESC;
