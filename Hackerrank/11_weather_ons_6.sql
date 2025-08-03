-- =================================================================
-- Problem: Query the list of CITY names starting with vowels 
--          (a, e, i, o, or u) from STATION. The result cannot 
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
(1, 'Austin', 'TX', 30.27, -97.74),
(2, 'Orlando', 'FL', 28.54, -81.38),
(3, 'Indianapolis', 'IN', 39.77, -86.16),
(4, 'Udaipur', 'RJ', 24.58, 73.68),
(5, 'Chicago', 'IL', 41.88, -87.63),
(6, 'Edinburgh', 'SC', 55.95, -3.19),
(7, 'Dallas', 'TX', 32.77, -96.79),
(8, 'Austin', 'TX', 30.27, -97.74);  -- duplicate to test DISTINCT
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
WHERE CITY LIKE '[AEIOU]%'    -- Matches cities starting with uppercase vowels
   OR CITY LIKE '[aeiou]%';   -- Matches cities starting with lowercase vowels (optional)
GO
