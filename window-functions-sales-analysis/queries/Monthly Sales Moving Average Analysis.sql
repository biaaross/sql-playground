-- ==========================================================
-- Task 08 : Monthly Sales Moving Average Analysis
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


    AVG(monthly_total) OVER
    (
        ORDER BY month ASC
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS three_month_average


FROM monthly_sales


ORDER BY month ASC;