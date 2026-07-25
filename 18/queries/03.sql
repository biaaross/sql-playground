-- ==========================================================
-- Task 03 : Find the Most Expensive Product in Each Category
-- ==========================================================
-- Rank products by price within each category.
-- Display only the most expensive product from every category.
-- Include category name, product name and price.
-- ==========================================================

WITH ProductRanking AS
(
    SELECT
        c.category_name,
        p.product_name,
        p.price,

        ROW_NUMBER() OVER
        (
            PARTITION BY c.category_name
            ORDER BY p.price DESC
        ) AS product_rank

    FROM products AS p

    INNER JOIN categories AS c
        ON p.category_id = c.category_id
)

SELECT
    category_name,
    product_name,
    price

FROM ProductRanking

WHERE product_rank = 1

ORDER BY
    category_name ASC;