DELIMITER //

CREATE PROCEDURE transfer_money
(
    IN p_sender_account INT,
    IN p_receiver_account INT,
    IN p_amount DECIMAL(10,2)
)

BEGIN


DECLARE v_sender_count INT;
DECLARE v_receiver_count INT;

DECLARE v_sender_status VARCHAR(20);
DECLARE v_receiver_status VARCHAR(20);

DECLARE v_sender_balance DECIMAL(10,2);

DECLARE v_message VARCHAR(100);



-- HATA YÖNETİMİ

DECLARE EXIT HANDLER FOR SQLEXCEPTION

BEGIN

ROLLBACK;

SET v_message = 'Transfer Failed';

SELECT v_message AS message;

END;



-- 1) Gönderilen miktar kontrolü

IF p_amount <= 0 THEN

SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Invalid Transfer Amount';

END IF;



-- 2) Aynı hesaba transfer kontrolü

IF p_sender_account = p_receiver_account THEN

SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Cannot Transfer To Same Account';

END IF;



-- 3) Sender hesap kontrolü

SELECT COUNT(*)

INTO v_sender_count

FROM accounts AS a

WHERE a.account_id = p_sender_account;



IF v_sender_count = 0 THEN

SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Sender Account Not Found';

END IF;



-- 4) Receiver hesap kontrolü

SELECT COUNT(*)

INTO v_receiver_count

FROM accounts AS a

WHERE a.account_id = p_receiver_account;



IF v_receiver_count = 0 THEN

SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Receiver Account Not Found';

END IF;



-- 5) Sender hesap durumunu al

SELECT a.status

INTO v_sender_status

FROM accounts AS a

WHERE a.account_id = p_sender_account;



IF v_sender_status IN ('Blocked','Closed') THEN

SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Sender Account Not Active';

END IF;



-- 6) Receiver hesap durumunu al

SELECT a.status

INTO v_receiver_status

FROM accounts AS a

WHERE a.account_id = p_receiver_account;



IF v_receiver_status IN ('Blocked','Closed') THEN

SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Receiver Account Not Active';

END IF;



-- 7) Sender bakiyesini al

SELECT a.balance

INTO v_sender_balance

FROM accounts AS a

WHERE a.account_id = p_sender_account;



IF v_sender_balance < p_amount THEN

SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Insufficient Balance';

END IF;



-- TRANSACTION BAŞLAT

START TRANSACTION;



-- 8) Gönderen hesaptan para düş

UPDATE accounts

SET balance = balance - p_amount

WHERE account_id = p_sender_account;



-- 9) Alıcı hesaba para ekle

UPDATE accounts

SET balance = balance + p_amount

WHERE account_id = p_receiver_account;



-- 10) Transaction kaydı

INSERT INTO transactions
(
    sender_account,
    receiver_account,
    transaction_type,
    amount,
    description
)

VALUES
(
    p_sender_account,
    p_receiver_account,
    'Transfer',
    p_amount,
    'Money Transfer'
);



-- Başarılı işlem

COMMIT;



SET v_message = 'Money Transferred Successfully';


SELECT v_message AS message;



END //

DELIMITER ;