DELIMITER //

CREATE PROCEDURE get_customer_total_spent
(
    IN p_customer_id INT,
    OUT p_total_spent DECIMAL(10,2)
)

BEGIN

    SELECT
        SUM(total_amount)
    INTO
        p_total_spent
    FROM orders
    WHERE customer_id = p_customer_id;

END //

DELIMITER ;


CALL get_customer_total_spent(1, @total);

SELECT @total;