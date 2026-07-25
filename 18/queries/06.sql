-- ==========================================================
-- Task 06 : Find the Second Most Expensive Product
-- ==========================================================
-- Find the second most expensive product in each category.
-- Use DENSE_RANK() to rank products by price within each category.
-- Display category name, product name, price and price rank.
-- Return only products with rank = 2.
-- ==========================================================

WITH ProductRanking AS
(
    SELECT
        c.category_name,
        p.product_name,
        p.price,

        DENSE_RANK() OVER
        (
            PARTITION BY c.category_name
            ORDER BY p.price DESC
        ) AS price_rank

    FROM categories AS c

    INNER JOIN products AS p
        ON c.category_id = p.category_id
)

SELECT
    category_name,
    product_name,
    price,
    price_rank

FROM ProductRanking

WHERE price_rank = 2

ORDER BY
    category_name;