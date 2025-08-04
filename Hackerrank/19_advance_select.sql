-- ============================================================================
-- Problem: Classify triangles based on side lengths A, B, and C from the
--          TRIANGLES table as one of the following:
--            - Equilateral: All sides are equal
--            - Isosceles: Two sides are equal
--            - Scalene: All sides are different
--            - Not A Triangle: The sides do not form a valid triangle
-- ============================================================================

-- Drop the TRIANGLES table if it already exists
IF OBJECT_ID('dbo.TRIANGLES', 'U') IS NOT NULL
    DROP TABLE dbo.TRIANGLES;
GO

-- Create the TRIANGLES table
CREATE TABLE TRIANGLES (
    A INT,
    B INT,
    C INT
);
GO

-- Insert sample data for testing
INSERT INTO TRIANGLES (A, B, C) VALUES
(20, 20, 23),       -- Isosceles
(20, 20, 20),       -- Equilateral
(20, 21, 22),       -- Scalene
(1, 2, 3),          -- Not A Triangle
(5, 5, 5),          -- Equilateral
(5, 5, 8),          -- Isosceles
(7, 9, 10),         -- Scalene
(2, 2, 5),          -- Not A Triangle
(10, 15, 20),       -- Scalene
(6, 8, 10),         -- Scalene
(3, 4, 5),          -- Scalene
(1, 2, 4),          -- Not A Triangle
(4, 1, 2),          -- Not A Triangle
(6, 10, 15),        -- Scalene
(100, 100, 100);    -- Equilateral
GO

-- Verify inserted data
SELECT * FROM TRIANGLES;
GO

-- =======================
-- Solution Query
-- =======================

/*
Classify each triangle based on side lengths using the following rules:
  - Not A Triangle: If A + B <= C OR A + C <= B OR B + C <= A
  - Equilateral: All sides are equal
  - Isosceles: Exactly two sides are equal
  - Scalene: All sides are different
*/

SELECT 
  CASE
    WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
    WHEN A = B AND B = C THEN 'Equilateral'
    WHEN A = B OR B = C OR A = C THEN 'Isosceles'
    ELSE 'Scalene'
  END AS TYPE
FROM TRIANGLES
ORDER BY A, B, C;
GO
