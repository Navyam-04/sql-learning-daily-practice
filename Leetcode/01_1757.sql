-- ============================================================================
-- Problem: Retrieve the product IDs of all products that are both
--          low fat (`low_fats = 'Y'`) and recyclable (`recyclable = 'Y'`)
-- 
-- Table: Products
--   - product_id   INT        : Primary key
--   - low_fats     ENUM('Y','N')
--   - recyclable   ENUM('Y','N')
--
-- Expected Output:
--   A list of product_ids that satisfy both conditions.
--   Order of results does not matter.
-- ============================================================================

-- Drop the Products table if it already exists
IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL
    DROP TABLE dbo.Products;
GO

-- Create the Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    low_fats   CHAR(1) CHECK (low_fats IN ('Y', 'N')),
    recyclable CHAR(1) CHECK (recyclable IN ('Y', 'N'))
);
GO

-- Insert sample data
INSERT INTO Products (product_id, low_fats, recyclable) VALUES
(0, 'Y', 'N'),
(1, 'Y', 'Y'),
(2, 'N', 'Y'),
(3, 'Y', 'Y'),
(4, 'N', 'N');
GO

-- Verify inserted data
SELECT * FROM Products;
GO

-- =======================
-- Solution Query
-- =======================
/*
Select product_id for all products where:
  - low_fats is 'Y'
  - recyclable is 'Y'
*/

SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';
GO
