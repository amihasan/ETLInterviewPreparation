# SQL Practice Questions

## Beginner Level

### 1. Basic SELECT Statements
**Q1:** Write a query to select all columns from a table called `employees`.

**Q2:** Write a query to select only the `first_name` and `last_name` columns from the `employees` table.

**Q3:** Write a query to select distinct values from the `department` column in the `employees` table.

### 2. WHERE Clause
**Q4:** Write a query to select all employees whose salary is greater than 50000.

**Q5:** Write a query to select all employees who work in the 'Sales' department.

**Q6:** Write a query to select all employees whose first name starts with 'J'.

**Q7:** Write a query to select all employees hired between '2020-01-01' and '2023-12-31'.

### 3. ORDER BY
**Q8:** Write a query to select all employees ordered by salary in descending order.

**Q9:** Write a query to select all employees ordered by department (ascending) and then by salary (descending).

### 4. LIMIT/TOP
**Q10:** Write a query to select the top 5 highest-paid employees.

## Intermediate Level

### 5. Aggregate Functions
**Q11:** Write a query to count the total number of employees in the company.

**Q12:** Write a query to find the average salary of all employees.

**Q13:** Write a query to find the maximum and minimum salaries in the company.

**Q14:** Write a query to calculate the total salary expenditure for the company.

### 6. GROUP BY
**Q15:** Write a query to count the number of employees in each department.

**Q16:** Write a query to find the average salary for each department.

**Q17:** Write a query to find the highest salary in each department.

### 7. HAVING Clause
**Q18:** Write a query to find departments with more than 10 employees.

**Q19:** Write a query to find departments where the average salary is greater than 60000.

**Q20:** Write a query to find departments that have at least 3 employees earning more than 70000.

### 8. JOINS
**Q21:** Write a query to join `employees` and `departments` tables to show employee names with their department names.

**Q22:** Write a query using LEFT JOIN to show all departments and their employees (including departments with no employees).

**Q23:** Write a query using INNER JOIN to show employees and their managers (assume there's a `manager_id` column in the employees table).

**Q24:** Write a query to find all employees who work in the same department as 'John Smith'.

### 9. Subqueries
**Q25:** Write a query to find all employees who earn more than the average salary.

**Q26:** Write a query to find employees who work in departments located in 'New York'.

**Q27:** Write a query to find the employee with the highest salary in each department using a subquery.

**Q28:** Write a query to find employees whose salary is higher than the salary of any employee in the 'IT' department.

## Advanced Level

### 10. Complex Joins
**Q29:** Write a query to find employees who have never been assigned to any project (using LEFT JOIN and IS NULL).

**Q30:** Write a query using SELF JOIN to find pairs of employees who work in the same department.

**Q31:** Write a query to show employees with their manager's name and their manager's manager name.

### 11. Window Functions
**Q32:** Write a query using ROW_NUMBER() to rank employees by salary within each department.

**Q33:** Write a query using RANK() to rank employees by salary across the entire company.

**Q34:** Write a query using LAG() to show each employee's salary along with the previous employee's salary when ordered by hire date.

**Q35:** Write a query using SUM() as a window function to show running total of salaries ordered by hire date.

### 12. CTEs (Common Table Expressions)
**Q36:** Write a query using a CTE to find departments where the average salary is above the company average.

**Q37:** Write a query using a recursive CTE to display an employee hierarchy (employee → manager → manager's manager, etc.).

**Q38:** Write a query using multiple CTEs to find the top 3 employees by salary in each department.

### 13. Complex Aggregations
**Q39:** Write a query to find the 2nd highest salary in the company.

**Q40:** Write a query to find the N-th highest salary (where N is a parameter).

**Q41:** Write a query to calculate the percentage of total salary that each employee receives.

**Q42:** Write a query to find departments where the salary range (max - min) is greater than 30000.

### 14. Date Functions
**Q43:** Write a query to find employees hired in the last 6 months.

**Q44:** Write a query to calculate each employee's tenure (years of service).

**Q45:** Write a query to find the number of employees hired each month in 2023.

### 15. String Functions
**Q46:** Write a query to concatenate first_name and last_name with a space in between.

**Q47:** Write a query to convert all employee names to uppercase.

**Q48:** Write a query to find employees whose email domain is 'company.com'.

### 16. CASE Statements
**Q49:** Write a query to categorize employees as 'High', 'Medium', or 'Low' earners based on salary ranges.

**Q50:** Write a query to show employees with a bonus: 10% for salary < 50000, 5% for salary 50000-80000, and 2% for salary > 80000.

### 17. Set Operations
**Q51:** Write a query using UNION to combine current employees and former employees (from an archive table).

**Q52:** Write a query using INTERSECT to find employees who are both in the 'employees' table and 'training_participants' table.

**Q53:** Write a query using EXCEPT to find employees who have not completed mandatory training.

### 18. Advanced Subqueries
**Q54:** Write a correlated subquery to find employees who earn more than the average salary in their department.

**Q55:** Write a query using EXISTS to find departments that have at least one employee earning over 100000.

**Q56:** Write a query to find employees who have worked on all projects (division operation).

### 19. Data Modification
**Q57:** Write a query to insert a new employee into the employees table.

**Q58:** Write a query to update the salary of all employees in the 'IT' department by 10%.

**Q59:** Write a query to delete employees who haven't been assigned to any project in the last 2 years.

**Q60:** Write a query using INSERT INTO SELECT to copy employees from one department to an archive table.

### 20. Performance and Optimization
**Q61:** Write a query with proper indexing hints to efficiently find employees by last name.

**Q62:** Rewrite a query using JOIN instead of subquery for better performance.

**Q63:** Write a query using EXISTS instead of IN for better performance with large datasets.

## Expert Level Challenges

**Q64:** Write a query to find the longest consecutive sequence of days where at least one employee was hired.

**Q65:** Write a query to calculate the median salary for each department.

**Q66:** Write a query to find employees who have had at least 3 different managers during their tenure.

**Q67:** Write a query to find the most common salary in the company (mode).

**Q68:** Write a query to pivot employee data showing departments as columns and job titles as rows with count of employees.

**Q69:** Write a query to find all employees who share the same manager but work in different departments.

**Q70:** Write a query to calculate the moving average of salaries for the last 5 employees hired.

## Practice Database Schema

To practice these questions, you can create tables with the following schema:

```sql
-- Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    hire_date DATE,
    job_title VARCHAR(50),
    salary DECIMAL(10, 2),
    manager_id INT,
    department_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(100),
    budget DECIMAL(12, 2)
);

-- Projects Table
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Employee_Projects Table (Many-to-Many relationship)
CREATE TABLE employee_projects (
    employee_id INT,
    project_id INT,
    hours_worked DECIMAL(6, 2),
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);
```

Happy practicing! 🎯
