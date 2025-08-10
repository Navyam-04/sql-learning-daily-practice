============================================================================
-- Problem: Weather Observation Station 2
--
-- Table: STATION
--   - ID       NUMBER       : Unique ID of the station
--   - CITY     VARCHAR2(21) : Name of the city
--   - STATE    VARCHAR2(2)  : State code
--   - LAT_N    NUMBER       : Northern latitude
--   - LONG_W   NUMBER       : Western longitude
--
-- Requirement:
--   1. Find the sum of all LAT_N values rounded to 2 decimal places.
--   2. Find the sum of all LONG_W values rounded to 2 decimal places.
--   3. Output the result as: lat lon
--
-- Expected Output Schema:
--   lat       | lon
--  -----------+-----------
--   <decimal> | <decimal>
--
-- Example:
-- STATION:
-- | LAT_N   | LONG_W  |
-- | 10.2345 | 20.4567 |
-- |  5.1234 | 15.9876 |
--
-- Output:
-- | lat     | lon     |
-- | 15.36   | 36.44   |
============================================================================

-- Drop table if exists
DROP TABLE IF EXISTS STATION;

-- Create STATION table
CREATE TABLE STATION (
    ID      NUMBER,
    CITY    VARCHAR2(21),
    STATE   VARCHAR2(2),
    LAT_N   NUMBER,
    LONG_W  NUMBER
);

-- Insert sample data
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'CityA', 'CA', 10.2345, 20.4567),
(2, 'CityB', 'NY', 5.1234, 15.9876);

-- =======================
-- Solution Query
-- =======================
/*
  Steps:
    1. Use SUM to calculate the total LAT_N and LONG_W values.
    2. Apply ROUND to format both values to 2 decimal places.
    3. CAST the rounded results to DECIMAL(10,2) to ensure correct formatting.
*/
SELECT
    CAST(ROUND(SUM(LAT_N), 2) AS DECIMAL(10,2)) AS lat,
    CAST(ROUND(SUM(LONG_W), 2) AS DECIMAL(10,2)) AS lon
FROM STATION;
