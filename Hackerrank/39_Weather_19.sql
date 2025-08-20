/*
-- Problem: Weather Observation Station 19 (Euclidean Distance)
-- Description:
--   Consider two points on a 2D plane:
--     Point A = (min LAT_N, min LONG_W)
--     Point B = (max LAT_N, max LONG_W)
--
--   Task: Compute the Euclidean Distance between A and B:
--     SQRT( (max(LAT_N) - min(LAT_N))^2 + (max(LONG_W) - min(LONG_W))^2 )
--
--   Round the result to 4 decimal places and return as DECIMAL(18,4).
--
-- Input table: STATION
-- Relevant columns:
--   ID      INT
--   CITY    VARCHAR(50)
--   LAT_N   DECIMAL(9,4)   -- northern latitude
--   LONG_W  DECIMAL(9,4)   -- western longitude
--
-- Requirement / Output:
--   Single value (DECIMAL with scale 4) representing the Euclidean distance.
--   Example expected output (HackerRank hidden test case): 184.1616
*/

-- 1) Drop table if exists (safe redeploy)
IF OBJECT_ID('dbo.STATION', 'U') IS NOT NULL
    DROP TABLE dbo.STATION;
GO

-- 2) Create table schema
CREATE TABLE dbo.STATION (
    ID INT PRIMARY KEY,
    CITY VARCHAR(50),
    LAT_N DECIMAL(9,4),
    LONG_W DECIMAL(9,4)
);
GO

-- 3) Insert sample rows (illustrative only; HackerRank uses hidden dataset)
INSERT INTO dbo.STATION (ID, CITY, LAT_N, LONG_W) VALUES
(1, 'Alpha', 23.4567, 45.1234),
(2, 'Beta' , 10.0000, 120.0000),
(3, 'Gamma', 283.1423, 5.4395);
GO

/*
-- Step-by-step solution:
-- 1. Find min(LAT_N), max(LAT_N), min(LONG_W), max(LONG_W).
-- 2. Compute ΔLAT = (max(LAT_N) - min(LAT_N)).
-- 3. Compute ΔLONG = (max(LONG_W) - min(LONG_W)).
-- 4. Euclidean distance = SQRT(ΔLAT^2 + ΔLONG^2).
-- 5. Round to 4 decimal places, cast as DECIMAL(18,4).
*/

-- 4) Final query
SELECT CAST(
           ROUND(
               SQRT(
                   POWER(MAX(LAT_N) - MIN(LAT_N), 2)   -- ΔLAT²
                 + POWER(MAX(LONG_W) - MIN(LONG_W), 2) -- ΔLONG²
               )
           , 4) 
       AS DECIMAL(18,4)) AS EUCLIDEAN_DISTANCE
FROM dbo.STATION;
GO
