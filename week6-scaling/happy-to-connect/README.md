# Happy to Connect

This exercise is part of Week 6 of CS50's Introduction to Databases with SQL.

## Description

Happy to Connect focuses on designing a MySQL database schema for a professional networking platform similar to LinkedIn.
The goal was to design a normalized relational database capable of representing users, schools, companies, professional connections, educational history, and employment history.

## Database Structure

The database contains the following tables:

- `users` — stores user information and credentials.
- `schools` — stores schools and universities.
- `companies` — stores companies and their industries.
- `connections` — represents mutual connections between users.
- `education` — stores users' educational history.
- `employment` — stores users' employment history.

## Files Included

- `schema.sql` — MySQL database schema.
- `test.sql` — sample data and queries used to test the schema and its constraints.

## SQL Concepts Used

- CREATE TABLE
- DROP TABLE IF EXISTS
- PRIMARY KEY
- FOREIGN KEY
- Composite primary keys
- UNIQUE constraints
- CHECK constraints
- NOT NULL constraints
- ENUM
- AUTO_INCREMENT
- ON DELETE CASCADE
- ON DELETE RESTRICT
- JOIN operations
- Self-JOIN
- Relational database normalization
- Data modeling

## Design Decisions

The `connections` table uses a composite primary key and a `CHECK` constraint to represent mutual connections without storing both `(user_id, connection_id)` and `(connection_id, user_id)`.
Foreign keys are used to preserve referential integrity between users, schools, companies, education records, and employment records.
`ON DELETE CASCADE` is used for user-dependent records, while `ON DELETE RESTRICT` prevents schools or companies from being deleted while they are still referenced by education or employment records.

## Testing

The schema was tested using sample data based on the problem specification.
Additional tests were performed to verify:

- successful insertion of valid records
- JOIN relationships
- uniqueness of usernames
- uniqueness of connections
- prevention of inverted connection pairs
- foreign key constraints

## Skills Developed

- Designing relational databases from specifications
- Modeling real-world entities and relationships
- Designing normalized schemas
- Working with MySQL
- Implementing primary and foreign keys
- Applying database constraints
- Testing relational database integrity
- Using JOINs to query related data
