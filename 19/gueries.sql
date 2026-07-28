DELIMITER //

CREATE PROCEDURE customer_summary
(
    IN p_customer_id INT
)

BEGIN

    DECLARE v_customer_name VARCHAR(100);
    DECLARE v_order_count INT;
    DECLARE v_total_spent DECIMAL(10,2);

    SELECT
        CONCAT(c.first_name,' ',c.last_name),
        COUNT(o.order_id),
        SUM(o.total_amount)
    INTO
        v_customer_name,
        v_order_count,
        v_total_spent
    FROM customers AS c
    INNER JOIN orders AS o
        ON c.customer_id = o.customer_id
    WHERE c.customer_id = p_customer_id
    GROUP BY
        c.customer_id,
        CONCAT(c.first_name,' ',c.last_name);

    SELECT
        v_customer_name AS customer_name,
        v_order_count AS order_count,
        v_total_spent AS total_spent;

END //

DELIMITER ;

CALL customer_summary(3);

    
    
