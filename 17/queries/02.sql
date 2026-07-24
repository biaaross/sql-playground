-- ==========================================================
-- Task 02 : High Value Customers using CTE
-- ==========================================================
-- Create a CTE named CustomerSales to calculate each
-- customer's total spending.
--
-- Return only customers whose total spending is greater
-- than 10000.
-- ==========================================================

WITH CustomerSales AS 
(
    SELECT 
        customer_id,
        SUM(total_amount) AS total_sales
    FROM orders AS o
)

SELECT 
        customer_id,
        SUM(total_amount) AS total_sales
    FROM CustomerSales AS c

WHERE SUM(total_amount) > 10000
GROUP BY
    customer_id

ORDER BY total_sales DESC