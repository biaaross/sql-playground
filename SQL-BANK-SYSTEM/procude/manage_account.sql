DELIMITER //

CREATE PROCEDURE manage_account
(
    IN p_account_id INT,
    IN p_new_status VARCHAR(100)
)
BEGIN

    DECLARE v_account_count INT;
    DECLARE v_account_state VARCHAR(100);
    DECLARE v_message VARCHAR(100);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET v_message = 'Account Update Failed';
        SELECT v_message AS message;
    END;

    -- Hesap var mı?
    SELECT COUNT(*)
    INTO v_account_count
    FROM accounts AS a
    WHERE a.account_id = p_account_id;

    IF v_account_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Account Not Found';
    END IF;

    -- Hesabın mevcut durumunu al
    SELECT a.status
    INTO v_account_state
    FROM accounts AS a
    WHERE a.account_id = p_account_id;

    -- Aynı durumdaysa işlem yapma
    IF v_account_state = p_new_status THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Account Already In This Status';
    END IF;

    START TRANSACTION;

    UPDATE accounts AS a
    SET a.status = p_new_status
    WHERE a.account_id = p_account_id;

    COMMIT;

    SET v_message = 'Account Updated Successfully';
    SELECT v_message AS message;

END //

DELIMITER ;