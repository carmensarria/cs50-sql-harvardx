-- =========================================
-- DESE - CS50 SQL Week 1
-- =========================================

-- Question 1: Your colleague is preparing a map of all public schools in Massachusetts. Write a SQL query to find the names and cities of all public schools in Massachusetts.
-- Keep in mind that not all schools in the schools table are considered traditional public schools. Massachusetts also recognizes charter schools, which (according to DESE!) are considered distinct.
SELECT "name", "city" FROM "schools" WHERE "state" = 'MA' AND "type" = 'Public School';

-- Question 2: Your team is working on archiving old data. Write a SQL query to find the names of districts that are no longer operational.
-- Districts that are no longer operational have “(non-op)” at the end of their name.
SELECT "name" FROM "districts" WHERE "name" LIKE '%(non-op)';

-- Question 3: The Massachusetts Legislature would like to learn how much money, on average, districts spent per-pupil last year. Write a SQL query to find the average per-pupil expenditure. Name the column “Average District Per-Pupil Expenditure”.
-- Note the per_pupil_expenditure column in the expenditures table contains the average amount, per pupil, each district spent last year. You’ve been asked to find the average of this set of averages, weighting all districts equally regardless of their size.
SELECT AVG("per_pupil_expenditure") AS "Average District Per-Pupil Expenditure" FROM "expenditures";

-- Question 4: Some cities have more public schools than others. Write a SQL query to find the 10 cities with the most public schools. Your query should return the names of the cities and the number of public schools within them, ordered from greatest number of public schools to least. If two cities have the same number of public schools, order them alphabetically.
SELECT "city", COUNT(*) AS "Number_of_Public_Schools" FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY "Number_of_Public_Schools" DESC, "city" ASC
LIMIT 10;

-- Question 5: DESE would like you to determine in what cities additional public schools might be needed. Write a SQL query to find cities with 3 or fewer public schools. Your query should return the names of the cities and the number of public schools within them, ordered from greatest number of public schools to least. If two cities have the same number of public schools, order them alphabetically.
SELECT "city", COUNT(*) AS "Number_of_Public_Schools" FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING COUNT (*) <= 3
ORDER BY "Number_of_Public_Schools" DESC, "city" ASC;

-- Question 6: DESE wants to assess which schools achieved a 100% graduation rate. Write a SQL query to find the names of schools (public or charter!) that reported a 100% graduation rate.
SELECT "name" FROM "schools" WHERE "id" IN (
    SELECT "school_id" FROM "graduation_rates"
    WHERE "graduated" = 100
);

-- Question 7: DESE is preparing a report on schools in the Cambridge school district. Write a SQL query to find the names of schools (public or charter!) in the Cambridge school district. Keep in mind that Cambridge, the city, contains a few school districts, but DESE is interested in the district whose name is “Cambridge.”
SELECT "schools"."name" FROM "schools"
JOIN "districts" ON "schools"."district_id" = "districts"."id"
WHERE "districts"."name" = 'Cambridge';

-- Question 8: A parent wants to send their child to a district with many other students. Write a SQL query to display the names of all school districts and the number of pupils enrolled in each.
SELECT "districts"."name", SUM ("expenditures"."pupils") AS "Total_Pupils" FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
GROUP BY "districts"."name";

-- Question 9: Another parent wants to send their child to a district with few other students. Write a SQL query to find the name (or names) of the school district(s) with the single least number of pupils. Report only the name(s).
SELECT "name" FROM (
    SELECT "districts"."name", SUM("expenditures"."pupils") AS total_pupils
    FROM "districts"
    JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
    GROUP BY "districts"."name"
)
WHERE total_pupils = (
    SELECT MIN(total_pupils) FROM (
        SELECT SUM("expenditures"."pupils") AS total_pupils
        FROM "districts"
        JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
        GROUP BY "districts"."name"
    )
);

-- Question 10: In Massachusetts, school district expenditures are in part determined by local taxes on property (e.g., home) values. Write a SQL query to find the 10 public school districts with the highest per-pupil expenditures. Your query should return the names of the districts and the per-pupil expenditure for each.
SELECT "districts"."name", "expenditures"."per_pupil_expenditure" FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
WHERE "districts"."type" = 'Public School District'
ORDER BY "expenditures"."per_pupil_expenditure" DESC
LIMIT 10;

-- Question 11: Is there a relationship between school expenditures and graduation rates? Write a SQL query to display the names of schools, their per-pupil expenditure, and their graduation rate. Sort the schools from greatest per-pupil expenditure to least. If two schools have the same per-pupil expenditure, sort by school name.
-- You should assume a school spends the same amount per-pupil their district as a whole spends.
SELECT "schools"."name",
"expenditures"."per_pupil_expenditure",
"graduation_rates"."graduated"
FROM "schools"
JOIN "expenditures"
ON "schools"."district_id" = "expenditures"."district_id"
JOIN "graduation_rates"
ON "schools"."id" = "graduation_rates"."school_id"
ORDER BY "expenditures"."per_pupil_expenditure" DESC, "schools"."name" ASC;

-- Question 12: A parent asks you for advice on finding the best public school districts in Massachusetts. Write a SQL query to find public school districts with above-average per-pupil expenditures and an above-average percentage of teachers rated “exemplary”. Your query should return the districts’ names, along with their per-pupil expenditures and percentage of teachers rated exemplary. Sort the results first by the percentage of teachers rated exemplary (high to low), then by the per-pupil expenditure (high to low).
SELECT "districts"."name", "expenditures"."per_pupil_expenditure", "staff_evaluations"."exemplary"
FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
JOIN "staff_evaluations" ON "districts"."id" = "staff_evaluations"."district_id"
WHERE "districts"."type" = 'Public School District'
AND "expenditures"."per_pupil_expenditure" > (
    SELECT AVG ("per_pupil_expenditure") FROM "expenditures"
)
AND "staff_evaluations"."exemplary" > (
    SELECT AVG ("exemplary") FROM "staff_evaluations"
)
ORDER BY "staff_evaluations"."exemplary" DESC, "expenditures"."per_pupil_expenditure" DESC;

-- Question 13: write a SQL query to answer a question you have about the data! The query should:
-- Involve at least one JOIN or subquery 
-- **Which schools have a high per pupil
-- expenditure but a low graduation rate?**

SELECT "schools"."name",
"expenditures"."per_pupil_expenditure",
"graduation_rates"."graduated"
FROM "schools"
JOIN "expenditures"
ON "schools"."district_id" = "expenditures"."district_id"
JOIN "graduation_rates"
ON "schools"."id" = "graduation_rates"."school_id"
WHERE "expenditures"."per_pupil_expenditure" > (
    SELECT AVG("per_pupil_expenditure")
    FROM "expenditures"
)
AND "graduation_rates"."graduated" < (
    SELECT AVG("graduated")
    FROM "graduation_rates"
)
ORDER BY "expenditures"."per_pupil_expenditure" DESC;
