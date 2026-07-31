DELIMITER //

CREATE PROCEDURE product_sale
(
    IN p_product_id INT,
    IN p_quantity INT
)
BEGIN

    --------------------------------------------------
    -- Değişkenler
    --------------------------------------------------
    DECLARE v_stock INT;
    DECLARE v_product_count INT;
    DECLARE v_message VARCHAR(100);

    --------------------------------------------------
    -- SQL Hata Yakalama
    --------------------------------------------------
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;

        SET v_message = 'Sale Failed';

        SELECT v_message AS message;
    END;

    --------------------------------------------------
    -- Quantity Kontrolü
    --------------------------------------------------
    IF p_quantity <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid Quantity';
    END IF;

    --------------------------------------------------
    -- Ürün Kontrolü
    --------------------------------------------------
    SELECT COUNT(*)
    INTO v_product_count
    FROM products
    WHERE product_id = p_product_id;

    IF v_product_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Product Not Found';
    END IF;

    --------------------------------------------------
    -- Stok Oku
    --------------------------------------------------
    SELECT stock
    INTO v_stock
    FROM products
    WHERE product_id = p_product_id;

    --------------------------------------------------
    -- Stok Kontrolü
    --------------------------------------------------
    IF v_stock < p_quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient Stock';
    END IF;

    --------------------------------------------------
    -- Transaction Başlat
    --------------------------------------------------
    START TRANSACTION;

    --------------------------------------------------
    -- Stoğu Güncelle
    --------------------------------------------------
    UPDATE products
    SET stock = stock - p_quantity
    WHERE product_id = p_product_id;

    --------------------------------------------------
    -- İşlemi Kaydet
    --------------------------------------------------
    COMMIT;

    --------------------------------------------------
    -- Başarı Mesajı
    --------------------------------------------------
    SET v_message = 'Sale Completed Successfully';

    SELECT v_message AS message;

END //

DELIMITER ;