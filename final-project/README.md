# Final Project – Medical Device Recall Database

This project is the final project for CS50's Introduction to Databases with SQL by HarvardX.

## Overview

The project uses SQLite to organize and analyze public FDA medical device recall data from the openFDA database.

The database was designed to support queries about recall classifications, recalling firms, recall histories, and ongoing Class I recalls.

## Database Design

The database uses three related tables:

- `firm` — stores information about firms associated with recalls.
- `event` — stores recall event information, including status, location, and dates.
- `recall_record` — stores individual recall records, including classification, product description, and reason for recall.

Primary keys, foreign keys, constraints, and indexes help maintain data integrity and support efficient queries.

The complete design documentation and entity-relationship diagram are available in `DESIGN.md`.

## Files Included

- `DESIGN.md` — project purpose, scope, entities, relationships, optimizations, limitations, entity-relationship diagram, and video overview.
- `schema.sql` — SQL statements used to define the database schema and indexes.
- `queries.sql` — annotated SQL queries for retrieving and modifying data.
- `load_data.py` — Python script used to load the source dataset into the database.
- `erd.png` — entity-relationship diagram.

## Technologies and Concepts

- SQLite
- SQL
- Relational database design
- Primary and foreign keys
- Data integrity constraints
- Indexing and query optimization
- Data exploration and analysis
- Python for data loading

## Video Demonstration

[Watch the project video on YouTube](https://youtu.be/lBierGSK3tI)

## Data Source

The project uses public medical device recall data from the FDA's openFDA database.

Source: https://open.fda.gov/apis/device/recall/

## Disclaimer

This is an educational project developed as part of CS50's Introduction to Databases with SQL. It is intended for learning and demonstrating database design and querying skills.
