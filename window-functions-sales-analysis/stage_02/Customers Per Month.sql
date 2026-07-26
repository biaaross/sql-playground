WITH customer_monthly_sales AS
(
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,

        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,

        SUM(o.total_amount) AS monthly_total

    FROM orders AS o

    INNER JOIN customers AS c
        ON o.customer_id = c.customer_id

    GROUP BY
        DATE_FORMAT(o.order_date, '%Y-%m'),
        c.customer_id,
        c.first_name,
        c.last_name
),

customer_monthly_rank AS
(
    SELECT
        order_month,

        customer_name,

        monthly_total,

        RANK() OVER
        (
            PARTITION BY order_month
            ORDER BY monthly_total DESC
        ) AS monthly_rank

    FROM customer_monthly_sales
)

SELECT
    order_month,

    customer_name,

    monthly_total,

    monthly_rank

FROM customer_monthly_rank

WHERE monthly_rank <= 2;