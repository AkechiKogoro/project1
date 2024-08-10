SQL 
1.	Types of commands and their examples.
> SQL (Structured Query Language) is used for managing and manipulating relational databases. Here are some common types of SQL commands along with examples:
> - Data Definition Language (DDL):
>
>    These commands are used to define, alter, and manage schema and database objects.
>    1. CREATE: Used to create databases and database objects.
``` 
        CREATE TABLE Employees (
            EmployeeID int,
            FirstName varchar(255),
            LastName varchar(255),
            Email varchar(255)
        );
```
>
>            2. ALTER: Used to modify existing database schema.
>
```
        ALTER TABLE Employees ADD BirthDate date;
```
>
>            3. DROP: Used to delete objects from the database.
>
```
        DROP TABLE Employees;
```
> - Data Manipulation Language (DML): 
>
>       These commands are used for data handling and manipulation.
>       1. INSERT: Used to insert data into tables.
>
```
        INSERT INTO Employees (EmployeeID, FirstName, LastName, Email)
        VALUES (1, 'John', 'Doe', 'john.doe@example.com');
```
>           2. UPDATE: Used to modify existing data.
>
```
        UPDATE Employees SET Email = 'john.new@example.com' WHERE EmployeeID = 1;

```
>           3. DELETE: Used to remove data from a table.
>
```
            DELETE FROM Employees WHERE EmployeeID = 1;
```
>  - Data Control Language (DCL):
>
>       These commands are related to rights, permissions, and other control mechanisms.
>
>       1. GRANT: Gives user's access privileges to database.
>
```
        GRANT SELECT ON Employees TO user1;
```
>           2. REVOKE: Removes user's access privileges.
>
```
        REVOKE SELECT ON Employees FROM user1;
```
> - Transaction Control Language (TCL):
>
>   These commands deal with transaction management.
>
>       1. COMMIT: Saves all changes made in the transaction.
>
```
        COMMIT;
```
>       2. ROLLBACK: Undoes changes since the last commit.
>
```
        ROLLBACK;
```
> - Data Query Language (DQL)
>
>       1. SELECT: Used to query data from a database.
>      
```
        SELECT * FROM Employees;

```

2.	What is Normalization and denormalization?  
3.	Explain 1NF, 2NF, 3NF.
4.	Share use case where you had to do denormalization in database.
5.	What is primary key
 and foreign key
?
6.	what is alternate and candidate key
?
7.	What are window functions?
8.	Explain Ranking Functions? Given a small table , write the output.
9.	Types of Joins? With example and usecase. All the number of records return and exact records.
10.	Use case when self join is required.
11.	What is subquery?
12.	What is corelated subquery?
13.	What is CTE? 
14.	What is derived table?
15.	Find third highest employee based on salary?
16.	Find third highest employee based on salary  per department?
17.	How to find duplicate values in a single column?
18.	How to find duplicate values in a multiple column?
19.	What are ACID properties?
20.	Diff between union and union all
21.	Diff between primary key
 and unique key

22.	Difference between truncate and delete
23.	Difference between having and where
24.	SQL query execution order.
25.	What are indexes? Types of Indexes and their differences.
26.	What is surrogate key
? Give example where you used it and how.
27.	Ways to optimize sql query?