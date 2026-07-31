DELIMITER // 
CREATE PROCEDURE customer_search_handler
(
    IN p_customer_id INT 
)
BEGIN 
DECLARE v_customer_id INT;
DECLARE v_first_name VARCHAR(100);
DECLARE v_last_name VARCHAR(100);
DECLARE v_city VARCHAR(100);
DECLARE v_message VARCHAR(100);

DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET v_message = "Customer Not Found";

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city
INTO 
    v_customer_id,
    v_first_name,
    v_last_name,
    v_city
FROM customers AS c
WHERE c.customer_id = p_customer_id;

IF v_message IS NOT NULL THEN
    SELECT v_message AS message;
ELSE  
    SELECT 
        v_customer_id,
        v_first_name,
        v_last_name,
        v_city
END IF;
END //
DELIMITER ;
CALL customer_search_handler(1);
CALL customer_search_handler(999);