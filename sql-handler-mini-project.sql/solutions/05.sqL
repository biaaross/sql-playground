DELIMITER //

CREATE PROCEDURE update_product_stock
(
    IN p_product_id INT,
    IN p_new_stock INT
)
BEGIN

    DECLARE v_product_name VARCHAR(100);
    DECLARE v_current_stock INT;
    DECLARE v_message VARCHAR(100);

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET v_message = 'Product not found.';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET v_message = 'Stock could not be updated.';

        SELECT
            v_message AS Message;
    END;

    SELECT
        product_name,
        stock
    INTO
        v_product_name,
        v_current_stock
    FROM products
    WHERE product_id = p_product_id;

    IF v_message IS NOT NULL THEN

        SELECT
            v_message AS Message;

    ELSE

        IF p_new_stock < 0 THEN

            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Stock cannot be negative.';

        END IF;

        UPDATE products
        SET stock = p_new_stock
        WHERE product_id = p_product_id;

        SET v_message = 'Stock updated successfully.';

        SELECT
            v_product_name AS Product_Name,
            v_current_stock AS Old_Stock,
            p_new_stock AS New_Stock,
            v_message AS Message;

    END IF;

END //

DELIMITER ;

CALL update_product_stock(1,50);
CALL update_product_stock(999,50);
CALL update_product_stock(1,-10);
