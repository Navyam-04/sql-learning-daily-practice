/*
==========================================================
Problem: Average Population of Each Continent
==========================================================
We are given two tables:

1) CITY
   - ID (int)
   - Name (varchar)
   - CountryCode (char(3))
   - District (varchar)
   - Population (int)

2) COUNTRY
   - Code (char(3))
   - Name (varchar)
   - Continent (varchar)
   - Region (varchar)
   - SurfaceArea (float)
   - IndepYear (int)
   - Population (int)
   - LifeExpectancy (float)
   - GNP (float)
   - LocalName (varchar)
   - GovernmentForm (varchar)
   - HeadOfState (varchar)
   - Capital (int)
   - Code2 (char(2))

Requirement:
-----------------------------------------------
Query the names of all the continents (COUNTRY.Continent) 
and their respective average city populations (CITY.Population), 
rounded down to the nearest integer.

Note:
- CITY.CountryCode = COUNTRY.Code (foreign key relationship).
- Use FLOOR() to round down in SQL Server.

Expected Output Schema:
-----------------------------------------------
Continent    avg_city_pop

Example Output:
-----------------------------------------------
Oceania        109189
South America  147435
Europe         175138
Africa         274439
Asia           693038
==========================================================
*/

-- Final T-SQL Solution
SELECT 
    ct.Continent,
    FLOOR(AVG(ci.Population)) AS avg_city_pop
FROM CITY AS ci
JOIN COUNTRY AS ct
    ON ci.CountryCode = ct.Code
GROUP BY ct.Continent;
