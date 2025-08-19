/*
------------------------------------------------------------
 Problem: Population Census (HackerRank - Basic Join)
------------------------------------------------------------
 Tables:
   1. CITY
      - ID INT
      - NAME VARCHAR
      - COUNTRYCODE VARCHAR
      - DISTRICT VARCHAR
      - POPULATION INT

   2. COUNTRY
      - CODE VARCHAR
      - NAME VARCHAR
      - CONTINENT VARCHAR
      - REGION VARCHAR
      - SURFACEAREA FLOAT
      - INDEPYEAR INT
      - POPULATION INT
      - LIFEEXPECTANCY FLOAT
      - GNP FLOAT
      - GNPOld FLOAT
      - LOCALNAME VARCHAR
      - GOVERNMENTFORM VARCHAR
      - HEADOFSTATE VARCHAR
      - CAPITAL INT
      - CODE2 VARCHAR

 Requirements:
   Query the sum of the populations of all cities (CITY.POPULATION)
   where the CONTINENT is 'Asia'. Use the join condition:
   CITY.CountryCode = COUNTRY.Code

 Expected Output Schema:
   SUM (BIGINT/INT)

 Example:
   Input: (not shown - uses CITY + COUNTRY tables)
   Output:
   27028484
------------------------------------------------------------
*/

-- Drop tables if exist (for local testing)
DROP TABLE IF EXISTS CITY;
DROP TABLE IF EXISTS COUNTRY;

-- Create tables
CREATE TABLE COUNTRY (
    CODE VARCHAR(10),
    NAME VARCHAR(50),
    CONTINENT VARCHAR(50),
    REGION VARCHAR(50),
    SURFACEAREA FLOAT,
    INDEPYEAR INT,
    POPULATION INT,
    LIFEEXPECTANCY FLOAT,
    GNP FLOAT,
    GNPOld FLOAT,
    LOCALNAME VARCHAR(50),
    GOVERNMENTFORM VARCHAR(50),
    HEADOFSTATE VARCHAR(50),
    CAPITAL INT,
    CODE2 VARCHAR(10)
);

CREATE TABLE CITY (
    ID INT,
    NAME VARCHAR(50),
    COUNTRYCODE VARCHAR(10),
    DISTRICT VARCHAR(50),
    POPULATION INT
);

-- Insert sample data (minimal example for testing)
INSERT INTO COUNTRY (CODE, NAME, CONTINENT, REGION, POPULATION)
VALUES
('IND', 'India', 'Asia', 'Southern Asia', 1000000),
('CHN', 'China', 'Asia', 'Eastern Asia', 2000000),
('USA', 'United States', 'North America', 'North America', 3000000);

INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION)
VALUES
(1, 'Mumbai', 'IND', 'Maharashtra', 5000000),
(2, 'Delhi', 'IND', 'Delhi', 3000000),
(3, 'Shanghai', 'CHN', 'Shanghai', 7000000),
(4, 'Beijing', 'CHN', 'Beijing', 6000000),
(5, 'New York', 'USA', 'New York', 8000000);

------------------------------------------------------------
-- ✅ Step-by-step solution
------------------------------------------------------------
-- Step 1: Join CITY and COUNTRY on matching key columns
-- Step 2: Filter only rows where CONTINENT = 'Asia'
-- Step 3: Sum the CITY.POPULATION column
------------------------------------------------------------

SELECT SUM(ci.POPULATION) AS total_population
FROM CITY AS ci
JOIN COUNTRY AS ct
    ON ci.CountryCode = ct.Code
WHERE ct.CONTINENT = 'Asia';
