DELIMITER //

CREATE FUNCTION get_customer_loan_summary
(
    p_customer_id INT
)
RETURNS VARCHAR(300)

BEGIN

    DECLARE v_customer_full_name VARCHAR(120);
    DECLARE v_account_count INT;
    DECLARE v_total_balance DECIMAL(12,2);
    DECLARE v_active_loan_count INT;
    DECLARE v_total_active_loan_amount DECIMAL(12,2);
    DECLARE v_average_interest_rate DECIMAL(5,2);
    DECLARE v_risk_level VARCHAR(20);
    DECLARE v_result_message VARCHAR(300);

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET v_customer_full_name = NULL;

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
            ) AS total_active_loan_amount,

            IFNULL(
                AVG(
                    CASE
                        WHEN status = 'Active' THEN interest_rate
                    END
                ),
                0
            ) AS average_interest_rate

        FROM loans
        GROUP BY customer_id
    )

    SELECT
        CONCAT(c.first_name,' ',c.last_name),
        IFNULL(a.account_count,0),
        IFNULL(a.total_balance,0),
        IFNULL(l.active_loan_count,0),
        IFNULL(l.total_active_loan_amount,0),
        IFNULL(l.average_interest_rate,0)

    INTO
        v_customer_full_name,
        v_account_count,
        v_total_balance,
        v_active_loan_count,
        v_total_active_loan_amount,
        v_average_interest_rate

    FROM customers AS c

    LEFT JOIN account_summary AS a
        ON c.customer_id = a.customer_id

    LEFT JOIN loan_summary AS l
        ON c.customer_id = l.customer_id

    WHERE c.customer_id = p_customer_id;

    IF v_customer_full_name IS NULL THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer not found.';

    END IF;

    IF v_active_loan_count = 0 THEN

        SET v_risk_level = 'LOW';

    ELSEIF v_total_active_loan_amount >= 100000 THEN

        SET v_risk_level = 'HIGH';

    ELSE

        SET v_risk_level = 'NORMAL';

    END IF;

    SET v_result_message = CONCAT(
        v_customer_full_name,
        ' | Accounts: ',
        v_account_count,
        ' | Balance: ',
        FORMAT(v_total_balance,2),
        ' | Active Loans: ',
        v_active_loan_count,
        ' | Loan Amount: ',
        FORMAT(v_total_active_loan_amount,2),
        ' | Avg Interest: ',
        ROUND(v_average_interest_rate,2),
        '% | Risk: ',
        v_risk_level
    );

    RETURN v_result_message;

END //

DELIMITER ;