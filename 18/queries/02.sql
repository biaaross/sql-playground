-- ==========================================================
-- Task 02 : Rank Products Within Each Brand
-- ==========================================================
-- Rank products by price within each brand.
-- The ranking should restart from 1 for every brand.
-- Display the brand name, product name, price and product rank.
-- Sort the final result by brand name and product rank.
-- ==========================================================

SELECT
    b.brand_name,
    p.product_name,
    p.price,

    ROW_NUMBER() OVER
    (
        PARTITION BY b.brand_name
        ORDER BY p.price DESC
    ) AS product_rank

FROM brands AS b

INNER JOIN products AS p
    ON b.brand_id = p.brand_id

ORDER BY
    b.brand_name ASC,
    product_rank ASC;