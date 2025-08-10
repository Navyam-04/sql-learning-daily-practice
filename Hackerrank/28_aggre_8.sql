============================================================================
-- Problem: Employee Maximum Earnings
--
-- Table: Employee
--   - employee_id INT       : Employee's ID number (Primary Key)
--   - name        VARCHAR   : Employee's name
--   - months      INT       : Total number of months they have worked
--   - salary      INT       : Monthly salary
--
-- Requirement:
--   1. Define total earnings as (months * salary).
--   2. Find:
--        a) The maximum total earnings among all employees.
--        b) The number of employees with this maximum total earnings.
--   3. Output both values as space-separated integers (on a single line).
--
-- Expected Output Format:
--   <max_earnings> <num_employees_with_max_earnings>
--
-- Example:
-- Employee:
-- | employee_id | name     | months | salary |
-- | 12228       | Rose     | 15     | 1968   |
-- | 33645       | Angela   | 1      | 3443   |
-- | 45692       | Frank    | 17     | 1608   |
-- | 56118       | Patrick  | 7      | 1345   |
-- | 59725       | Lisa     | 11     | 2330   |
-- | 74197       | Kimberly | 16     | 4370   |
-- | 78454       | Bonnie   | 8      | 1771   |
-- | 83565       | Michael  | 6      | 2017   |
-- | 98607       | Todd     | 5      | 3396   |
-- | 99989       | Joe      | 9      | 3573   |
--
-- Output:
-- 69952 1
============================================================================

-- Drop table if exists
IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL
    DROP TABLE dbo.Employee;
GO

-- Create Employee table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name        VARCHAR(100),
    months      INT,
    salary      INT
);
GO

-- Insert sample data
INSERT INTO Employee (employee_id, name, months, salary) VALUES
(12228, 'Rose',     15, 1968),
(33645, 'Angela',    1, 3443),
(45692, 'Frank',    17, 1608),
(56118, 'Patrick',   7, 1345),
(59725, 'Lisa',     11, 2330),
(74197, 'Kimberly', 16, 4370),
(78454, 'Bonnie',    8, 1771),
(83565, 'Michael',   6, 2017),
(98607, 'Todd',      5, 3396),
(99989, 'Joe',       9, 3573);
GO

-- =======================
-- Solution Query
-- =======================
/*
  Steps:
    1. Calculate total earnings as months * salary for each employee.
    2. Determine the maximum total earnings.
    3. Count the number of employees with that maximum.
    4. Output both values in one row, space-separated.
*/
SELECT
    MAX(months * salary) AS max_earnings,
    COUNT(*) AS num_employees_with_max
FROM Employee
WHERE (months * salary) = (
    SELECT MAX(months * salary)
    FROM Employee
);
GO
