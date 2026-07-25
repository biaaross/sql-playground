WITH customer_orders AS
(
    SELECT
        c.customer_id,

        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,

        o.order_date,

        DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,

        o.total_amount

    FROM customers AS c

    INNER JOIN orders AS o
        ON c.customer_id = o.customer_id
)

SELECT
        customer_id,

        customer_name,

        order_date,

        order_month,

        total_amount,

        SUM(total_amount) OVER
        (
            PARTITION BY order_month

        ) AS monthly_sales,

        RANK() OVER
        (
            PARTITION BY order_month
            ORDER BY total_amount DESC
        ) AS monthly_rank,

        LAG(total_amount) OVER
        (
            PARTITION BY order_month
            ORDER BY order_date
        ) AS previous_order,

        total_amount -
LAG(total_amount) OVER
(
    PARTITION BY order_month
    ORDER BY order_date
) AS difference

    FROM customer_orders 


    