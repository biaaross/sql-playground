DELIMITER //

CREATE PROCEDURE product_sales_analyzer
(
    IN p_product_id INT
)

BEGIN

    DECLARE v_product_name VARCHAR(100);
    DECLARE v_brand_name VARCHAR(100);
    DECLARE v_category_name VARCHAR(100);

    DECLARE v_total_orders INT;
    DECLARE v_total_quantity INT;

    DECLARE v_total_revenue DECIMAL(10,2);
    DECLARE v_average_order DECIMAL(10,2);
    DECLARE v_max_order DECIMAL(10,2);
    DECLARE v_min_order DECIMAL(10,2);

    DECLARE v_sales_status VARCHAR(30);

    SELECT
        p.product_name,
        b.brand_name,
        c.category_name,
        COUNT(o.order_id),
        COUNT(o.product_id),
        SUM(o.total_amount),
        ROUND(AVG(o.total_amount),2),
        MAX(o.total_amount),
        MIN(o.total_amount)

    INTO
        v_product_name,
        v_brand_name,
        v_category_name,
        v_total_orders,
        v_total_quantity,
        v_total_revenue,
        v_average_order,
        v_max_order,
        v_min_order

    FROM products AS p

    INNER JOIN brands AS b
        ON p.brand_id = b.brand_id

    INNER JOIN categories AS c
        ON p.category_id = c.category_id

    INNER JOIN orders AS o
        ON p.product_id = o.product_id

    WHERE p.product_id = p_product_id

    GROUP BY
        p.product_id,
        p.product_name,
        b.brand_name,
        c.category_name;

    IF v_total_revenue >= 100000 THEN
        SET v_sales_status = 'Best Seller';

    ELSEIF v_total_revenue >= 50000 THEN
        SET v_sales_status = 'Popular';

    ELSEIF v_total_revenue >= 10000 THEN
        SET v_sales_status = 'Average';

    ELSE
        SET v_sales_status = 'Low Sales';

    END IF;

    SELECT
        v_product_name AS product_name,
        v_brand_name AS brand_name,
        v_category_name AS category_name,
        v_total_orders AS total_orders,
        v_total_quantity AS total_quantity,
        v_total_revenue AS total_revenue,
        v_average_order AS average_order,
        v_max_order AS highest_order,
        v_min_order AS lowest_order,
        v_sales_status AS sales_status;

END //

DELIMITER ;

CALL product_sales_analyzer(1);