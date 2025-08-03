-- =================================================================
-- Problem: Query the list of CITY names from STATION that do not 
--          start with vowels (a, e, i, o, u). The result cannot 
--          contain duplicates.
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
-- Includes cities starting with vowels and consonants for testing.
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'Austin', 'TX', 30.27, -97.74),      -- starts with vowel
(2, 'Boston', 'MA', 42.36, -71.06),      -- starts with consonant ✅
(3, 'Chicago', 'IL', 41.88, -87.63),     -- starts with consonant ✅
(4, 'Orlando', 'FL', 28.54, -81.38),     -- starts with vowel
(5, 'Delhi', 'DL', 28.61, 77.21),        -- starts with consonant ✅
(6, 'Udaipur', 'RJ', 24.58, 73.68),      -- starts with vowel
(7, 'Boston', 'MA', 42.36, -71.06);      -- duplicate to test DISTINCT
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
WHERE CITY NOT LIKE '[AEIOU]%'  -- not starting with uppercase vowels
  AND CITY NOT LIKE '[aeiou]%'; -- not starting with lowercase vowels
GO
