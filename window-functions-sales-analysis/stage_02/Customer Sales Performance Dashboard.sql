-- ==========================================================
-- FINAL TASK : Customer Sales Performance Dashboard
-- ==========================================================

WITH info AS
(
    SELECT
        c.customer_id,

        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,

        o.order_date,

        o.total_amount

    FROM customers AS c

    INNER JOIN orders AS o
        ON c.customer_id = o.customer_id
),

customer_dashboard AS
(
    SELECT
        customer_id,

        customer_name,

        order_date,

        total_amount,

        ROW_NUMBER() OVER
        (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS purchase_number,

        LAG(total_amount) OVER
        (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS previous_purchase,

        LEAD(total_amount) OVER
        (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS next_purchase,

        SUM(total_amount) OVER
        (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS running_total,

        SUM(total_amount) OVER
        (
            PARTITION BY customer_id
        ) AS total_spent

    FROM info
)

SELECT

    customer_name,

    order_date,

    total_amount,

    purchase_number,

    previous_purchase,

    next_purchase,

    running_total,

    total_spent,

    RANK() OVER
    (
        ORDER BY total_spent DESC
    ) AS spending_rank

FROM customer_dashboard

ORDER BY
    customer_name,
    order_date;