/*
-- Problem: 197. Rising Temperature
-- Platform: LeetCode (SQL 50)
--
-- Description:
--   Find all dates' IDs where the temperature was higher than the previous day.
--
-- Input Table:
--   Weather
--   +---------+---------+-------+
--   | id      | date    | temp  |
--   +---------+---------+-------+
--   id: int (PK), date: date, temp: int
--
-- Output:
--   +----+
--   | id |
--   +----+
--   Return IDs in any order.
--
-- Logic:
--   1. Compare each day's temperature with the previous day's temperature.
--   2. The previous day means date difference of 1 day.
--   3. Use self join on Weather table.
--
-- Expected Output Example:
--   | id |
--   |----|
--   |  2 |
*/

-- 1) Drop table if exists
IF OBJECT_ID('dbo.Weather', 'U') IS NOT NULL DROP TABLE dbo.Weather;
GO

-- 2) Create table
CREATE TABLE dbo.Weather (
    id INT PRIMARY KEY,
    recordDate DATE,
    temperature INT
);
GO

-- 3) Insert sample data
INSERT INTO dbo.Weather (id, recordDate, temperature) VALUES
(1, '2015-01-01', 10),
(2, '2015-01-02', 25),
(3, '2015-01-03', 20),
(4, '2015-01-04', 30);
GO

/*
-- Step-by-step solution:
-- 1. Self-join Weather table as W1 and W2.
-- 2. Match where W1.recordDate = W2.recordDate + 1 day.
-- 3. Filter where W1.temperature > W2.temperature.
*/

-- 4) Final Query
SELECT W1.id
FROM dbo.Weather W1
JOIN dbo.Weather W2
    ON W1.recordDate = DATEADD(DAY, 1, W2.recordDate)
WHERE W1.temperature > W2.temperature;
GO

  
-- Another way
SELECT id
FROM
(
    SELECT id,
           recordDate,
           temperature,
        LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
        LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date
    FROM Weather
) t
WHERE DATEDIFF(DAY, prev_date, recordDate) = 1
  AND temperature > prev_temp
