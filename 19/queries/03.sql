DELIMITER //

CREATE PROCEDURE calculate_discount
(
    IN p_order_id INT
)

BEGIN

    DECLARE v_customer_name VARCHAR(100);
    DECLARE v_total_amount DECIMAL(10,2);
    DECLARE v_discount_rate DECIMAL(5,2);
    DECLARE v_discount_amount DECIMAL(10,2);
    DECLARE v_final_amount DECIMAL(10,2);

    -- Müşteri adı ve sipariş tutarını al
    SELECT
        CONCAT(c.first_name,' ',c.last_name),
        o.total_amount
    INTO
        v_customer_name,
        v_total_amount
    FROM customers AS c
    INNER JOIN orders AS o
        ON c.customer_id = o.customer_id
    WHERE o.order_id = p_order_id;

    -- İndirim oranını belirle
    IF v_total_amount < 1000 THEN

        SET v_discount_rate = 0;

    ELSEIF v_total_amount < 3000 THEN

        SET v_discount_rate = 5;

    ELSEIF v_total_amount < 5000 THEN

        SET v_discount_rate = 10;

    ELSE

        SET v_discount_rate = 15;

    END IF;

    -- İndirim tutarını hesapla
    SET v_discount_amount = v_total_amount * v_discount_rate / 100;

    -- Son ödenecek tutarı hesapla
    SET v_final_amount = v_total_amount - v_discount_amount;

    -- Sonucu göster
    SELECT
        v_customer_name AS customer_name,
        v_total_amount AS total_amount,
        CONCAT(v_discount_rate, '%') AS discount_rate,
        v_discount_amount AS discount_amount,
        v_final_amount AS final_amount;

END //

DELIMITER ;

CALL calculate_discount(1);