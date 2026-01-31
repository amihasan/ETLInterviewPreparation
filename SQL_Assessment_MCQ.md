# SQL Assessment - MCQ

## SQL Basics

### 1. Which SQL statement is used to retrieve data from a database?
- A) GET
- B) SELECT
- C) FETCH
- D) READ

**Answer: B) SELECT**

### 2. Which clause is used to filter rows in a query?
- A) ORDER BY
- B) GROUP BY
- C) WHERE
- D) HAVING

**Answer: C) WHERE**

### 3. Which SQL keyword is used to remove duplicate rows in a result set?
- A) UNIQUE
- B) DISTINCT
- C) DIFFERENT
- D) DEDUPE

**Answer: B) DISTINCT**

### 4. Which operator is used to match patterns in SQL?
- A) MATCH
- B) LIKE
- C) BETWEEN
- D) IN

**Answer: B) LIKE**

### 5. Which clause sorts the result set?
- A) ORDER BY
- B) GROUP BY
- C) SORT
- D) ARRANGE

**Answer: A) ORDER BY**

## Aggregations and Grouping

### 6. Which function returns the number of rows?
- A) SUM()
- B) COUNT()
- C) TOTAL()
- D) NUMBER()

**Answer: B) COUNT()**

### 7. Which clause is used to group rows for aggregation?
- A) GROUP BY
- B) ORDER BY
- C) PARTITION BY
- D) HAVING

**Answer: A) GROUP BY**

### 8. Which clause filters groups after aggregation?
- A) WHERE
- B) HAVING
- C) FILTER
- D) GROUP BY

**Answer: B) HAVING**

### 9. What does AVG() return?
- A) Total of values
- B) Maximum value
- C) Average of values
- D) Minimum value

**Answer: C) Average of values**

### 10. Which function returns the highest value in a column?
- A) TOP()
- B) MAX()
- C) HIGH()
- D) CEIL()

**Answer: B) MAX()**

## Joins

### 11. Which join returns only matching rows from both tables?
- A) LEFT JOIN
- B) RIGHT JOIN
- C) INNER JOIN
- D) FULL JOIN

**Answer: C) INNER JOIN**

### 12. Which join returns all rows from the left table and matching rows from the right table?
- A) INNER JOIN
- B) LEFT JOIN
- C) RIGHT JOIN
- D) FULL JOIN

**Answer: B) LEFT JOIN**

### 13. Which join returns all rows from both tables, matching where possible?
- A) FULL OUTER JOIN
- B) LEFT JOIN
- C) INNER JOIN
- D) CROSS JOIN

**Answer: A) FULL OUTER JOIN**

### 14. Which join produces a Cartesian product?
- A) INNER JOIN
- B) LEFT JOIN
- C) CROSS JOIN
- D) RIGHT JOIN

**Answer: C) CROSS JOIN**

### 15. Which join returns all rows from the right table and matching rows from the left table?
- A) LEFT JOIN
- B) RIGHT JOIN
- C) INNER JOIN
- D) FULL JOIN

**Answer: B) RIGHT JOIN**

## Subqueries and CTEs

### 16. What is a subquery?
- A) A stored procedure
- B) A query inside another query
- C) A temporary table
- D) A transaction

**Answer: B) A query inside another query**

### 17. Which keyword introduces a common table expression?
- A) TEMP
- B) WITH
- C) CTE
- D) AS

**Answer: B) WITH**

### 18. Which type of subquery returns multiple rows?
- A) Scalar subquery
- B) Correlated subquery
- C) Multi-row subquery
- D) Single-row subquery

**Answer: C) Multi-row subquery**

### 19. A correlated subquery is executed:
- A) Once only
- B) For each row of the outer query
- C) Only for aggregates
- D) After ORDER BY

**Answer: B) For each row of the outer query**

### 20. Which clause can be used to filter results from a CTE?
- A) WHERE
- B) HAVING
- C) ORDER BY
- D) Any of the above

**Answer: D) Any of the above**

## Set Operations

### 21. Which operator combines results and removes duplicates?
- A) UNION ALL
- B) UNION
- C) INTERSECT
- D) EXCEPT

**Answer: B) UNION**

### 22. Which operator combines results and keeps duplicates?
- A) UNION
- B) UNION ALL
- C) INTERSECT
- D) EXCEPT

**Answer: B) UNION ALL**

### 23. Which operator returns common rows between two queries?
- A) INTERSECT
- B) EXCEPT
- C) UNION
- D) JOIN

**Answer: A) INTERSECT**

### 24. Which operator returns rows from the first query not in the second?
- A) INTERSECT
- B) UNION
- C) EXCEPT
- D) JOIN

**Answer: C) EXCEPT**

### 25. For set operations, result sets must have:
- A) Same number of columns and compatible types
- B) Same table name
- C) Same indexes
- D) Same primary keys

**Answer: A) Same number of columns and compatible types**

## Data Types and Constraints

### 26. Which constraint enforces uniqueness of values?
- A) CHECK
- B) UNIQUE
- C) NOT NULL
- D) DEFAULT

**Answer: B) UNIQUE**

### 27. Which constraint prevents NULL values?
- A) UNIQUE
- B) CHECK
- C) NOT NULL
- D) FOREIGN KEY

**Answer: C) NOT NULL**

### 28. Which constraint enforces referential integrity?
- A) PRIMARY KEY
- B) UNIQUE
- C) FOREIGN KEY
- D) CHECK

**Answer: C) FOREIGN KEY**

### 29. Which constraint ensures a column has only specified values?
- A) CHECK
- B) DEFAULT
- C) UNIQUE
- D) FOREIGN KEY

**Answer: A) CHECK**

### 30. Which statement is used to create a table?
- A) CREATE TABLE
- B) MAKE TABLE
- C) BUILD TABLE
- D) NEW TABLE

**Answer: A) CREATE TABLE**

## Normalization and Keys

### 31. What is a primary key?
- A) A key used for sorting only
- B) A unique identifier for a table row
- C) A key used in other tables
- D) A key with duplicates allowed

**Answer: B) A unique identifier for a table row**

### 32. What is a foreign key?
- A) A unique identifier in the same table
- B) A field referencing a primary key in another table
- C) A key used only for sorting
- D) A key for encryption

**Answer: B) A field referencing a primary key in another table**

### 33. First Normal Form (1NF) requires:
- A) No duplicate columns and atomic values
- B) No partial dependencies
- C) No transitive dependencies
- D) Only one table

**Answer: A) No duplicate columns and atomic values**

### 34. Second Normal Form (2NF) requires:
- A) 1NF and no partial dependency on a composite key
- B) 1NF and no transitive dependency
- C) Only atomic values
- D) No foreign keys

**Answer: A) 1NF and no partial dependency on a composite key**

### 35. Third Normal Form (3NF) requires:
- A) 2NF and no transitive dependencies
- B) 2NF and no partial dependencies
- C) No duplicate rows only
- D) Only one primary key

**Answer: A) 2NF and no transitive dependencies**

## Indexes and Performance

### 36. What is the primary purpose of an index?
- A) To enforce constraints
- B) To speed up data retrieval
- C) To store backups
- D) To compress data

**Answer: B) To speed up data retrieval**

### 37. Which index type enforces uniqueness?
- A) Clustered index
- B) Nonclustered index
- C) Unique index
- D) Bitmap index

**Answer: C) Unique index**

### 38. What is a clustered index?
- A) An index that stores data rows in the index structure
- B) An index used only for small tables
- C) An index without keys
- D) A temporary index

**Answer: A) An index that stores data rows in the index structure**

### 39. Which action can slow down INSERT operations?
- A) Fewer indexes
- B) More indexes
- C) Normalization
- D) Using WHERE

**Answer: B) More indexes**

### 40. Which tool helps analyze query performance?
- A) EXPLAIN/EXPLAIN PLAN
- B) DESCRIBE
- C) SHOW TABLES
- D) ROLLBACK

**Answer: A) EXPLAIN/EXPLAIN PLAN**

## Transactions and ACID

### 41. Which property ensures a transaction is all-or-nothing?
- A) Atomicity
- B) Consistency
- C) Isolation
- D) Durability

**Answer: A) Atomicity**

### 42. Which property ensures data rules are preserved?
- A) Atomicity
- B) Consistency
- C) Isolation
- D) Durability

**Answer: B) Consistency**

### 43. Which property ensures concurrent transactions do not interfere?
- A) Durability
- B) Isolation
- C) Atomicity
- D) Consistency

**Answer: B) Isolation**

### 44. Which property ensures committed data persists after failure?
- A) Atomicity
- B) Consistency
- C) Isolation
- D) Durability

**Answer: D) Durability**

### 45. Which SQL statement starts a transaction?
- A) BEGIN TRANSACTION
- B) START QUERY
- C) OPEN TRANSACTION
- D) TRANSACT

**Answer: A) BEGIN TRANSACTION**

## Views and Stored Objects

### 46. What is a view?
- A) A stored procedure
- B) A virtual table based on a query
- C) A physical copy of data
- D) A table constraint

**Answer: B) A virtual table based on a query**

### 47. Which statement creates a view?
- A) CREATE VIEW
- B) CREATE TABLE
- C) CREATE INDEX
- D) CREATE PROCEDURE

**Answer: A) CREATE VIEW**

### 48. What is a stored procedure?
- A) A saved, precompiled SQL program
- B) A database trigger
- C) An index type
- D) A table alias

**Answer: A) A saved, precompiled SQL program**

### 49. What is a trigger?
- A) A manual script
- B) Code that runs automatically on data changes
- C) A scheduled job only
- D) A query optimizer

**Answer: B) Code that runs automatically on data changes**

### 50. Which object is best for reusable parameterized logic?
- A) View
- B) Stored procedure
- C) Index
- D) Foreign key

**Answer: B) Stored procedure**

## Window Functions

### 51. Which window function assigns a unique sequential number?
- A) RANK()
- B) DENSE_RANK()
- C) ROW_NUMBER()
- D) NTILE()

**Answer: C) ROW_NUMBER()**

### 52. Which function skips rank values on ties?
- A) ROW_NUMBER()
- B) RANK()
- C) DENSE_RANK()
- D) NTILE()

**Answer: B) RANK()**

### 53. Which function does not skip rank values on ties?
- A) RANK()
- B) DENSE_RANK()
- C) ROW_NUMBER()
- D) NTILE()

**Answer: B) DENSE_RANK()**

### 54. Which clause defines the window for a window function?
- A) WINDOW BY
- B) OVER()
- C) PARTITION()
- D) GROUP OVER

**Answer: B) OVER()**

### 55. Which clause resets window function calculations per group?
- A) GROUP BY
- B) PARTITION BY
- C) ORDER BY
- D) WINDOW BY

**Answer: B) PARTITION BY**

## Data Modification

### 56. Which statement adds new rows to a table?
- A) ADD
- B) INSERT
- C) UPDATE
- D) MERGE

**Answer: B) INSERT**

### 57. Which statement modifies existing rows?
- A) INSERT
- B) UPDATE
- C) DELETE
- D) TRUNCATE

**Answer: B) UPDATE**

### 58. Which statement removes specific rows?
- A) DROP
- B) DELETE
- C) TRUNCATE
- D) REMOVE

**Answer: B) DELETE**

### 59. Which statement removes all rows but keeps the table structure?
- A) DROP
- B) DELETE
- C) TRUNCATE
- D) ERASE

**Answer: C) TRUNCATE**

### 60. Which statement can insert or update in a single operation?
- A) MERGE (or UPSERT)
- B) JOIN
- C) UNION
- D) INTERSECT

**Answer: A) MERGE (or UPSERT)**

## NULLs and Three-Valued Logic

### 61. How do you check for NULL values?
- A) = NULL
- B) IS NULL
- C) NULL()
- D) EQUAL NULL

**Answer: B) IS NULL**

### 62. Which is TRUE when a column is NULL?
- A) column = NULL
- B) column <> NULL
- C) column IS NULL
- D) column LIKE NULL

**Answer: C) column IS NULL**

### 63. What is the result of NULL = NULL?
- A) TRUE
- B) FALSE
- C) UNKNOWN
- D) ERROR

**Answer: C) UNKNOWN**

### 64. Which function can replace NULLs with a value?
- A) NVL/COALESCE
- B) NULLIF
- C) ISNULL only
- D) REPLACE

**Answer: A) NVL/COALESCE**

### 65. Which operator handles NULL-safe comparison in some SQL dialects?
- A) =
- B) <=>
- C) ==
- D) :=

**Answer: B) <=>**

## Security and Permissions

### 66. Which statement grants privileges?
- A) GRANT
- B) ALLOW
- C) GIVE
- D) PERMIT

**Answer: A) GRANT**

### 67. Which statement removes privileges?
- A) DELETE
- B) DROP
- C) REVOKE
- D) REMOVE

**Answer: C) REVOKE**

### 68. What is SQL injection?
- A) A database backup technique
- B) A security vulnerability from untrusted input
- C) A query optimization method
- D) A data transformation

**Answer: B) A security vulnerability from untrusted input**

### 69. Which practice helps prevent SQL injection?
- A) Dynamic string concatenation
- B) Parameterized queries
- C) Disabling constraints
- D) Using SELECT * only

**Answer: B) Parameterized queries**

### 70. Which role-based model restricts access by job function?
- A) DAC
- B) MAC
- C) RBAC
- D) ABAC

**Answer: C) RBAC**

## Advanced Concepts

### 71. What is a transaction isolation level?
- A) A query ordering method
- B) A rule that controls visibility between concurrent transactions
- C) A backup frequency
- D) A data type

**Answer: B) A rule that controls visibility between concurrent transactions**

### 72. Which isolation level can cause dirty reads?
- A) READ COMMITTED
- B) REPEATABLE READ
- C) SERIALIZABLE
- D) READ UNCOMMITTED

**Answer: D) READ UNCOMMITTED**

### 73. Which isolation level prevents phantom reads?
- A) READ COMMITTED
- B) REPEATABLE READ
- C) SERIALIZABLE
- D) READ UNCOMMITTED

**Answer: C) SERIALIZABLE**

### 74. Which scenario is a deadlock?
- A) Two transactions waiting on each other’s locks
- B) A query with a missing index
- C) A query returning NULLs
- D) A failed connection

**Answer: A) Two transactions waiting on each other’s locks**

### 75. Which statement can be used to handle deadlocks safely?
- A) ROLLBACK and retry
- B) DROP table
- C) ALTER INDEX
- D) DELETE all rows

**Answer: A) ROLLBACK and retry**

## Data Modeling and Warehousing

### 76. What is a star schema?
- A) A schema with a single table
- B) A fact table connected to dimension tables
- C) A schema with only dimensions
- D) A schema without keys

**Answer: B) A fact table connected to dimension tables**

### 77. What is a snowflake schema?
- A) A schema where dimension tables are normalized
- B) A schema with only fact tables
- C) A schema with no dimensions
- D) A schema without relationships

**Answer: A) A schema where dimension tables are normalized**

### 78. What is the purpose of a surrogate key?
- A) To store a user’s email
- B) To provide a system-generated unique key
- C) To track UI sessions
- D) To store raw logs

**Answer: B) To provide a system-generated unique key**

### 79. Which table stores measurable business events?
- A) Dimension table
- B) Fact table
- C) Lookup table
- D) Reference table

**Answer: B) Fact table**

### 80. What is a conformed dimension?
- A) A dimension shared across data marts
- B) A dimension used once
- C) A staging table
- D) A temporary view

**Answer: A) A dimension shared across data marts**

## Analytics and Functions

### 81. Which function returns current date/time?
- A) NOW()/CURRENT_TIMESTAMP
- B) TODAY()
- C) GETDATEONLY()
- D) CURRENT_TIMEZONE()

**Answer: A) NOW()/CURRENT_TIMESTAMP**

### 82. Which function returns the number of distinct values?
- A) COUNT(*)
- B) COUNT(DISTINCT col)
- C) DISTINCT COUNT()
- D) UNIQUE()

**Answer: B) COUNT(DISTINCT col)**

### 83. Which function converts NULL to a value only if two expressions are equal?
- A) COALESCE
- B) NVL
- C) NULLIF
- D) ISNULL

**Answer: C) NULLIF**

### 84. Which clause limits the number of rows returned?
- A) LIMIT/TOP/FETCH
- B) WHERE
- C) GROUP BY
- D) HAVING

**Answer: A) LIMIT/TOP/FETCH**

### 85. Which function splits results into buckets?
- A) NTILE()
- B) RANK()
- C) DENSE_RANK()
- D) ROW_NUMBER()

**Answer: A) NTILE()**

## Practical SQL Scenarios

### 86. Which query finds duplicate rows by key?
- A) SELECT * FROM t
- B) SELECT key, COUNT(*) FROM t GROUP BY key HAVING COUNT(*) > 1
- C) SELECT DISTINCT key FROM t
- D) SELECT key FROM t ORDER BY key

**Answer: B) SELECT key, COUNT(*) FROM t GROUP BY key HAVING COUNT(*) > 1**

### 87. Which query finds rows in table A not in table B?
- A) INNER JOIN
- B) LEFT JOIN with NULL check
- C) CROSS JOIN
- D) UNION

**Answer: B) LEFT JOIN with NULL check**

### 88. Which query finds top 5 rows by highest amount?
- A) SELECT * FROM t ORDER BY amount DESC LIMIT 5
- B) SELECT * FROM t LIMIT 5
- C) SELECT * FROM t ORDER BY amount
- D) SELECT TOP 5 * FROM t

**Answer: A) SELECT * FROM t ORDER BY amount DESC LIMIT 5**

### 89. Which query calculates running total?
- A) SUM(amount) OVER (ORDER BY date)
- B) SUM(amount)
- C) COUNT(amount) OVER ()
- D) AVG(amount) OVER ()

**Answer: A) SUM(amount) OVER (ORDER BY date)**

### 90. Which query removes duplicates while keeping one row?
- A) DELETE FROM t
- B) DELETE FROM t WHERE ROW_NUMBER() OVER (PARTITION BY key ORDER BY id) > 1
- C) UPDATE t SET key = NULL
- D) TRUNCATE t

**Answer: B) DELETE FROM t WHERE ROW_NUMBER() OVER (PARTITION BY key ORDER BY id) > 1**

## Testing and Data Quality

### 91. Which check validates referential integrity?
- A) Verify foreign keys match primary keys
- B) Count all rows
- C) Sort by key
- D) Apply DISTINCT only

**Answer: A) Verify foreign keys match primary keys**

### 92. Which check validates column data types?
- A) Schema validation
- B) UI validation
- C) Browser testing
- D) Accessibility testing

**Answer: A) Schema validation**

### 93. Which check compares aggregates across systems?
- A) Row count only
- B) Sum/average comparison
- C) UI snapshot
- D) Sorting check

**Answer: B) Sum/average comparison**

### 94. Which check validates data completeness?
- A) All expected records are present
- B) All rows are sorted
- C) All indexes exist
- D) All rows are unique

**Answer: A) All expected records are present**

### 95. Which check validates data accuracy?
- A) Values match source or business rules
- B) Data is only unique
- C) Data is only sorted
- D) Data is only fast

**Answer: A) Values match source or business rules**

## Final Review

### 96. Which statement removes a table and its data?
- A) TRUNCATE TABLE
- B) DROP TABLE
- C) DELETE FROM
- D) REMOVE TABLE

**Answer: B) DROP TABLE**

### 97. Which statement changes a column definition?
- A) MODIFY TABLE
- B) ALTER TABLE
- C) CHANGE TABLE
- D) UPDATE TABLE

**Answer: B) ALTER TABLE**

### 98. Which function returns the first non-NULL value?
- A) COALESCE
- B) NULLIF
- C) NVL2 only
- D) ISNULL only

**Answer: A) COALESCE**

### 99. Which command saves changes permanently in a transaction?
- A) SAVEPOINT
- B) COMMIT
- C) ROLLBACK
- D) END

**Answer: B) COMMIT**

### 100. Which command undoes changes in a transaction?
- A) COMMIT
- B) ROLLBACK
- C) SAVEPOINT
- D) END

**Answer: B) ROLLBACK**

---

## Scoring Guide:
- 90-100: Excellent - Senior SQL Engineer
- 75-89: Very Good - Mid-Level SQL Engineer
- 60-74: Good - Junior SQL Engineer
- Below 60: Needs Improvement - Focus on SQL fundamentals

---

**Note:** These questions cover SQL fundamentals, joins, aggregations, transactions, and performance concepts. Regular practice and hands-on experience are essential for mastery.
