============================================================================
-- Problem: Find Followers Count
--
-- Table: Followers
--   - user_id     INT  : The ID of the user being followed
--   - follower_id INT  : The ID of the user who follows
-- (user_id, follower_id) is the primary key.
--
-- Requirement:
--   For each user_id, return the number of followers they have.
--   Output columns: user_id, followers_count
--   The result should be ordered by user_id.
--
-- Expected Output Schema:
--   user_id        | followers_count
--  ---------------+----------------
--   <int>          | <int>
--
-- Example:
-- Followers:
-- | user_id | follower_id |
-- | 1       | 3           |
-- | 2       | 1           |
-- | 2       | 3           |
--
-- Output:
-- | user_id | followers_count |
-- | 1       | 1               |
-- | 2       | 2               |
============================================================================

-- Drop table if exists
IF OBJECT_ID('dbo.Followers', 'U') IS NOT NULL
    DROP TABLE dbo.Followers;
GO

-- Create Followers table
CREATE TABLE Followers (
    user_id     INT,
    follower_id INT,
    PRIMARY KEY (user_id, follower_id)
);
GO

-- Insert sample data
INSERT INTO Followers (user_id, follower_id) VALUES
(1, 3),
(2, 1),
(2, 3);
GO

-- =======================
-- Solution Query
-- =======================
/*
  Steps:
    1. Group rows by user_id.
    2. Use COUNT(DISTINCT follower_id) to count unique followers.
    3. Order results by user_id for output consistency.
*/
SELECT
    user_id,
    COUNT(DISTINCT follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;
GO
