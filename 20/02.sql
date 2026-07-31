DELIMITER //

CREATE PROCEDURE increase_stock
(
    IN p_product_id INT,
    IN p_increase_amount INT
)
BEGIN

    DECLARE v_product_count INT;

    ----------------------------------------
    -- Stok Miktarı Kontrolü
    ----------------------------------------
    IF p_increase_amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid Stock Amount';
    END IF;

    ----------------------------------------
    -- Ürün Var mı?
    ----------------------------------------
    SELECT COUNT(*)
    INTO v_product_count
    FROM products
    WHERE product_id = p_product_id;

    IF v_product_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Product Not Found';
    END IF;

    ----------------------------------------
    -- Stok Güncelle
    ----------------------------------------
    UPDATE products
    SET stock = stock + p_increase_amount
    WHERE product_id = p_product_id;

    ----------------------------------------
    -- Başarı Mesajı
    ----------------------------------------
    SELECT 'Stock updated successfully.' AS message;

END //

DELIMITER ;