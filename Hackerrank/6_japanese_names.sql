-- Problem: Query all attributes of every Japanese city in the CITY table
-- The COUNTRYCODE for Japan is 'JPN'

-- The CITY table is described as follows:
-- ID: INT - unique identifier for the city
-- NAME: VARCHAR(50) - name of the city
-- COUNTRYCODE: CHAR(3) - country code (e.g., 'JPN')
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
(101, 'Tokyo', 'JPN', 'Tokyo-to', 8336599),
(102, 'Osaka', 'JPN', 'Osaka', 2595674),
(103, 'Nagoya', 'JPN', 'Aichi', 2154376),
(104, 'Sapporo', 'JPN', 'Hokkaido', 1790886),
(105, 'New York', 'USA', 'New York', 8008278); -- Non-Japanese city for contrast

-- Query to retrieve all attributes of every Japanese city
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';
