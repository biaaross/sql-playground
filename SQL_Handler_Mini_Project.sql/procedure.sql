DELIMITER //

CREATE PROCEDURE brand_information
(
    IN p_brand_id INT
)
BEGIN

    DECLARE v_brand_name VARCHAR(100);
    DECLARE v_product_count INT;
    DECLARE v_average_price DECIMAL(10,2);
    DECLARE v_message VARCHAR(100);

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET v_message = 'Brand Not Found';

    SELECT
        b.brand_name,
        COUNT(p.product_id),
        ROUND(AVG(p.price),2)
    INTO
        v_brand_name,
        v_product_count,
        v_average_price
    FROM brands AS b
    INNER JOIN products AS p
        ON b.brand_id = p.brand_id
    WHERE b.brand_id = p_brand_id
    GROUP BY
        b.brand_name;

    SELECT
        v_brand_name     AS Brand_Name,
        v_product_count  AS Product_Count,
        v_average_price  AS Average_Price,
        v_message        AS Message;

END //

DELIMITER ;