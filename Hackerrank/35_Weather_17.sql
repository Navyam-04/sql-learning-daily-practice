/*
------------------------------------------------------------
Problem: Weather Observation Station 17 (HackerRank - SQL)
------------------------------------------------------------
Description:
Query the Western Longitude (LONG_W) where the smallest 
Northern Latitude (LAT_N) in STATION is greater than 38.7780.  

Round the result (LONG_W) to 4 decimal places.

------------------------------------------------------------
Table: STATION
------------------------------------------------------------
| Field   | Type     |
|---------|----------|
| ID      | INTEGER  |
| CITY    | VARCHAR  |
| STATE   | VARCHAR  |
| LAT_N   | NUMERIC  | -- Northern latitude
| LONG_W  | NUMERIC  | -- Western longitude

------------------------------------------------------------
Requirements:
- Find the minimum LAT_N that is strictly greater than 38.7780.
- Return the corresponding LONG_W value.
- Round to 4 decimal places.

------------------------------------------------------------
Expected Output Schema:
| LONG_W (DECIMAL(18,4)) |

------------------------------------------------------------
Example:
If LAT_N > 38.7780 and the smallest LAT_N is 39.1234 
with LONG_W = 70.13781234,
then output = 70.1378

------------------------------------------------------------
Solution Steps:
1. Find the smallest LAT_N greater than 38.7780.
2. Select the LONG_W of that record.
3. Round LONG_W to 4 decimal places.
4. Cast to DECIMAL(18,4) for SQL Server precision.

------------------------------------------------------------
Final SQL Query (SQL Server):
------------------------------------------------------------
*/

SELECT CAST(ROUND(LONG_W, 4) AS DECIMAL(18,4)) AS LONG_W
FROM STATION
WHERE LAT_N = (
    SELECT MIN(LAT_N)
    FROM STATION
    WHERE LAT_N > 38.7780
);
