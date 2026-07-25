-- ==========================================================
-- Task 05 : Customer Next Purchase Analysis
-- ==========================================================

SELECT 
    c.first_name AS customer_name,
    c.last_name AS customer_surname,
    o.order_date,
    o.total_amount,

    LEAD(o.total_amount) OVER
    (
        PARTITION BY c.customer_id
        ORDER BY o.order_date ASC
    ) AS next_order_amount


FROM customers AS c

INNER JOIN orders AS o
    ON c.customer_id = o.customer_id


ORDER BY 
    c.customer_id,
    o.order_date ASC;