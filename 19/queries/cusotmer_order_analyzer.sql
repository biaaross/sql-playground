DELIMITER //

CREATE PROCEDURE customer_order_analyzer
(
    IN p_customer_id INT
)

BEGIN

    DECLARE v_customer_name VARCHAR(100);
    DECLARE v_total_orders INT;
    DECLARE v_total_spent DECIMAL(10,2);
    DECLARE v_average_order DECIMAL(10,2);
    DECLARE v_max_order DECIMAL(10,2);
    DECLARE v_min_order DECIMAL(10,2);
    DECLARE v_order_status VARCHAR(20);

    SELECT
        CONCAT(c.first_name,' ',c.last_name),
        COUNT(o.order_id),
        SUM(o.total_amount),
        ROUND(AVG(o.total_amount),2),
        MAX(o.total_amount),
        MIN(o.total_amount)
    INTO
        v_customer_name,
        v_total_orders,
        v_total_spent,
        v_average_order,
        v_max_order,
        v_min_order
    FROM customers AS c
    INNER JOIN orders AS o
        ON c.customer_id = o.customer_id
    WHERE c.customer_id = p_customer_id
    GROUP BY
        c.customer_id,
        CONCAT(c.first_name,' ',c.last_name);

    IF v_total_spent >= 20000 THEN
        SET v_order_status = 'Platinum';

    ELSEIF v_total_spent >= 10000 THEN
        SET v_order_status = 'Gold';

    ELSEIF v_total_spent >= 5000 THEN
        SET v_order_status = 'Silver';

    ELSE
        SET v_order_status = 'Standard';
    END IF;

    SELECT
        v_customer_name AS customer_name,
        v_total_orders AS total_orders,
        v_total_spent AS total_spent,
        v_average_order AS average_order,
        v_max_order AS highest_order,
        v_min_order AS lowest_order,
        v_order_status AS customer_level;

END //

DELIMITER ;

CALL customer_order_analyzer(1);