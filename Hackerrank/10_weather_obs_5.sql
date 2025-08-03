-- =================================================================
-- Problem: Query the two cities in STATION with the shortest and 
--          longest CITY names, as well as their respective lengths.
--          If there is more than one smallest or largest city, 
--          choose the one that comes first alphabetically.
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
-- Includes a variety of city name lengths for testing.
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'New York', 'NY', 40.71, -74.00),
(2, 'LA', 'CA', 34.05, -118.24),
(3, 'Chicago', 'IL', 41.88, -87.63),
(4, 'Houston', 'TX', 29.76, -95.36),
(5, 'Dallas', 'TX', 32.77, -96.79),
(6, 'San Francisco', 'CA', 37.77, -122.41),
(7, 'A', 'AZ', 33.45, -112.07);
GO

-- Verify that the data has been inserted correctly
SELECT * FROM STATION;
GO

-- =======================
-- Solution Query
-- =======================

/* Write your T-SQL query statement below */

-- Shortest and longest city names with their lengths
SELECT CITY, LEN(CITY) AS LEN
FROM (
    SELECT TOP 1 CITY, LEN(CITY) AS LEN
    FROM STATION
    WHERE LEN(CITY) = (SELECT MIN(LEN(CITY)) FROM STATION)
    ORDER BY CITY
) AS ShortestCity

UNION ALL

SELECT CITY, LEN(CITY) AS LEN
FROM (
    SELECT TOP 1 CITY, LEN(CITY) AS LEN
    FROM STATION
    WHERE LEN(CITY) = (SELECT MAX(LEN(CITY)) FROM STATION)
    ORDER BY CITY
) AS LongestCity;
GO
