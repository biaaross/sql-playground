-- ==========================================================
-- Task 10 : Lowest Product Price in Each Category
-- ==========================================================
-- Display every product together with the lowest priced
-- product in its category using LAST_VALUE().
-- ==========================================================

SELECT 
    c.category_name,
    p.product_name,
    p.price,
  LAST_VALUE(p.price) OVER
(
    PARTITION BY c.category_name
    ORDER BY p.price DESC
    ROWS BETWEEN UNBOUNDED PRECEDING
         AND UNBOUNDED FOLLOWING
) AS lowest_price_in_category
FROM categories AS c
INNER JOIN products AS p
    ON c.category_id = p.category_id