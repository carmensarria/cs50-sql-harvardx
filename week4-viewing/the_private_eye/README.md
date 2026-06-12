# The Private Eye

This exercise is part of Week 4 of CS50's Introduction to Databases with SQL.

## Description

The Private Eye is a SQL decoding exercise based on a book cipher technique. The goal is to extract hidden phrases from a collection of sentences in a database using positional indices.

A set of numeric triplets is provided, where each triplet defines:
- the sentence ID
- the starting character position
- the length of the hidden message segment

Using these triplets, the task is to reconstruct a hidden message by extracting substrings from a text corpus.

## File included

- private.sql

## Approach

To solve this problem, I first constructed a Common Table Expression (CTE) to represent the cipher triplets as a virtual table. Each row contains a sentence identifier, a starting position, and a length.

Then, I joined this CTE with the sentences table using the sentence ID. Finally, I used the SQLite `substr()` function to extract the corresponding text segments and reconstruct the hidden message.

## SQL Concepts Used

- Common Table Expressions (CTE)
- SELECT statements
- UNION ALL
- JOIN operations
- String manipulation using substr()
- Column aliasing

## Skills Developed

- Decoding structured text using SQL
- Working with virtual datasets (CTEs)
- Extracting substrings from text fields
- Joining derived tables with base tables
- Building query-based solutions for data reconstruction
