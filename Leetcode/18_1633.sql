/*
-- Problem: 1633. Percentage of Users Attended a Contest
-- Platform: LeetCode (SQL 50)
--
-- Description:
--   Find the percentage of users who registered in each contest.
--   Round the result to two decimal places.
--   Sort the result by percentage (descending), then by contest_id (ascending).
--
-- Tables:
--
--   Users:
--   +-------------+---------+
--   | Column Name | Type    |
--   +-------------+---------+
--   | user_id     | int     |
--   | user_name   | varchar |
--   +-------------+---------+
--   user_id is the primary key.
--
--   Register:
--   +-------------+---------+
--   | Column Name | Type    |
--   +-------------+---------+
--   | contest_id  | int     |
--   | user_id     | int     |
--   +-------------+---------+
--   (contest_id, user_id) is the primary key.
--
-- Output:
--   +------------+------------+
--   | contest_id | percentage |
--   +------------+------------+
--
-- Formula:
--   percentage = (number of distinct users in contest / total users) * 100
--   Round to 2 decimal places.
--
-- Example:
--   If total users = 3 and 2 users attended contest 215:
--   percentage = (2 / 3) * 100 = 66.67
*/

-- 1) Drop tables if they exist
IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL DROP TABLE dbo.Users;
IF OBJECT_ID('dbo.Register', 'U') IS NOT NULL DROP TABLE dbo.Register;
GO

-- 2) Create tables
CREATE TABLE dbo.Users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50)
);

CREATE TABLE dbo.Register (
    contest_id INT,
    user_id INT,
    CONSTRAINT PK_Register PRIMARY KEY (contest_id, user_id)
);
GO

-- 3) Insert sample data
INSERT INTO dbo.Users (user_id, user_name) VALUES
(6, 'Alice'),
(2, 'Bob'),
(7, 'Alex');

INSERT INTO dbo.Register (contest_id, user_id) VALUES
(215, 6),
(209, 2),
(208, 2),
(210, 6),
(208, 6),
(209, 7),
(209, 6),
(215, 7),
(208, 7),
(210, 2),
(207, 2),
(210, 7);
GO

/*
-- Step-by-step logic:
-- 1. Count total number of users from Users table.
-- 2. For each contest_id in Register, count distinct user_id.
-- 3. Compute percentage = (distinct_users / total_users) * 100.
-- 4. Round to 2 decimal places using ROUND().
-- 5. Sort by percentage DESC, contest_id ASC.
*/

-- 4) Final Query
WITH TotalUsers AS (
    SELECT COUNT(*) AS total_users FROM dbo.Users
)
SELECT
    R.contest_id,
    ROUND(COUNT(DISTINCT R.user_id) * 100.0 / TU.total_users, 2) AS percentage
FROM dbo.Register R
CROSS JOIN TotalUsers TU
GROUP BY R.contest_id, TU.total_users
ORDER BY percentage DESC, R.contest_id ASC;
GO
