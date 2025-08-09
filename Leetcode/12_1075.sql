============================================================================
-- Problem: Project Employees I
--
-- Table: Project
--   - project_id  INT
--   - employee_id INT
-- (project_id, employee_id) is the primary key
-- employee_id references Employee table.
--
-- Table: Employee
--   - employee_id      INT       : Primary key
--   - name             VARCHAR   : Employee name
--   - experience_years INT       : Years of experience (not NULL)
--
-- Requirement:
--   For each project, compute the average experience_years
--   of its employees, rounded to 2 decimal places.
--   Output columns: project_id, average_years
--   Order does not matter.
--
-- Expected Output Schema:
--   project_id   | average_years
-- --------------+----------------
--   <int>       | <decimal (2 digits)>
--  
-- Example:
-- Project:
-- | project_id | employee_id |
-- | 1          | 1           |
-- | 1          | 2           |
-- | 1          | 3           |
-- | 2          | 1           |
-- | 2          | 4           |
--
-- Employee:
-- | employee_id | name   | experience_years |
-- | 1           | Khaled | 3                |
-- | 2           | Ali    | 2                |
-- | 3           | John   | 1                |
-- | 4           | Doe    | 2                |
--
-- Output:
-- | project_id | average_years |
-- | 1          | 2.00          |
-- | 2          | 2.50          |
============================================================================

-- Drop tables if they exist
IF OBJECT_ID('dbo.Project', 'U') IS NOT NULL
    DROP TABLE dbo.Project;
GO

IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL
    DROP TABLE dbo.Employee;
GO

-- Create Project table
CREATE TABLE Project (
    project_id  INT,
    employee_id INT,
    PRIMARY KEY (project_id, employee_id)
);
GO

-- Create Employee table
CREATE TABLE Employee (
    employee_id      INT PRIMARY KEY,
    name             VARCHAR(100),
    experience_years INT NOT NULL
);
GO

-- Insert sample data
INSERT INTO Project (project_id, employee_id) VALUES
(1, 1), (1, 2), (1, 3), (2, 1), (2, 4);
GO

INSERT INTO Employee (employee_id, name, experience_years) VALUES
(1, 'Khaled', 3),
(2, 'Ali', 2),
(3, 'John', 1),
(4, 'Doe', 2);
GO

-- =======================
-- Solution Query
-- =======================
/*
  Steps:
    1. Join Project and Employee tables on employee_id.
    2. Group results by project_id.
    3. Use AVG to compute average experience_years per project.
    4. Round the result to two decimal places via ROUND(..., 2).
*/
SELECT P.project_id,
       ROUND(
         (CAST(SUM(E.experience_years) AS FLOAT) / COUNT(P.employee_id)),
         2
       ) AS average_years
FROM Project P
LEFT JOIN Employee E
  ON P.employee_id = E.employee_id
GROUP BY P.project_id;

GO
