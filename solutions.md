# SQL Practice Questions - Solutions

## Beginner Level

### 1. Basic SELECT Statements

**Q1: Select all columns from employees table**
```sql
SELECT * FROM employees;
```

**Q2: Select first_name and last_name only**
```sql
SELECT first_name, last_name FROM employees;
```

**Q3: Select distinct departments**
```sql
SELECT DISTINCT department FROM employees;
```

### 2. WHERE Clause

**Q4: Employees with salary > 50000**
```sql
SELECT * FROM employees WHERE salary > 50000;
```

**Q5: Employees in Sales department**
```sql
SELECT * FROM employees WHERE department = 'Sales';
```

**Q6: Employees whose first name starts with 'J'**
```sql
SELECT * FROM employees WHERE first_name LIKE 'J%';
```

**Q7: Employees hired between 2020 and 2023**
```sql
SELECT * FROM employees 
WHERE hire_date BETWEEN '2020-01-01' AND '2023-12-31';
```

### 3. ORDER BY

**Q8: Employees ordered by salary (descending)**
```sql
SELECT * FROM employees ORDER BY salary DESC;
```

**Q9: Order by department, then salary**
```sql
SELECT * FROM employees 
ORDER BY department ASC, salary DESC;
```

### 4. LIMIT/TOP

**Q10: Top 5 highest-paid employees**
```sql
-- MySQL/PostgreSQL
SELECT * FROM employees ORDER BY salary DESC LIMIT 5;

-- SQL Server
SELECT TOP 5 * FROM employees ORDER BY salary DESC;
```

## Intermediate Level

### 5. Aggregate Functions

**Q11: Count total employees**
```sql
SELECT COUNT(*) AS total_employees FROM employees;
```

**Q12: Average salary**
```sql
SELECT AVG(salary) AS average_salary FROM employees;
```

**Q13: Maximum and minimum salaries**
```sql
SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary 
FROM employees;
```

**Q14: Total salary expenditure**
```sql
SELECT SUM(salary) AS total_expenditure FROM employees;
```

### 6. GROUP BY

**Q15: Count employees per department**
```sql
SELECT department_id, COUNT(*) AS employee_count 
FROM employees 
GROUP BY department_id;
```

**Q16: Average salary per department**
```sql
SELECT department_id, AVG(salary) AS avg_salary 
FROM employees 
GROUP BY department_id;
```

**Q17: Highest salary per department**
```sql
SELECT department_id, MAX(salary) AS highest_salary 
FROM employees 
GROUP BY department_id;
```

### 7. HAVING Clause

**Q18: Departments with more than 10 employees**
```sql
SELECT department_id, COUNT(*) AS employee_count 
FROM employees 
GROUP BY department_id 
HAVING COUNT(*) > 10;
```

**Q19: Departments with average salary > 60000**
```sql
SELECT department_id, AVG(salary) AS avg_salary 
FROM employees 
GROUP BY department_id 
HAVING AVG(salary) > 60000;
```

**Q20: Departments with at least 3 employees earning > 70000**
```sql
SELECT department_id, COUNT(*) AS high_earners 
FROM employees 
WHERE salary > 70000 
GROUP BY department_id 
HAVING COUNT(*) >= 3;
```

### 8. JOINS

**Q21: Employees with department names**
```sql
SELECT e.first_name, e.last_name, d.department_name 
FROM employees e 
INNER JOIN departments d ON e.department_id = d.department_id;
```

**Q22: All departments with their employees (including empty departments)**
```sql
SELECT d.department_name, e.first_name, e.last_name 
FROM departments d 
LEFT JOIN employees e ON d.department_id = e.department_id;
```

**Q23: Employees with their managers**
```sql
SELECT e.first_name AS employee_name, m.first_name AS manager_name 
FROM employees e 
INNER JOIN employees m ON e.manager_id = m.employee_id;
```

**Q24: Employees in same department as John Smith**
```sql
SELECT e2.first_name, e2.last_name 
FROM employees e1 
INNER JOIN employees e2 ON e1.department_id = e2.department_id 
WHERE e1.first_name = 'John' AND e1.last_name = 'Smith' 
  AND e2.employee_id != e1.employee_id;
```

### 9. Subqueries

**Q25: Employees earning more than average**
```sql
SELECT * FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);
```

**Q26: Employees in departments located in New York**
```sql
SELECT * FROM employees 
WHERE department_id IN (
    SELECT department_id FROM departments WHERE location = 'New York'
);
```

**Q27: Highest salary employee per department**
```sql
SELECT * FROM employees e 
WHERE salary = (
    SELECT MAX(salary) 
    FROM employees 
    WHERE department_id = e.department_id
);
```

**Q28: Employees earning more than any IT employee**
```sql
SELECT * FROM employees 
WHERE salary > (
    SELECT MAX(salary) 
    FROM employees e 
    INNER JOIN departments d ON e.department_id = d.department_id 
    WHERE d.department_name = 'IT'
);
```

## Advanced Level

### 10. Complex Joins

**Q29: Employees never assigned to projects**
```sql
SELECT e.* 
FROM employees e 
LEFT JOIN employee_projects ep ON e.employee_id = ep.employee_id 
WHERE ep.project_id IS NULL;
```

**Q30: Pairs of employees in same department**
```sql
SELECT e1.first_name AS employee1, e2.first_name AS employee2, e1.department_id 
FROM employees e1 
INNER JOIN employees e2 ON e1.department_id = e2.department_id 
WHERE e1.employee_id < e2.employee_id;
```

**Q31: Employees with manager and manager's manager**
```sql
SELECT e.first_name AS employee, 
       m1.first_name AS manager, 
       m2.first_name AS managers_manager 
FROM employees e 
LEFT JOIN employees m1 ON e.manager_id = m1.employee_id 
LEFT JOIN employees m2 ON m1.manager_id = m2.employee_id;
```

### 11. Window Functions

**Q32: Rank employees by salary within department**
```sql
SELECT first_name, last_name, department_id, salary,
       ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank 
FROM employees;
```

**Q33: Rank employees by salary company-wide**
```sql
SELECT first_name, last_name, salary,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank 
FROM employees;
```

**Q34: Show previous employee's salary**
```sql
SELECT first_name, last_name, salary, hire_date,
       LAG(salary) OVER (ORDER BY hire_date) AS previous_salary 
FROM employees;
```

**Q35: Running total of salaries**
```sql
SELECT first_name, last_name, salary, hire_date,
       SUM(salary) OVER (ORDER BY hire_date) AS running_total 
FROM employees;
```

### 12. CTEs (Common Table Expressions)

**Q36: Departments with above-average salary**
```sql
WITH company_avg AS (
    SELECT AVG(salary) AS avg_salary FROM employees
),
dept_avg AS (
    SELECT department_id, AVG(salary) AS dept_avg_salary 
    FROM employees 
    GROUP BY department_id
)
SELECT d.department_name, da.dept_avg_salary 
FROM dept_avg da 
INNER JOIN departments d ON da.department_id = d.department_id 
CROSS JOIN company_avg ca 
WHERE da.dept_avg_salary > ca.avg_salary;
```

**Q37: Recursive employee hierarchy**
```sql
WITH RECURSIVE employee_hierarchy AS (
    -- Base case: employees with no manager
    SELECT employee_id, first_name, last_name, manager_id, 1 AS level 
    FROM employees 
    WHERE manager_id IS NULL
    
    UNION ALL
    
    -- Recursive case
    SELECT e.employee_id, e.first_name, e.last_name, e.manager_id, eh.level + 1 
    FROM employees e 
    INNER JOIN employee_hierarchy eh ON e.manager_id = eh.employee_id
)
SELECT * FROM employee_hierarchy ORDER BY level, employee_id;
```

**Q38: Top 3 employees by salary in each department**
```sql
WITH ranked_employees AS (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rn 
    FROM employees
)
SELECT * FROM ranked_employees WHERE rn <= 3;
```

### 13. Complex Aggregations

**Q39: 2nd highest salary**
```sql
SELECT MAX(salary) AS second_highest 
FROM employees 
WHERE salary < (SELECT MAX(salary) FROM employees);

-- Alternative with OFFSET
SELECT DISTINCT salary 
FROM employees 
ORDER BY salary DESC 
LIMIT 1 OFFSET 1;
```

**Q40: N-th highest salary**
```sql
-- For N = 3
SELECT DISTINCT salary 
FROM employees 
ORDER BY salary DESC 
LIMIT 1 OFFSET 2;  -- N-1

-- Using window function
WITH ranked_salaries AS (
    SELECT DISTINCT salary, 
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rank 
    FROM employees
)
SELECT salary FROM ranked_salaries WHERE rank = 3;  -- N
```

**Q41: Percentage of total salary**
```sql
SELECT first_name, last_name, salary,
       ROUND(salary * 100.0 / SUM(salary) OVER (), 2) AS percentage_of_total 
FROM employees;
```

**Q42: Departments with salary range > 30000**
```sql
SELECT department_id, 
       MAX(salary) - MIN(salary) AS salary_range 
FROM employees 
GROUP BY department_id 
HAVING MAX(salary) - MIN(salary) > 30000;
```

### 14. Date Functions

**Q43: Employees hired in last 6 months**
```sql
SELECT * FROM employees 
WHERE hire_date >= DATE_SUB(CURRENT_DATE, INTERVAL 6 MONTH);

-- SQL Server
SELECT * FROM employees 
WHERE hire_date >= DATEADD(MONTH, -6, GETDATE());
```

**Q44: Employee tenure in years**
```sql
SELECT first_name, last_name, hire_date,
       TIMESTAMPDIFF(YEAR, hire_date, CURRENT_DATE) AS years_of_service 
FROM employees;

-- SQL Server
SELECT first_name, last_name, hire_date,
       DATEDIFF(YEAR, hire_date, GETDATE()) AS years_of_service 
FROM employees;
```

**Q45: Employees hired each month in 2023**
```sql
SELECT MONTH(hire_date) AS month, COUNT(*) AS hires 
FROM employees 
WHERE YEAR(hire_date) = 2023 
GROUP BY MONTH(hire_date) 
ORDER BY month;
```

### 15. String Functions

**Q46: Concatenate first and last name**
```sql
SELECT CONCAT(first_name, ' ', last_name) AS full_name 
FROM employees;

-- Alternative
SELECT first_name || ' ' || last_name AS full_name 
FROM employees;
```

**Q47: Convert names to uppercase**
```sql
SELECT UPPER(first_name) AS first_name, UPPER(last_name) AS last_name 
FROM employees;
```

**Q48: Employees with company.com email**
```sql
SELECT * FROM employees 
WHERE email LIKE '%@company.com';

-- Or using string functions
SELECT * FROM employees 
WHERE RIGHT(email, 11) = 'company.com';
```

### 16. CASE Statements

**Q49: Categorize employees by salary**
```sql
SELECT first_name, last_name, salary,
       CASE 
           WHEN salary < 40000 THEN 'Low'
           WHEN salary BETWEEN 40000 AND 80000 THEN 'Medium'
           ELSE 'High'
       END AS salary_category 
FROM employees;
```

**Q50: Calculate bonus based on salary**
```sql
SELECT first_name, last_name, salary,
       CASE 
           WHEN salary < 50000 THEN salary * 0.10
           WHEN salary BETWEEN 50000 AND 80000 THEN salary * 0.05
           ELSE salary * 0.02
       END AS bonus 
FROM employees;
```

### 17. Set Operations

**Q51: Combine current and former employees**
```sql
SELECT employee_id, first_name, last_name, 'Current' AS status 
FROM employees 
UNION 
SELECT employee_id, first_name, last_name, 'Former' AS status 
FROM former_employees;
```

**Q52: Employees in both employees and training tables**
```sql
SELECT employee_id FROM employees 
INTERSECT 
SELECT employee_id FROM training_participants;
```

**Q53: Employees without mandatory training**
```sql
SELECT employee_id FROM employees 
EXCEPT 
SELECT employee_id FROM training_completed 
WHERE training_type = 'Mandatory';
```

### 18. Advanced Subqueries

**Q54: Employees earning more than department average (correlated)**
```sql
SELECT * FROM employees e 
WHERE salary > (
    SELECT AVG(salary) 
    FROM employees 
    WHERE department_id = e.department_id
);
```

**Q55: Departments with at least one employee earning > 100000**
```sql
SELECT * FROM departments d 
WHERE EXISTS (
    SELECT 1 FROM employees e 
    WHERE e.department_id = d.department_id AND e.salary > 100000
);
```

**Q56: Employees who worked on all projects**
```sql
SELECT e.employee_id, e.first_name, e.last_name 
FROM employees e 
WHERE NOT EXISTS (
    SELECT p.project_id 
    FROM projects p 
    WHERE NOT EXISTS (
        SELECT 1 
        FROM employee_projects ep 
        WHERE ep.employee_id = e.employee_id 
          AND ep.project_id = p.project_id
    )
);
```

### 19. Data Modification

**Q57: Insert new employee**
```sql
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_title, salary, department_id) 
VALUES (101, 'Jane', 'Doe', 'jane.doe@company.com', '2026-01-27', 'Developer', 75000, 3);
```

**Q58: Update IT department salaries by 10%**
```sql
UPDATE employees 
SET salary = salary * 1.10 
WHERE department_id = (
    SELECT department_id FROM departments WHERE department_name = 'IT'
);
```

**Q59: Delete inactive employees**
```sql
DELETE FROM employees 
WHERE employee_id NOT IN (
    SELECT DISTINCT employee_id 
    FROM employee_projects 
    WHERE start_date >= DATE_SUB(CURRENT_DATE, INTERVAL 2 YEAR)
);
```

**Q60: Archive employees**
```sql
INSERT INTO archive_employees 
SELECT * FROM employees 
WHERE department_id = 5;
```

### 20. Performance and Optimization

**Q61: Query with index hint**
```sql
SELECT * FROM employees 
WHERE last_name = 'Smith';

-- Index creation for optimization
CREATE INDEX idx_last_name ON employees(last_name);
```

**Q62: JOIN instead of subquery**
```sql
-- Instead of:
SELECT * FROM employees 
WHERE department_id IN (SELECT department_id FROM departments WHERE location = 'New York');

-- Use:
SELECT DISTINCT e.* 
FROM employees e 
INNER JOIN departments d ON e.department_id = d.department_id 
WHERE d.location = 'New York';
```

**Q63: EXISTS instead of IN**
```sql
-- Instead of:
SELECT * FROM employees 
WHERE department_id IN (SELECT department_id FROM departments WHERE budget > 1000000);

-- Use:
SELECT * FROM employees e 
WHERE EXISTS (
    SELECT 1 FROM departments d 
    WHERE d.department_id = e.department_id AND d.budget > 1000000
);
```

## Expert Level Challenges

**Q64: Longest consecutive hire sequence**
```sql
WITH hire_days AS (
    SELECT DISTINCT hire_date,
           DATEDIFF(hire_date, 
                   (SELECT MIN(hire_date) FROM employees)) - 
           ROW_NUMBER() OVER (ORDER BY hire_date) AS grp 
    FROM employees
)
SELECT MIN(hire_date) AS start_date, 
       MAX(hire_date) AS end_date,
       COUNT(*) AS consecutive_days 
FROM hire_days 
GROUP BY grp 
ORDER BY consecutive_days DESC 
LIMIT 1;
```

**Q65: Median salary per department**
```sql
WITH ranked AS (
    SELECT department_id, salary,
           ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary) AS rn,
           COUNT(*) OVER (PARTITION BY department_id) AS cnt 
    FROM employees
)
SELECT department_id, AVG(salary) AS median_salary 
FROM ranked 
WHERE rn IN (FLOOR((cnt + 1) / 2.0), CEIL((cnt + 1) / 2.0)) 
GROUP BY department_id;
```

**Q66: Employees with 3+ different managers**
```sql
WITH manager_history AS (
    SELECT employee_id, manager_id, hire_date 
    FROM employees 
    -- This assumes you have a historical manager tracking table
)
SELECT employee_id, COUNT(DISTINCT manager_id) AS manager_count 
FROM manager_history 
GROUP BY employee_id 
HAVING COUNT(DISTINCT manager_id) >= 3;
```

**Q67: Most common salary (mode)**
```sql
SELECT salary, COUNT(*) AS frequency 
FROM employees 
GROUP BY salary 
ORDER BY frequency DESC 
LIMIT 1;
```

**Q68: Pivot employee data**
```sql
SELECT job_title,
       SUM(CASE WHEN department_name = 'Sales' THEN 1 ELSE 0 END) AS Sales,
       SUM(CASE WHEN department_name = 'IT' THEN 1 ELSE 0 END) AS IT,
       SUM(CASE WHEN department_name = 'HR' THEN 1 ELSE 0 END) AS HR,
       SUM(CASE WHEN department_name = 'Finance' THEN 1 ELSE 0 END) AS Finance 
FROM employees e 
INNER JOIN departments d ON e.department_id = d.department_id 
GROUP BY job_title;
```

**Q69: Employees with same manager, different departments**
```sql
SELECT e1.first_name AS emp1, e2.first_name AS emp2, 
       e1.manager_id, e1.department_id AS dept1, e2.department_id AS dept2 
FROM employees e1 
INNER JOIN employees e2 ON e1.manager_id = e2.manager_id 
WHERE e1.employee_id < e2.employee_id 
  AND e1.department_id != e2.department_id;
```

**Q70: Moving average of salaries**
```sql
SELECT first_name, last_name, salary, hire_date,
       AVG(salary) OVER (
           ORDER BY hire_date 
           ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
       ) AS moving_avg_5 
FROM employees;
```
