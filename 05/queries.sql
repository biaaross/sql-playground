/*=========================================================
                GROUP BY + HAVING
=========================================================*/


/*=========================================================
                    COUNT() + HAVING
=========================================================*/

-- 1. Categories with at least 2 books
SELECT
    category,
    COUNT(*) AS total_books
FROM books
GROUP BY category
HAVING COUNT(*) >= 2;

-- 2. Publishers with at least 2 books
SELECT
    publisher,
    COUNT(*) AS total_books
FROM books
GROUP BY publisher
HAVING COUNT(*) >= 2;

-- 3. Languages with at least 5 books
SELECT
    language,
    COUNT(*) AS total_books
FROM books
GROUP BY language
HAVING COUNT(*) >= 5;


/*=========================================================
                    SUM() + HAVING
=========================================================*/

-- 4. Categories with total stock greater than 20
SELECT
    category,
    SUM(stock) AS total_stock
FROM books
GROUP BY category
HAVING SUM(stock) > 20;

-- 5. Publishers with total book price greater than 2000
SELECT
    publisher,
    SUM(price) AS total_price
FROM books
GROUP BY publisher
HAVING SUM(price) > 2000;

-- 6. Languages with total stock greater than 30
SELECT
    language,
    SUM(stock) AS total_stock
FROM books
GROUP BY language
HAVING SUM(stock) > 30;


/*=========================================================
                    AVG() + HAVING
=========================================================*/

-- 7. Categories with average price greater than 1000
SELECT
    category,
    AVG(price) AS average_price
FROM books
GROUP BY category
HAVING AVG(price) > 1000;

-- 8. Publishers with average price greater than 900
SELECT
    publisher,
    AVG(price) AS average_price
FROM books
GROUP BY publisher
HAVING AVG(price) > 900;

-- 9. Languages with average price greater than 700
SELECT
    language,
    AVG(price) AS average_price
FROM books
GROUP BY language
HAVING AVG(price) > 700;


/*=========================================================
                    MIN() + HAVING
=========================================================*/

-- 10. Categories whose lowest price is greater than 500
SELECT
    category,
    MIN(price) AS lowest_price
FROM books
GROUP BY category
HAVING MIN(price) > 500;

-- 11. Publishers whose lowest price is greater than 600
SELECT
    publisher,
    MIN(price) AS lowest_price
FROM books
GROUP BY publisher
HAVING MIN(price) > 600;


/*=========================================================
                    MAX() + HAVING
=========================================================*/

-- 12. Categories whose highest price is greater than 1500
SELECT
    category,
    MAX(price) AS highest_price
FROM books
GROUP BY category
HAVING MAX(price) > 1500;

-- 13. Publishers whose highest price is greater than 1700
SELECT
    publisher,
    MAX(price) AS highest_price
FROM books
GROUP BY publisher
HAVING MAX(price) > 1700;


/*=========================================================
                        BONUS
=========================================================*/

-- Complete category report with HAVING
SELECT
    category,
    COUNT(*) AS total_books,
    SUM(stock) AS total_stock,
    AVG(price) AS average_price,
    MIN(price) AS lowest_price,
    MAX(price) AS highest_price
FROM books
GROUP BY category
HAVING AVG(price) > 800
   AND SUM(stock) > 20;