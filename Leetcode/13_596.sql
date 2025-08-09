============================================================================
-- Problem: Classes With at Least 5 Students
--
-- Table: Courses
--   - student VARCHAR : Student name
--   - class   VARCHAR : Class name
-- (student, class) is the primary key.
--
-- Requirement:
--   Report all the classes that have at least five students.
--   Output column: class
--   The order of results does not matter.
--
-- Expected Output Schema:
--   class
--   -----
--   <varchar>
--
-- Example:
-- Courses:
-- | student | class |
-- | A       | Math  |
-- | B       | Math  |
-- | C       | Math  |
-- | D       | Math  |
-- | E       | Math  |
-- | F       | English |
--
-- Output:
-- | class |
-- | Math  |
============================================================================

-- Drop table if exists
IF OBJECT_ID('dbo.Courses', 'U') IS NOT NULL
    DROP TABLE dbo.Courses;
GO

-- Create Courses table
CREATE TABLE Courses (
    student VARCHAR(50),
    class   VARCHAR(50),
    PRIMARY KEY (student, class)
);
GO

-- Insert sample data
INSERT INTO Courses (student, class) VALUES
('A', 'Math'),
('B', 'Math'),
('C', 'Math'),
('D', 'Math'),
('E', 'Math'),
('F', 'English');
GO

-- =======================
-- Solution Query
-- =======================
/*
  Steps:
    1. Group by class to aggregate student counts.
    2. Use COUNT(DISTINCT student) to ensure uniqueness.
    3. Apply HAVING to filter for classes with >= 5 students.
*/
SELECT
    class
FROM Courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;
GO
