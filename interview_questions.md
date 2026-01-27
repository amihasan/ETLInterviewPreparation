# SQL Interview Questions

## Table of Contents
1. [Basic SQL Concepts](#basic-sql-concepts)
2. [Intermediate Questions](#intermediate-questions)
3. [Advanced SQL Topics](#advanced-sql-topics)
4. [Scenario-Based Questions](#scenario-based-questions)
5. [Performance & Optimization](#performance--optimization)
6. [Database Design Questions](#database-design-questions)

---

## Basic SQL Concepts

### Q1: What is the difference between WHERE and HAVING clauses?
**Answer:** 
- `WHERE` filters rows before grouping (used with individual rows)
- `HAVING` filters groups after grouping (used with aggregate functions)
- `WHERE` cannot use aggregate functions; `HAVING` can

**Example:**
```sql
-- WHERE: filters individual employees
SELECT * FROM employees WHERE salary > 50000;

-- HAVING: filters department groups
SELECT department_id, AVG(salary) 
FROM employees 
GROUP BY department_id 
HAVING AVG(salary) > 50000;
```

### Q2: Explain the different types of JOINs with examples.
**Answer:**
- **INNER JOIN**: Returns only matching rows from both tables
- **LEFT JOIN (LEFT OUTER JOIN)**: Returns all rows from left table, matching rows from right
- **RIGHT JOIN (RIGHT OUTER JOIN)**: Returns all rows from right table, matching rows from left
- **FULL JOIN (FULL OUTER JOIN)**: Returns all rows when there's a match in either table
- **CROSS JOIN**: Returns Cartesian product of both tables
- **SELF JOIN**: Joins a table to itself

```sql
-- INNER JOIN
SELECT e.name, d.department_name 
FROM employees e 
INNER JOIN departments d ON e.dept_id = d.dept_id;

-- LEFT JOIN
SELECT d.department_name, e.name 
FROM departments d 
LEFT JOIN employees e ON d.dept_id = e.dept_id;
```

### Q3: What is the difference between DELETE, TRUNCATE, and DROP?
**Answer:**
- **DELETE**: Removes specific rows, can use WHERE clause, can be rolled back, slower, triggers fire
- **TRUNCATE**: Removes all rows, cannot use WHERE, can be rolled back (in some DBs), faster, triggers don't fire, resets identity
- **DROP**: Removes entire table structure and data, cannot be rolled back

```sql
DELETE FROM employees WHERE salary < 30000;  -- Delete specific rows
TRUNCATE TABLE employees;                     -- Remove all data, keep structure
DROP TABLE employees;                          -- Remove table completely
```

### Q4: What are PRIMARY KEY and FOREIGN KEY?
**Answer:**
- **PRIMARY KEY**: Uniquely identifies each record, cannot be NULL, only one per table
- **FOREIGN KEY**: Links two tables together, references PRIMARY KEY of another table, can be NULL

```sql
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
```

### Q5: What is the difference between UNION and UNION ALL?
**Answer:**
- **UNION**: Combines results and removes duplicates (slower)
- **UNION ALL**: Combines results and keeps duplicates (faster)

```sql
-- UNION (removes duplicates)
SELECT name FROM employees_2023
UNION
SELECT name FROM employees_2024;

-- UNION ALL (keeps duplicates)
SELECT name FROM employees_2023
UNION ALL
SELECT name FROM employees_2024;
```

### Q6: Explain NULL values and how to handle them.
**Answer:**
NULL represents missing or unknown data. Key points:
- NULL is not equal to anything, including itself
- Use `IS NULL` or `IS NOT NULL` to check
- Most operations with NULL return NULL
- Use `COALESCE()` or `IFNULL()` to handle NULLs

```sql
-- Check for NULL
SELECT * FROM employees WHERE manager_id IS NULL;

-- Replace NULL with default value
SELECT name, COALESCE(phone, 'No phone') FROM employees;

-- NULL in calculations
SELECT salary * bonus;  -- Returns NULL if bonus is NULL
SELECT salary * COALESCE(bonus, 0);  -- Safe calculation
```

### Q7: What is a subquery? What are the types?
**Answer:**
A subquery is a query nested inside another query. Types:
- **Scalar subquery**: Returns single value
- **Row subquery**: Returns single row
- **Column subquery**: Returns single column
- **Table subquery**: Returns multiple rows and columns
- **Correlated subquery**: References outer query

```sql
-- Scalar subquery
SELECT * FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Correlated subquery
SELECT * FROM employees e 
WHERE salary > (SELECT AVG(salary) FROM employees WHERE dept_id = e.dept_id);
```

### Q8: What is the difference between RANK(), DENSE_RANK(), and ROW_NUMBER()?
**Answer:**
- **ROW_NUMBER()**: Assigns unique sequential numbers (1,2,3,4...)
- **RANK()**: Assigns ranks with gaps for ties (1,2,2,4...)
- **DENSE_RANK()**: Assigns ranks without gaps for ties (1,2,2,3...)

```sql
SELECT name, salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) as row_num,
    RANK() OVER (ORDER BY salary DESC) as rank,
    DENSE_RANK() OVER (ORDER BY salary DESC) as dense_rank
FROM employees;

-- Results with salaries 100, 90, 90, 80:
-- row_num: 1, 2, 3, 4
-- rank: 1, 2, 2, 4
-- dense_rank: 1, 2, 2, 3
```

---

## Intermediate Questions

### Q9: Find the second highest salary in the employees table.
**Answer:**
```sql
-- Method 1: Using LIMIT/OFFSET
SELECT DISTINCT salary 
FROM employees 
ORDER BY salary DESC 
LIMIT 1 OFFSET 1;

-- Method 2: Using subquery
SELECT MAX(salary) 
FROM employees 
WHERE salary < (SELECT MAX(salary) FROM employees);

-- Method 3: Using DENSE_RANK
SELECT salary 
FROM (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) as rnk 
    FROM employees
) ranked 
WHERE rnk = 2;
```

### Q10: Find duplicate records in a table.
**Answer:**
```sql
-- Find duplicate emails
SELECT email, COUNT(*) as count 
FROM employees 
GROUP BY email 
HAVING COUNT(*) > 1;

-- Show all details of duplicates
SELECT * FROM employees 
WHERE email IN (
    SELECT email 
    FROM employees 
    GROUP BY email 
    HAVING COUNT(*) > 1
);
```

### Q11: Delete duplicate rows keeping one record.
**Answer:**
```sql
-- Using ROW_NUMBER (PostgreSQL, SQL Server)
DELETE FROM employees 
WHERE employee_id IN (
    SELECT employee_id 
    FROM (
        SELECT employee_id, 
               ROW_NUMBER() OVER (PARTITION BY email ORDER BY employee_id) as rn 
        FROM employees
    ) t 
    WHERE rn > 1
);

-- Using self-join
DELETE e1 FROM employees e1 
INNER JOIN employees e2 
WHERE e1.email = e2.email 
  AND e1.employee_id > e2.employee_id;
```

### Q12: Write a query to find employees who earn more than their manager.
**Answer:**
```sql
SELECT e.name as employee_name, 
       e.salary as employee_salary,
       m.name as manager_name,
       m.salary as manager_salary
FROM employees e
INNER JOIN employees m ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;
```

### Q13: Find departments with no employees.
**Answer:**
```sql
-- Using LEFT JOIN
SELECT d.* 
FROM departments d 
LEFT JOIN employees e ON d.dept_id = e.dept_id 
WHERE e.employee_id IS NULL;

-- Using NOT EXISTS
SELECT * FROM departments d 
WHERE NOT EXISTS (
    SELECT 1 FROM employees e WHERE e.dept_id = d.dept_id
);

-- Using NOT IN
SELECT * FROM departments 
WHERE dept_id NOT IN (SELECT DISTINCT dept_id FROM employees WHERE dept_id IS NOT NULL);
```

### Q14: Display employee names with their cumulative salary.
**Answer:**
```sql
SELECT name, 
       salary,
       SUM(salary) OVER (ORDER BY employee_id) as cumulative_salary
FROM employees;

-- Cumulative salary by department
SELECT name, 
       dept_id,
       salary,
       SUM(salary) OVER (PARTITION BY dept_id ORDER BY employee_id) as dept_cumulative
FROM employees;
```

### Q15: Find employees hired in the last 30 days.
**Answer:**
```sql
-- MySQL
SELECT * FROM employees 
WHERE hire_date >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY);

-- PostgreSQL
SELECT * FROM employees 
WHERE hire_date >= CURRENT_DATE - INTERVAL '30 days';

-- SQL Server
SELECT * FROM employees 
WHERE hire_date >= DATEADD(DAY, -30, GETDATE());
```

### Q16: Write a query to swap values in two columns.
**Answer:**
```sql
-- Swap first_name and last_name
UPDATE employees 
SET first_name = last_name,
    last_name = first_name;

-- Safe method using CASE (swap gender M/F)
UPDATE employees 
SET gender = CASE 
    WHEN gender = 'M' THEN 'F'
    WHEN gender = 'F' THEN 'M'
    ELSE gender
END;
```

---

## Advanced SQL Topics

### Q17: Explain window functions and when to use them.
**Answer:**
Window functions perform calculations across rows related to the current row without grouping.

**Common window functions:**
- **Ranking**: ROW_NUMBER(), RANK(), DENSE_RANK()
- **Aggregate**: SUM(), AVG(), COUNT(), MAX(), MIN()
- **Navigation**: LAG(), LEAD(), FIRST_VALUE(), LAST_VALUE()
- **Distribution**: NTILE(), PERCENT_RANK(), CUME_DIST()

```sql
-- Compare each employee's salary with department average
SELECT name, 
       dept_id,
       salary,
       AVG(salary) OVER (PARTITION BY dept_id) as dept_avg,
       salary - AVG(salary) OVER (PARTITION BY dept_id) as diff_from_avg
FROM employees;

-- Previous and next salary
SELECT name,
       salary,
       LAG(salary) OVER (ORDER BY hire_date) as previous_salary,
       LEAD(salary) OVER (ORDER BY hire_date) as next_salary
FROM employees;
```

### Q18: What is a CTE? Write an example.
**Answer:**
CTE (Common Table Expression) is a temporary named result set that exists within the execution of a single query.

**Advantages:**
- Improves readability
- Can be referenced multiple times
- Supports recursion
- Alternative to derived tables

```sql
-- Basic CTE
WITH dept_salaries AS (
    SELECT dept_id, AVG(salary) as avg_salary
    FROM employees
    GROUP BY dept_id
)
SELECT e.name, e.salary, ds.avg_salary
FROM employees e
JOIN dept_salaries ds ON e.dept_id = ds.dept_id
WHERE e.salary > ds.avg_salary;

-- Recursive CTE (employee hierarchy)
WITH RECURSIVE emp_hierarchy AS (
    -- Anchor member: top-level employees
    SELECT employee_id, name, manager_id, 1 as level
    FROM employees
    WHERE manager_id IS NULL
    
    UNION ALL
    
    -- Recursive member
    SELECT e.employee_id, e.name, e.manager_id, eh.level + 1
    FROM employees e
    INNER JOIN emp_hierarchy eh ON e.manager_id = eh.employee_id
)
SELECT * FROM emp_hierarchy ORDER BY level;
```

### Q19: Find the Nth highest salary without using LIMIT/TOP.
**Answer:**
```sql
-- For N = 3
SELECT DISTINCT salary
FROM employees e1
WHERE 3 = (
    SELECT COUNT(DISTINCT salary)
    FROM employees e2
    WHERE e2.salary >= e1.salary
);

-- Using window function
SELECT salary
FROM (
    SELECT DISTINCT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) as rank
    FROM employees
) ranked
WHERE rank = 3;
```

### Q20: Write a query to find gaps in sequential data.
**Answer:**
```sql
-- Find missing employee IDs
SELECT e1.employee_id + 1 as missing_start,
       MIN(e2.employee_id) - 1 as missing_end
FROM employees e1
LEFT JOIN employees e2 ON e1.employee_id + 1 = e2.employee_id
WHERE e2.employee_id IS NULL
  AND e1.employee_id + 1 < (SELECT MAX(employee_id) FROM employees)
GROUP BY e1.employee_id;

-- Alternative using window functions
WITH numbered AS (
    SELECT employee_id,
           employee_id - ROW_NUMBER() OVER (ORDER BY employee_id) as grp
    FROM employees
)
SELECT MIN(employee_id) as range_start,
       MAX(employee_id) as range_end
FROM numbered
GROUP BY grp;
```

### Q21: Explain ACID properties with examples.
**Answer:**
**ACID** ensures reliable database transactions:

- **Atomicity**: All or nothing. Transaction completes fully or not at all.
  ```sql
  BEGIN TRANSACTION;
  UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;
  UPDATE accounts SET balance = balance + 100 WHERE account_id = 2;
  COMMIT;  -- Both succeed or both fail
  ```

- **Consistency**: Database moves from one valid state to another. Constraints are maintained.
  ```sql
  -- CHECK constraint ensures consistency
  ALTER TABLE employees ADD CONSTRAINT chk_salary CHECK (salary > 0);
  ```

- **Isolation**: Concurrent transactions don't interfere. Different isolation levels: READ UNCOMMITTED, READ COMMITTED, REPEATABLE READ, SERIALIZABLE.
  ```sql
  SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
  ```

- **Durability**: Committed changes persist even after system failure.

### Q22: What is database normalization? Explain with examples.
**Answer:**
Normalization reduces redundancy and dependency by organizing data.

**Normal Forms:**

**1NF (First Normal Form):**
- Atomic values (no repeating groups)
- Each column contains single value

```sql
-- Not in 1NF
CREATE TABLE orders (
    order_id INT,
    products VARCHAR(200)  -- "Apple, Banana, Orange"
);

-- In 1NF
CREATE TABLE orders (
    order_id INT,
    product VARCHAR(50)
);
```

**2NF (Second Normal Form):**
- Must be in 1NF
- No partial dependencies (non-key attributes depend on entire primary key)

```sql
-- Not in 2NF (OrderID, ProductID is composite key, but CustomerName depends only on OrderID)
CREATE TABLE orders (
    order_id INT,
    product_id INT,
    customer_name VARCHAR(50),
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);

-- In 2NF
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);
```

**3NF (Third Normal Form):**
- Must be in 2NF
- No transitive dependencies (non-key attributes don't depend on other non-key attributes)

---

## Scenario-Based Questions

### Q23: You have a sales table. Find the top 3 selling products in each category.
**Answer:**
```sql
WITH ranked_products AS (
    SELECT 
        category,
        product_name,
        SUM(quantity) as total_sold,
        RANK() OVER (PARTITION BY category ORDER BY SUM(quantity) DESC) as rank
    FROM sales
    GROUP BY category, product_name
)
SELECT category, product_name, total_sold
FROM ranked_products
WHERE rank <= 3;
```

### Q24: Calculate running total and running average of sales.
**Answer:**
```sql
SELECT 
    sale_date,
    amount,
    SUM(amount) OVER (ORDER BY sale_date) as running_total,
    AVG(amount) OVER (ORDER BY sale_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as running_avg,
    -- Moving average (last 7 days)
    AVG(amount) OVER (ORDER BY sale_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as moving_avg_7
FROM sales
ORDER BY sale_date;
```

### Q25: Find customers who made purchases in consecutive months.
**Answer:**
```sql
WITH monthly_purchases AS (
    SELECT 
        customer_id,
        DATE_FORMAT(purchase_date, '%Y-%m') as year_month,
        DATE_FORMAT(purchase_date, '%Y-%m-01') as month_start
    FROM purchases
    GROUP BY customer_id, year_month
),
with_next_month AS (
    SELECT 
        customer_id,
        month_start,
        LEAD(month_start) OVER (PARTITION BY customer_id ORDER BY month_start) as next_month
    FROM monthly_purchases
)
SELECT DISTINCT customer_id
FROM with_next_month
WHERE DATEDIFF(next_month, month_start) = 1;

-- Alternative: Find sequences of consecutive months
WITH numbered AS (
    SELECT 
        customer_id,
        purchase_month,
        purchase_month - ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY purchase_month) as grp
    FROM (
        SELECT customer_id, 
               EXTRACT(YEAR FROM purchase_date) * 12 + EXTRACT(MONTH FROM purchase_date) as purchase_month
        FROM purchases
        GROUP BY customer_id, purchase_month
    ) monthly
)
SELECT customer_id, 
       COUNT(*) as consecutive_months
FROM numbered
GROUP BY customer_id, grp
HAVING COUNT(*) >= 2;
```

### Q26: Find products that are always purchased together.
**Answer:**
```sql
-- Products purchased in same order
SELECT 
    s1.product_id as product_1,
    s2.product_id as product_2,
    COUNT(DISTINCT s1.order_id) as times_bought_together
FROM sales s1
INNER JOIN sales s2 ON s1.order_id = s2.order_id
WHERE s1.product_id < s2.product_id
GROUP BY s1.product_id, s2.product_id
ORDER BY times_bought_together DESC
LIMIT 10;

-- Products where product_1 is ALWAYS bought with product_2
SELECT 
    s1.product_id as base_product,
    s2.product_id as companion_product
FROM sales s1
CROSS JOIN (SELECT DISTINCT product_id FROM sales) s2
WHERE s1.product_id != s2.product_id
GROUP BY s1.product_id, s2.product_id
HAVING COUNT(DISTINCT s1.order_id) = (
    SELECT COUNT(DISTINCT order_id) 
    FROM sales 
    WHERE product_id = s1.product_id
);
```

### Q27: Calculate customer retention rate month over month.
**Answer:**
```sql
WITH monthly_active_customers AS (
    SELECT 
        DATE_FORMAT(purchase_date, '%Y-%m') as month,
        customer_id
    FROM purchases
    GROUP BY month, customer_id
),
retention AS (
    SELECT 
        curr.month as current_month,
        COUNT(DISTINCT curr.customer_id) as current_customers,
        COUNT(DISTINCT prev.customer_id) as retained_customers
    FROM monthly_active_customers curr
    LEFT JOIN monthly_active_customers prev 
        ON curr.customer_id = prev.customer_id
        AND DATE_FORMAT(DATE_ADD(STR_TO_DATE(prev.month, '%Y-%m'), INTERVAL 1 MONTH), '%Y-%m') = curr.month
    GROUP BY curr.month
)
SELECT 
    current_month,
    current_customers,
    retained_customers,
    ROUND(retained_customers * 100.0 / LAG(current_customers) OVER (ORDER BY current_month), 2) as retention_rate_pct
FROM retention
ORDER BY current_month;
```

### Q28: Find the median value in a column.
**Answer:**
```sql
-- Method 1: Using window functions (most efficient)
WITH numbered AS (
    SELECT 
        salary,
        ROW_NUMBER() OVER (ORDER BY salary) as row_num,
        COUNT(*) OVER () as total_count
    FROM employees
)
SELECT AVG(salary) as median_salary
FROM numbered
WHERE row_num IN (FLOOR((total_count + 1) / 2.0), CEIL((total_count + 1) / 2.0));

-- Method 2: Using PERCENTILE_CONT (PostgreSQL, SQL Server)
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY salary) as median_salary
FROM employees;

-- Method 3: Subquery approach
SELECT AVG(salary) as median_salary
FROM (
    SELECT salary, 
           @row_num := @row_num + 1 as row_num,
           @total_rows := @row_num as total_rows
    FROM employees, (SELECT @row_num := 0) r
    ORDER BY salary
) ranked
WHERE row_num IN (FLOOR((@total_rows + 1) / 2), CEIL((@total_rows + 1) / 2));
```

---

## Performance & Optimization

### Q29: How do you optimize a slow query?
**Answer:**
**Steps to optimize:**

1. **Use EXPLAIN/EXPLAIN ANALYZE**
```sql
EXPLAIN SELECT * FROM employees WHERE salary > 50000;
```

2. **Add appropriate indexes**
```sql
CREATE INDEX idx_salary ON employees(salary);
CREATE INDEX idx_dept_salary ON employees(department_id, salary);
```

3. **Avoid SELECT ***
```sql
-- Instead of
SELECT * FROM employees;
-- Use
SELECT employee_id, name, salary FROM employees;
```

4. **Use WHERE instead of HAVING when possible**
```sql
-- Bad
SELECT dept_id FROM employees GROUP BY dept_id HAVING dept_id = 5;
-- Good
SELECT dept_id FROM employees WHERE dept_id = 5 GROUP BY dept_id;
```

5. **Use EXISTS instead of IN for large datasets**
```sql
-- Instead of
SELECT * FROM employees WHERE dept_id IN (SELECT dept_id FROM departments WHERE location = 'NY');
-- Use
SELECT * FROM employees e WHERE EXISTS (SELECT 1 FROM departments d WHERE d.dept_id = e.dept_id AND d.location = 'NY');
```

6. **Avoid functions on indexed columns**
```sql
-- Bad (can't use index)
SELECT * FROM employees WHERE YEAR(hire_date) = 2023;
-- Good
SELECT * FROM employees WHERE hire_date >= '2023-01-01' AND hire_date < '2024-01-01';
```

7. **Use proper JOIN order and types**
8. **Partition large tables**
9. **Analyze query execution plan**
10. **Consider denormalization for read-heavy workloads**

### Q30: Explain different types of indexes.
**Answer:**

1. **Clustered Index**: Determines physical order of data in table (one per table)
2. **Non-Clustered Index**: Separate structure with pointers to data (multiple allowed)
3. **Unique Index**: Ensures uniqueness
4. **Composite Index**: Index on multiple columns
5. **Full-Text Index**: For text searching
6. **Bitmap Index**: Efficient for low-cardinality columns
7. **Covering Index**: Index contains all columns needed by query

```sql
-- Create various indexes
CREATE INDEX idx_name ON employees(last_name);
CREATE UNIQUE INDEX idx_email ON employees(email);
CREATE INDEX idx_dept_salary ON employees(department_id, salary);
CREATE FULLTEXT INDEX idx_description ON products(description);
```

### Q31: What are query execution plans and how to read them?
**Answer:**
Execution plans show how database will execute a query.

**Key components:**
- **Scan vs Seek**: Full table scan (slow) vs index seek (fast)
- **Join types**: Nested loop, hash join, merge join
- **Cost**: Estimated resource usage
- **Rows**: Estimated rows processed
- **Filters**: WHERE conditions applied

```sql
-- Get execution plan
EXPLAIN SELECT e.name, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE e.salary > 50000;

-- Analyze actual execution
EXPLAIN ANALYZE SELECT ...;
```

**Red flags:**
- Table scans on large tables
- Missing indexes
- High estimated costs
- Implicit conversions
- Large row count estimates

---

## Database Design Questions

### Q32: Design a database schema for an e-commerce system.
**Answer:**
```sql
-- Users
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    parent_category_id INT,
    FOREIGN KEY (parent_category_id) REFERENCES categories(category_id)
);

-- Products
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'processing', 'shipped', 'delivered', 'cancelled'),
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Order Items
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Addresses
CREATE TABLE addresses (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    address_line1 VARCHAR(255),
    address_line2 VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(20),
    country VARCHAR(100),
    is_default BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Reviews
CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
```

### Q33: How would you handle soft deletes?
**Answer:**
```sql
-- Add deleted_at column
ALTER TABLE employees ADD COLUMN deleted_at TIMESTAMP NULL;

-- Create index for performance
CREATE INDEX idx_deleted_at ON employees(deleted_at);

-- Soft delete
UPDATE employees SET deleted_at = NOW() WHERE employee_id = 123;

-- Query active records
SELECT * FROM employees WHERE deleted_at IS NULL;

-- Create view for convenience
CREATE VIEW active_employees AS
SELECT * FROM employees WHERE deleted_at IS NULL;

-- Restore deleted record
UPDATE employees SET deleted_at = NULL WHERE employee_id = 123;

-- Hard delete (permanent)
DELETE FROM employees WHERE deleted_at < DATE_SUB(NOW(), INTERVAL 90 DAY);
```

### Q34: Design a schema for a social media friend system.
**Answer:**
```sql
-- Users table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Friendships (mutual relationship)
CREATE TABLE friendships (
    user_id1 INT,
    user_id2 INT,
    status ENUM('pending', 'accepted', 'blocked') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id1, user_id2),
    FOREIGN KEY (user_id1) REFERENCES users(user_id),
    FOREIGN KEY (user_id2) REFERENCES users(user_id),
    CHECK (user_id1 < user_id2)  -- Ensure consistent ordering
);

-- Get all friends of a user
SELECT u.user_id, u.username
FROM users u
INNER JOIN friendships f ON (u.user_id = f.user_id2 OR u.user_id = f.user_id1)
WHERE (f.user_id1 = ? OR f.user_id2 = ?)
  AND u.user_id != ?
  AND f.status = 'accepted';

-- Send friend request
INSERT INTO friendships (user_id1, user_id2, status)
VALUES (LEAST(?, ?), GREATEST(?, ?), 'pending');

-- Accept friend request
UPDATE friendships
SET status = 'accepted'
WHERE user_id1 = LEAST(?, ?) AND user_id2 = GREATEST(?, ?);
```

### Q35: Common interview coding challenges.

**Challenge 1: Find employees with same salary**
```sql
SELECT e1.name, e2.name, e1.salary
FROM employees e1
INNER JOIN employees e2 ON e1.salary = e2.salary
WHERE e1.employee_id < e2.employee_id;
```

**Challenge 2: Display hierarchical data**
```sql
WITH RECURSIVE org_chart AS (
    SELECT employee_id, name, manager_id, name as path, 0 as level
    FROM employees
    WHERE manager_id IS NULL
    
    UNION ALL
    
    SELECT e.employee_id, e.name, e.manager_id,
           CONCAT(oc.path, ' > ', e.name) as path,
           oc.level + 1
    FROM employees e
    INNER JOIN org_chart oc ON e.manager_id = oc.employee_id
)
SELECT REPEAT('  ', level) || name as hierarchy, level
FROM org_chart
ORDER BY path;
```

**Challenge 3: Pivot table (dynamic columns)**
```sql
-- Static pivot
SELECT 
    product_name,
    SUM(CASE WHEN month = 'Jan' THEN sales ELSE 0 END) as Jan,
    SUM(CASE WHEN month = 'Feb' THEN sales ELSE 0 END) as Feb,
    SUM(CASE WHEN month = 'Mar' THEN sales ELSE 0 END) as Mar
FROM sales_data
GROUP BY product_name;
```

---

## Additional Tips for Interviews

### Common Mistakes to Avoid:
1. Not considering NULL values
2. Forgetting to handle duplicates
3. Using SELECT * in production code
4. Not optimizing queries with proper indexes
5. Ignoring transaction handling for critical operations
6. Not considering edge cases
7. Forgetting to test with large datasets

### Questions to Ask Interviewer:
1. What is the expected data volume?
2. Are there any performance requirements?
3. What database system is being used?
4. Are there any specific constraints or business rules?
5. Should we consider data archival?
6. What's the expected concurrency level?

### Practice Resources:
- LeetCode Database problems
- HackerRank SQL challenges
- SQLZoo tutorials
- Mode Analytics SQL tutorial
- Practice with real datasets

Good luck with your SQL interviews! 🚀
