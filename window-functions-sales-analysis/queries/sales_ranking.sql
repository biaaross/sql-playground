-- ==========================================================
-- Task 01 : Top 3 Most Expensive Products by Category
-- ==========================================================

WITH ProductPriceRanking AS
(
    SELECT
        c.category_name,
        p.product_name,
        p.price,

        ROW_NUMBER() OVER
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

FROM ProductPriceRanking

WHERE price_rank <= 3

ORDER BY
    category_name ASC,
    price DESC;