-- ==========================================================
-- Task 06 : Customer Running Total Analysis
-- ==========================================================

SELECT

    CONCAT(
        c.first_name,
        ' ',
        c.last_name
    ) AS customer_name,

    o.order_date,

    o.total_amount,

    SUM(o.total_amount) OVER
    (
        PARTITION BY c.customer_id
        ORDER BY o.order_date
    ) AS running_total


FROM customers AS c

INNER JOIN orders AS o
    ON c.customer_id = o.customer_id


ORDER BY
    c.customer_id,
    o.order_date ASC;