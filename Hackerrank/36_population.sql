/* 
------------------------------------------------------------
Problem: African Cities
------------------------------------------------------------
Tables:
1. CITY
   - ID: int
   - Name: varchar
   - CountryCode: varchar
   - District: varchar
   - Population: int

2. COUNTRY
   - Code: varchar
   - Name: varchar
   - Continent: varchar
   - Region: varchar
   - SurfaceArea: float
   - IndepYear: int
   - Population: int
   - LifeExpectancy: float
   - GNP: float
   - GNPOld: float
   - LocalName: varchar
   - GovernmentForm: varchar
   - HeadOfState: varchar
   - Capital: int
   - Code2: varchar

------------------------------------------------------------
Requirement:
Query the names of all cities from the CITY table where the 
corresponding COUNTRY belongs to the continent 'Africa'.

------------------------------------------------------------
Expected Output Schema:
Name (varchar)

------------------------------------------------------------
Sample Example:
If the COUNTRY table has a row (Code = 'ZAF', Continent = 'Africa')
and the CITY table has rows (Name = 'Qina', CountryCode = 'ZAF'),
then output should include 'Qina'.
------------------------------------------------------------
*/

-- Drop tables if they exist (for reusability)
DROP TABLE IF EXISTS CITY;
DROP TABLE IF EXISTS COUNTRY;

-- Create COUNTRY table
CREATE TABLE COUNTRY (
    Code VARCHAR(3) PRIMARY KEY,
    Name VARCHAR(50),
    Continent VARCHAR(50),
    Region VARCHAR(50),
    SurfaceArea FLOAT,
    IndepYear INT,
    Population INT,
    LifeExpectancy FLOAT,
    GNP FLOAT,
    GNPOld FLOAT,
    LocalName VARCHAR(50),
    GovernmentForm VARCHAR(50),
    HeadOfState VARCHAR(50),
    Capital INT,
    Code2 VARCHAR(2)
);

-- Create CITY table
CREATE TABLE CITY (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    CountryCode VARCHAR(3),
    District VARCHAR(50),
    Population INT,
    FOREIGN KEY (CountryCode) REFERENCES COUNTRY(Code)
);

-- Insert sample data
INSERT INTO COUNTRY (Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, GNPOld, LocalName, GovernmentForm, HeadOfState, Capital, Code2)
VALUES
('EGY', 'Egypt', 'Africa', 'Northern Africa', 1002450, 1922, 68470000, 63.3, 82710.0, NULL, 'Misr', 'Republic', 'Hosni Mubarak', 608, 'EG'),
('ZAF', 'South Africa', 'Africa', 'Southern Africa', 1221037, 1910, 40377000, 51.1, 116729.0, NULL, 'South Africa', 'Republic', 'Thabo Mbeki', 716, 'ZA');

INSERT INTO CITY (ID, Name, CountryCode, District, Population)
VALUES
(1, 'Qina', 'EGY', 'Qina', 200000),
(2, 'Warraq al-Arab', 'EGY', 'Giza', 150000),
(3, 'Kempton Park', 'ZAF', 'Gauteng', 171575),
(4, 'Alberton', 'ZAF', 'Gauteng', 410102);

------------------------------------------------------------
-- Step-by-step solution:
-- 1. Join CITY with COUNTRY on matching CountryCode and Code.
-- 2. Filter rows where Continent = 'Africa'.
-- 3. Select only the city names.
------------------------------------------------------------

-- Final Query
SELECT ci.Name
FROM CITY AS ci
JOIN COUNTRY AS ct
    ON ci.CountryCode = ct.Code
WHERE ct.Continent = 'Africa';
