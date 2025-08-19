/* 
-----------------------------------------------------------
Problem: Weather Observation Station 16
-----------------------------------------------------------
Table: STATION

Schema:
+---------+-----------------------+
| Column  | Type                  |
+---------+-----------------------+
| ID      | INT                   |
| CITY    | VARCHAR               |
| STATE   | VARCHAR               |
| LAT_N   | FLOAT (Latitude)      |
| LONG_W  | FLOAT (Longitude)     |
+---------+-----------------------+

Requirement:
- Query the smallest Northern Latitude (LAT_N) 
  from STATION that is greater than 38.7780.
- Round the result to 4 decimal places.

Expected Output Schema:
+----------+
| LAT_N    |
+----------+

Example Expected Output:
38.8526
-----------------------------------------------------------
*/

-- Drop table if it exists
IF OBJECT_ID('STATION', 'U') IS NOT NULL
    DROP TABLE STATION;
GO

-- Create table
CREATE TABLE STATION (
    ID INT,
    CITY VARCHAR(50),
    STATE VARCHAR(50),
    LAT_N FLOAT,
    LONG_W FLOAT
);
GO

-- Insert sample data
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'CITY1', 'STATE1', 38.7521, -97.3961),
(2, 'CITY2', 'STATE2', 38.8526, -97.2621),
(3, 'CITY3', 'STATE3', 39.1234, -97.4567),
(4, 'CITY4', 'STATE4', 38.9001, -97.3000);
GO

-----------------------------------------------------------
-- Step 1: Filter only rows where LAT_N > 38.7780
-- Step 2: Find the MIN(LAT_N) among them
-- Step 3: Round the result to 4 decimal places in SQL Server
-----------------------------------------------------------

SELECT ROUND(MIN(LAT_N), 4) AS LAT_N
FROM STATION
WHERE LAT_N > 38.7780;
GO
