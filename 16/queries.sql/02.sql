-- ==========================================================
-- Task 15 : Customer Spending Report
-- ==========================================================
--
-- Retrieve the following information:
--   • Customer First Name
--   • Customer Last Name
--   • Total Orders
--   • Total Spending
--
-- Requirements:
--   • At least 2 orders per customer
--   • Total Spending > 100,000
--
-- Sort the results by:
--   1. Total Spending (DESC)
--   2. Total Orders (DESC)
-- ==========================================================

SELECT
    c.first_name AS customer_name,
    c.last_name AS customer_surname,
    COUNT(o.order_id) AS total_order,
    SUM(o.total_amount) AS total_price
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    COUNT(o.order_id) >= 2
    AND SUM(o.total_amount) > 100000
ORDER BY
    total_price DESC,
    total_order DESC;



-- ==========================================================
-- Task 16 : Brand Category Performance Report
-- ==========================================================
--
-- Retrieve the following information:
--   • Brand Name
--   • Category Name
--   • Total Products
--   • Average Product Price
--
-- Requirements:
--   • At least 2 products per brand-category group
--   • Average Product Price > 25,000
--
-- Sort the results by:
--   1. Brand Name (ASC)
--   2. Total Products (DESC)
--   3. Average Product Price (DESC)
-- ==========================================================

SELECT
    b.brand_name,
    c.category_name,
    COUNT(p.product_id) AS total_product,
    ROUND(AVG(p.price),2) AS average_price
FROM brands AS b
INNER JOIN products AS p
    ON b.brand_id = p.brand_id
INNER JOIN categories AS c
    ON p.category_id = c.category_id
GROUP BY
    b.brand_id,
    b.brand_name,
    c.category_id,
    c.category_name
HAVING
    COUNT(p.product_id) >= 2
    AND AVG(p.price) > 25000
ORDER BY
    b.brand_name ASC,
    total_product DESC,
    average_price DESC;



-- ==========================================================
-- Task 17 : Customer Brand Purchase Analysis
-- ==========================================================
--
-- Retrieve the following information:
--   • Customer First Name
--   • Customer Last Name
--   • Brand Name
--   • Total Purchased Quantity
--   • Total Spending
--
-- Requirements:
--   • At least 2 purchased products from the same brand
--   • Total Spending > 80,000
--
-- Sort the results by:
--   1. Total Spending (DESC)
--   2. Total Purchased Quantity (DESC)
--   3. Customer First Name (ASC)
-- ==========================================================

SELECT
    c.first_name AS customer_name,
    c.last_name AS customer_surname,
    b.brand_name,
    SUM(oi.quantity) AS total_purchased_quantity,
    SUM(o.total_amount) AS total_spending

FROM customers AS c

INNER JOIN orders AS o
    ON c.customer_id = o.customer_id

INNER JOIN order_items AS oi
    ON o.order_id = oi.order_id

INNER JOIN products AS p
    ON oi.product_id = p.product_id

INNER JOIN brands AS b
    ON p.brand_id = b.brand_id

GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    b.brand_id,
    b.brand_name

HAVING
    SUM(oi.quantity) >= 2
    AND SUM(o.total_amount) > 80000

ORDER BY
    total_spending DESC,
    total_purchased_quantity DESC,
    customer_name ASC;



-- ==========================================================
-- Task 18 : Product Sales Analysis
-- ==========================================================
--
-- Retrieve the following information:
--   • Product Name
--   • Brand Name
--   • Category Name
--   • Total Sales
--   • Product Rating
--
-- Requirements:
--   • Total Sales > 200
--   • Product Rating >= 4.5
--
-- Sort the results by:
--   1. Total Sales (DESC)
--   2. Product Rating (DESC)
--   3. Product Name (ASC)
-- ==========================================================

SELECT
    p.product_name,
    b.brand_name,
    c.category_name,
    p.sales AS total_sales,
    p.rating
FROM products AS p
INNER JOIN brands AS b
    ON p.brand_id = b.brand_id
INNER JOIN categories AS c
    ON p.category_id = c.category_id
WHERE
    p.sales > 200
    AND p.rating >= 4.5
ORDER BY
    p.sales DESC,
    p.rating DESC,
    p.product_name ASC;



-- ==========================================================
-- Task 19 : Brand & Category Performance Report
-- ==========================================================
--
-- Retrieve the following information:
--   • Brand Name
--   • Category Name
--   • Total Products
--   • Total Sales
--   • Average Product Rating
--   • Average Product Price
--
-- Requirements:
--   • At least 3 products per brand-category group
--   • Total Sales > 500
--   • Average Product Rating >= 4.5
--   • Average Product Price > 30,000
--
-- Sort the results by:
--   1. Total Sales (DESC)
--   2. Average Product Rating (DESC)
--   3. Brand Name (ASC)
-- ==========================================================

SELECT
    b.brand_name,
    c.category_name,
    COUNT(p.product_id) AS total_product,
    SUM(p.sales) AS total_sales,
    ROUND(AVG(p.rating),2) AS average_rating,
    ROUND(AVG(p.price),2) AS average_price
FROM brands AS b
INNER JOIN products AS p
    ON b.brand_id = p.brand_id
INNER JOIN categories AS c
    ON p.category_id = c.category_id
GROUP BY
    b.brand_id,
    b.brand_name,
    c.category_id,
    c.category_name
HAVING
    COUNT(p.product_id) >= 3
    AND SUM(p.sales) > 500
    AND AVG(p.rating) >= 4.5
    AND AVG(p.price) > 30000
ORDER BY
    total_sales DESC,
    average_rating DESC,
    b.brand_name ASC;


    -- ==========================================================
-- Task 20 : Customers Without Orders
-- ==========================================================
--
-- Retrieve the following information:
--   • Customer First Name
--   • Customer Last Name
--   • Email
--   • City
--   • Registration Date
--
-- Requirements:
--   • Show only customers who have never placed an order
--
-- Sort the results by:
--   1. Registration Date (DESC)
--   2. City (ASC)
--   3. Customer First Name (ASC)
-- ==========================================================

SELECT
    c.first_name AS customer_name,
    c.last_name AS customer_surname,
    c.email,
    c.city,
    c.register_date
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE
    o.order_id IS NULL
ORDER BY
    c.register_date DESC,
    c.city ASC,
    c.first_name ASC;



    -- ==========================================================
-- Task 21 : Products Without Orders
-- ==========================================================
--
-- Retrieve the following information:
--   • Product Name
--   • Brand Name
--   • Category Name
--   • Price
--   • Stock
--
-- Requirements:
--   • Show only products that have never been ordered
--
-- Sort the results by:
--   1. Stock (DESC)
--   2. Price (DESC)
--   3. Product Name (ASC)
-- ==========================================================

SELECT
    p.product_name,
    b.brand_name,
    c.category_name,
    p.price,
    p.stock
FROM products AS p
LEFT JOIN order_items AS oi
    ON p.product_id = oi.product_id
INNER JOIN brands AS b
    ON p.brand_id = b.brand_id
INNER JOIN categories AS c
    ON p.category_id = c.category_id
WHERE
    oi.product_id IS NULL
ORDER BY
    p.stock DESC,
    p.price DESC,
    p.product_name ASC;



-- ==========================================================
-- Task 22 : Customers Without Orders Report
-- ==========================================================
--
-- Retrieve the following information:
--   • Customer First Name
--   • Customer Last Name
--   • City
--   • Total Orders
--
-- Requirements:
--   • Show only customers who have never placed an order
--
-- Sort the results by:
--   1. City (ASC)
--   2. Customer First Name (ASC)
-- ==========================================================

SELECT
    c.first_name AS customer_name,
    c.last_name AS customer_surname,
    c.city,
    COUNT(o.order_id) AS total_orders
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city
HAVING
    COUNT(o.order_id) = 0
ORDER BY
    c.city ASC,
    c.first_name ASC;