DELIMITER //

CREATE PROCEDURE transfer_money
(
    IN p_sender_id INT,
    IN p_receiver_id INT,
    IN p_amount DECIMAL(10,2)
)
BEGIN

    ---------------------------------------
    -- Değişkenler
    ---------------------------------------
    DECLARE v_sender_balance DECIMAL(10,2);
    DECLARE v_message VARCHAR(100);

    ---------------------------------------
    -- Handler
    ---------------------------------------
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;

        SET v_message = 'Transaction Failed';

        SELECT v_message AS message;
    END;

    ---------------------------------------
    -- Kontrol 1
    ---------------------------------------
    IF p_amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid Transfer Amount';
    END IF;

    ---------------------------------------
    -- Gönderen bakiyesi
    ---------------------------------------
    SELECT balance
    INTO v_sender_balance
    FROM accounts
    WHERE account_id = p_sender_id;

    ---------------------------------------
    -- Kontrol 2
    ---------------------------------------
    IF v_sender_balance < p_amount THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient Balance';
    END IF;

    ---------------------------------------
    -- Transaction
    ---------------------------------------
    START TRANSACTION;

        UPDATE accounts
        SET balance = balance - p_amount
        WHERE account_id = p_sender_id;

        UPDATE accounts
        SET balance = balance + p_amount
        WHERE account_id = p_receiver_id;

    COMMIT;

    ---------------------------------------
    -- Başarı Mesajı
    ---------------------------------------
    SET v_message = 'Transfer Completed Successfully';

    SELECT v_message AS message;

END //

DELIMITER ;