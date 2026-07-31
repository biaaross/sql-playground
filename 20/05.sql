DELIMITER //

CREATE PROCEDURE money_transfer
(
    IN p_sender_id INT,
    IN p_receiver_id INT,
    IN p_amount DECIMAL(10,2)
)
BEGIN

    --------------------------------------------------
    -- Değişkenler
    --------------------------------------------------
    DECLARE v_sender_balance DECIMAL(10,2);
    DECLARE v_sender_count INT;
    DECLARE v_receiver_count INT;
    DECLARE v_message VARCHAR(100);

    --------------------------------------------------
    -- SQL Hatası
    --------------------------------------------------
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;

        SET v_message = 'Transfer Failed';

        SELECT v_message AS message;
    END;

    --------------------------------------------------
    -- Validation
    --------------------------------------------------
    IF p_amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid Transfer Amount';
    END IF;

    --------------------------------------------------
    -- Gönderen Hesap Kontrolü
    --------------------------------------------------
    SELECT COUNT(*)
    INTO v_sender_count
    FROM accounts
    WHERE account_id = p_sender_id;

    IF v_sender_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Sender Not Found';
    END IF;

    --------------------------------------------------
    -- Alıcı Hesap Kontrolü
    --------------------------------------------------
    SELECT COUNT(*)
    INTO v_receiver_count
    FROM accounts
    WHERE account_id = p_receiver_id;

    IF v_receiver_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Receiver Not Found';
    END IF;

    --------------------------------------------------
    -- Gönderen Bakiyesini Oku
    --------------------------------------------------
    SELECT balance
    INTO v_sender_balance
    FROM accounts
    WHERE account_id = p_sender_id;

    --------------------------------------------------
    -- Bakiye Kontrolü
    --------------------------------------------------
    IF v_sender_balance < p_amount THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient Balance';
    END IF;

    --------------------------------------------------
    -- Transaction Başlat
    --------------------------------------------------
    START TRANSACTION;

    --------------------------------------------------
    -- Gönderen Hesabını Güncelle
    --------------------------------------------------
    UPDATE accounts
    SET balance = balance - p_amount
    WHERE account_id = p_sender_id;

    --------------------------------------------------
    -- Alıcı Hesabını Güncelle
    --------------------------------------------------
    UPDATE accounts
    SET balance = balance + p_amount
    WHERE account_id = p_receiver_id;

    --------------------------------------------------
    -- İşlemi Kaydet
    --------------------------------------------------
    COMMIT;

    --------------------------------------------------
    -- Başarı Mesajı
    --------------------------------------------------
    SET v_message = 'Transfer Completed Successfully';

    SELECT v_message AS message;

END //

DELIMITER ;