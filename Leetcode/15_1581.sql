/*
-- Problem: 1581. Customer Who Visited but Did Not Make Any Transactions
-- Platform: LeetCode (SQL 50)
--
-- Description:
--   Find the IDs of customers who visited but did not make any transactions.
--   For each such customer, return the number of visits where no transactions occurred.
--
-- Input Tables:
--   Visits
--   +-------------+---------+
--   | visit_id    | int     | (PK)
--   | customer_id | int     |
--   +-------------+---------+
--
--   Transactions
--   +----------------+---------+
--   | transaction_id | int     | (PK)
--   | visit_id       | int     | (FK to Visits)
--   | amount         | int     |
--   +----------------+---------+
--
-- Output:
--   +-------------+----------------+
--   | customer_id | count_no_trans |
--   +-------------+----------------+
--   Sorted in any order.
--
-- Logic:
--   1. Use LEFT JOIN from Visits to Transactions on visit_id.
--   2. Identify rows where Transactions.transaction_id IS NULL (meaning no transaction happened during that visit).
--   3. Group by customer_id and count such visits.
--
-- Expected Output Example:
--   | customer_id | count_no_trans |
--   | ----------- | -------------- |
--   | 30          | 1              |
--   | 54          | 2              |
--   | 96          | 1              |
*/

-- 1) Drop tables if they exist
IF OBJECT_ID('dbo.Visits', 'U') IS NOT NULL DROP TABLE dbo.Visits;
IF OBJECT_ID('dbo.Transactions', 'U') IS NOT NULL DROP TABLE dbo.Transactions;
GO

-- 2) Create tables
CREATE TABLE dbo.Visits (
    visit_id INT PRIMARY KEY,
    customer_id INT
);

CREATE TABLE dbo.Transactions (
    transaction_id INT PRIMARY KEY,
    visit_id INT,
    amount INT
);
GO

-- 3) Insert sample data (from problem statement)
INSERT INTO dbo.Visits (visit_id, customer_id) VALUES
(1, 23),
(2, 9),
(4, 30),
(5, 54),
(6, 96),
(7, 54),
(8, 54);

INSERT INTO dbo.Transactions (transaction_id, visit_id, amount) VALUES
(2, 5, 310),
(3, 5, 300),
(9, 5, 200),
(12, 1, 910),
(13, 2, 970);
GO

/*
-- Step-by-step solution:
-- 1. Start with all Visits.
-- 2. LEFT JOIN Transactions on visit_id.
-- 3. Filter for rows where transaction_id IS NULL (no transaction recorded).
-- 4. Group by customer_id and COUNT(*) as count_no_trans.
*/

-- 4) Final Query
SELECT 
    V.customer_id,
    COUNT(*) AS count_no_trans
FROM dbo.Visits V
LEFT JOIN dbo.Transactions T
    ON V.visit_id = T.visit_id
WHERE T.transaction_id IS NULL
GROUP BY V.customer_id;
GO
