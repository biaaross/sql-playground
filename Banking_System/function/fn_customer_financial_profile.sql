DELIMITER //
CREATE FUNCTION fn_customer_financial_profile
(
    p_customer_id INT
)
RETURNS VARCHAR(500)

NOT DETERMINISTIC
READS SQL DATA

BEGIN

DECLARE v_customer_name VARCHAR(120);

DECLARE v_account_count INT;
DECLARE v_total_balance DECIMAL(12,2);

DECLARE v_active_loan_count INT;
DECLARE v_total_active_loan_amount DECIMAL(12,2);

DECLARE v_total_card_count INT;
DECLARE v_active_card_count INT;

DECLARE v_total_transaction_count INT;

DECLARE v_financial_score VARCHAR(20);

DECLARE v_result_message VARCHAR(500);

DECLARE CONTINUE HANDLER FOR NOT FOUND
SET v_customer_name = NULL;

WITH account_summary AS
(
    SELECT
        customer_id,
        COUNT(account_id) AS account_count,
        IFNULL(SUM(balance),0) AS total_balance
    FROM accounts
    GROUP BY customer_id
),

loan_summary AS
(
    SELECT
        customer_id,

        COUNT(
            CASE
                WHEN status = 'Active' THEN loan_id
            END
        ) AS active_loan_count,

        IFNULL(
            SUM(
                CASE
                    WHEN status = 'Active' THEN amount
                    ELSE 0
                END
            ),
            0
        ) AS total_active_loan_amount

    FROM loans
    GROUP BY customer_id
),

card_summary AS
(
    SELECT
        a.customer_id,

        COUNT(c.card_id) AS total_card_count,

        COUNT(
            CASE
                WHEN c.status = 'Active' THEN c.card_id
            END
        ) AS active_card_count

    FROM accounts AS a

    LEFT JOIN cards AS c
        ON a.account_id = c.account_id

    GROUP BY a.customer_id
),

transaction_summary AS
(
    SELECT
        customer_id,
        SUM(total_transaction_count) AS total_transaction_count

    FROM
    (
        SELECT
            sender_id AS customer_id,
            COUNT(*) AS total_transaction_count
        FROM transactions
        GROUP BY sender_id


        UNION ALL


        SELECT
            receiver_id AS customer_id,
            COUNT(*) AS total_transaction_count
        FROM transactions
        GROUP BY receiver_id

    ) x

    GROUP BY customer_id
)

SELECT

    CONCAT(c.first_name,' ',c.last_name),

    IFNULL(acc.account_count,0),

    IFNULL(acc.total_balance,0),

    IFNULL(l.active_loan_count,0),

    IFNULL(l.total_active_loan_amount,0),

    IFNULL(cd.total_card_count,0),

    IFNULL(cd.active_card_count,0),

    IFNULL(ts.total_transaction_count,0)

INTO

    v_customer_name,

    v_account_count,

    v_total_balance,

    v_active_loan_count,

    v_total_active_loan_amount,

    v_total_card_count,

    v_active_card_count,

    v_total_transaction_count

FROM customers AS c

LEFT JOIN account_summary AS acc
    ON c.customer_id = acc.customer_id

LEFT JOIN loan_summary AS l
    ON c.customer_id = l.customer_id

LEFT JOIN card_summary AS cd
    ON c.customer_id = cd.customer_id

LEFT JOIN transaction_summary AS ts
    ON c.customer_id = ts.customer_id

WHERE c.customer_id = p_customer_id;


IF v_customer_name IS NULL THEN

    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer not found.';

END IF;

IF v_total_balance >= (v_total_active_loan_amount * 2) THEN

    SET v_financial_score = 'Excellent';

ELSEIF v_total_balance >= v_total_active_loan_amount THEN

    SET v_financial_score = 'Good';

ELSEIF v_total_balance > 0 THEN

    SET v_financial_score = 'Normal';

ELSE

    SET v_financial_score = 'Risky';

END IF;

SET v_result_message = CONCAT(
    'Customer: ', v_customer_name,
    ' | Accounts: ', v_account_count,
    ' | Total Balance: ', ROUND(v_total_balance,2),
    ' | Active Loans: ', v_active_loan_count,
    ' | Loan Amount: ', ROUND(v_total_active_loan_amount,2),
    ' | Total Cards: ', v_total_card_count,
    ' | Active Cards: ', v_active_card_count,
    ' | Transactions: ', v_total_transaction_count,
    ' | Financial Score: ', v_financial_score
);

RETURN v_result_message;

END //

DELIMITER ;