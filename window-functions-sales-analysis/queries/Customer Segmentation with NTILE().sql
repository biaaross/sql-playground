-- ==========================================================
-- Task 09 : Customer Segmentation with NTILE()
-- ==========================================================


WITH customer_spending AS
(
    SELECT

        c.customer_id,

        CONCAT(
            c.first_name,
            ' ',
            c.last_name
        ) AS customer_name,


        SUM(o.total_amount) AS total_spent


    FROM customers AS c

    INNER JOIN orders AS o
        ON c.customer_id = o.customer_id


    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name
)


SELECT

    customer_name,

    total_spent,


    NTILE(4) OVER
    (
        ORDER BY total_spent DESC
    ) AS customer_segment


FROM customer_spending


ORDER BY
    total_spent DESC;