-- Problem: American Cities with Population Greater Than 120000

-- Write a SQL query to print the NAME of all American cities
-- from the CITY table with populations larger than 120000.
-- The COUNTRYCODE for America is 'USA'.

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

-- Query for American cities with population > 120000
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000;
