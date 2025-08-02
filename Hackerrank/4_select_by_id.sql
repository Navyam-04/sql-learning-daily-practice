-- Problem: Query all columns for a city in CITY with the ID 1661

-- The CITY table is described as follows:
-- ID: INT - unique identifier for the city
-- NAME: VARCHAR(50) - name of the city
-- COUNTRYCODE: CHAR(3) - country code (e.g., 'USA')
-- DISTRICT: VARCHAR(50) - administrative division
-- POPULATION: INT - population of the city

-- Table creation

CREATE TABLE CITY (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    COUNTRYCODE CHAR(3),
    DISTRICT VARCHAR(50),
    POPULATION INT
);

-- Insert test data into CITY table
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES
(1659, 'San Francisco', 'USA', 'California', 776733),
(1660, 'San Diego', 'USA', 'California', 1223400),
(1661, 'San Jose', 'USA', 'California', 894943),
(1662, 'Austin', 'USA', 'Texas', 656562);

-- Query to retrieve all columns for the city with ID 1661
SELECT *
FROM CITY
WHERE ID = 1661;
