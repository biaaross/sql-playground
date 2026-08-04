DELIMITER //

CREATE FUNCTION get_customer_total_balance
(
    p_customer_id INT
)
RETURNS VARCHAR(150)

BEGIN

DECLARE v_customer_name VARCHAR(120);

DECLARE v_total_balance DECIMAL(12,2);

DECLARE v_message VARCHAR(150);

DECLARE CONTINUE HANDLER FOR NOT FOUND
SET v_customer_name = NULL;

SELECT
    CONCAT(c.first_name, ' ', c.last_name),
    IFNULL(SUM(a.balance), 0)
INTO
    v_customer_name,
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

    SET v_message = CONCAT(
    v_customer_name,
    ' | Total Balance: ',
    v_total_balance
);
RETURN v_message;
END // 
DELIMITER ;