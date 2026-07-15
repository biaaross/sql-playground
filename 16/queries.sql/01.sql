-- ==========================================================
-- Task 1 : Premium Product Analysis
-- ==========================================================
--
-- Retrieve the following information from the products table:
--   • Product Name
--   • Price
--   • Stock
--   • Rating
--   • Sales
--
-- Requirements:
--   • Released in 2024 or later
--   • Rating >= 4.8
--   • Price > 40,000
--
-- Sort the results by:
--   1. Rating (DESC)
--   2. Sales (DESC)
--   3. Price (DESC)
-- ==========================================================



SELECT
    p.product_name,
    p.price,
    p.stock,
    p.rating,
    p.sales
FROM products AS p
WHERE
    p.release_year >= 2024
    AND p.rating >= 4.8
    AND p.price > 40000
ORDER BY
    p.rating DESC,
    p.sales DESC,
    p.price DESC;



-- ==========================================================
-- Task 2 : Low Stock High Demand Products
-- ==========================================================
--
-- Retrieve the following information from the products table:
--   • Product Name
--   • Price
--   • Stock
--   • Sales
--   • Release Year
--
-- Requirements:
--   • Stock <= 15
--   • Sales > 100
--   • Price >= 50,000
--
-- Sort the results by:
--   1. Stock (ASC)
--   2. Sales (DESC)
-- ==========================================================

SELECT
    p.product_name,
    p.price,
    p.stock,
    p.sales,
    p.release_year
FROM products AS p
WHERE
    p.stock <= 15
    AND p.sales > 100
    AND p.price >= 50000
ORDER BY
    p.stock ASC,
    p.sales DESC;



-- ==========================================================
-- Task 4 : Products by Price Range
-- ==========================================================
--
-- Retrieve the following information from the products table:
--   • Product Name
--   • Price
--   • Release Year
--   • Rating
--
-- Requirements:
--   • Price BETWEEN 20,000 AND 60,000
--   • Release Year IN (2024, 2025)
--
-- Sort the results by:
--   1. Release Year (DESC)
--   2. Price (DESC)
-- ==========================================================

SELECT
    p.product_name,
    p.price,
    p.release_year,
    p.rating
FROM products AS p
WHERE
    p.price BETWEEN 20000 AND 60000
    AND p.release_year IN (2024, 2025)
ORDER BY
    p.release_year DESC,
    p.price DESC;



-- ==========================================================
-- Task 5 : Brand Product Analysis
-- ==========================================================
--
-- Retrieve the following information from the products table:
--   • Product Name
--   • Brand ID
--   • Price
--   • Rating
--   • Sales
--
-- Requirements:
--   • Brand ID IN (1, 2)
--   • Sales > 150
--
-- Sort the results by:
--   1. Brand ID (ASC)
--   2. Sales (DESC)
--   3. Rating (DESC)
-- ==========================================================

SELECT
    p.product_name,
    p.brand_id,
    p.price,
    p.rating,
    p.sales
FROM products AS p
WHERE
    p.brand_id IN (1, 2)
    AND p.sales > 150
ORDER BY
    p.brand_id ASC,
    p.sales DESC,
    p.rating DESC;


SELECT
    COUNT(p.product_id) AS total_product,
    AVG(p.price),
    MAX(p.price),
    MIN(p.price),
    SUM(p.sales)
FROM products AS p
WHERE
    p.brand_id IN (1, 2)
    AND p.sales > 150
ORDER BY
    p.brand_id ASC,
    p.sales DESC,
    p.rating DESC;



-- ==========================================================
-- Task 8 : Brand Product Statistics
-- ==========================================================
--
-- Retrieve the following information from the products table:
--   • Brand ID
--   • Total Products
--   • Average Product Price
--
-- Requirements:
--   • Display each brand only once
--   • Sort by Average Product Price (DESC)
-- ==========================================================

SELECT
    p.brand_id,
    COUNT(p.product_id) AS total_products,
    AVG(p.price) AS average_price
FROM products AS p
GROUP BY
    p.brand_id
ORDER BY
    average_price DESC;



-- ==========================================================
-- Task 9 : Premium Brand Analysis
-- ==========================================================
--
-- Retrieve the following information:
--   • Brand ID
--   • Total Products
--   • Average Product Price
--   • Total Sales
--
-- Requirements:
--   • At least 2 products per brand
--   • Average Price > 40,000
--
-- Sort by:
--   1. Average Price (DESC)
--   2. Total Sales (DESC)
-- ==========================================================

SELECT
    p.brand_id,
    COUNT(p.product_id) AS total_products,
    AVG(p.price) AS average_price,
    SUM(p.sales) AS total_sales
FROM products AS p
GROUP BY
    p.brand_id
HAVING
    COUNT(p.product_id) >= 2
    AND AVG(p.price) > 40000
ORDER BY
    average_price DESC,
    total_sales DESC;



-- ==========================================================
-- Task 10 : Category Performance Report
-- ==========================================================
--
-- Retrieve the following information from the products table:
--   • Category ID
--   • Total Products
--   • Total Sales
--   • Average Rating
--
-- Requirements:
--   • At least 3 products per category
--   • Average Rating >= 4.5
--
-- Sort the results by:
--   1. Total Sales (DESC)
--   2. Average Rating (DESC)
-- ==========================================================

SELECT
    p.product_name,
    b.brand_name,
    p.price,
    p.rating,
    p.sales
FROM products AS p
INNER JOIN brands AS b
    ON p.brand_id = b.brand_id
WHERE
    p.price > 30000
    AND p.rating >= 4.5
    AND p.sales > 100
ORDER BY
    b.brand_name ASC,
    p.sales DESC,
    p.price DESC;



-- ==========================================================
-- Task 12 : Low Stock Product Report
-- ==========================================================
--
-- Retrieve the following information:
--   • Product Name
--   • Brand ID
--   • Category ID
--   • Price
--   • Stock
--
-- Requirements:
--   • Stock <= 15
--   • Price > 20,000
--
-- Sort the results by:
--   1. Stock (ASC)
--   2. Price (DESC)
-- ==========================================================

SELECT
    p.product_name,
    p.brand_id,
    p.category_id,
    p.price,
    p.stock
FROM products AS p
WHERE
    p.stock <= 15
    AND p.price > 20000
ORDER BY
    p.stock ASC,
    p.price DESC;
    


-- ==========================================================
-- Task 13 : Category Performance Analysis
-- ==========================================================
--
-- Retrieve the following information:
--   • Category Name
--   • Total Products
--   • Average Product Price
--   • Total Sales
--
-- Requirements:
--   • At least 2 products per category
--   • Average Product Price > 30,000
--
-- Sort the results by:
--   1. Total Sales (DESC)
--   2. Average Product Price (DESC)
-- ==========================================================
 
SELECT
    c.category_name,
    COUNT(p.product_id) AS total_products,
    ROUND(AVG(p.price),2) AS average_price,
    SUM(p.sales) AS total_sales
FROM products AS p
INNER JOIN categories AS c
    ON p.category_id = c.category_id
GROUP BY
    c.category_name
HAVING
    COUNT(p.product_id) >= 2
    AND AVG(p.price) > 30000
ORDER BY
    total_sales DESC,
    average_price DESC;



-- ==========================================================
-- Task 14 : Brand Sales Performance Report
-- ==========================================================
--
-- Retrieve the following information:
--   • Brand Name
--   • Total Products
--   • Average Product Price
--   • Total Sales
--
-- Requirements:
--   • At least 3 products per brand
--   • Average Product Price > 40,000
--   • Total Sales > 500
--
-- Sort the results by:
--   1. Total Sales (DESC)
--   2. Average Product Price (DESC)
-- ==========================================================

SELECT
    b.brand_name,
    COUNT(p.product_id) AS total_products,
    ROUND(AVG(p.price),2) AS average_price,
    SUM(p.sales) AS total_sales
FROM brands AS b
INNER JOIN products AS p
    ON b.brand_id = p.brand_id
GROUP BY
    b.brand_id,
    b.brand_name
HAVING
    COUNT(p.product_id) >= 3
    AND AVG(p.price) > 40000
    AND SUM(p.sales) > 500
ORDER BY
    total_sales DESC,
    average_price DESC;