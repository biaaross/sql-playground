-- ==========================================================
-- Task 02 : Customer Purchase Ranking
-- ==========================================================

WITH total_spent AS
(
    SELECT
        c.customer_id,
        c.first_name AS customer_name,
        c.last_name AS customer_surname,
        SUM(o.total_amount) AS total

    FROM customers AS c

    INNER JOIN orders AS o
        ON c.customer_id = o.customer_id

    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name
),

customer_rank AS
(
    SELECT
        *,
        DENSE_RANK() OVER
        (
            ORDER BY total DESC
        ) AS spending_rank

    FROM total_spent
)

SELECT
    customer_name,
    customer_surname,
    total,
    spending_rank

FROM customer_rank

WHERE spending_rank <= 2

ORDER BY total DESC;