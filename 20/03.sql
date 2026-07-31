DELIMITER //

CREATE PROCEDURE delete_brand
(
    IN p_brand_id INT
)
BEGIN

    ----------------------------------------
    -- Değişkenler
    ----------------------------------------
    DECLARE v_brand_count INT;
    DECLARE v_message VARCHAR(100);

    ----------------------------------------
    -- SQL Hata Yakalama
    ----------------------------------------
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET v_message = 'Brand Could Not Be Deleted';

        SELECT v_message AS message;
    END;

    ----------------------------------------
    -- Marka Var mı?
    ----------------------------------------
    SELECT COUNT(*)
    INTO v_brand_count
    FROM brands
    WHERE brand_id = p_brand_id;

    ----------------------------------------
    -- Marka Bulunamadı
    ----------------------------------------
    IF v_brand_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Brand Not Found';
    END IF;

    ----------------------------------------
    -- Marka Sil
    ----------------------------------------
    DELETE FROM brands
    WHERE brand_id = p_brand_id;

    ----------------------------------------
    -- Başarı Mesajı
    ----------------------------------------
    SET v_message = 'Brand Deleted Successfully';

    SELECT v_message AS message;

END //

DELIMITER ;