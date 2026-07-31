DELIMITER //

CREATE PROCEDURE add_new_brand
(
    IN p_brand_name VARCHAR(100)
)
BEGIN

    DECLARE v_message VARCHAR(100);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET v_message = 'Brand could not be added.';

        SELECT
            v_message AS Message;
    END;

    INSERT INTO brands
    (
        brand_name
    )
    VALUES
    (
        p_brand_name
    );

    SET v_message = 'Brand added successfully.';

    SELECT
        v_message AS Message;

END //

DELIMITER ;

CALL add_new_brand('Xiaomi');
CALL add_new_brand('Apple');