-- E-Commerce Sales & Customer Analysis
-- Version 2: SQL Data Operations Practice
-- Today's learning: UPDATE, DELETE, ALTER TABLE, RENAME,
-- CHANGE/MODIFY concept and TRUNCATE.
--
-- IMPORTANT:
-- These are learning/practice operations.
-- Do NOT run destructive examples against the main e-commerce tables
-- if you want to preserve the analysis dataset.
--
-- A separate practice table is used below.

DROP TABLE IF EXISTS sql_operations_practice;

CREATE TABLE sql_operations_practice (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);

INSERT INTO sql_operations_practice VALUES
(1, 'Rahul', 'IT', 48000, '2025-01-10'),
(2, 'Priya', 'HR', 55000, '2025-02-15'),
(3, 'Amit', 'Sales', 72000, '2025-03-20'),
(4, 'Sneha', 'IT', 65000, '2025-04-05'),
(5, 'Rohan', 'Sales', 45000, '2025-05-12');

-- ============================================================
-- UPDATE
-- ============================================================

-- Increase Rahul's salary by 10%.
UPDATE sql_operations_practice
SET salary = salary + (salary * 0.10)
WHERE employee_name = 'Rahul';

-- Increase IT salaries by 5%.
UPDATE sql_operations_practice
SET salary = salary + (salary * 0.05)
WHERE department = 'IT';

-- Update text data.
UPDATE sql_operations_practice
SET department = 'Technology'
WHERE employee_name = 'Sneha';

-- ============================================================
-- DELETE
-- ============================================================

-- Delete employees with salary below 40,000.
DELETE FROM sql_operations_practice
WHERE salary < 40000;

-- Delete Sales employees earning above 70,000.
DELETE FROM sql_operations_practice
WHERE department = 'Sales'
  AND salary > 70000;

-- ============================================================
-- ALTER TABLE
-- ============================================================

-- Add a column.
ALTER TABLE sql_operations_practice
ADD COLUMN email VARCHAR(100);

-- Change a column data type in PostgreSQL.
ALTER TABLE sql_operations_practice
ALTER COLUMN salary TYPE DECIMAL(12,2);

-- Rename a column.
ALTER TABLE sql_operations_practice
RENAME COLUMN joining_date TO date_of_joining;

-- Rename the table.
ALTER TABLE sql_operations_practice
RENAME TO employee_operations_practice;

-- ============================================================
-- CHANGE / MODIFY
-- ============================================================
-- CHANGE and MODIFY are commonly used in MySQL.
-- PostgreSQL uses ALTER TABLE ... ALTER COLUMN instead.
--
-- MySQL examples for learning reference:
-- MODIFY salary DECIMAL(12,2);
-- CHANGE joining_date date_of_joining DATE;
--
-- PostgreSQL equivalent:
-- ALTER TABLE employee_operations_practice
-- ALTER COLUMN salary TYPE DECIMAL(12,2);
--
-- PostgreSQL rename:
-- ALTER TABLE employee_operations_practice
-- RENAME COLUMN joining_date TO date_of_joining;

-- ============================================================
-- TRUNCATE
-- ============================================================

-- Removes all rows from the practice table while keeping its structure.
TRUNCATE TABLE employee_operations_practice;

-- The practice table can still be used after TRUNCATE.
SELECT *
FROM employee_operations_practice;
