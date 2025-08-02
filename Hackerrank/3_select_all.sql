-- Problem: Query all columns for every row in the CITY table

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
(1, 'New York', 'USA', 'New York', 8008278),
(2, 'Los Angeles', 'USA', 'California', 3694820),
(3, 'Chicago', 'USA', 'Illinois', 2896016),
(4, 'Houston', 'USA', 'Texas', 1953631),
(5, 'Smalltown', 'USA', 'Nowhere', 95000),
(6, 'Toronto', 'CAN', 'Ontario', 2800000);

-- Query to display all columns for every row in the CITY table
SELECT *
FROM CITY;
