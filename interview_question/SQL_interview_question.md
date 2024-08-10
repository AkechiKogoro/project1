SQL 
1.	Types of commands and their examples.
> SQL (Structured Query Language) is used for managing and manipulating relational databases. Here are some common types of SQL commands along with examples:
> - Data Definition Language (DDL):
>
>    These commands are used to define, alter, and manage schema and database objects.
>
> 1. `CREATE`: Used to create databases and database objects.
``` 
        CREATE TABLE Employees (
            EmployeeID int,
            FirstName varchar(255),
            LastName varchar(255),
            Email varchar(255)
        );
```
>
> 2. `ALTER`: Used to modify existing database schema.
>
```
        ALTER TABLE Employees ADD BirthDate date;
```
>
> 3. `DROP`: Used to delete objects from the database.
>
```
        DROP TABLE Employees;
```
> - Data Manipulation Language (DML): 
>
>       These commands are used for data handling and manipulation.
>  1. `INSERT`: Used to insert data into tables.
>
```
        INSERT INTO Employees (EmployeeID, FirstName, LastName, Email)
        VALUES (1, 'John', 'Doe', 'john.doe@example.com');
```
>  2. `UPDATE`: Used to modify existing data.
>
```
        UPDATE Employees SET Email = 'john.new@example.com' WHERE EmployeeID = 1;

```
>  3. `DELETE`: Used to remove data from a table.
>
```
            DELETE FROM Employees WHERE EmployeeID = 1;
```
>  - Data Control Language (DCL):
>
>       These commands are related to rights, permissions, and other control mechanisms.
>
>  1. `GRANT`: Gives user's access privileges to database.
>
```
        GRANT SELECT ON Employees TO user1;
```
>  2. `REVOKE`: Removes user's access privileges.
>
```
        REVOKE SELECT ON Employees FROM user1;
```
> - Transaction Control Language (TCL):
>
>   These commands deal with transaction management.
>
> 1. `COMMIT`: Saves all changes made in the transaction.
>
```
        COMMIT;
```
> 2. `ROLLBACK`: Undoes changes since the last commit.
>
```
        ROLLBACK;
```
> - Data Query Language (DQL)
>
> 1. SELECT: Used to query data from a database.
>      
```
        SELECT * FROM Employees;

```

2.	What is Normalization and denormalization?  
> - Normalization
>
>   Normalization is a database design technique used to organize tables in a manner that reduces redundancy and dependency by dividing large tables into smaller ones and linking them using relationships. The main goals of normalization are to reduce data redundancy (duplicate data), enhance data integrity, and simplify data structures.
>
> - Denormalization
Denormalization is the process of trying to improve the read performance of a database by adding redundant data or by grouping data. In essence, it involves the controlled introduction of redundancy in a database to decrease the complexity of queries. The main goal is to optimize the performance of a database schema by increasing the speed of retrieval operations.
>
>   Denormalization may involve:
>
>   - Combining multiple tables into a single table.
>   - Adding redundant copies of data or groups of data.
>   - Using precomputed totals to speed up calculation-intensive queries.
>
> - Trade-offs
>
>   Normalization benefits include greater data consistency and reduced risk of data anomalies, but at the cost of more complex queries and potentially slower performance due to the need to join multiple tables.
Denormalization can enhance performance by reducing the need for joins and speeding up read-oriented tasks. However, it can lead to data redundancy, increased disk usage, and maintenance challenges since updates may need to be propagated to multiple redundant copies of data.
3.	Explain 1NF, 2NF, 3NF.
> Normal forms are a set of guidelines to help streamline database structures to minimize redundancy and improve data integrity. Here's a breakdown of the first three normal forms:
> 
> 1. First Normal Form (1NF)
> 
>    To satisfy the First Normal Form, a table must meet the following criteria:
>
>       - Atomicity: Each cell in the table should contain only a single value, meaning the values are indivisible. There should be no repeating groups or arrays.
>
>       - Uniqueness: The table should have a primary key, a unique identifier for table records. This ensures that each row represents a unique piece of data.
>
> 2. Second Normal Form (2NF)
> 
>      A table is in the Second Normal Form if:
>
>       - It is already in 1NF.
>       - All non-key attributes are fully functionally dependent on the primary key (i.e., the entire primary key if composite).
> 
> 3. Third Normal Form (3NF)
>
>       A table is in Third Normal Form if:
>
>       - It is already in 2NF.
>       - It does not contain transitive dependencies (where one non-key attribute depends on another non-key attribute).

4.	Share use case where you had to do denormalization in database.
> - An e-commerce platform maintains a highly normalized database for managing orders, products, customers, and inventory. 
> - The reporting system, which is used for generating real-time sales reports, customer behavior analytics, and inventory statuses, faces performance issues due to the complex joins and calculations needed due to the normalized schema.
> - To improve performance, certain aspects of the database are denormalized specifically for the reporting module.

5.	What is primary key and foreign key?
> - Primary Key
>
>   A primary key is a column (or a set of columns) in a table that uniquely identifies each row in that table. Every table should ideally have a primary key because it ensures that each record within the table can be uniquely distinguished from others.
>
>   Characteristics of a primary key:
>
>   - Uniqueness: No two rows can have the same primary key value. This uniqueness guarantees that each record can be retrieved, updated, or deleted without ambiguity.
>   - Non-nullability: A primary key cannot have NULL values. Each row must have a value for the primary key.
>   - Persistence: Once defined, the primary key value of a record should not change. Changing key values can lead to data integrity issues.
> 
> - Foreign Key
>   A foreign key is a column (or a set of columns) in one table that links to the primary key of another table. The purpose of the foreign key is to enforce referential integrity within the database. Essentially, it ensures that relationships between tables remain consistent.
>
>   Characteristics of a foreign key:
>
>   - Reference: A foreign key in one table points to a primary key in another table, establishing a relationship between the two tables.
>   - Referential Integrity: The database enforces that every value in the foreign key column must either be null or match a value in the primary key column of the referenced table. This prevents records pointing to non-existent entries in related tables.
>   - Cascading Actions: Actions like updates and deletes can be cascaded from the referenced table to the referencing table, ensuring data integrity across relationships.

6.	what is alternate and candidate key?
> - Candidate Key
> 
>   A candidate key is a column, or a set of columns, that can uniquely identify any row in a table. Each table may have one or more candidate keys, but only one of them can be chosen as the primary key.
>
>   Characteristics of candidate keys:
>
>   - Uniqueness: Each candidate key must ensure that no two rows have the same value in the database table.
>   - Non-nullability: They must contain a value in every row (no NULLs allowed).
>
>   All candidate keys are potential primary keys, but only one set is selected based on design requirements and constraints, such as simplicity or the frequency of usage.
> 
> - Alternate Key
>
>   An alternate key is any candidate key that is not chosen as the primary key. These keys also guarantee uniqueness within the table and can be used as a reference for foreign keys in other tables.
>
>   Characteristics of alternate keys:
>
>   - Uniqueness: Like primary keys, alternate keys are unique to every row in the table.
>   - Identity: Alternate keys can identify a record uniquely but are not used as the primary identifier.

7.	What are window functions?
> Window functions are a powerful feature in SQL that allow you to perform calculations across a set of table rows that are somehow related to the current row. Unlike standard aggregation functions that collapse the rows into a single output row, window functions perform calculations without collapsing rows, maintaining the original table's row structure.
> 
> -  of Window Functions
>
>       - Preserve Row Details: They perform calculations across a set of rows related to the current row while still returning an individual value for each row.
>       - Access to Multiple Rows: Window functions can access data from multiple rows at a time to calculate a return value for a specific row.
>       - Partitioning: Often used in conjunction with OVER() clause which defines the partitioning and ordering of a data subset for the function to operate over.
>
> - Common Uses of Window Functions
>
>   - Aggregations: Compute aggregate values such as SUM(), AVG(), MAX(), and others while still returning individual rows. Useful for running totals, moving averages, and cumulative statistics.
>
>   - Ranking: Assign a rank to each row within a partition of a result set. Functions like RANK(), DENSE_RANK(), and ROW_NUMBER() are typical examples.
>
>   - Row Navigation: Functions like LEAD(), LAG(), FIRST_VALUE(), and LAST_VALUE() allow navigation over rows (forward and backward) to return a value from another row at a specified physical offset which is very useful for comparing rows within the same result set.

8.	Explain Ranking Functions? Given a small table , write the output.

> Ranking functions in SQL are used to assign a rank to each row within the partition of a result set. The rank can be based on a specified column, and rows can be processed in ascending or descending order. Here are some of the most commonly used ranking functions:
>
>   - `ROW_NUMBER()`: Assigns a unique number to each row starting from 1 within the partition. Rows are numbered based on the ORDER BY clause in the function.
>
>   - `RANK()`: Assigns a rank to each row within a partition, with gaps in the rank values if there are ties. For example, if two rows are tied for rank 1, the next rank listed would be 3.
>
>   - `DENSE_RANK()`: Similar to RANK(), but ranks are consecutive. No gaps in the ranking sequence when there are ties. For example, if two rows are tied for rank 1, the next rank would be 2.
>
>   - `NTILE(n)`: Distributes the rows in an ordered partition into a specified number of groups and assigns an appropriate group number to each row. Useful for dividing data into quantiles or other similar segments.

9.	Types of Joins? With example and use case. All the number of records return and exact records.
> 1. INNER JOIN
>
>    Description: Returns records that have matching values in both tables.
>
> 2. LEFT JOIN (or LEFT OUTER JOIN)
>
>    Description: Returns all records from the left table, and the matched records from the right table. If there is no match, the result is NULL on the side of the right table.
>
> 3. RIGHT JOIN (or RIGHT OUTER JOIN)
>
>    Description: Returns all records from the right table, and the matched records from the left table. If there is no match, the result is NULL on the side of the left table.
> 
> 4. FULL JOIN (or FULL OUTER JOIN)
>
>    Description: Returns all records when there is a match in either left or right table records.
>
> 5. CROSS JOIN
>
>    Description: Returns the Cartesian product of both tables, i.e., each row of the first table is combined with all rows from the second table.

10.	Use case when self join is required.

> A self join is a regular join, but instead of joining two different tables, it joins a table to itself. This can be useful when the information related to each other is stored in the same table. A self join uses table aliases to differentiate between different instances of the same table during the query process.
11.	What is subquery?
>
> A subquery is a query nested inside another SQL query. Essentially, it's a query within a query, used to perform operations that require multiple steps of logic in database systems. Subqueries can be used in various clauses of an SQL statement, including SELECT, FROM, WHERE, and others.
> 
> Characteristics of Subqueries
>   - Nested Queries: Subqueries appear inside another SQL query.
>   - Execution Order: The inner query (subquery) executes before the main query, and the result of the subquery is used by the main query.
>   - Scope and Visibility: The outer query can use the result of the subquery, but the subquery cannot directly modify or access data from the outer query unless passed as a parameter.
>   - Independence: Subqueries can be independent (non-correlated) or dependent (correlated) on the outer query.

12.	What is correlated subquery?
> A correlated subquery is a type of subquery that is dependent on the outer query.
>
> Characteristics of Correlated Subqueries
>   - Dependency: The execution of the correlated subquery is dependent on the data from the outer query.
>   - Execution Order: Each time a row from the outer query is processed, the correlated subquery executes, using the current row's data to complete its computation.

13.	What is CTE? 
> 
> A Common Table Expression (CTE) is a temporary result set that you can reference within a `SELECT`, `INSERT`, `UPDATE`, or `DELETE` statement. CTEs are particularly useful for breaking down complex queries into simpler parts, making them easier to read and maintain. They can also be recursively defined to handle hierarchical or tree-structured data.
>
14.	What is derived table?
A derived table is a subquery that is used in the `FROM` clause of an SQL statement as if it were a regular table. Derived tables are temporary and exist only during the execution of the query. They allow you to simplify complex queries, particularly those involving multiple steps of aggregation or transformation, by encapsulating these steps within the subquery.

15.	Find third highest employee based on salary?
16.	Find third highest employee based on salary  per department?
17.	How to find duplicate values in a single column?
18.	How to find duplicate values in a multiple column?

19.	What are ACID properties?
> The ACID properties are a set of principles that guarantee database transactions are processed reliably and ensure the integrity of data within the database. ACID stands for Atomicity, Consistency, Isolation, and Durability.
>
> 1. Atomicity
>
>       Atomicity ensures that a transaction is treated as a single, indivisible unit, which means either all of its operations are completed successfully, or none of them are. If an error occurs during the execution of the transaction, any changes made up to that point are rolled back, as if the transaction had never been initiated.
> 
> 2. Consistency
>
>    Consistency ensures that a transaction can only bring the database from one valid state to another, maintaining the integrity of all data. All data must be valid according to all defined rules, including constraints, cascades, and triggers, during and after the transaction.
>
> 3. Isolation
>
>    Isolation ensures that the concurrent execution of transactions results in a system state that would be obtained if transactions were executed serially, i.e., one after the other. Each transaction should operate without any other transaction interfering with its operations or data. 
>
> 4. Durability
>
>    Durability ensures that once a transaction has been committed, it will remain so, even in the event of a system failure. This property guarantees that the committed changes are permanent and stored in non-volatile memory.

20.	Difference between `union` and `union all`.
> The `UNION` operator combines the result sets of two or more `SELECT` statements and removes duplicate rows from the result. It effectively performs a distinct operation across the result set.
>
> The `UNION ALL` operator combines the result sets of two or more `SELECT` statements but does not remove duplicate rows. It simply concatenates the results, making it faster since no additional work is needed to check for duplicates.

21.	Difference between primary key
 and unique 
 
> - Purpose: Primary keys serve as the main record identifier within a table, while unique keys provide a way to prevent duplicate values in other columns.
>
> - Nullability: Primary keys must contain non-null values, whereas unique keys can contain nulls.
>
> - Number of Keys: There is one primary key per table, but a table can have multiple unique keys

22.	Difference between truncate and delete
> 
> - Performance: `TRUNCATE` is faster for deleting all rows in a table because it doesn't log each row's deletion, while DELETE can be slow for large datasets as it logs each deletion.
> - Usage: Use `DELETE` when you need to selectively remove rows. Use `TRUNCATE` when you need to quickly remove all rows from a table.
> - Transaction Logs: `DELETE` records each row change in the transaction log, but `TRUNCATE` does not, which can be significant for recovery and replication.
> - Resetting Identity Columns: `TRUNCATE` resets identity columns, whereas `DELETE` does not.

23.	Difference between having and where
>
> - Filtering Stage: `WHERE` filters rows before any groupings are applied, whereas HAVING filters groups after they are formed by `GROUP BY`.
>
> - Aggregates Compatibility: `WHERE` cannot use aggregate functions since it filters data before aggregation, while `HAVING` is specifically designed to work with aggregate functions.
>
> - Context of Use: `WHERE` is used for filtering raw data, and `HAVING` is used for filtering aggregated or summarized data.

24.	SQL query execution order
> 
> 1. `FROM` clause
>
>       The SQL engine starts by identifying the source tables and joins specified in the `FROM` clause. This is where it determines which tables are involved in the query and how they are related.
>
> 2. `JOIN`s (if any)
>
>       If there are any `JOIN` conditions, these are applied after identifying the tables in the `FROM` clause. The database engine combines rows from two or more tables based on a related column between them.
>
> 3. `WHERE` clause
>
>     After joining tables, the `WHERE` clause filters the rows, eliminating those that do not satisfy the condition specified. This reduces the number of rows to be processed in subsequent steps.
>
> 4. `GROUP BY` clause
>
>     If a GROUP BY clause is present, the SQL engine groups the remaining rows based on the specified columns. This is essential for aggregating data.
>
> 5. `HAVING` clause
>
>    The `HAVING` clause filters these groups created by the `GROUP BY` clause. It is used to exclude groups that do not satisfy the given condition, often used with aggregate functions.
> 
> 6. `SELECT` clause
>
>     The `SELECT` clause specifies which columns or calculated results to display in the final result set. Although written first, this is processed after the data has been filtered and grouped.
>
> 7. `DISTINCT` clause
>
>     If the `DISTINCT` keyword is used, it is applied after the `SELECT` clause to remove duplicate rows from the result set.
>
> 8. `ORDER BY` clause
>
>     This clause sorts the result set according to specified column(s) and sort directions (`ASC` or `DESC`). It is one of the last operations performed.
>
> 9. `LIMIT` / `FETCH` / `OFFSET` clause
>
>    Primary operation: Finally, `LIMIT` or `OFFSET` clauses are applied to limit the number of rows returned or to skip a specific number of rows in the result set.

25.	What are indexes? Types of Indexes and their differences.
>
> In database systems, an index is a data structure that improves the speed of data retrieval operations on a database table at the cost of additional writes and storage space to maintain the index data structure. Indexes are used to quickly locate data without having to search every row in a database table every time a database table is accessed. They can significantly speed up querying but might slow down data input, with updates and deletions, due to the extra work required to maintain them.
>
> Types of Indexes and Their Differences
>
> 1. Clustered Index:
>
>       - How it works: A clustered index sorts and stores the data rows in the table based on the index key. There can be only one clustered index per table because the data rows themselves are sorted in only one order.
>      - Use cases: Best used for frequently accessed columns and range queries.
>      - Advantages: Since the data is physically stored in index order, reading data in that order is very fast.
>      - Disadvantages: Inserting and updating data can be slow because the data location might need to be changed to maintain order.
>
> 2. Non-Clustered Index
>
>       - How it works: A non-clustered index creates a separate structure from the data in the table and includes a sorted list of references to the table data. A table can have multiple non-clustered indexes.
>       - Use cases: Useful for columns used frequently in queries but not in range queries.
>       - Advantages: Faster for insert and update operations compared to clustered indexes because the data itself isn't reorganized—only the index.
>       - Disadvantages: Queries using non-clustered indexes are generally slower than queries using clustered indexes because the index lookup has to be followed by a data row lookup.
>
> 3. Unique Index
>
>       - How it works: A unique index ensures that the index key contains only unique values. This can be applied to both clustered and non-clustered indexes.
>       - Use cases: Enforcing uniqueness for columns, such as email addresses or employee IDs.
>       - Advantages: Helps maintain data integrity by ensuring that no two rows have the same index values.
>       - Disadvantages: Similar performance trade-offs as regular indexes, with additional overhead to check for uniqueness when data is inserted or updated.
>
> 4. Composite Index
>
>       - How it works: A composite index is an index on two or more columns of a table. Its effectiveness depends on the order of the columns in the definition.
>       - Use cases: Effective for queries that test all or the first part of the columns in the index.
>       - Advantages: Great for speeding up queries that use multiple columns.
>       - Disadvantages: More complex to manage and can be less efficient if queries only use the latter part of the columns in the index.
>
> 5. Full-Text Index
>
>       - How it works: Designed for text content, these indexes allow fast searching of text within the columns. They index the full content of a column.
>       - Use cases: Useful in searching texts within large books or articles, such as a search in a database of PDFs or blogs.
>       - Advantages: Facilitates complex searches through the text, including pattern matching.
>       - Disadvantages: Typically larger than other indexes and slower to update, which can impact performance when large volumes of text are modified.
>
> 6. Spatial Index
>
>       - How it works: Spatial indexes are used for geometric data stored in a spatial database, such as coordinates, polygons, etc.
>       - Use cases: Essential for efficient querying of spatial data, such as finding all locations within a certain distance from a point.
>       - Advantages: Optimizes spatial queries like distance calculations and area overlaps.
>       - Disadvantages: Only useful for geometric data and requires additional storage.
26.	What is surrogate key?? Give example where you used it and how.
> 
> A surrogate key is an artificial identifier for an entity, typically a number that has no business meaning. It is generated by the database system and is primarily used to uniquely identify a row within a table. Surrogate keys are commonly used in relational database design to provide a unique identifier for each record when natural keys (keys derived from data attributes that naturally identify an entity, such as Social Security numbers or email addresses) are either not present or not suitable.
> 
> Characteristics of Surrogate Keys
>   - Artificial: They are created specifically to serve as primary keys. They have no meaning outside the database and no business logic attached to them.
>   - Unique: Each surrogate key is unique across the table it is used in, ensuring that each record can be uniquely identified.
>   - Immutable: Once assigned, surrogate keys generally do not change. This immutability makes them ideal for use as primary keys.
>   - Sequential: They are often generated sequentially (though not necessarily), such as 1, 2, 3, etc., often using auto-increment features in database systems like SQL Server’s `IDENTITY` property, MySQL’s `AUTO_INCREMENT`, or PostgreSQL’s `SERIAL`.
>
> Advantages of Using Surrogate Keys
>   - Simplicity: Being automatically generated, they simplify the handling of entity identification in the database.
>   - Performance: Surrogate keys can enhance the performance of database operations, especially joins and lookups, because they are usually integers, which are faster to compare than other data types like strings.
>   - Stability: They do not change because they are not based on external data (which might need to be updated).
>   - Avoiding Duplication: They prevent issues arising from "duplicate" natural data that might be intended to be unique but isn't (e.g., two people with the same name and birthdate).
>   - Flexibility: If the natural key changes, it does not affect the surrogate key or the integrity of the relationships that depend on it.


27.	Ways to optimize sql query?
>
> 1. Use Appropriate Indexes
>
> 2. Avoid Selecting Unnecessary Columns
>
> 3.  Use Joins Instead of Subqueries
>
> 4. Where Clause Optimization
>       - Use Specific Conditions: Filter rows as early as possible in the WHERE clause to reduce the number of rows returned, which minimizes processing time.
>       - Sargable Queries: Write "search argumentable" (sargable) queries that allow the database to efficiently use indexes, such as avoiding functions on indexed columns in the WHERE clause.
>
> 5. Optimize Join Order and Type
>       - Order of Tables: When joining multiple tables, arrange them so that you reduce the size of the result set early in the query execution.
>       - Join Types: Use the appropriate type of join (`INNER`, `LEFT`, `RIGHT`, `OUTER`) based on the relationship and data requirements, which can significantly impact performance.
>
> 6. Limit the Use of Wildcards
>
> 7. Aggregate Data Efficiently
>
>       - Minimize Row Count Before Aggregating: Pre-filter data with `WHERE` or `LIMIT` to minimize the amount of data processed by aggregate functions (e.g., `SUM`, `AVG`).
>
> 8. Avoid Unnecessary Complex Calculations in Queries
>
> 9. Use Query Performance Analysis Tools
>
> 10. Optimize SQL Data Types
>
> 11. Batch Updates and Inserts
>
> 12. Normalize and Denormalize Thoughtfully