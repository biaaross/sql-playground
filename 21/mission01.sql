DELIMITER //

-- =====================================================
-- Function 1
-- Total Transaction Count
-- =====================================================

CREATE FUNCTION get_total_transaction_count
(
    p_account_id INT
)
RETURNS INT
READS SQL DATA

BEGIN

    DECLARE v_account_count INT;
    DECLARE v_transaction_count INT;

    -- Account validation
    SELECT COUNT(*)
    INTO v_account_count
    FROM accounts
    WHERE account_id = p_account_id;

    IF v_account_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Account Not Found';
    END IF;

    -- Total transaction count
    SELECT COUNT(*)
    INTO v_transaction_count
    FROM transactions
    WHERE sender_account = p_account_id
       OR receiver_account = p_account_id;

    RETURN v_transaction_count;

END //

-- =====================================================
-- Function 2
-- Total Sent Amount
-- =====================================================

CREATE FUNCTION get_total_sent_amount
(
    p_account_id INT
)
RETURNS DECIMAL(12,2)
READS SQL DATA

BEGIN

    DECLARE v_account_count INT;
    DECLARE v_total_sent DECIMAL(12,2);

    -- Account validation
    SELECT COUNT(*)
    INTO v_account_count
    FROM accounts
    WHERE account_id = p_account_id;

    IF v_account_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Account Not Found';
    END IF;

    -- Total sent amount
    SELECT IFNULL(SUM(amount),0)
    INTO v_total_sent
    FROM transactions
    WHERE sender_account = p_account_id;

    RETURN v_total_sent;

END //

-- =====================================================
-- Function 3
-- Total Received Amount
-- =====================================================

CREATE FUNCTION get_total_received_amount
(
    p_account_id INT
)
RETURNS DECIMAL(12,2)
READS SQL DATA

BEGIN

    DECLARE v_account_count INT;
    DECLARE v_total_received DECIMAL(12,2);

    -- Account validation
    SELECT COUNT(*)
    INTO v_account_count
    FROM accounts
    WHERE account_id = p_account_id;

    IF v_account_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Account Not Found';
    END IF;

    -- Total received amount
    SELECT IFNULL(SUM(amount),0)
    INTO v_total_received
    FROM transactions
    WHERE receiver_account = p_account_id;

    RETURN v_total_received;

END //

DELIMITER ;