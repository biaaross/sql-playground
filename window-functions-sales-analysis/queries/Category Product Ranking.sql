-- ==========================================================
-- Task 03 : Category Product Ranking
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


FROM categories AS c

INNER JOIN products AS p
    ON c.category_id = p.category_id


ORDER BY
    c.category_name,
    price_rank;