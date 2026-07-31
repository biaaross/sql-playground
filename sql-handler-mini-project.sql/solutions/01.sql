DELIMITER //

CREATE PROCEDURE product_search_handler
(
    IN p_product_id INT
)
BEGIN

    DECLARE v_product_name VARCHAR(100);
    DECLARE v_product_price DECIMAL(10,2);
    DECLARE v_product_stock INT;

    DECLARE v_message VARCHAR(100);

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET v_message = 'Product not found.';

    SELECT
        p.product_name,
        p.price,
        p.stock
    INTO
        v_product_name,
        v_product_price,
        v_product_stock
    FROM products AS p
    WHERE p.product_id = p_product_id;

    IF v_message IS NOT NULL THEN

        SELECT
            v_message AS Message;

    ELSE

        SELECT
            v_product_name AS Product_Name,
            v_product_price AS Price,
            v_product_stock AS Stock;

    END IF;

END //

DELIMITER ;

CALL product_search_handler(1);
CALL product_search_handler(999);