DELIMITER //

CREATE PROCEDURE Cancel_Order_System
(
    IN p_order_id INT
)
BEGIN

DECLARE v_order_count INT;
DECLARE v_status VARCHAR(100);
DECLARE v_product_id INT;
DECLARE v_quantity INT;
DECLARE v_message VARCHAR(100);


DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN

ROLLBACK;

SET v_message = 'Order Cancel Failed';

SELECT v_message AS message;

END;


START TRANSACTION;


-- 1) Sipariş var mı kontrolü

SELECT COUNT(*)
INTO v_order_count
FROM orders AS o
WHERE o.order_id = p_order_id;


IF v_order_count = 0 THEN

SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Order Not Found';

END IF;



-- 2) Sipariş durumunu al

SELECT o.status
INTO v_status
FROM orders AS o
WHERE o.order_id = p_order_id;



IF v_status = 'Cancelled' THEN

SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Order Already Cancelled';

END IF;



-- 3) Sipariş ürün bilgilerini al

SELECT 
p.product_id,
oi.quantity

INTO
v_product_id,
v_quantity

FROM order_items AS oi

JOIN products AS p
ON p.product_id = oi.product_id

WHERE oi.order_id = p_order_id;



-- 4) Stoğu geri yükle

UPDATE products

SET stock = stock + v_quantity

WHERE product_id = v_product_id;



-- 5) Sipariş durumunu değiştir

UPDATE orders

SET status = 'Cancelled'

WHERE order_id = p_order_id;



-- 6) İşlemi kaydet

COMMIT;



SET v_message = 'Order Cancelled Successfully';


SELECT v_message AS message;


END //

DELIMITER ;