
-- ========================================================================
-- Problem: List employee names from EMPLOYEE table 
--          where SALARY > 2000 AND MONTHS < 10.
--          Order the result by ascending employee_id.
-- ========================================================================

-- Drop the EMPLOYEE table if it already exists
IF OBJECT_ID('dbo.EMPLOYEE', 'U') IS NOT NULL
    DROP TABLE dbo.EMPLOYEE;
GO

-- Create the EMPLOYEE table
CREATE TABLE EMPLOYEE (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    months INT,
    salary INT
);
GO

-- Insert sample data for testing (adjusted to fit the condition)
INSERT INTO EMPLOYEE (employee_id, name, months, salary) VALUES
(1, 'Angela', 1, 3000),
(2, 'Bonnie', 12, 3500),
(3, 'Frank', 24, 3000),
(4, 'Joe', 5, 2800),
(5, 'Kimberly', 40, 4500),
(6, 'Lisa', 7, 2500),
(7, 'Michael', 8, 4000),
(8, 'Patrick', 6, 4100),
(9, 'Rose', 3, 3900),
(10, 'Todd', 4, 3300);
GO

-- Verify inserted data
SELECT * FROM EMPLOYEE;
GO

-- =======================
-- Solution Query
-- =======================

/*
Print the name of employees who earn more than 2000
and have worked for less than 10 months,
sorted by employee_id in ascending order.
*/

SELECT name
FROM EMPLOYEE
WHERE salary > 2000 AND months < 10
ORDER BY employee_id;
GO
