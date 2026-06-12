# Census Taker
This exercise is part of Week 4 of CS50's Introduction to Databases with SQL.

## Description
Census Taker focuses on analyzing population data from Nepal by creating SQL views that summarize and filter census records.

The dataset includes information about districts, localities, households, families, and population breakdowns by gender.

The objective is to transform raw census data into structured views for analysis and reporting.

## Files Included
- rural.sql
- total.sql
- by_district.sql
- most_populated.sql

## Approach
To solve this exercise, I explored the structure of the census dataset and identified how each column contributes to demographic analysis.

First, I created a view to filter rural municipalities using pattern matching with LIKE. Then, I generated a total summary of the entire country using aggregate functions. After that, I grouped the data by district to compute regional statistics. Finally, I ordered the results to identify the most populated districts in Nepal.

This exercise emphasized the use of SQL views as a tool for simplifying complex queries and improving data readability.

## SQL Concepts Used
- CREATE VIEW
- SELECT queries
- WHERE with LIKE
- GROUP BY
- SUM aggregation
- ORDER BY
- Column aliasing (AS)
- Data summarization

## Skills Developed
- Building reusable SQL views
- Aggregating large datasets
- Filtering structured data
- Grouping and summarizing information
- Analyzing demographic datasets using SQL
