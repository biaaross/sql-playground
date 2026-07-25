-- ==========================================================
-- Task 04 : Rank Products by Price Within Each Category
-- ==========================================================
-- Rank products by price within each category using RANK().
-- Products with the same price should receive the same rank.
-- Display category name, product name, price and rank.
-- Sort the final result by category name and rank.
-- ==========================================================

WITH ProductRanking AS
(
    SELECT
        c.category_name,
        p.product_name,
        p.price,

        RANK() OVER
        (
            PARTITION BY c.category_name
            ORDER BY p.price DESC
        ) AS price_rank

    FROM products AS p

    INNER JOIN categories AS c
        ON p.category_id = c.category_id
)

SELECT
    category_name,
    product_name,
    price,
    price_rank

FROM ProductRanking

ORDER BY
    category_name,
    price_rank;