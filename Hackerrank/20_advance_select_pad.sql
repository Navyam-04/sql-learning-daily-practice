-- ============================================================================
-- Problem: Format names with occupations from the OCCUPATIONS table.
-- 
-- Part 1: List all names in alphabetical order followed by the first letter 
--         of their occupation enclosed in parentheses.
--
-- Part 2: Output the total number of people in each occupation, formatted as:
--         "There are a total of [count] [occupation]s."
-- 
-- Rules:
--   - Occupation values include: Doctor, Professor, Singer, Actor.
--   - Do not change the casing of names. Occupations in count must be lowercase.
--   - Pluralize occupations by simply adding "s" at the end.
-- ============================================================================

-- Drop the OCCUPATIONS table if it already exists
IF OBJECT_ID('dbo.OCCUPATIONS', 'U') IS NOT NULL
    DROP TABLE dbo.OCCUPATIONS;
GO

-- Create the OCCUPATIONS table
CREATE TABLE OCCUPATIONS (
    Name VARCHAR(100),
    Occupation VARCHAR(20) -- Allowed values: Doctor, Professor, Singer, Actor
);
GO

-- Insert sample data
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES
('Samantha', 'Actor'),
('Julia', 'Doctor'),
('Maria', 'Actor'),
('Meera', 'Singer'),
('Ashley', 'Professor'),
('Ketty', 'Professor'),
('Christeen', 'Professor'),
('Jane', 'Actor'),
('Jenny', 'Doctor'),
('Priya', 'Singer');
GO

-- Verify inserted data
SELECT * FROM OCCUPATIONS;
GO

-- =======================
-- Part 1: Name (Occupation Initial)
-- =======================
SELECT 
    CONCAT(Name, '(', LEFT(Occupation, 1), ')') AS NameWithOccupation
FROM OCCUPATIONS
ORDER BY Name;
GO

-- =======================
-- Part 2: Total People by Occupation
-- =======================
SELECT 
    CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.') AS OccupationSummary
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*), Occupation;
GO
