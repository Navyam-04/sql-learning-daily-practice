-- Problem: American Cities with Population Greater Than 100000

-- Write a SQL query to find all records of American cities (`CountryCode = 'USA'`) from the `CITY` table where the population is greater than 100000.
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
(5, 'Smalltown', 'USA', 'Nowhere', 95000);

-- Query for American cities with population > 100000
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 100000;
