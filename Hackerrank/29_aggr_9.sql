============================================================================
-- Problem: Average Salary Error (Samantha's Calculation)
--
-- Table: EMPLOYEES
--   - id     INT     : Employee ID
--   - name   VARCHAR : Employee name
--   - salary INT     : Monthly salary
--
-- Requirement:
--   Samantha calculated the average monthly salary but accidentally removed
--   all '0' digits from salaries before calculating. We need to:
--     1. Calculate the actual average salary.
--     2. Calculate Samantha's incorrect average (with all '0's removed).
--     3. Find the difference between the two averages.
--     4. Round the difference up to the next integer.
--
-- Expected Output Schema:
--   error_amount
--  --------------
--   <int>
--
-- Example:
-- EMPLOYEES:
-- | id | name    | salary |
-- |  1 | Alice   | 1000   |
-- |  2 | Bob     | 900    |
-- |  3 | Charlie | 2500   |
--
-- Output:
-- | error_amount |
-- | 206          |
============================================================================

-- =======================
-- Solution Query (SQL Server)
-- =======================
/*
  Steps:
    1. Use AVG(salary * 1.0) for correct average (ensure decimal division).
    2. Use REPLACE(salary, '0', '') to remove zeros for Samantha's calculation,
       then CAST back to INT.
    3. Subtract Samantha's average from the correct average.
    4. Use CEILING() in SQL Server to round up.
*/
SELECT
    CEILING(
        AVG(salary * 1.0) - AVG(CAST(REPLACE(CAST(salary AS VARCHAR), '0', '') AS INT) * 1.0)
    ) AS error_amount
FROM EMPLOYEES;
GO
