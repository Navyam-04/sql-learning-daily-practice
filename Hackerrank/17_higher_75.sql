-- =================================================================
-- Problem: Write a query that prints a list of employee names 
--          from the Employee table in alphabetical order.
-- =================================================================

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.EMPLOYEE', 'U') IS NOT NULL
    DROP TABLE dbo.EMPLOYEE;
GO

-- Create the EMPLOYEE table
-- This table stores employee IDs, names, months of service, and salary.
CREATE TABLE EMPLOYEE (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    months INT,
    salary INT
);
GO

-- Insert sample data into EMPLOYEE table
-- Includes a variety of names for testing alphabetical order.
INSERT INTO EMPLOYEE (employee_id, name, months, salary) VALUES
(1, 'Angela', 36, 4000),
(2, 'Bonnie', 12, 3500),
(3, 'Frank', 24, 3000),
(4, 'Joe', 18, 3200),
(5, 'Kimberly', 40, 4500),
(6, 'Lisa', 15, 3700),
(7, 'Michael', 22, 5000),
(8, 'Patrick', 28, 4100),
(9, 'Rose', 30, 3900),
(10, 'Todd', 10, 3300);
GO

-- Verify that the data has been inserted correctly
SELECT * FROM EMPLOYEE;
GO

-- =======================
-- Solution Query
-- =======================

/* Write your T-SQL query statement below */

SELECT name
FROM EMPLOYEE
ORDER BY name;
GO
