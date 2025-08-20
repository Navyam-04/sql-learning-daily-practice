/*
-- Problem: The Blunder
-- Description:
--   Samantha calculated the average monthly salaries from the EMPLOYEES table,
--   but mistakenly removed all '0' digits from salaries before computing.
--
--   Task:
--   1. Compute the actual average salary: AVG(SALARY).
--   2. Compute Samantha’s incorrect average salary:
--        AVG(SALARY with all '0' digits removed).
--   3. Find the difference: (actual_avg - wrong_avg).
--   4. Round UP (CEILING) the result to the next integer.
--
-- Input Table: EMPLOYEES
-- Columns:
--   EMPLOYEE_ID INT
--   NAME        VARCHAR(50)
--   SALARY      INT (monthly salary)
--
-- Output:
--   Single integer value representing the error in Samantha’s calculation.
--   Example expected output (HackerRank hidden test case): 2253
*/

-- 1) Drop table if exists
IF OBJECT_ID('dbo.EMPLOYEES', 'U') IS NOT NULL
    DROP TABLE dbo.EMPLOYEES;
GO

-- 2) Create table schema
CREATE TABLE dbo.EMPLOYEES (
    EMPLOYEE_ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    SALARY INT
);
GO

-- 3) Insert sample rows (illustrative only; HackerRank uses hidden dataset)
INSERT INTO dbo.EMPLOYEES (EMPLOYEE_ID, NAME, SALARY) VALUES
(1, 'Alice', 9000),
(2, 'Bob',   5000),
(3, 'Chris', 10100),
(4, 'Dana',  800),
(5, 'Eve',   60000);
GO

/*
-- Step-by-step solution:
-- 1. Actual average = AVG(SALARY * 1.0).
-- 2. Wrong average = AVG(CAST(REPLACE(SALARY, '0', '') AS INT)).
--      - REPLACE removes '0' digits.
--      - CAST ensures numeric calculation.
-- 3. Difference = actual_avg - wrong_avg.
-- 4. Use CEILING() to round UP to the next integer.
*/

-- 4) Final Query
SELECT CEILING(
           AVG(SALARY * 1.0) 
         - AVG(CAST(REPLACE(SALARY, '0', '') AS INT))
       ) AS ErrorAmount
FROM dbo.EMPLOYEES;
GO
