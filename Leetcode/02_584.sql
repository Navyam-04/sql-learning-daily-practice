-- ============================================================================
-- Problem: Find the names of customers who are:
--   - referred by any customer with id != 2, OR
--   - not referred by any customer (i.e., referee_id is NULL)
--
-- Table: Customer
--   - id          INT        : Primary key
--   - name        VARCHAR
--   - referee_id  INT (nullable)
--
-- Expected Output:
--   Return a list of names satisfying the above condition.
--   Return result in any order.
-- ============================================================================

-- Drop the Customer table if it already exists
IF OBJECT_ID('dbo.Customer', 'U') IS NOT NULL
    DROP TABLE dbo.Customer;
GO

-- Create the Customer table
CREATE TABLE Customer (
    id         INT PRIMARY KEY,
    name       VARCHAR(100),
    referee_id INT NULL
);
GO

-- Insert sample data
INSERT INTO Customer (id, name, referee_id) VALUES
(1, 'Will', NULL),
(2, 'Jane', NULL),
(3, 'Alex', 2),
(4, 'Bill', NULL),
(5, 'Zack', 1),
(6, 'Mark', 2);
GO

-- Verify inserted data
SELECT * FROM Customer;
GO

-- =======================
-- Solution Query
-- =======================
/*
Select names of customers where:
  - referee_id is NULL (not referred by anyone), OR
  - referee_id != 2 (referred by someone other than customer with id = 2)
*/

SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id != 2;
GO
