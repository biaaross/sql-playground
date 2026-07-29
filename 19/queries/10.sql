DELIMITER //

CREATE PROCEDURE product_sales_summary
(
    IN p_product_id INT
)

BEGIN

    DECLARE v_product_name VARCHAR(100);
    DECLARE v_total_quantity INT;
    DECLARE v_total_revenue DECIMAL(10,2);
    DECLARE v_average_order DECIMAL(10,2);
    DECLARE v_sales_status VARCHAR(20);

    -- Ürün bilgilerini al
    SELECT
        p.product_name,
        SUM(o.quantity),
        SUM(o.total_amount),
        ROUND(AVG(o.total_amount),2)

    INTO
        v_product_name,
        v_total_quantity,
        v_total_revenue,
        v_average_order

    FROM products AS p

    INNER JOIN orders AS o
        ON p.product_id = o.product_id

    WHERE p.product_id = p_product_id

    GROUP BY
        p.product_id,
        p.product_name;


    -- Satış durumunu belirle
    IF v_total_quantity >= 100 THEN

        SET v_sales_status = 'BEST SELLER';

    ELSEIF v_total_quantity >= 50 THEN

        SET v_sales_status = 'POPULAR';

    ELSEIF v_total_quantity >= 10 THEN

        SET v_sales_status = 'NORMAL';

    ELSE

        SET v_sales_status = 'LOW';

    END IF;


    -- Sonucu göster
    SELECT
        v_product_name AS product_name,
        v_total_quantity AS total_quantity,
        v_total_revenue AS total_revenue,
        v_average_order AS average_order,
        v_sales_status AS sales_status;

END //

DELIMITER ;

CALL product_sales_summary(1);