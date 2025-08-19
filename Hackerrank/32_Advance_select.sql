============================================================================
-- Problem: Occupations
--
-- Table: OCCUPATIONS
--   - Name       VARCHAR : The person's name
--   - Occupation VARCHAR : The occupation of the person
--
-- Occupation will only contain one of the following values:
--   'Doctor', 'Professor', 'Singer', 'Actor'
--
-- Requirement:
--   Pivot the Occupation column so that:
--     - Each occupation becomes a separate column (Doctor, Professor, Singer, Actor).
--     - Names are sorted alphabetically within each occupation.
--     - Rows are aligned by order, with NULL values if an occupation has fewer names.
--
-- Expected Output Schema:
--   Doctor       | Professor   | Singer     | Actor
--  -------------+-------------+------------+------------
--   <varchar>    | <varchar>   | <varchar>  | <varchar>
--
-- Example:
-- OCCUPATIONS:
-- | Name     | Occupation |
-- | Jenny    | Doctor     |
-- | Ashley   | Professor  |
-- | Meera    | Singer     |
-- | Jane     | Actor      |
-- | Samantha | Doctor     |
--
-- Output:
-- | Doctor    | Professor | Singer | Actor |
-- |-----------|-----------|--------|-------|
-- | Jenny     | Ashley    | Meera  | Jane  |
-- | Samantha  | NULL      | NULL   | NULL  |
============================================================================

-- =======================
-- Solution Query (SQL Server)
-- =======================
/*
  Steps:
    1. Assign row numbers to each name within its occupation, ordered alphabetically.
    2. Pivot the result by grouping on row number.
    3. Use MAX with CASE to place names into their correct occupation columns.
    4. Order rows by row number so that names align correctly.
*/
WITH cte AS (
    SELECT 
        Name,
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn
    FROM OCCUPATIONS
)
SELECT 
    MAX(CASE WHEN Occupation = 'Doctor'    THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer'    THEN Name END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor'     THEN Name END) AS Actor
FROM cte
GROUP BY rn
ORDER BY rn;
GO
