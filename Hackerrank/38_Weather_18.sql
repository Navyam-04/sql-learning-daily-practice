/*
-- Problem: Weather Observation Station (Manhattan Distance)
-- Description:
--   Consider two points A and B on a 2D plane where:
--     A = (min LAT_N, min LONG_W)
--     B = (max LAT_N, max LONG_W)
--   Compute the Manhattan Distance between A and B:
--     |max(LAT_N) - min(LAT_N)| + |max(LONG_W) - min(LONG_W)|
--   Round the result to 4 decimal places.
--
-- Input table: STATION
-- Relevant columns:
--   ID      INT
--   CITY    VARCHAR(50)
--   LAT_N   DECIMAL(9,4)   -- northern latitude
--   LONG_W  DECIMAL(9,4)   -- western longitude
--
-- Requirement / Output:
--   Single value (DECIMAL with scale 4) representing the Manhattan distance,
--   e.g. HackerRank sample expected output: 259.6859
--
-- Example (HackerRank uses its own hidden test data; below are sample rows)
*/

-- 1) Drop table if exists (safe redeploy)
IF OBJECT_ID('dbo.STATION', 'U') IS NOT NULL
    DROP TABLE dbo.STATION;
GO

-- 2) Create table (schema containing relevant columns)
CREATE TABLE dbo.STATION (
    ID INT PRIMARY KEY,
    CITY VARCHAR(50),
    LAT_N DECIMAL(9,4),
    LONG_W DECIMAL(9,4)
);
GO

-- 3) Insert sample data (illustrative only)
INSERT INTO dbo.STATION (ID, CITY, LAT_N, LONG_W) VALUES
(1, 'Alpha', 23.4567, 45.1234),
(2, 'Beta' , 10.0000, 120.0000),
(3, 'Gamma', 283.1423, 5.4395);
-- (Note: These sample rows are for demonstration. HackerRank uses its own dataset.)
GO

/*
-- Step-by-step explanation of the solution:
-- 1. Compute min(LAT_N) and max(LAT_N).
-- 2. Compute min(LONG_W) and max(LONG_W).
-- 3. Compute the absolute difference for latitudes: ABS(MAX(LAT_N) - MIN(LAT_N))
-- 4. Compute the absolute difference for longitudes: ABS(MAX(LONG_W) - MIN(LONG_W))
-- 5. Sum the two differences.
-- 6. Round the sum to 4 decimal places and cast to DECIMAL(18,4) for exact output format.
--
-- Final query (T-SQL): prints one numeric value with 4 decimal places.
*/

-- 4) Final query
SELECT CAST(
         ROUND(
           ABS(MAX(LAT_N) - MIN(LAT_N))         -- latitude range
         + ABS(MAX(LONG_W) - MIN(LONG_W))       -- longitude range
         , 4)                                   -- round to 4 decimal places
       AS DECIMAL(18,4)) AS MANHATTAN_DISTANCE
FROM dbo.STATION;
GO
