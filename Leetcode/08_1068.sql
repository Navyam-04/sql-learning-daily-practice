-- =============================================================================
-- Problem: Report product_name, year, and price for each sale in the Sales table
--
-- Tables:
--   - Sales: Contains sale_id, product_id, year, quantity, and price
--   - Product: Contains product_id and product_name
-- Requirement:
--   - Join Sales and Product on product_id
--   - Return product_name, year, and price
-- =============================================================================

-- ✅ Drop tables if they already exist
IF OBJECT_ID('Sales', 'U') IS NOT NULL
    DROP TABLE Sales;
IF OBJECT_ID('Product', 'U') IS NOT NULL
    DROP TABLE Product;
GO

-- ✅ Create Product table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)
);
GO

-- ✅ Create Sales table
CREATE TABLE Sales (
    sale_id INT,
    product_id INT,
    year INT,
    quantity INT,
    price INT,
    PRIMARY KEY (sale_id, year),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
GO

-- ✅ Insert sample data into Product
INSERT INTO Product (product_id, product_name) VALUES
(100, 'Nokia'),
(200, 'Apple'),
(300, 'Samsung');
GO

-- ✅ Insert sample data into Sales
INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES
(1, 100, 2008, 10, 5000),
(2, 100, 2009, 12, 5000),
(7, 200, 2011, 15, 9000);
GO

-- ✅ Verify inserted data
SELECT * FROM Product;
SELECT * FROM Sales;
GO

-- ===========================
-- ✅ Final Query Solution
-- ===========================

/*
    Join Sales and Product tables using product_id
    Select product_name, year, and price for each sale
*/

SELECT 
    P.product_name,
    S.year,
    S.price
FROM 
    Sales S
LEFT JOIN 
    Product P
    ON S.product_id = P.product_id;
GO
