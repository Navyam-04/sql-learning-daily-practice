-- ============================================================================  
-- Problem: Not Boring Movies  
--  
-- Table: Cinema  
--   - id INT           : Unique identifier for the movie  
--   - movie VARCHAR    : Name of the movie  
--   - description VARCHAR : Description of the movie  
--   - rating FLOAT     : Movie rating (0.00 to 10.00)  
--  
-- Notes:  
--   - Return movies with odd-numbered id (id % 2 != 0)  
--   - Exclude movies with description = 'boring'  
--   - Sort the result by rating in descending order  
-- ============================================================================  

-- ✅ Drop the Cinema table if it exists  
IF OBJECT_ID('dbo.Cinema', 'U') IS NOT NULL  
    DROP TABLE dbo.Cinema;  
GO  

-- ✅ Create the Cinema table  
CREATE TABLE Cinema (  
    id INT PRIMARY KEY,  
    movie VARCHAR(100),  
    description VARCHAR(100),  
    rating FLOAT  
);  
GO  

-- ✅ Insert sample data  
INSERT INTO Cinema (id, movie, description, rating) VALUES  
(1, 'War', 'great 3D', 8.9),  
(2, 'Science', 'fiction', 8.5),  
(3, 'irish', 'boring', 6.2),  
(4, 'Ice song', 'Fantacy', 8.6),  
(5, 'House card', 'Interesting', 9.1);  
GO  

-- ✅ Verify data  
SELECT * FROM Cinema;  
GO  

-- =======================  
-- ✅ Final Query Solution  
-- =======================  

/*
  Select all records where:
    - id is odd (id % 2 != 0)
    - description is not 'boring'
  Then sort by rating descending
*/

SELECT *  
FROM Cinema  
WHERE id % 2 != 0  
  AND description != 'boring'  
ORDER BY rating DESC;  
GO  
