DELIMITER //

CREATE PROCEDURE sp_transfer_money
(
    IN p_sender_account_id INT,
    IN p_receiver_account_id INT,
    IN p_amount DECIMAL(12,2)
)

BEGIN

    /* ===========================
       DECLARE
    ============================ */

    DECLARE v_sender_account_exists BOOLEAN;
    DECLARE v_receiver_account_exists BOOLEAN;

    DECLARE v_sender_balance DECIMAL(12,2);

    DECLARE v_sender_status VARCHAR(20);
    DECLARE v_receiver_status VARCHAR(20);

    DECLARE v_transaction_date DATETIME;

    /* ===========================
       ERROR HANDLER
    ============================ */

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;

        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Money transfer failed. Transaction has been rolled back.';
    END;

    /* ===========================
       START TRANSACTION
    ============================ */

    START TRANSACTION;

    /* ===========================
       ACCOUNT EXIST CHECK
    ============================ */

    SELECT EXISTS
    (
        SELECT 1
        FROM accounts
        WHERE account_id = p_sender_account_id
    )
    INTO v_sender_account_exists;

    SELECT EXISTS
    (
        SELECT 1
        FROM accounts
        WHERE account_id = p_receiver_account_id
    )
    INTO v_receiver_account_exists;

    IF NOT v_sender_account_exists THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Sender account not found.';
    END IF;

    IF NOT v_receiver_account_exists THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Receiver account not found.';
    END IF;

    /* ===========================
       ACCOUNT INFORMATION
    ============================ */

    SELECT
        balance,
        status
    INTO
        v_sender_balance,
        v_sender_status
    FROM accounts
    WHERE account_id = p_sender_account_id;

    SELECT
        status
    INTO
        v_receiver_status
    FROM accounts
    WHERE account_id = p_receiver_account_id;

    /* ===========================
       VALIDATIONS
    ============================ */

    IF p_sender_account_id = p_receiver_account_id THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Sender and receiver accounts cannot be the same.';
    END IF;

    IF p_amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Transfer amount must be greater than zero.';
    END IF;

    IF v_sender_status <> 'Active' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Sender account is not active.';
    END IF;

    IF v_receiver_status <> 'Active' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Receiver account is not active.';
    END IF;

    IF v_sender_balance < p_amount THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insufficient balance.';
    END IF;

    /* ===========================
       UPDATE BALANCES
    ============================ */

    UPDATE accounts
    SET balance = balance - p_amount
    WHERE account_id = p_sender_account_id;

    UPDATE accounts
    SET balance = balance + p_amount
    WHERE account_id = p_receiver_account_id;

    /* ===========================
       TRANSACTION RECORD
    ============================ */

    SET v_transaction_date = NOW();

    INSERT INTO transactions
    (
        sender_id,
        receiver_id,
        amount,
        transaction_date
    )
    VALUES
    (
        p_sender_account_id,
        p_receiver_account_id,
        p_amount,
        v_transaction_date
    );

    /* ===========================
       TRANSACTION SUCCESS
    ============================ */

    COMMIT;

    /* ===========================
       TEST OUTPUT
    ============================ */

    SELECT
        v_sender_account_exists   AS sender_account_exists,
        v_receiver_account_exists AS receiver_account_exists,
        v_sender_balance          AS sender_balance_before_transfer,
        v_sender_status           AS sender_status,
        v_receiver_status         AS receiver_status,
        p_amount                  AS transfer_amount,
        v_transaction_date        AS transaction_date;

END //

DELIMITER ;