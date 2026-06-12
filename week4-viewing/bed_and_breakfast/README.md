# Bed and Breakfast

This exercise is part of Week 4 of CS50's Introduction to Databases with SQL.

## Description

Bed and Breakfast focuses on analyzing Airbnb listing data from Boston using SQL views. The objective is to create multiple views that simplify the exploration of listings, availability, reviews, and vacancy patterns throughout the city.

## Files Included

- no_descriptions.sql
- one_bedrooms.sql
- available.sql
- frequently_reviewed.sql
- june_vacancies.sql

## Approach

To solve this exercise, I first explored the database schema and identified the relationships between listings, reviews, and availabilities.

I then created a series of independent SQL views, each designed to answer a specific analytical question. Some views focused on filtering records based on listing characteristics, while others required combining data from multiple tables using JOIN operations.

For review and vacancy analysis, aggregate functions were used to count related records, while GROUP BY and ORDER BY clauses helped organize the results according to the problem requirements.

This exercise provided practical experience working with SQL views as reusable queries and demonstrated how relational data can be transformed into meaningful summaries for analysis.

## SQL Concepts Used

- CREATE VIEW
- SELECT queries
- Filtering with WHERE
- JOIN operations
- Aggregate functions (COUNT)
- GROUP BY
- ORDER BY
- LIMIT
- Column aliasing with AS
- Working with relational datasets

## Skills Developed

- Creating and managing SQL views
- Combining data from multiple tables
- Analyzing listing availability data
- Aggregating and summarizing records
- Applying sorting and ranking logic
- Working with real-world relational datasets
- Transforming raw data into reusable analytical views
