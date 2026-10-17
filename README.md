# CS50's Introduction to Databases with SQL — HarvardX

This repository contains my solutions to the problem sets and final project completed while studying **CS50's Introduction to Databases with SQL**, offered by HarvardX through edX.

The repository documents my learning process and provides a practical portfolio of SQL exercises, database design work, and data analysis projects.

## About the Course

- **Course:** CS50's Introduction to Databases with SQL
- **Institution:** Harvard University — CS50 / HarvardX
- **Platform:** edX
- **Instructors:** Carter Zenke and David J. Malan
- **Course page:** [CS50's Introduction to Databases with SQL](https://pll.harvard.edu/course/cs50s-introduction-databases-sql)

## Repository Structure

The repository is organized according to the course weeks and final project.

| Folder | Topics |
|---|---|
| `week0-introduction/` | SQL fundamentals, filtering, sorting, and aggregation |
| `week1-relating/` | Relational data, joins, and multi-table queries |
| `week2-designing/` | Database design, normalization, and constraints |
| `week3-writing/` | INSERT, UPDATE, DELETE, triggers, and data cleaning |
| `week4-viewing/` | Views, CTEs, and data summarization |
| `week5-optimizing/` | Indexes, query execution plans, and optimization |
| `week6-scaling/` | MySQL, database scalability, partitioning, and application integration |
| `final-project/` | Medical Device Recall Database |

Each week folder contains individual exercises and README files describing their objectives, SQL concepts, and implementation approaches.

## Final Project — Medical Device Recall Database

The final project uses SQLite to organize and analyze publicly available FDA medical device recall data from the openFDA Device Enforcement dataset.

The database contains three related entities:

- **Firms:** Organizations associated with recall events.
- **Events:** FDA recall events and their associated information.
- **Recall records:** Individual recall records, including classification, product description, and reason for recall.

The project includes a relational schema, an entity-relationship diagram, analytical SQL queries, and a Python data-loading script.

Key concepts applied include:

- Relational database design and normalization
- Primary keys, foreign keys, and uniqueness constraints
- JOIN operations and aggregate queries
- Data loading and transformation
- Indexing and query optimization
- Database integrity validation

Explore the [`final-project/`](final-project/) folder for the design documentation, schema, queries, diagram, and Python script.

## Topics and Skills Practiced

- SQL querying with SELECT, WHERE, ORDER BY, and LIMIT
- Aggregate functions and GROUP BY
- Relational database modeling and normalization
- Primary and foreign keys
- Database constraints and triggers
- INSERT, UPDATE, and DELETE operations
- Views and Common Table Expressions (CTEs)
- Indexes and query execution plans
- SQLite and MySQL
- Database partitioning and scalability concepts
- Connecting SQL databases with Python and Java
- Prepared statements and parameterized queries
- Data exploration, cleaning, and transformation

## Purpose

This repository serves as a personal learning archive and practical portfolio documenting my progress in SQL and relational database development.

The exercises and final project provide examples of applying database concepts to structured datasets and practical problem-solving tasks.

## Disclaimer

This is an independent learning repository containing my own exercise solutions, project files, and documentation created while studying CS50's Introduction to Databases with SQL through edX.

It is not an official course repository and is not affiliated with or endorsed by Harvard University, HarvardX, or CS50.
