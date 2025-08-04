-- ============================================================================
-- Problem: Find the name, population, and area of countries classified as big.
--          A country is considered big if:
--            - Area >= 3,000,000 km² OR
--            - Population >= 25,000,000
--
-- Table: World
--   - name        VARCHAR   : Name of the country (Primary Key)
--   - continent   VARCHAR   : Continent the country belongs to
--   - area        INT       : Area in km²
--   - population  INT       : Total population
--   - gdp         BIGINT    : GDP value
--
-- Expected Output:
--   - name, population, area for countries matching the above condition
--   - Return result in any order
-- ============================================================================

-- Drop the World table if it already exists
IF OBJECT_ID('dbo.World', 'U') IS NOT NULL
    DROP TABLE dbo.World;
GO

-- Create the World table
CREATE TABLE World (
    name        VARCHAR(100) PRIMARY KEY,
    continent   VARCHAR(50),
    area        INT,
    population  INT,
    gdp         BIGINT
);
GO

-- Insert sample data
INSERT INTO World (name, continent, area, population, gdp) VALUES
('Afghanistan', 'Asia',     652230, 25500100, 20343000000),
('Albania',     'Europe',     28748,  2831741, 12960000000),
('Algeria',     'Africa',   2381741, 37100000,188681000000),
('Andorra',     'Europe',       468,    78115,  3712000000),
('Angola',      'Africa',   1246700, 20609294,100990000000);
GO

-- Verify inserted data
SELECT * FROM World;
GO

-- =======================
-- Solution Query
-- =======================
/*
Select countries where:
  - area >= 3,000,000 OR
  - population >= 25,000,000
Return name, population, and area only.
*/

SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;
GO
