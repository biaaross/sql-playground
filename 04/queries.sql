/*=========================================================
                    GROUP BY - COUNT()
=========================================================*/

-- 1. Number of books in each category
SELECT
    category,
    COUNT(*) AS total_books
FROM books
GROUP BY category;

-- 2. Number of books published by each publisher
SELECT
    publisher,
    COUNT(*) AS total_books
FROM books
GROUP BY publisher;

-- 3. Number of books in each language
SELECT
    language,
    COUNT(*) AS total_books
FROM books
GROUP BY language;

-- 4. Number of books by publication year
SELECT
    published_year,
    COUNT(*) AS total_books
FROM books
GROUP BY published_year;


/*=========================================================
                    GROUP BY - SUM()
=========================================================*/

-- 5. Total stock by category
SELECT
    category,
    SUM(stock) AS total_stock
FROM books
GROUP BY category;

-- 6. Total price by category
SELECT
    category,
    SUM(price) AS total_price
FROM books
GROUP BY category;

-- 7. Total stock by publisher
SELECT
    publisher,
    SUM(stock) AS total_stock
FROM books
GROUP BY publisher;

-- 8. Total stock by language
SELECT
    language,
    SUM(stock) AS total_stock
FROM books
GROUP BY language;


/*=========================================================
                    GROUP BY - AVG()
=========================================================*/

-- 9. Average price by category
SELECT
    category,
    AVG(price) AS average_price
FROM books
GROUP BY category;

-- 10. Average price by publisher
SELECT
    publisher,
    AVG(price) AS average_price
FROM books
GROUP BY publisher;

-- 11. Average price by language
SELECT
    language,
    AVG(price) AS average_price
FROM books
GROUP BY language;


/*=========================================================
                    GROUP BY - MIN()
=========================================================*/

-- 12. Lowest price in each category
SELECT
    category,
    MIN(price) AS lowest_price
FROM books
GROUP BY category;

-- 13. Lowest price by publisher
SELECT
    publisher,
    MIN(price) AS lowest_price
FROM books
GROUP BY publisher;

-- 14. Lowest price by language
SELECT
    language,
    MIN(price) AS lowest_price
FROM books
GROUP BY language;


/*=========================================================
                    GROUP BY - MAX()
=========================================================*/

-- 15. Highest price in each category
SELECT
    category,
    MAX(price) AS highest_price
FROM books
GROUP BY category;

-- 16. Highest price by publisher
SELECT
    publisher,
    MAX(price) AS highest_price
FROM books
GROUP BY publisher;

-- 17. Highest price by language
SELECT
    language,
    MAX(price) AS highest_price
FROM books
GROUP BY language;


/*=========================================================
                        BONUS
=========================================================*/

-- Complete report by category
SELECT
    category,
    COUNT(*) AS total_books,
    SUM(stock) AS total_stock,
    AVG(price) AS average_price,
    MIN(price) AS lowest_price,
    MAX(price) AS highest_price
FROM books
GROUP BY category;