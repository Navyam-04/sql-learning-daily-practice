/*  
-----------------------------------------------------------------------------------
Problem: Weather Observation Station 15 (HackerRank)

Table: STATION
- ID        : Integer
- CITY      : VARCHAR
- STATE     : VARCHAR
- LAT_N     : FLOAT (Northern latitude in degrees)
- LONG_W    : FLOAT (Western longitude in degrees)

Requirement:
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) 
that is less than 137.2345.  
Round the output to 4 decimal places.  

Expected Output Schema:
| LONG_W (DECIMAL(18,4)) |

Example:
If the maximum LAT_N < 137.2345 is 129.2345 and its corresponding LONG_W = 117.246456,  
then output should be: 117.2465
-----------------------------------------------------------------------------------
*/

-- Drop table if exists (for reproducibility)
DROP TABLE IF EXISTS STATION;

-- Create table
CREATE TABLE STATION (
    ID INT,
    CITY VARCHAR(50),
    STATE VARCHAR(50),
    LAT_N FLOAT,
    LONG_W FLOAT
);

-- Insert sample data
INSERT INTO STATION VALUES 
(1, 'Seattle', 'WA', 131.1234, 117.246456),
(2, 'Denver', 'CO', 120.6543, 110.123456),
(3, 'Miami', 'FL', 138.0000, 100.654321),
(4, 'Dallas', 'TX', 136.9999, 117.246456);

-----------------------------------------------------------------------------------
-- Step 1: Find the maximum LAT_N which is strictly less than 137.2345
-- Step 2: Get the corresponding LONG_W for that LAT_N
-- Step 3: Round the result to 4 decimal places
-----------------------------------------------------------------------------------

SELECT 
    CAST(ROUND(LONG_W, 4) AS DECIMAL(18,4)) AS LONG_W
FROM STATION
WHERE LAT_N = (
    SELECT MAX(LAT_N)
    FROM STATION
    WHERE LAT_N < 137.2345
);
