-- ==========================================================
-- Task 04 : Multiple CTE - Top Customers Report
-- ==========================================================
-- Create two CTEs to calculate customer sales and filter
-- high-value customers.
-- ==========================================================

WITH CustomerSales AS 
(
    SELECT 
        c.customer_id,
        SUM()
)