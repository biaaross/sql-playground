DELIMITER //

CREATE FUNCTION get_customer_total_balance
(
    p_customer_id INT
)
RETURNS DECIMAL(12,2)
READS SQL DATA

BEGIN

    DECLARE v_customer_count INT;
    DECLARE v_total_balance DECIMAL(12,2);

    -- Müşteri var mı?
    SELECT COUNT(*)
    INTO v_customer_count
    FROM customers
    WHERE customer_id = p_customer_id;

    IF v_customer_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer Not Found';
    END IF;

    -- Toplam bakiyeyi hesapla
    SELECT IFNULL(SUM(balance), 0)
    INTO v_total_balance
    FROM accounts
    WHERE customer_id = p_customer_id;

    RETURN v_total_balance;

END //

DELIMITER ;