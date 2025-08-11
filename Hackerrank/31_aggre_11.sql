============================================================================
-- Problem: Weather Observation Station 14
--
-- Table: STATION
--   - ID       INT     : Station ID
--   - CITY     VARCHAR : City name
--   - STATE    VARCHAR : State code
--   - LAT_N    FLOAT   : Northern latitude
--   - LONG_W   FLOAT   : Western longitude
--
-- Requirement:
--   Query the greatest value of LAT_N from STATION where:
--       LAT_N < 137.2345
--   Truncate the result to 4 decimal places (not round).
--
-- Expected Output Schema:
--   max_lat
--  ---------
--   <decimal(18,4)>
--
-- Example:
-- STATION:
-- | ID | CITY    | STATE | LAT_N    | LONG_W   |
-- |  1 | AUSTIN  | TX    | 120.5678 | 110.4567 |
-- |  2 | DALLAS  | TX    | 136.9999 | 115.9876 |
-- |  3 | DENVER  | CO    | 137.1000 | 105.2345 |
--
-- Output:
-- | max_lat   |
-- | 136.9999  |
============================================================================

-- =======================
-- Solution Query (SQL Server)
-- =======================
/*
  Steps:
    1. Filter rows where LAT_N is less than 137.2345.
    2. Get the maximum LAT_N using MAX().
    3. Truncate to 4 decimal places:
       - Multiply by 10000, apply FLOOR, divide by 10000.0.
    4. CAST result as DECIMAL(18,4) for exact format.
*/
SELECT
    CAST(FLOOR(MAX(LAT_N) * 10000) / 10000.0 AS DECIMAL(18,4)) AS max_lat
FROM STATION
WHERE LAT_N < 137.2345;
GO
