-- =====================================================
-- Query 01
-- List all orders with customer, book, author,
-- category, quantity, price, total price and order date.
-- =====================================================

SELECT
    o.order_id,
    c.name AS customer_name,
    b.title AS book_name,
    a.author_name,
    cat.category_name,
    o.quantity,
    b.price,
    (o.quantity * b.price) AS total_price,
    o.order_date
FROM Orders AS o
INNER JOIN Customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN Books AS b
    ON o.book_id = b.book_id
INNER JOIN Authors AS a
    ON b.author_id = a.author_id
INNER JOIN Categories AS cat
    ON b.category_id = cat.category_id;


    -- =====================================================
-- Query 02
-- List all orders placed by customers from Ankara.
-- =====================================================

SELECT
    c.name AS customer_name,
    c.city,
    b.title AS book_name,
    o.quantity,
    o.order_date
FROM Orders AS o
INNER JOIN Customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN Books AS b
    ON o.book_id = b.book_id
WHERE c.city = 'Ankara';


-- =====================================================
-- Query 03
-- Total number of orders for each customer.
-- =====================================================

SELECT
    c.name AS customer_name,
    COUNT(o.order_id) AS total_orders
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.name;


    -- =====================================================
-- Query 04
-- Total number of books purchased by each customer.
-- =====================================================

SELECT
    c.name AS customer_name,
    SUM(o.quantity) AS total_books
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.name;


    -- =====================================================
-- Query 05
-- Find the best-selling book.
-- =====================================================

SELECT
    b.title AS book_name,
    SUM(o.quantity) AS total_sold
FROM Books AS b
INNER JOIN Orders AS o
    ON b.book_id = o.book_id
GROUP BY
    b.book_id,
    b.title
ORDER BY
    total_sold DESC
LIMIT 1;


-- =====================================================
-- Query 06
-- List the number of books in each category.
-- =====================================================

SELECT
    c.category_name,
    COUNT(b.book_id) AS book_count
FROM Categories AS c
LEFT JOIN Books AS b
    ON c.category_id = b.category_id
GROUP BY
    c.category_id,
    c.category_name;


    -- =====================================================
-- Query 07
-- List the number of books written by each author.
-- =====================================================

SELECT
    a.author_name,
    COUNT(b.book_id) AS total_books
FROM Authors AS a
LEFT JOIN Books AS b
    ON a.author_id = b.author_id
GROUP BY
    a.author_id,
    a.author_name;


    -- =====================================================
-- Query 08
-- Calculate the total spending of each customer.
-- =====================================================

SELECT
    c.name AS customer_name,
    SUM(o.quantity * b.price) AS total_spending
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN Books AS b
    ON o.book_id = b.book_id
GROUP BY
    c.customer_id,
    c.name;


    -- =====================================================
-- Query 09
-- List customers who bought books costing more than 500.
-- =====================================================

SELECT DISTINCT
    c.name AS customer_name
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN Books AS b
    ON o.book_id = b.book_id
WHERE b.price > 500;


-- =====================================================
-- Query 10
-- List customers who have never placed an order.
-- =====================================================

SELECT
    c.name AS customer_name
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- =====================================================
-- Query 11
-- List books that have never been sold.
-- =====================================================

SELECT
    b.title AS book_name
FROM Books AS b
LEFT JOIN Orders AS o
    ON b.book_id = o.book_id
WHERE o.order_id IS NULL;


-- =====================================================
-- Query 12
-- List categories that do not contain any books.
-- =====================================================

SELECT
    c.category_name
FROM Categories AS c
LEFT JOIN Books AS b
    ON c.category_id = b.category_id
WHERE b.book_id IS NULL;


-- =====================================================
-- Query 13
-- Find the author of the most expensive book.
-- =====================================================

SELECT
    a.author_name,
    b.title AS book_name,
    b.price
FROM Authors AS a
INNER JOIN Books AS b
    ON a.author_id = b.author_id
ORDER BY
    b.price DESC
LIMIT 1;


-- =====================================================
-- Query 14
-- Find the last order date of each customer.
-- =====================================================

SELECT
    c.name AS customer_name,
    MAX(o.order_date) AS last_order
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.name;


    -- =====================================================
-- Query 15
-- Find the book that generated the highest revenue.
-- =====================================================

SELECT
    b.title AS book_name,
    SUM(o.quantity * b.price) AS revenue
FROM Books AS b
INNER JOIN Orders AS o
    ON b.book_id = o.book_id
GROUP BY
    b.book_id,
    b.title
ORDER BY
    revenue DESC
LIMIT 1;


-- =====================================================
-- Query 16
-- List authors by total sales revenue.
-- =====================================================

SELECT
    a.author_name,
    SUM(o.quantity * b.price) AS revenue
FROM Authors AS a
INNER JOIN Books AS b
    ON a.author_id = b.author_id
INNER JOIN Orders AS o
    ON b.book_id = o.book_id
GROUP BY
    a.author_id,
    a.author_name
ORDER BY
    revenue DESC;


    -- =====================================================
-- Query 17
-- Total number of books sold in each city.
-- =====================================================

SELECT
    c.city,
    SUM(o.quantity) AS books_sold
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.city;


    -- =====================================================
-- Query 18
-- Top 3 customers who bought the most books.
-- =====================================================

SELECT
    c.name AS customer_name,
    SUM(o.quantity) AS total_books
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.name
ORDER BY
    total_books DESC
LIMIT 3;


-- =====================================================
-- Query 19
-- Average book price by category.
-- =====================================================

SELECT
    c.category_name,
    AVG(b.price) AS average_price
FROM Categories AS c
INNER JOIN Books AS b
    ON c.category_id = b.category_id
GROUP BY
    c.category_id,
    c.category_name;


    -- =====================================================
-- Query 20
-- Customer sales report.
-- =====================================================

SELECT
    c.name AS customer_name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity) AS total_books,
    SUM(o.quantity * b.price) AS total_spending,
    MAX(o.order_date) AS last_order
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN Books AS b
    ON o.book_id = b.book_id
GROUP BY
    c.customer_id,
    c.name,
    c.city;