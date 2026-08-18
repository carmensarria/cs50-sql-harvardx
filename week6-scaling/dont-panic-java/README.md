# Don't Panic! with Java

This exercise is part of Week 6 of CS50's Introduction to Databases with SQL.

## Description

Don't Panic! with Java focuses on connecting a Java application to a SQLite database and using prepared statements to modify database records. The objective was to write a Java program that connects to the database and allows the user to choose a new administrative password.

The exercise builds on the original Don't Panic! exercise from Week 3 and the Python version from Week 6. It introduces JDBC, Java's standard API for connecting applications to relational databases, and demonstrates how SQL statements can be executed from Java.

## Files Included

- Hack.java
- reset.sql

## Approach

To solve this exercise, I first created a basic Java program and verified that it could compile and run successfully.

The first step was establishing a connection between Java and the SQLite database using JDBC. I used the `DriverManager` and `Connection` classes to connect to `dont-panic.db`. Because Java does not include a SQLite driver by default, the provided SQLite JDBC driver was added to the Java classpath when running the program.

Once the connection was working, I used a `Statement` object to execute an SQL `UPDATE` statement that changed the administrator's password. This intermediate step helped verify that Java could successfully execute SQL statements against the SQLite database.

The exercise then introduced prepared statements. I replaced the hard-coded password in the SQL statement with a `?` placeholder and changed the program to use `PreparedStatement`.

Finally, I used Java's `Scanner` class to request a new password from the user while the program was running. The entered value was passed to the prepared statement using `setString()`, and the `UPDATE` statement was executed against the database.

After running the program, I verified the result directly in SQLite by querying the `users` table and confirming that the administrator's password had been updated.

During development, I also used `reset.sql` to restore the database to its original state when necessary and allow the program to be tested again from a clean database.

## Step-by-Step Process

1. Created a basic Java program and verified that it compiled successfully.
2. Imported the Java SQL classes required to work with the database.
3. Established a connection to `dont-panic.db` using `DriverManager` and `Connection`.
4. Added the SQLite JDBC driver to the Java classpath when running the program.
5. Created a `Statement` object to execute SQL from Java.
6. Executed an `UPDATE` statement to change the administrator's password.
7. Verified the database modification using SQLite.
8. Replaced the hard-coded password with a `?` placeholder.
9. Replaced `Statement` with `PreparedStatement`.
10. Added a `Scanner` to collect the new password from the user.
11. Used `setString()` to provide the user-entered password to the prepared statement.
12. Executed the parameterized `UPDATE` statement.
13. Verified the final password change directly in SQLite.
14. Used `reset.sql` when necessary to restore the database for additional testing.

## SQL and Java Concepts Used

- UPDATE statements
- Prepared statements
- SQL placeholders (`?`)
- Parameterized queries
- JDBC
- `DriverManager`
- `Connection`
- `Statement`
- `PreparedStatement`
- `Scanner`
- `setString()`
- `executeUpdate()`
- SQLite database connections
- Executing SQL from Java
- Java classpaths
- Database modification

## Skills Developed

- Connecting Java applications to SQLite databases
- Using JDBC to interact with relational databases
- Executing SQL statements from Java
- Using prepared statements
- Working with parameterized SQL queries
- Handling user input with Java
- Passing parameters from Java to SQL
- Modifying database records programmatically
- Verifying database changes using SQLite
- Understanding the interaction between application code and databases
