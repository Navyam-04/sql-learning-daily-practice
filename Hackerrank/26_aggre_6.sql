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

-- ✅ Insert sample data
INSERT INTO CITY (ID, Name, CountryCode, District, Population) VALUES
(1, 'Tokyo', 'JPN', 'Tokyo', 13929286),
(2, 'Osaka', 'JPN', 'Osaka', 2691000),
(3, 'Kyoto', 'JPN', 'Kyoto', 1475000),
(4, 'Fukuoka', 'JPN', 'Fukuoka', 1615000),
(5, 'Kobe', 'JPN', 'Hyogo', 1537000),
(6, 'Yokohama', 'JPN', 'Kanagawa', 3740000),
(7, 'Nagoya', 'JPN', 'Aichi', 2296000);
GO

-- ✅ Verify data
SELECT * FROM CITY;
GO

-- ✅ Final Query: Difference between MAX and MIN population
SELECT 
    MAX(Population) - MIN(Population) AS Population_Difference
FROM CITY;
GO
