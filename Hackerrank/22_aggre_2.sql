-- ✅ Drop table if it already exists
IF OBJECT_ID('CITY', 'U') IS NOT NULL  
    DROP TABLE CITY;
GO

-- ✅ Create CITY table with structure as described
CREATE TABLE CITY (
    ID INT PRIMARY KEY,               -- Unique city identifier
    Name VARCHAR(50),                 -- City name
    CountryCode CHAR(3),              -- ISO country code (e.g., 'USA')
    District VARCHAR(50),             -- District name (e.g., 'California')
    Population INT                    -- City population
);
GO

-- ✅ Insert sample data (feel free to add more rows for practice)
INSERT INTO CITY (ID, Name, CountryCode, District, Population) VALUES
(1, 'Los Angeles', 'USA', 'California', 3970000),
(2, 'San Diego', 'USA', 'California', 1423851),
(3, 'San Francisco', 'USA', 'California', 883305),
(4, 'New York', 'USA', 'New York', 8398748),
(5, 'Houston', 'USA', 'Texas', 2328000);
GO

-- ✅ Verify data inserted successfully
SELECT * FROM CITY;
GO

-- ✅ Final Query: Get total population of cities in 'California'
-- We use SUM(Population) to aggregate total population
-- WHERE clause ensures we only include cities in California
SELECT SUM(Population) AS Total_Population
FROM CITY
WHERE District = 'California';
GO
