-- ==========================================================
-- Task 11 : Divide Products into 4 Price Groups
-- ==========================================================
-- Divide all products into 4 price groups using NTILE().
-- ==========================================================

SELECT
    p.product_name,
    c.category_name,
    p.price,

    NTILE(4) OVER
    (
        ORDER BY p.price DESC
    ) AS price_group

FROM products AS p

INNER JOIN categories AS c
    ON p.category_id = c.category_id

ORDER BY
    p.price DESC;