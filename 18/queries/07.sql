-- ==========================================================
-- Task 07 : Compare Products with the Previous Product
-- ==========================================================
-- Display all products ordered by price (highest to lowest).
-- Show the previous product's price using LAG().
-- Also calculate the price difference between the current
-- product and the previous product.
-- ==========================================================

SELECT
    p.product_name,
    p.price,

    LAG(p.price) OVER
    (
        ORDER BY p.price DESC
    ) AS previous_price,

    p.price -
    LAG(p.price) OVER
    (
        ORDER BY p.price DESC
    ) AS price_difference

FROM products AS p

ORDER BY
    p.price DESC;
