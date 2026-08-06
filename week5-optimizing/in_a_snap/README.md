# In a Snap

This exercise is part of Week 5 of CS50's Introduction to Databases with SQL.

## Description

In a Snap focuses on writing efficient SQL queries for a fictional messaging application where users send temporary images that expire after being viewed.

The objective of this exercise was to retrieve information from a relational database while ensuring queries were optimized through the use of indexes. The problem introduced the importance of query performance and demonstrated how database indexes can improve data retrieval speed.

## Files Included

- snap.sql

## Approach

To solve this exercise, I analyzed the database schema and identified the relationships between users, friendships, and messages.

Each query was designed not only to return the correct results, but also to take advantage of existing indexes. I used filtering, aggregation, subqueries, grouping, ordering, and set operations to retrieve the required information efficiently.

The performance of each query was evaluated using `EXPLAIN QUERY PLAN` to verify that SQLite was using the expected indexes during execution.

This exercise emphasized the importance of balancing query correctness and performance when working with large relational databases.

## SQL Concepts Used

- SELECT queries
- WHERE filtering
- Subqueries
- JOIN operations
- Aggregate functions (COUNT)
- GROUP BY
- ORDER BY
- LIMIT
- INTERSECT
- Index usage
- EXPLAIN QUERY PLAN
- Query optimization

## Skills Developed

- Writing optimized SQL queries
- Understanding how indexes improve database performance
- Analyzing query execution plans
- Working with relational database schemas
- Using aggregation and grouping for data analysis
- Retrieving data efficiently from large datasets
- Applying database optimization techniques
