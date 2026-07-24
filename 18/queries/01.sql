
-- ==========================================================
-- Task 01 : Rank Products by Price
-- ==========================================================
-- List all products from the highest price to the lowest price.
-- Assign a unique ranking number to each product using ROW_NUMBER().
-- Include brand and category information in the result.
-- ==========================================================

SELECT
    p.product_id,
    p.product_name,
    b.brand_name,
    c.category_name,
    p.price,

    ROW_NUMBER() OVER
    (
        ORDER BY p.price DESC
    ) AS product_rank

FROM products AS p

INNER JOIN brands AS b
    ON p.brand_id = b.brand_id

INNER JOIN categories AS c
    ON p.category_id = c.category_id

ORDER BY
    p.price DESC;
