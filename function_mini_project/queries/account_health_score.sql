DELIMITER //

CREATE FUNCTION get_account_health_score
(
    p_account_id INT
)
RETURNS VARCHAR(300)

BEGIN

    DECLARE v_customer_name VARCHAR(120);

    DECLARE v_balance DECIMAL(12,2);

    DECLARE v_sent DECIMAL(12,2);

    DECLARE v_received DECIMAL(12,2);

    DECLARE v_net DECIMAL(12,2);

    DECLARE v_transactions INT;

    DECLARE v_health VARCHAR(20);

    DECLARE v_message VARCHAR(300);

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET v_customer_name = NULL;

    WITH account_summary AS
    (
        SELECT
            account_id,
            customer_id,
            IFNULL(balance,0) AS balance
        FROM accounts
    ),

    sent_summary AS
    (
        SELECT
            sender_account AS account_id,
            IFNULL(SUM(amount),0) AS sent_amount,
            COUNT(transaction_id) AS transaction_count
        FROM transactions
        GROUP BY sender_account
    ),

    received_summary AS
    (
        SELECT
            receiver_account AS account_id,
            IFNULL(SUM(amount),0) AS received_amount
        FROM transactions
        GROUP BY receiver_account
    )

    SELECT
        CONCAT(c.first_name,' ',c.last_name),

        a.balance,

        IFNULL(s.sent_amount,0),

        IFNULL(r.received_amount,0),

        IFNULL(r.received_amount,0) - IFNULL(s.sent_amount,0),

        IFNULL(s.transaction_count,0)

    INTO
        v_customer_name,
        v_balance,
        v_sent,
        v_received,
        v_net,
        v_transactions

    FROM account_summary AS a

    INNER JOIN customers AS c
        ON a.customer_id = c.customer_id

    LEFT JOIN sent_summary AS s
        ON a.account_id = s.account_id

    LEFT JOIN received_summary AS r
        ON a.account_id = r.account_id

    WHERE a.account_id = p_account_id;

    IF v_customer_name IS NULL THEN

        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Account not found.';

    END IF;

    IF v_balance >= 100000 THEN

        SET v_health = 'EXCELLENT';

    ELSEIF v_balance >= 50000 THEN

        SET v_health = 'GOOD';

    ELSEIF v_balance >= 10000 THEN

        SET v_health = 'NORMAL';

    ELSE

        SET v_health = 'LOW';

    END IF;

    SET v_message = CONCAT(
        v_customer_name,
        ' | Balance: ',
        ROUND(v_balance,2),
        ' | Sent: ',
        ROUND(v_sent,2),
        ' | Received: ',
        ROUND(v_received,2),
        ' | Net: ',
        ROUND(v_net,2),
        ' | Transactions: ',
        v_transactions,
        ' | Health: ',
        v_health
    );

    RETURN v_message;

END //

DELIMITER ;