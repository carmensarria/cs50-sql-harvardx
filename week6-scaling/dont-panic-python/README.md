# Don't Panic! with Python
This exercise is part of Week 6 of CS50's Introduction to Databases with SQL.

## Description
Don't Panic! with Python focuses on connecting a Python application to a SQLite database and using prepared statements to safely modify database records.
The objective was to write a Python program that allows the user to choose a new administrative password and update the corresponding record in the database.
The exercise builds on the SQL concepts introduced in the original Don't Panic! exercise from Week 3 and introduces the use of SQL from Python.

## Files Included
- hack.py
- reset.sql

## Approach
To solve this exercise, I first inspected the database structure and the existing users table to understand how the administrator account was stored.
The initial version of the program used a fixed password directly inside the SQL statement. The exercise then required modifying the program so that the new password could be provided by the user while the program was running.

First, I used Python's input() function to ask the user for a password and stored the result in the password variable.
Next, I modified the SQL UPDATE statement by replacing the fixed password with a ? placeholder. This transformed the query into a prepared statement.

The password was then passed separately to the db.execute() method. The CS50 SQL library uses the value provided as a parameter for the placeholder in the SQL query.
This approach separates the SQL statement from the user-provided value and demonstrates how prepared statements can be used when working with dynamic input.
After running the program, I verified the result directly in SQLite by querying the users table and confirming that the administrator's password had been updated.

During the development process, I also used reset.sql to restore the database to its original state after testing different versions of the program.

## Step-by-Step Process

1. Connected the Python program to the SQLite database using the CS50 SQL library.
2. Added user input with input() to allow the password to be chosen when the program runs.
3. Stored the user's input in the password variable.
4. Replaced the hard-coded password in the UPDATE statement with a ? placeholder.
5. Passed the password variable separately to db.execute().
6. Ran the Python program and provided a new password.
7. Opened the SQLite database to verify that the administrator's password had been updated.
8. Used reset.sql when necessary to restore the database to its original state for additional testing.

## SQL and Python Concepts Used
- UPDATE statements
- Prepared statements
- SQL placeholders (?)
- Parameterized queries
- Python input with input()
- Python variables
- CS50 SQL library
- SQLite database connections
- Passing parameters from Python to SQL
- Database modification

## Skills Developed
- Connecting Python applications to SQLite databases
- Executing SQL statements from Python
- Using prepared statements
- Working with parameterized queries
- Handling user-provided input
- Modifying database records programmatically
- Verifying database changes using SQLite
- Understanding the interaction between application code and databases
