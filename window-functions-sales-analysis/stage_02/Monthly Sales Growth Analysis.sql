-- ==========================================================
-- Task 14 : Monthly Sales Growth Analysis
-- ==========================================================

WITH monthly_sales_report AS
(
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,

        SUM(o.total_amount) AS monthly_sales

    FROM orders AS o

    GROUP BY
        DATE_FORMAT(o.order_date, '%Y-%m')
)

SELECT
    order_month,

    monthly_sales,

    LAG(monthly_sales) OVER
    (
        ORDER BY order_month
    ) AS previous_month_sales,

    monthly_sales -
    LAG(monthly_sales) OVER
    (
        ORDER BY order_month
    ) AS sales_difference,

    ROUND
(
(
    monthly_sales -
    LAG(monthly_sales) OVER(...)
)
/
LAG(monthly_sales) OVER(...)
* 100
,2
) AS growth_percent



FROM monthly_sales_report;