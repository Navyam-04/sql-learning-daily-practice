-- Drop the table if it already exists
DROP TABLE IF EXISTS CITY;
GO

-- Create the CITY table with appropriate columns
CREATE TABLE CITY (
    ID INT,
    NAME VARCHAR(50),
    COUNTRYCODE VARCHAR(10),
    DISTRICT VARCHAR(50),
    POPULATION INT
);
GO

-- Insert sample data into the CITY table
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES
(1, 'Kabul', 'AFG', 'Kabol', 1780000),
(2, 'Qandahar', 'AFG', 'Qandahar', 237500),
(3, 'Herat', 'AFG', 'Herat', 186800),
(4, 'Mazar-e-Sharif', 'AFG', 'Balkh', 127800),
(5, 'Amsterdam', 'NLD', 'Noord-Holland', 731200),
(6, 'Rotterdam', 'NLD', 'Zuid-Holland', 593321),
(7, 'Utrecht', 'NLD', 'Utrecht', 234323),
(8, 'Nairobi', 'KEN', 'Nairobi Area', 2290000),
(9, 'Mombasa', 'KEN', 'Coast', 1200000),
(10, 'Kisumu', 'KEN', 'Nyanza', 409928);
GO

-- Verify inserted data
SELECT * FROM CITY;
GO

-- Final Query: Count the number of cities with population > 100000
-- You can change 100000 to any other threshold if needed
SELECT COUNT(*) AS Cities_With_Population_Over_100000
FROM CITY
WHERE POPULATION > 100000;
GO
