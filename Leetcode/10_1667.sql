============================================================================
-- Problem: Fix Names in a Table
--
-- Table: Users
--   - user_id INT       : Primary key
--   - name    VARCHAR   : User's name (contains only lowercase/uppercase letters)
--
-- Requirement:
--   Transform each user's name so that:
--     - The first character is uppercase
--     - The remaining characters are lowercase
--   Return the result ordered by user_id.
--
-- Expected Output:
--   user_id | name
--   --------+-------
--   <int>   | <formatted_name>
--   (Names should follow the capitalization rule above.)
============================================================================

-- Drop the Users table if it already exists
IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL
    DROP TABLE dbo.Users;
GO

-- Create the Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name    VARCHAR(100)
);
GO

-- Insert sample data
INSERT INTO Users (user_id, name) VALUES
(1, 'aLice'),
(2, 'bOB');
GO

-- Verify inserted data
SELECT * FROM Users;
GO

-- =======================
-- Solution Query
-- =======================
/*
Logic:
  - Extract the first letter: UPPER(LEFT(name, 1))
  - Extract the remaining letters: LOWER(SUBSTRING(name, 2, LEN(name) - 1))
  - Combine both using CONCAT()
  - Sort by user_id
*/
SELECT 
    user_id,
    CONCAT(
        UPPER(LEFT(name, 1)), 
        LOWER(SUBSTRING(name, 2, LEN(name) - 1))
    ) AS name
FROM Users
ORDER BY user_id;
GO
