/*
-- Problem: 1251. Average Selling Price
-- Platform: LeetCode (SQL 50)
--
-- Description:
--   Find the average selling price for each product. The average price is calculated as:
--       (SUM of price * units sold) / (SUM of units sold)
--   Round the result to 2 decimal places. If a product has no sold units, its average price is 0.
--
-- Input Tables:
--
--   Prices:
--   +------------+------------+------------+--------+
--   | product_id | start_date | end_date   | price  |
--   +------------+------------+------------+--------+
--   (product_id, start_date, end_date) is the primary key.
--   Each row shows the price of a product in a given date range.
--
--   UnitsSold:
--   +------------+---------------+-------+
--   | product_id | purchase_date | units |
--   +------------+---------------+-------+
--   Each row shows a purchase with date, product_id, and number of units sold.
--
-- Output:
--   +------------+---------------+
--   | product_id | average_price |
--   +------------+---------------+
--
-- Logic:
--   1. Join Prices and UnitsSold on product_id where purchase_date falls between start_date and end_date.
--   2. Calculate weighted average: SUM(price * units) / SUM(units).
--   3. Use COALESCE to replace NULL with 0 for products with no sales.
--   4. Round to 2 decimal places.
--
-- Expected Output Example:
--   | product_id | average_price |
--   | ---------- | ------------- |
--   | 1          | 6.96          |
--   | 2          | 16.96         |
*/

-- 1) Drop tables if they exist
IF OBJECT_ID('dbo.Prices', 'U') IS NOT NULL DROP TABLE dbo.Prices;
IF OBJECT_ID('dbo.UnitsSold', 'U') IS NOT NULL DROP TABLE dbo.UnitsSold;
GO

-- 2) Create tables
CREATE TABLE dbo.Prices (
    product_id INT,
    start_date DATE,
    end_date DATE,
    price INT,
    CONSTRAINT PK_Prices PRIMARY KEY (product_id, start_date, end_date)
);

CREATE TABLE dbo.UnitsSold (
    product_id INT,
    purchase_date DATE,
    units INT
);
GO

-- 3) Insert sample data
INSERT INTO dbo.Prices (product_id, start_date, end_date, price) VALUES
(1, '2019-02-17', '2019-02-28', 5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30);

INSERT INTO dbo.UnitsSold (product_id, purchase_date, units) VALUES
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30);
GO

/*
-- Step-by-step solution:
-- 1. LEFT JOIN Prices and UnitsSold on product_id and date range.
-- 2. Compute weighted average price:
--        SUM(price * units) / SUM(units)
-- 3. Use COALESCE for cases where no sales exist (result becomes 0).
-- 4. Round to 2 decimal places using CAST.
*/

-- 4) Final Query
SELECT 
    P.product_id,
    COALESCE(
        CAST(SUM(P.price * U.units) * 1.0 / SUM(U.units) AS DECIMAL(10, 2)),
        0
    ) AS average_price
FROM Prices P
LEFT JOIN UnitsSold U
    ON P.product_id = U.product_id
   AND U.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY P.product_id;
GO
