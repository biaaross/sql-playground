DELIMITER //

CREATE PROCEDURE update_product_price
(
    IN p_product_id INT,
    IN p_new_price DECIMAL(10,2)
)
BEGIN

    DECLARE v_message VARCHAR(100);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET v_message = 'Price could not be updated.';

        SELECT
            v_message AS Message;
    END;

    IF p_new_price <= 0 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Price cannot be zero or negative.';

    END IF;

    UPDATE products
    SET
        price = p_new_price
    WHERE
        product_id = p_product_id;

    SET v_message = 'Price updated successfully.';

    SELECT
        v_message AS Message;

END //

DELIMITER ;

CALL update_product_price(1, 45000);
CALL update_product_price(1, -500);