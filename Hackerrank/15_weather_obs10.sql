-- =================================================================
-- Problem: Query the list of CITY names from STATION that do not 
--          end with vowels (a, e, i, o, u). The result cannot 
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
-- Includes cities that end with vowels and consonants for testing.
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'Osaka', 'JP', 34.69, 135.50),       -- ends with vowel
(2, 'Chicago', 'IL', 41.88, -87.63),     -- ends with consonant ✅
(3, 'Lima', 'PE', -12.04, -77.03),       -- ends with vowel
(4, 'Berlin', 'DE', 52.52, 13.40),       -- ends with consonant ✅
(5, 'Agra', 'IN', 27.18, 78.01),         -- ends with vowel
(6, 'Dallas', 'TX', 32.77, -96.79),      -- ends with consonant ✅
(7, 'Berlin', 'DE', 52.52, 13.40);       -- duplicate to test DISTINCT
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
WHERE CITY NOT LIKE '%[AEIOU]'   -- does not end with uppercase vowels
  AND CITY NOT LIKE '%[aeiou]';  -- does not end with lowercase vowels
GO
