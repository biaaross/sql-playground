DELIMITER //

CREATE PROCEDURE add_new_product
(
    IN p_product_name VARCHAR(100),
    IN p_category_id INT,
    IN p_price DECIMAL(10,2),
    IN p_stock INT
)
BEGIN

    DECLARE v_message VARCHAR(100);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN

        SET v_message = 'Product could not be added.';

        SELECT
            v_message AS Message;

    END;


    INSERT INTO products
    (
        product_name,
        category_id,
        price,
        stock
    )
    VALUES
    (
        p_product_name,
        p_category_id,
        p_price,
        p_stock
    );


    SET v_message = 'Product added successfully.';

    SELECT
        v_message AS Message;

END //

DELIMITER ;


CALL add_new_product(
    'Keyboard',
    1,
    1500,
    20
);


CALL add_new_product(
    'Keyboard',
    999,
    1500,
    20
);