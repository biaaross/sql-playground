-- ==========================================================
-- Task 01 : Customer Sales Report using CTE
-- ==========================================================
-- Create a CTE named CustomerSales to calculate each
-- customer's total spending.
--
-- Return:
-- • customer_id
-- • total_sales
--
-- Sort by total_sales DESC.
-- ==========================================================

WITH CustomerSales AS
(
    SELECT
        customer_id,
        SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT
    customer_id,
    total_sales
FROM CustomerSales

ORDER BY
    total_sales DESC;