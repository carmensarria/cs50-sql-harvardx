-- =========================================
-- Author: Sarría Ferrer, Carmen Magdalena
-- Course: CS50 Introduction to Databases with SQL
-- Week: 0 - Cyberchase
-- Platform: HarvardX / edX
-- =========================================

-- Question 1: write a SQL query to list the titles of all episodes in Cyberchase’s original season, Season 1.
SELECT "title" FROM "episodes" WHERE "season"=1;

-- =========================================

-- Question 2: list the season number of, and title of, the first episode of every season.
SELECT "season","title" FROM "episodes" WHERE "episode_in_season"=1;

-- =========================================

-- Question 3: find the production code for the episode “Hackerized!”.
SELECT "production_code" FROM "episodes" WHERE "title"='Hackerized!';

-- =========================================

-- Question 4: write a query to find the titles of episodes that do not yet have a listed topic.:
SELECT "title" FROM "episodes" WHERE "topic" IS NULL;

-- =========================================

-- Question 5: find the title of the holiday episode that aired on December 31st, 2004.
SELECT "title" FROM "episodes" WHERE "air_date" LIKE '2004-12-31';

-- =========================================

-- Question 6: list the titles of episodes from season 6 (2008) that were released early, in 2007.
SELECT "title" FROM "episodes" WHERE "season"=6 AND "air_date" LIKE '2007%';

-- =========================================

-- Question 7: write a SQL query to list the titles and topics of all episodes teaching fractions.
SELECT "title", "topic" FROM "episodes" WHERE "topic" LIKE '%fraction%';

-- =========================================

-- Question 8: write a query that counts the number of episodes released in the last 6 years, from 2018 to 2023, inclusive.
SELECT COUNT(*) FROM "episodes" WHERE "air_date" BETWEEN '2018-01-01' AND '2023-12-31';

-- =========================================

-- Question 9: write a query that counts the number of episodes released in Cyberchase’s first 6 years, from 2002 to 2007, inclusive.
SELECT COUNT(*) AS "number of episodes released" FROM "episodes" WHERE "air_date" BETWEEN '2002-01-01' AND '2007-12-31';

-- =========================================

-- Question 10: write a SQL query to list the ids, titles, and production codes of all episodes. Order the results by production code, from earliest to latest.
SELECT "id", "title", "production_code" FROM "episodes" ORDER BY "production_code";

-- =========================================

-- Question 11: list the titles of episodes from season 5, in reverse alphabetical order.
SELECT "title" FROM "episodes" WHERE "season"=5 ORDER BY "title" DESC;

-- =========================================

-- Question 12: count the number of unique episode titles.
SELECT COUNT (DISTINCT "title") FROM "episodes";


-- =========================================

-- Question 13: write a SQL query to explore a question of your choice. This query should:
-- Involve at least one condition, using WHERE with AND or OR
SELECT "title", "season", "episode_in_season", "topic" FROM "episodes"
WHERE "episode_in_season" >= 10 AND ("topic" LIKE '%fraction%' OR "topic" LIKE '%geometry%');
