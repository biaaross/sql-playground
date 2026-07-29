DELIMITER //

CREATE PROCEDURE product_price_updater
(
    IN p_product_id INT,
    IN p_increase_percent DECIMAL(10,2)
)

BEGIN

    DECLARE v_product_name VARCHAR(100);
    DECLARE v_old_price DECIMAL(10,2);
    DECLARE v_new_price DECIMAL(10,2);

    SELECT
        product_name,
        price
    INTO
        v_product_name,
        v_old_price
    FROM products
    WHERE product_id = p_product_id;

    SET v_new_price = v_old_price + (v_old_price * p_increase_percent / 100);

    UPDATE products
    SET
        price = v_new_price
    WHERE
        product_id = p_product_id;

    SELECT
        v_product_name AS product_name,
        v_old_price AS old_price,
        p_increase_percent AS increase_percent,
        v_new_price AS new_price;

END //

DELIMITER ;

CALL product_price_updater(1,20);