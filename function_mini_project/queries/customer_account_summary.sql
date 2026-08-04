DELIMITER //

CREATE FUNCTION get_customer_account_summary
(
    p_customer_id INT
)
RETURNS VARCHAR(250)

BEGIN

DECLARE v_customer_name VARCHAR(120);

DECLARE v_accounts INT;

DECLARE v_active INT;

DECLARE v_blocked INT;

DECLARE v_closed INT;

DECLARE v_total_balance DECIMAL(12,2);

DECLARE v_message VARCHAR(250);

DECLARE CONTINUE HANDLER FOR NOT FOUND
SET v_customer_name = NULL;

SELECT
    CONCAT(c.first_name, ' ', c.last_name),
    COUNT(a.account_id),
    SUM(CASE WHEN a.status = 'Active' THEN 1 ELSE 0 END),
    SUM(CASE WHEN a.status = 'Blocked' THEN 1 ELSE 0 END),
    SUM(CASE WHEN a.status = 'Closed' THEN 1 ELSE 0 END),
    IFNULL(SUM(a.balance),0)
INTO
    v_customer_name,
    v_accounts,
    v_active,
    v_blocked,
    v_closed,
    v_total_balance
FROM customers AS c
LEFT JOIN accounts AS a
    ON c.customer_id = a.customer_id
WHERE c.customer_id = p_customer_id
GROUP BY
    c.customer_id;

IF v_customer_name IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Customer not found.';
END IF;

IF v_accounts = 0 THEN

    SET v_message = CONCAT(
        v_customer_name,
        ' | No account found.'
    );

    RETURN v_message;

END IF;

    SET v_message = CONCAT(
    v_customer_name,
    ' | Accounts: ',
    v_accounts,
    ' | Active: ',
    v_active,
    ' | Blocked: ',
    v_blocked,
    ' | Closed: ',
    v_closed,
    ' | Total Balance: ',
    v_total_balance
);

RETURN v_message;

END //

DELIMITER ;