# Packages, Please

This exercise is part of Week 1 of CS50's Introduction to Databases with SQL.

## Description

Packages, Please is a database investigation exercise involving tracking packages through a delivery system.

The goal is to determine the status, location, and final destination of different packages using SQL queries across multiple related tables such as packages, addresses, scans, and drivers.

## Cases Solved

### The Lost Letter
- Tracked a missing package from sender to final destination.
- Determined final address and delivery type.

### The Devious Delivery
- Identified an unusual package ("Duck debugger").
- Tracked its movement through scan history.
- Found final delivery location (Police Station).

### The Forgotten Gift
- Tracked a gift between relatives.
- Determined final status and current holder of the package.

## Files included

- packages.sql (SQL queries used to solve the cases)
- answers.txt (final answers to the questions)

## SQL Concepts Used

- SELECT statements
- Subqueries
- Filtering with WHERE
- ORDER BY and LIMIT
- JOIN-like logic using nested queries
- Working with relational data
- Tracking state changes over time (scans table)
