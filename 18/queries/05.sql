-- ==========================================================
-- Task 05 : Dense Rank Products by Price Within Each Category
-- ==========================================================
-- Rank products by price within each category using DENSE_RANK().
-- Products with the same price should receive the same rank.
-- Unlike RANK(), the next rank should NOT skip any numbers.
-- Display category name, product name, price and dense rank.
-- Sort the final result by category name and dense rank.
-- ==========================================================

-- ==========================================================
-- Task 05 : Dense Rank Products by Price Within Each Category
-- ==========================================================
-- Rank products by price within each category using DENSE_RANK().
-- Products with the same price should receive the same rank.
-- Unlike RANK(), the next rank should NOT skip any numbers.
-- Display category name, product name, price and dense rank.
-- Sort the final result by category name and dense rank.
-- ==========================================================

SELECT
    c.category_name,
    p.product_name,
    p.price,

    DENSE_RANK() OVER
    (
        PARTITION BY c.category_name
        ORDER BY p.price DESC
    ) AS price_rank

FROM products AS p

INNER JOIN categories AS c
    ON p.category_id = c.category_id

ORDER BY
    c.category_name ASC,
    price_rank ASC;