# Don't Panic!

This exercise is part of Week 3 of CS50's Introduction to Databases with SQL.

## Description

Don't Panic! focuses on modifying existing records, understanding database triggers, and manipulating audit logs.

The objective is to alter a user's password, remove evidence of the real modification, and create misleading log entries while preserving database consistency.

## File Included

* hack.sql

## Approach

To solve this exercise, I first inspected the database schema using SQLite's `.schema` command in order to understand the available tables, relationships, and triggers.

The investigation revealed that updates to user accounts automatically generated audit records through database triggers. After identifying the relevant tables and stored password hashes, I modified the administrator account, removed the generated audit record, and inserted a fabricated log entry using a subquery to retrieve data dynamically from the database.

This exercise emphasized the importance of understanding database schemas before modifying data and demonstrated how triggers can automatically record changes.

## SQL Concepts Used

* UPDATE
* DELETE
* INSERT
* Triggers
* Subqueries
* INSERT INTO ... SELECT
* Filtering with WHERE

## Skills Developed

* Modifying existing data
* Working with audit trails
* Understanding trigger-generated records
* Retrieving values with subqueries
* Manipulating relational data
