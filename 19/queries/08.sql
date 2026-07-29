
DELIMITER //

CREATE PROCEDURE customer_purchase_summary
(
    IN p_customer_id INT
)

BEGIN

    DECLARE v_customer_name VARCHAR(100);
    DECLARE v_city VARCHAR(50);
    DECLARE v_total_orders INT;
    DECLARE v_total_spent DECIMAL(10,2);
    DECLARE v_average_order DECIMAL(10,2);

    SELECT
        CONCAT(c.first_name, ' ', c.last_name),
        c.city,
        COUNT(o.order_id),
        SUM(o.total_amount),
        AVG(o.total_amount)

    INTO
        v_customer_name,
        v_city,
        v_total_orders,
        v_total_spent,
        v_average_order

    FROM customers AS c

    INNER JOIN orders AS o
        ON c.customer_id = o.customer_id

    WHERE c.customer_id = p_customer_id

    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name,
        c.city;

    SELECT
        v_customer_name AS customer_name,
        v_city AS city,
        v_total_orders AS total_orders,
        v_total_spent AS total_spent,
        v_average_order AS average_order;

END //

DELIMITER ;

CALL customer_purchase_summary(1);