DELIMITER //

CREATE PROCEDURE add_new_category
(
    IN p_category_name VARCHAR(100)
)
BEGIN

    DECLARE v_message VARCHAR(100);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET v_message = 'Category could not be added.';

        SELECT
            v_message AS Message;
    END;

    INSERT INTO categories
    (
        category_name
    )
    VALUES
    (
        p_category_name
    );

    SET v_message = 'Category added successfully.';

    SELECT
        v_message AS Message;

END //

DELIMITER ;

CALL add_new_category('Gaming');
CALL add_new_category('Electronics');