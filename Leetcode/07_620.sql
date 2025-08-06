-- =============================================================================
-- Problem: Replace Employee ID with Unique ID if available, else return NULL
--
-- Tables:
--   - Employees: Contains id and name
--   - EmployeeUNI: Contains id and its corresponding unique_id
-- Requirement:
--   - Show unique_id and name for every employee
--   - If employee has no unique_id, show NULL
-- =============================================================================

-- ✅ Drop tables if they already exist
IF OBJECT_ID('EmployeeUNI', 'U') IS NOT NULL
    DROP TABLE EmployeeUNI;
IF OBJECT_ID('Employees', 'U') IS NOT NULL
    DROP TABLE Employees;
GO

-- ✅ Create Employees table
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);
GO

-- ✅ Create EmployeeUNI table
CREATE TABLE EmployeeUNI (
    id INT PRIMARY KEY,
    unique_id INT
);
GO

-- ✅ Insert sample data into Employees
INSERT INTO Employees (id, name) VALUES
(1, 'Alice'),
(7, 'Bob'),
(11, 'Meir'),
(90, 'Winston'),
(3, 'Jonathan');
GO

-- ✅ Insert sample data into EmployeeUNI
INSERT INTO EmployeeUNI (id, unique_id) VALUES
(3, 1),
(11, 2),
(90, 3);
GO

-- ✅ Verify inserted data
SELECT * FROM Employees;
SELECT * FROM EmployeeUNI;
GO

-- ===========================
-- ✅ Final Query Solution
-- ===========================

/*
    Use LEFT JOIN to retain all Employees
    Match with EmployeeUNI to fetch unique_id if present
*/

SELECT 
    U.unique_id,   -- Will be NULL if not present
    E.name
FROM 
    Employees E
LEFT JOIN 
    EmployeeUNI U
    ON E.id = U.id;
GO
