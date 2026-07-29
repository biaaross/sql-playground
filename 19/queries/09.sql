DELIMITER //

CREATE PROCEDURE customer_discount_calculator
(
    IN p_customer_id INT
)

BEGIN

    DECLARE v_customer_name VARCHAR(100);
    DECLARE v_total_spent DECIMAL(10,2);
    DECLARE v_discount_rate DECIMAL(4,2);

    -- Müşteri adı ve toplam harcamayı al
    SELECT
        CONCAT(c.first_name, ' ', c.last_name),
        SUM(o.total_amount)

    INTO
        v_customer_name,
        v_total_spent

    FROM customers AS c

    INNER JOIN orders AS o
        ON c.customer_id = o.customer_id

    WHERE c.customer_id = p_customer_id

    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name;


    -- İndirim oranını belirle
    IF v_total_spent >= 20000 THEN

        SET v_discount_rate = 20;

    ELSEIF v_total_spent >= 10000 THEN

        SET v_discount_rate = 15;

    ELSEIF v_total_spent >= 5000 THEN

        SET v_discount_rate = 10;

    ELSE

        SET v_discount_rate = 0;

    END IF;


    -- Sonucu göster
    SELECT
        v_customer_name AS customer_name,
        v_total_spent AS total_spent,
        CONCAT(v_discount_rate, '%') AS discount_rate;

END //

DELIMITER ;

CALL customer_discount_calculator(1);