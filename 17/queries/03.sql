-- ==========================================================
-- Task 03 : Customer Information using CTE
-- ==========================================================
-- Create a CTE named CustomerSales to calculate each
-- customer's total spending.
--
-- Join the CTE with the customers table and return
-- customer information together with total spending.
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
    c.first_name AS customer_name,
    c.last_name AS customer_surname,
    c.city,
    cs.total_sales
FROM customers AS c

INNER JOIN CustomerSales AS cs
    ON c.customer_id = cs.customer_id

ORDER BY
    cs.total_sales DESC;

    