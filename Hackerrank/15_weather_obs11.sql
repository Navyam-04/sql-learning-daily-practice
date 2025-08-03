-- =================================================================
-- Problem: Query the list of CITY names from STATION that either 
--          do not start with vowels OR do not end with vowels. 
--          The result cannot contain duplicates.
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
-- Mix of cities starting/ending with vowels and consonants for testing.
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'Oslo', 'NO', 59.91, 10.75),       -- starts & ends with vowel ❌ (should be excluded)
(2, 'Agra', 'IN', 27.18, 78.01),       -- starts & ends with vowel ❌ (should be excluded)
(3, 'Berlin', 'DE', 52.52, 13.40),     -- starts with consonant ✅
(4, 'Udaipur', 'RJ', 24.58, 73.68),    -- starts with vowel, ends with consonant ✅
(5, 'Chicago', 'IL', 41.88, -87.63),   -- starts with consonant ✅
(6, 'Orlando', 'FL', 28.54, -81.38),   -- starts with vowel, ends with consonant ✅
(7, 'Berlin', 'DE', 52.52, 13.40);     -- duplicate to test DISTINCT
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
WHERE CITY NOT LIKE '[AEIOU]%'   -- does not start with uppercase vowels
   OR CITY NOT LIKE '%[AEIOU]'   -- OR does not end with uppercase vowels
   OR CITY NOT LIKE '[aeiou]%'   -- does not start with lowercase vowels
   OR CITY NOT LIKE '%[aeiou]';  -- OR does not end with lowercase vowels
GO
