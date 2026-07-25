-- ==========================================================
-- Task 10 : Customer Purchase Analysis Dashboard
-- ==========================================================

-- ==========================================================
-- Task 10 : Customer Purchase Analysis Dashboard
-- ==========================================================


-- ==========================================================
-- Task 10 : Customer Purchase Analysis Dashboard
-- ==========================================================

WITH customer_orders AS
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

customer_analysis AS
(
    SELECT
        customer_id,
        customer_name,
        order_date,
        total_amount,

        SUM(total_amount) OVER
        (
            PARTITION BY customer_id
        ) AS total_spent,

        LAG(total_amount) OVER
        (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS previous_purchase,

        SUM(total_amount) OVER
        (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS running_total

    FROM customer_orders
)

SELECT

    customer_name,

    order_date,

    total_amount,

    total_spent,

    RANK() OVER
    (
        ORDER BY total_spent DESC
    ) AS spending_rank,

    previous_purchase,

    running_total

FROM customer_analysis

ORDER BY
    customer_name,
    order_date;
