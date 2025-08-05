-- ✅ Drop table if it already exists
IF OBJECT_ID('CITY', 'U') IS NOT NULL  
    DROP TABLE CITY;
GO

-- ✅ Create CITY table
CREATE TABLE CITY (
    ID INT PRIMARY KEY,               -- Unique city identifier
    Name VARCHAR(50),                 -- Name of the city
    CountryCode CHAR(3),              -- Country code (ISO 3-letter)
    District VARCHAR(50),             -- District or state name
    Population INT                    -- Population of the city
);
GO

-- ✅ Insert sample data (you can add more for practice)
INSERT INTO CITY (ID, Name, CountryCode, District, Population) VALUES
(1, 'Los Angeles', 'USA', 'California', 3970000),
(2, 'San Diego', 'USA', 'California', 1423851),
(3, 'San Francisco', 'USA', 'California', 883305),
(4, 'New York', 'USA', 'New York', 8398748),
(5, 'Houston', 'USA', 'Texas', 2328000);
GO

-- ✅ Verify data
SELECT * FROM CITY;
GO

-- ✅ Final Query: Average population of all cities, rounded down
-- AVG(Population) returns a decimal, so we use FLOOR() to round down
SELECT FLOOR(AVG(Population * 1.0)) AS Average_Population
FROM CITY;
GO
