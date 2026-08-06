# Your Harvard

This exercise is part of Week 5 of CS50's Introduction to Databases with SQL.

## Description

Your Harvard focuses on database optimization through the creation of indexes.
The objective is to improve the performance of common queries executed on a university course database by designing efficient indexes while balancing query speed and storage requirements.

The database contains information about students, courses, enrollments, requirements, and course requirements relationships.

## File Included

- indexes.sql

## Approach

To solve this exercise, I first analyzed the execution plans of the provided SQL queries using `EXPLAIN QUERY PLAN`.

I identified which tables were performing full table scans (`SCAN`) and determined which columns were frequently used in filtering and joining operations.

Based on this analysis, I created indexes on the columns that improved query performance, including indexes for student enrollments, course searches, course requirements, and course relationships.

After creating the indexes, I reviewed the query plans again to verify that SQLite was using indexes instead of unnecessary table scans.

The final solution balances query optimization with storage efficiency by avoiding unnecessary indexes.

## SQL Concepts Used

- CREATE INDEX
- EXPLAIN QUERY PLAN
- Query optimization
- Database indexing
- Composite indexes
- Primary key indexes
- JOIN optimization
- Search optimization

## Skills Developed

- Analyzing database query performance
- Understanding how indexes improve searches
- Designing efficient database structures
- Optimizing relational database queries
- Balancing performance and storage costs
- Interpreting SQLite execution plans
