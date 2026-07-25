-- ==========================================================
-- Task 07 : Monthly Sales Running Total Analysis
-- ==========================================================


WITH monthly_sales AS
(
    SELECT

        DATE_FORMAT(order_date, '%Y-%m') AS month,

        SUM(total_amount) AS monthly_total


    FROM orders


    GROUP BY
        DATE_FORMAT(order_date, '%Y-%m')
)


SELECT

    month,

    monthly_total,


    SUM(monthly_total) OVER
    (
        ORDER BY month ASC
    ) AS running_total


FROM monthly_sales


ORDER BY month ASC;