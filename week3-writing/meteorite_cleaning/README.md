# Meteorite Cleaning

This exercise is part of Week 3 of CS50's Introduction to Databases with SQL.

## Description

Meteorite Cleaning focuses on importing, cleaning, and transforming a large CSV dataset containing historical meteorite landings on Earth.

The objective is to import raw data into SQLite, handle missing values, standardize numerical data, remove unwanted records, and create a clean dataset suitable for future analysis.

## Files Included

* import.sql

## Approach

To solve this exercise, I first created a temporary table matching the structure of the CSV file and imported the dataset using SQLite's `.import` command.

After importing the data, I inspected the dataset to identify missing values and understand how SQLite stored them. Empty values were converted to `NULL`, and all decimal values in the mass, latitude, and longitude columns were rounded to two decimal places.

Next, I created a final cleaned table and transferred the processed data from the temporary table. During this step, meteorites classified as `Relict` were excluded and the remaining records were sorted by year and name before being inserted. Finally, the temporary table was removed.

This exercise emphasized the importance of data cleaning, validation, and transformation before storing information for analysis.

## SQL Concepts Used

* CREATE TABLE
* INSERT INTO ... SELECT
* UPDATE
* ORDER BY
* ROUND
* NULL handling
* SQLite `.import`
* Data cleaning and transformation

## Skills Developed

* Importing CSV data into SQLite
* Cleaning incomplete datasets
* Handling missing values
* Transforming numerical data
* Creating and populating tables
* Organizing data for analysis
* Working with temporary tables
