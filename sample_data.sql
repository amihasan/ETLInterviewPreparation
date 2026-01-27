-- SQL Practice Database Setup
-- Sample data for practicing SQL queries

-- Create Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(100),
    budget DECIMAL(12, 2)
);

-- Create Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    hire_date DATE NOT NULL,
    job_title VARCHAR(50),
    salary DECIMAL(10, 2),
    manager_id INT,
    department_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Create Projects Table
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Create Employee_Projects Junction Table
CREATE TABLE employee_projects (
    employee_id INT,
    project_id INT,
    hours_worked DECIMAL(6, 2),
    start_date DATE,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Insert Sample Departments
INSERT INTO departments (department_id, department_name, location, budget) VALUES
(1, 'IT', 'New York', 1500000.00),
(2, 'Sales', 'Los Angeles', 1200000.00),
(3, 'HR', 'Chicago', 800000.00),
(4, 'Finance', 'New York', 1000000.00),
(5, 'Marketing', 'San Francisco', 900000.00),
(6, 'Operations', 'Boston', 750000.00),
(7, 'Customer Service', 'Austin', 650000.00),
(8, 'R&D', 'Seattle', 2000000.00);

-- Insert Sample Employees
INSERT INTO employees (employee_id, first_name, last_name, email, phone, hire_date, job_title, salary, manager_id, department_id) VALUES
-- CEO
(1, 'John', 'Smith', 'john.smith@company.com', '555-0101', '2015-01-15', 'CEO', 250000.00, NULL, 1),

-- IT Department
(2, 'Sarah', 'Johnson', 'sarah.johnson@company.com', '555-0102', '2016-03-20', 'CTO', 200000.00, 1, 1),
(3, 'Michael', 'Williams', 'michael.williams@company.com', '555-0103', '2017-05-10', 'Senior Developer', 120000.00, 2, 1),
(4, 'Emily', 'Brown', 'emily.brown@company.com', '555-0104', '2018-07-15', 'Developer', 95000.00, 2, 1),
(5, 'David', 'Jones', 'david.jones@company.com', '555-0105', '2019-02-01', 'Developer', 90000.00, 2, 1),
(6, 'Jessica', 'Garcia', 'jessica.garcia@company.com', '555-0106', '2020-04-10', 'Junior Developer', 70000.00, 3, 1),
(7, 'Daniel', 'Martinez', 'daniel.martinez@company.com', '555-0107', '2021-06-15', 'Junior Developer', 68000.00, 3, 1),
(8, 'Lisa', 'Rodriguez', 'lisa.rodriguez@company.com', '555-0108', '2019-08-20', 'Database Admin', 105000.00, 2, 1),
(9, 'James', 'Wilson', 'james.wilson@company.com', '555-0109', '2020-11-05', 'DevOps Engineer', 110000.00, 2, 1),

-- Sales Department
(10, 'Jennifer', 'Anderson', 'jennifer.anderson@company.com', '555-0110', '2016-02-15', 'VP Sales', 180000.00, 1, 2),
(11, 'Robert', 'Thomas', 'robert.thomas@company.com', '555-0111', '2017-04-20', 'Sales Manager', 130000.00, 10, 2),
(12, 'Linda', 'Taylor', 'linda.taylor@company.com', '555-0112', '2018-06-10', 'Senior Sales Rep', 95000.00, 11, 2),
(13, 'William', 'Moore', 'william.moore@company.com', '555-0113', '2019-08-15', 'Sales Rep', 75000.00, 11, 2),
(14, 'Mary', 'Jackson', 'mary.jackson@company.com', '555-0114', '2020-01-20', 'Sales Rep', 72000.00, 11, 2),
(15, 'Christopher', 'White', 'christopher.white@company.com', '555-0115', '2021-03-10', 'Junior Sales Rep', 60000.00, 11, 2),
(16, 'Patricia', 'Harris', 'patricia.harris@company.com', '555-0116', '2021-09-05', 'Junior Sales Rep', 58000.00, 11, 2),

-- HR Department
(17, 'Richard', 'Martin', 'richard.martin@company.com', '555-0117', '2016-05-01', 'HR Director', 150000.00, 1, 3),
(18, 'Susan', 'Thompson', 'susan.thompson@company.com', '555-0118', '2018-07-20', 'HR Manager', 95000.00, 17, 3),
(19, 'Joseph', 'Garcia', 'joseph.garcia@company.com', '555-0119', '2019-09-15', 'HR Specialist', 70000.00, 18, 3),
(20, 'Karen', 'Martinez', 'karen.martinez@company.com', '555-0120', '2020-11-10', 'HR Specialist', 68000.00, 18, 3),
(21, 'Thomas', 'Robinson', 'thomas.robinson@company.com', '555-0121', '2021-01-15', 'Recruiter', 65000.00, 18, 3),

-- Finance Department
(22, 'Charles', 'Clark', 'charles.clark@company.com', '555-0122', '2016-08-10', 'CFO', 210000.00, 1, 4),
(23, 'Nancy', 'Rodriguez', 'nancy.rodriguez@company.com', '555-0123', '2017-10-15', 'Finance Manager', 120000.00, 22, 4),
(24, 'Steven', 'Lewis', 'steven.lewis@company.com', '555-0124', '2018-12-01', 'Accountant', 85000.00, 23, 4),
(25, 'Betty', 'Lee', 'betty.lee@company.com', '555-0125', '2019-03-20', 'Accountant', 82000.00, 23, 4),
(26, 'Paul', 'Walker', 'paul.walker@company.com', '555-0126', '2020-06-15', 'Financial Analyst', 78000.00, 23, 4),
(27, 'Dorothy', 'Hall', 'dorothy.hall@company.com', '555-0127', '2021-08-20', 'Junior Analyst', 62000.00, 23, 4),

-- Marketing Department
(28, 'Mark', 'Allen', 'mark.allen@company.com', '555-0128', '2017-01-10', 'Marketing Director', 160000.00, 1, 5),
(29, 'Sandra', 'Young', 'sandra.young@company.com', '555-0129', '2018-03-15', 'Marketing Manager', 115000.00, 28, 5),
(30, 'Donald', 'Hernandez', 'donald.hernandez@company.com', '555-0130', '2019-05-20', 'Marketing Specialist', 80000.00, 29, 5),
(31, 'Ashley', 'King', 'ashley.king@company.com', '555-0131', '2020-07-10', 'Marketing Specialist', 77000.00, 29, 5),
(32, 'Kenneth', 'Wright', 'kenneth.wright@company.com', '555-0132', '2021-09-01', 'Content Writer', 65000.00, 29, 5),
(33, 'Donna', 'Lopez', 'donna.lopez@company.com', '555-0133', '2022-01-15', 'Social Media Manager', 72000.00, 29, 5),

-- Operations Department
(34, 'Joshua', 'Hill', 'joshua.hill@company.com', '555-0134', '2017-04-01', 'Operations Director', 155000.00, 1, 6),
(35, 'Carol', 'Scott', 'carol.scott@company.com', '555-0135', '2018-06-10', 'Operations Manager', 110000.00, 34, 6),
(36, 'Matthew', 'Green', 'matthew.green@company.com', '555-0136', '2019-08-20', 'Operations Coordinator', 75000.00, 35, 6),
(37, 'Michelle', 'Adams', 'michelle.adams@company.com', '555-0137', '2020-10-15', 'Operations Coordinator', 73000.00, 35, 6),

-- Customer Service Department
(38, 'Brian', 'Baker', 'brian.baker@company.com', '555-0138', '2017-07-01', 'CS Director', 145000.00, 1, 7),
(39, 'Amanda', 'Gonzalez', 'amanda.gonzalez@company.com', '555-0139', '2018-09-10', 'CS Manager', 100000.00, 38, 7),
(40, 'Kevin', 'Nelson', 'kevin.nelson@company.com', '555-0140', '2019-11-15', 'CS Representative', 55000.00, 39, 7),
(41, 'Stephanie', 'Carter', 'stephanie.carter@company.com', '555-0141', '2020-02-20', 'CS Representative', 54000.00, 39, 7),
(42, 'Jeffrey', 'Mitchell', 'jeffrey.mitchell@company.com', '555-0142', '2021-04-10', 'CS Representative', 52000.00, 39, 7),
(43, 'Deborah', 'Perez', 'deborah.perez@company.com', '555-0143', '2022-06-15', 'CS Representative', 51000.00, 39, 7),

-- R&D Department
(44, 'Ryan', 'Roberts', 'ryan.roberts@company.com', '555-0144', '2016-09-01', 'R&D Director', 190000.00, 1, 8),
(45, 'Rebecca', 'Turner', 'rebecca.turner@company.com', '555-0145', '2017-11-10', 'Research Scientist', 135000.00, 44, 8),
(46, 'Jason', 'Phillips', 'jason.phillips@company.com', '555-0146', '2018-02-15', 'Research Scientist', 130000.00, 44, 8),
(47, 'Laura', 'Campbell', 'laura.campbell@company.com', '555-0147', '2019-04-20', 'Research Associate', 105000.00, 45, 8),
(48, 'Jacob', 'Parker', 'jacob.parker@company.com', '555-0148', '2020-06-25', 'Research Associate', 102000.00, 45, 8),
(49, 'Amy', 'Evans', 'amy.evans@company.com', '555-0149', '2021-08-30', 'Lab Technician', 75000.00, 45, 8),
(50, 'Gary', 'Edwards', 'gary.edwards@company.com', '555-0150', '2022-10-01', 'Lab Technician', 72000.00, 45, 8);

-- Insert Sample Projects
INSERT INTO projects (project_id, project_name, start_date, end_date, budget, department_id) VALUES
(1, 'Website Redesign', '2023-01-15', '2023-06-30', 250000.00, 1),
(2, 'Mobile App Development', '2023-03-01', '2023-12-31', 500000.00, 1),
(3, 'Cloud Migration', '2023-02-01', '2023-09-30', 350000.00, 1),
(4, 'CRM Implementation', '2023-04-01', '2023-10-31', 300000.00, 2),
(5, 'Sales Training Program', '2023-05-01', '2023-08-31', 75000.00, 2),
(6, 'Employee Wellness Initiative', '2023-01-01', '2023-12-31', 100000.00, 3),
(7, 'Financial Audit System', '2023-03-15', '2023-09-15', 200000.00, 4),
(8, 'Brand Refresh Campaign', '2023-02-01', '2023-07-31', 400000.00, 5),
(9, 'Social Media Strategy', '2023-06-01', '2023-12-31', 150000.00, 5),
(10, 'Supply Chain Optimization', '2023-04-01', '2024-03-31', 450000.00, 6),
(11, 'Customer Portal Upgrade', '2023-05-01', '2023-11-30', 275000.00, 7),
(12, 'Product Innovation Lab', '2023-01-01', '2024-12-31', 1000000.00, 8),
(13, 'Data Analytics Platform', '2023-07-01', '2024-06-30', 600000.00, 1);

-- Insert Sample Employee-Project Assignments
INSERT INTO employee_projects (employee_id, project_id, hours_worked, start_date) VALUES
-- Website Redesign
(3, 1, 320.00, '2023-01-15'),
(4, 1, 280.00, '2023-01-15'),
(6, 1, 240.00, '2023-02-01'),
(30, 1, 160.00, '2023-01-15'),

-- Mobile App Development
(3, 2, 400.00, '2023-03-01'),
(5, 2, 450.00, '2023-03-01'),
(7, 2, 380.00, '2023-03-15'),
(9, 2, 200.00, '2023-04-01'),

-- Cloud Migration
(8, 3, 320.00, '2023-02-01'),
(9, 3, 380.00, '2023-02-01'),
(4, 3, 240.00, '2023-03-01'),

-- CRM Implementation
(3, 4, 160.00, '2023-04-01'),
(11, 4, 240.00, '2023-04-01'),
(12, 4, 280.00, '2023-04-01'),
(13, 4, 200.00, '2023-05-01'),

-- Sales Training Program
(18, 5, 120.00, '2023-05-01'),
(11, 5, 80.00, '2023-05-01'),
(12, 5, 60.00, '2023-05-01'),

-- Employee Wellness Initiative
(18, 6, 200.00, '2023-01-01'),
(19, 6, 180.00, '2023-01-01'),
(20, 6, 160.00, '2023-01-01'),

-- Financial Audit System
(23, 7, 240.00, '2023-03-15'),
(24, 7, 280.00, '2023-03-15'),
(25, 7, 260.00, '2023-03-15'),
(26, 7, 220.00, '2023-04-01'),

-- Brand Refresh Campaign
(29, 8, 320.00, '2023-02-01'),
(30, 8, 300.00, '2023-02-01'),
(31, 8, 280.00, '2023-02-01'),
(32, 8, 240.00, '2023-03-01'),

-- Social Media Strategy
(33, 9, 280.00, '2023-06-01'),
(30, 9, 160.00, '2023-06-01'),
(31, 9, 180.00, '2023-06-01'),

-- Supply Chain Optimization
(35, 10, 400.00, '2023-04-01'),
(36, 10, 380.00, '2023-04-01'),
(37, 10, 360.00, '2023-04-01'),

-- Customer Portal Upgrade
(3, 11, 200.00, '2023-05-01'),
(4, 11, 240.00, '2023-05-01'),
(39, 11, 160.00, '2023-05-01'),
(40, 11, 120.00, '2023-06-01'),

-- Product Innovation Lab
(45, 12, 600.00, '2023-01-01'),
(46, 12, 580.00, '2023-01-01'),
(47, 12, 520.00, '2023-01-01'),
(48, 12, 500.00, '2023-01-01'),

-- Data Analytics Platform
(8, 13, 280.00, '2023-07-01'),
(9, 13, 240.00, '2023-07-01'),
(45, 13, 200.00, '2023-07-01'),
(26, 13, 160.00, '2023-07-01');

-- Create indexes for better query performance
CREATE INDEX idx_emp_dept ON employees(department_id);
CREATE INDEX idx_emp_manager ON employees(manager_id);
CREATE INDEX idx_emp_salary ON employees(salary);
CREATE INDEX idx_emp_hire_date ON employees(hire_date);
CREATE INDEX idx_proj_dept ON projects(department_id);
CREATE INDEX idx_emp_proj_emp ON employee_projects(employee_id);
CREATE INDEX idx_emp_proj_proj ON employee_projects(project_id);

-- Sample queries to verify data
-- SELECT COUNT(*) FROM employees;
-- SELECT COUNT(*) FROM departments;
-- SELECT COUNT(*) FROM projects;
-- SELECT COUNT(*) FROM employee_projects;
