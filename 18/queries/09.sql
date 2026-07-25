-- ==========================================================
-- Task 09 : Highest Priced Product in Each Category
-- ==========================================================
-- Display every product together with the highest priced
-- product in its category using FIRST_VALUE().
-- ==========================================================

SELECT
    c.category_name,
    p.product_name,
    p.price,

    FIRST_VALUE(p.price) OVER
    (
        PARTITION BY c.category_name
        ORDER BY p.price DESC
    ) AS highest_price_in_category

FROM categories AS c

INNER JOIN products AS p
    ON c.category_id = p.category_id

ORDER BY
    c.category_name,
    p.price DESC;