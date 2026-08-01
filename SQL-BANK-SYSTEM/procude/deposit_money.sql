DELIMITER //

CREATE PROCEDURE deposit_money
(
    IN p_account_id INT,
    IN p_amount DECIMAL(10,2)
)
BEGIN

    DECLARE v_message VARCHAR(100);
    DECLARE v_account_count INT;
    DECLARE v_status VARCHAR(20);

    -- Hata oluşursa işlemi geri al
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;

        SET v_message = 'Deposit Failed';
        SELECT v_message AS message;
    END;

    -- Geçersiz miktar kontrolü
    IF p_amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid Deposit Amount';
    END IF;

    -- Hesap var mı?
    SELECT COUNT(*)
    INTO v_account_count
    FROM accounts AS a
    WHERE a.account_id = p_account_id;

    IF v_account_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Account Not Found';
    END IF;

    -- Hesap durumunu kontrol et
    SELECT a.status
    INTO v_status
    FROM accounts AS a
    WHERE a.account_id = p_account_id;

    IF v_status = 'Blocked' THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Account Is Blocked';

    ELSEIF v_status = 'Closed' THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Account Is Closed';

    END IF;

    START TRANSACTION;

        -- Hesap bakiyesini güncelle
        UPDATE accounts AS a
        SET a.balance = a.balance + p_amount
        WHERE a.account_id = p_account_id;

        -- İşlem kaydı oluştur
        INSERT INTO transactions
        (
            sender_account,
            receiver_account,
            transaction_type,
            amount,
            description
        )
        VALUES
        (
            NULL,
            p_account_id,
            'Deposit',
            p_amount,
            'Cash Deposit'
        );

    COMMIT;

    SET v_message = 'Money Deposited Successfully';
    SELECT v_message AS message;

END //

DELIMITER ;