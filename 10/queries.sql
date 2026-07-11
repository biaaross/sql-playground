/*
====================================================
SQL SUBQUERY PRACTICE PROJECT
Product Analytics
====================================================

Topics Covered:
- Subqueries
- Aggregate Functions
- AVG()
- MAX()
- WHERE Filtering
- ORDER BY

====================================================
*/


/*
====================================================
Task 1
Products Above Average Price

Objective:
Retrieve all products whose price is higher than
the average product price.

Concepts:
- Subquery
- AVG()
- WHERE
- ORDER BY
====================================================
*/

SELECT *
FROM products
WHERE price >
(
    SELECT AVG(price)
    FROM products
)
ORDER BY price DESC;



/*
====================================================
Task 2
Products Above Average Stock

Objective:
Retrieve all products whose stock quantity is
greater than the average stock level.

Concepts:
- Subquery
- AVG()
- WHERE
- ORDER BY
====================================================
*/

SELECT *
FROM products
WHERE stock >
(
    SELECT AVG(stock)
    FROM products
)
ORDER BY stock DESC;



/*
====================================================
Task 3
Best Selling Product

Objective:
Find the product(s) with the highest sales amount.

Concepts:
- Subquery
- MAX()
- WHERE
- ORDER BY
====================================================
*/

SELECT *
FROM products
WHERE sales =
(
    SELECT MAX(sales)
    FROM products
)
ORDER BY sales DESC;



/*
====================================================
Task 4
High Rated Products Below Average Price

Objective:
Find products that:
- Have a rating greater than or equal to 4.5
- Have a price lower than the average price

Concepts:
- Multiple WHERE conditions
- AND operator
- Subquery
- AVG()
====================================================
*/

SELECT *
FROM products
WHERE rating >= 4.5
AND price <
(
    SELECT AVG(price)
    FROM products
)
ORDER BY rating DESC;



/*
====================================================
Task 5
Best Selling Product From The Latest Year

Objective:
Find the product(s) with the highest sales
among the newest released products.

Concepts:
- Multiple Subqueries
- Nested Subquery
- MAX()
- WHERE filtering
====================================================
*/

SELECT *
FROM products
WHERE release_year =
(
    SELECT MAX(release_year)
    FROM products
)
AND sales =
(
    SELECT MAX(sales)
    FROM products
    WHERE release_year =
    (
        SELECT MAX(release_year)
        FROM products
    )
);
