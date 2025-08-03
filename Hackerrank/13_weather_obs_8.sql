-- =================================================================
-- Problem: Query the list of CITY names from STATION which have 
--          vowels (a, e, i, o, u) as both their first and last 
--          characters. The result cannot contain duplicates.
-- =================================================================

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.STATION', 'U') IS NOT NULL
    DROP TABLE dbo.STATION;
GO

-- Create the STATION table
-- This table stores city names, states, and coordinates.
CREATE TABLE STATION (
    ID INT PRIMARY KEY,
    CITY VARCHAR(21),
    STATE VARCHAR(2),
    LAT_N FLOAT,
    LONG_W FLOAT
);
GO

-- Insert sample data into STATION table
-- Includes cities that start and end with vowels, and others that do not.
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'Oslo', 'NO', 59.91, 10.75),      -- starts and ends with vowel
(2, 'Agra', 'IN', 27.18, 78.01),      -- starts and ends with vowel
(3, 'Orlando', 'FL', 28.54, -81.38),  -- starts with vowel, ends with consonant
(4, 'Iquique', 'CL', -20.22, -70.14), -- starts and ends with vowel
(5, 'Udaipur', 'RJ', 24.58, 73.68),   -- starts with vowel, ends with consonant
(6, 'Dallas', 'TX', 32.77, -96.79),   -- no vowel at start or end
(7, 'Agra', 'IN', 27.18, 78.01);      -- duplicate to test DISTINCT
GO

-- Verify that the data has been inserted correctly
SELECT * FROM STATION;
GO

-- =======================
-- Solution Query
-- =======================

/* Write your T-SQL query statement below */

SELECT DISTINCT CITY
FROM STATION
WHERE (CITY LIKE '[AEIOU]%' OR CITY LIKE '[aeiou]%')  -- starts with vowel
  AND (CITY LIKE '%[AEIOU]' OR CITY LIKE '%[aeiou]'); -- ends with vowel
GO
