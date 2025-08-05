-- ✅ Drop table if it already exists
IF OBJECT_ID('CITY', 'U') IS NOT NULL  
    DROP TABLE CITY;
GO

-- ✅ Create CITY table
CREATE TABLE CITY (
    ID INT PRIMARY KEY,               -- Unique city identifier
    Name VARCHAR(50),                 -- Name of the city
    CountryCode CHAR(3),              -- Country code (ISO 3-letter)
    District VARCHAR(50),            -- District or state name
    Population INT                    -- Population of the city
);
GO

-- ✅ Insert sample data (including Japanese cities)
INSERT INTO CITY (ID, Name, CountryCode, District, Population) VALUES
(1, 'Tokyo', 'JPN', 'Tokyo', 13929286),
(2, 'Osaka', 'JPN', 'Osaka', 2715000),
(3, 'Nagoya', 'JPN', 'Aichi', 2305000),
(4, 'Kyoto', 'JPN', 'Kyoto', 1464000),
(5, 'Yokohama', 'JPN', 'Kanagawa', 3740000),
(6, 'New York', 'USA', 'New York', 8398748),
(7, 'Seoul', 'KOR', 'Seoul', 9776000);
GO

-- ✅ Verify data
SELECT * FROM CITY;
GO

-- ✅ Final Query: Total population for cities in Japan (CountryCode = 'JPN')
SELECT SUM(Population) AS Total_Japan_Population
FROM CITY
WHERE CountryCode = 'JPN';
GO
