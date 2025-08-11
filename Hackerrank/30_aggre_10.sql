============================================================================
-- Problem: Weather Observation Station 13
--
-- Table: STATION
--   - ID       INT     : Station ID
--   - CITY     VARCHAR : City name
--   - STATE    VARCHAR : State code
--   - LAT_N    FLOAT   : Northern latitude
--   - LONG_W   FLOAT   : Western longitude
--
-- Requirement:
--   Query the sum of LAT_N for stations where:
--       LAT_N > 38.7880
--       AND LAT_N < 137.2345
--   Truncate the result to 4 decimal places (not round).
--
-- Expected Output Schema:
--   truncated_sum
--  --------------
--   <decimal(18,4)>
--
-- Example:
-- STATION:
-- | ID | CITY    | STATE | LAT_N   | LONG_W   |
-- |  1 | AUSTIN  | TX    | 45.6789 | 120.4567 |
-- |  2 | DALLAS  | TX    | 39.4567 | 110.9876 |
-- |  3 | DENVER  | CO    | 37.0000 | 105.2345 |
--
-- Output:
-- | truncated_sum |
-- |  85.1356      |
============================================================================

-- =======================
-- Solution Query (SQL Server)
-- =======================
/*
  Steps:
    1. Filter rows by LAT_N range (38.7880 < LAT_N < 137.2345).
    2. Use SUM(LAT_N) to get the total latitude.
    3. Multiply by 10000, apply FLOOR to truncate, then divide by 10000.0.
    4. CAST the result as DECIMAL(18,4) to match output format.
*/
SELECT
    CAST(FLOOR(SUM(LAT_N) * 10000) / 10000.0 AS DECIMAL(18,4)) AS truncated_sum
FROM STATION
WHERE LAT_N > 38.7880
  AND LAT_N < 137.2345;
GO
