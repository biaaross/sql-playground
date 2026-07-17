-- ==========================================================
-- Task 25 : Most Expensive Product Analysis
-- ==========================================================
--
-- Retrieve the following information:
--   • Product Name
--   • Brand Name
--   • Category Name
--   • Price
--   • Product Rating
--
-- Requirements:
--   • Show only the most expensive product(s) in the system
--   • If multiple products share the highest price, display all of them
-- ==========================================================

SELECT
    p.product_name,
    b.brand_name,
    c.category_name,
    p.price,
    p.rating
FROM products AS p

INNER JOIN brands AS b
    ON p.brand_id = b.brand_id

INNER JOIN categories AS c
    ON p.category_id = c.category_id

WHERE p.price =
(
    SELECT MAX(price)
    FROM products
);



-- ==========================================================
-- Task 26 : Products Above Average Price
-- ==========================================================
--
-- Retrieve the following information:
--   • Product Name
--   • Brand Name
--   • Category Name
--   • Price
--   • Product Rating
--
-- Requirements:
--   • Show only products with a price above the average product price
--
-- Sort the results by:
--   1. Price (DESC)
--   2. Product Rating (DESC)
-- ==========================================================

SELECT
    p.product_name,
    b.brand_name,
    c.category_name,
    p.price,
    p.rating
FROM products AS p

INNER JOIN brands AS b
    ON p.brand_id = b.brand_id

INNER JOIN categories AS c
    ON p.category_id = c.category_id

WHERE p.price >
(
    SELECT AVG(price)
    FROM products
)

ORDER BY
    p.price DESC,
    p.rating DESC;



-- ==========================================================
-- Task 28 : Customers Who Spent Above Average
-- ==========================================================
--
-- Retrieve the following information:
--   • Customer First Name
--   • Customer Last Name
--   • Total Spending
--
-- Requirements:
--   • Show only customers whose total spending is above the average customer spending
--
-- Sort the results by:
--   1. Total Spending (DESC)
--   2. Customer First Name (ASC)
-- ==========================================================

SELECT
    c.first_name AS customer_name,
    c.last_name AS customer_surname,
    SUM(o.total_amount) AS total_price
FROM customers AS c

INNER JOIN orders AS o
    ON c.customer_id = o.customer_id

GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name

HAVING
SUM(o.total_amount) >
(
    SELECT AVG(total_spending)
    FROM
    (
        SELECT
            customer_id,
            SUM(total_amount) AS total_spending
        FROM orders
        GROUP BY customer_id
    ) AS customer_totals
)

ORDER BY
    total_price DESC,
    c.first_name ASC;



    -- ==========================================================
-- Task 29 : Brands Above Average Sales
-- ==========================================================
--
-- Retrieve the following information:
--   • Brand Name
--   • Total Products
--   • Total Sales
--
-- Requirements:
--   • Show only brands whose total sales are above the average total sales of all brands
--
-- Sort the results by:
--   1. Total Sales (DESC)
--   2. Brand Name (ASC)
-- ==========================================================

SELECT
    b.brand_name,
    COUNT(p.product_id) AS total_product,
    SUM(p.sales) AS total_sales
FROM brands AS b

INNER JOIN products AS p
    ON b.brand_id = p.brand_id

GROUP BY
    b.brand_id,
    b.brand_name

HAVING
    SUM(p.sales) >
    (
        SELECT AVG(total_sales)
        FROM
        (
            SELECT
                brand_id,
                SUM(sales) AS total_sales
            FROM products
            GROUP BY brand_id
        ) AS brand_totals
    )

ORDER BY
    total_sales DESC,
    b.brand_name ASC;



    -- ==========================================================
-- Task 30 : Customers Who Bought the Most Expensive Product
-- ==========================================================
--
-- Retrieve the following information:
--   • Customer First Name
--   • Customer Last Name
--   • Product Name
--   • Product Price
--   • Order Date
--
-- Requirements:
--   • Show only customers who purchased the most expensive product(s)
--   • If multiple customers bought the same most expensive product, display all of them
--
-- Sort the results by:
--   1. Order Date (DESC)
--   2. Customer First Name (ASC)
-- ==========================================================

SELECT
    c.first_name AS customer_name,
    c.last_name AS customer_surname,
    p.product_name,
    p.price,
    o.order_date
FROM customers AS c

INNER JOIN orders AS o
    ON c.customer_id = o.customer_id

INNER JOIN order_items AS oi
    ON o.order_id = oi.order_id

INNER JOIN products AS p
    ON oi.product_id = p.product_id

WHERE p.price =
(
    SELECT MAX(price)
    FROM products
)

ORDER BY
    o.order_date DESC,
    c.first_name ASC;



    -- ==========================================================
-- Task 31 : Customers Who Purchased Apple Products
-- ==========================================================
--
-- Retrieve the following information:
--   • Customer First Name
--   • Customer Last Name
--   • Email
--
-- Requirements:
--   • Show customers who purchased at least one Apple product
--   • Display each customer only once
--
-- Sort the results by:
--   1. Customer First Name (ASC)
-- ==========================================================

SELECT DISTINCT
    c.first_name AS customer_name,
    c.last_name AS customer_surname,
    c.email
FROM customers AS c

WHERE c.customer_id IN
(
    SELECT o.customer_id
    FROM orders AS o

    INNER JOIN order_items AS oi
        ON o.order_id = oi.order_id

    INNER JOIN products AS p
        ON oi.product_id = p.product_id

    INNER JOIN brands AS b
        ON p.brand_id = b.brand_id

    WHERE b.brand_name = 'Apple'
)

ORDER BY
    c.first_name ASC;



    -- ==========================================================
-- Task 32 : Products Ordered by Customers from Istanbul
-- ==========================================================
--
-- Retrieve the following information:
--   • Product Name
--   • Brand Name
--   • Category Name
--   • Price
--
-- Requirements:
--   • Show only products purchased by customers living in Istanbul
--   • Display each product only once
--
-- Sort the results by:
--   1. Product Name (ASC)
-- ==========================================================

SELECT DISTINCT
    p.product_name,
    b.brand_name,
    c2.category_name,
    p.price
FROM products AS p

INNER JOIN brands AS b
    ON p.brand_id = b.brand_id

INNER JOIN categories AS c2
    ON p.category_id = c2.category_id

WHERE p.product_id IN
(
    SELECT
        p.product_id
    FROM products AS p

    INNER JOIN order_items AS oi
        ON p.product_id = oi.product_id

    INNER JOIN orders AS o
        ON oi.order_id = o.order_id

    INNER JOIN customers AS c
        ON o.customer_id = c.customer_id

    WHERE c.city = 'Istanbul'
)

ORDER BY
    p.product_name ASC;



    -- ==========================================================
-- Task 33 : Customers Who Have Placed Orders
-- ==========================================================
--
-- Retrieve the following information:
--   • Customer First Name
--   • Customer Last Name
--   • Email
--   • City
--
-- Requirements:
--   • Show only customers who have placed at least one order
--   • Use EXISTS
--
-- Sort the results by:
--   1. Customer First Name (ASC)
--   2. Customer Last Name (ASC)
-- ==========================================================

SELECT
    c.first_name AS customer_name,
    c.last_name AS customer_surname,
    c.email,
    c.city
FROM customers AS c

WHERE EXISTS
(
    SELECT 1
    FROM orders AS o
    WHERE o.customer_id = c.customer_id
)

ORDER BY
    c.first_name ASC,
    c.last_name ASC;



    -- ==========================================================
-- Task 34 : Products That Have Been Ordered
-- ==========================================================
--
-- Retrieve the following information:
--   • Product Name
--   • Brand Name
--   • Category Name
--   • Price
--
-- Requirements:
--   • Show only products that have been ordered at least once
--   • Use EXISTS
--
-- Sort the results by:
--   1. Product Name (ASC)
-- ==========================================================

SELECT
    p.product_name,
    b.brand_name,
    c.category_name,
    p.price
FROM products AS p

INNER JOIN brands AS b
    ON p.brand_id = b.brand_id

INNER JOIN categories AS c
    ON p.category_id = c.category_id

WHERE EXISTS
(
    SELECT 1
    FROM order_items AS oi
    WHERE oi.product_id = p.product_id
)

ORDER BY
    p.product_name ASC;



    -- ==========================================================
-- Task 35 : Customers Who Have Never Placed an Order
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
--   • Use NOT EXISTS
--
-- Sort the results by:
--   1. Registration Date (DESC)
--   2. Customer First Name (ASC)
-- ==========================================================

SELECT
    c.first_name AS customer_name,
    c.last_name AS customer_surname,
    c.email,
    c.city,
    c.register_date
FROM customers AS c

WHERE NOT EXISTS
(
    SELECT 1 
    FROM orders AS o
    WHERE c.customer_id = o.customer_id
)

ORDER BY
    c.register_date DESC,
    c.first_name ASC;