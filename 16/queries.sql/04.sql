-- ==========================================================
-- Task 36 : Product Price Categories
-- ==========================================================
--
-- Retrieve the following information:
--   • Product Name
--   • Brand Name
--   • Price
--   • Price Category
--
-- Requirements:
--   • Use CASE WHEN
--   • Price >= 50000  -> Premium
--   • Price >= 30000  -> Mid-Range
--   • Otherwise       -> Budget
--
-- Sort the results by:
--   1. Price (DESC)
--   2. Product Name (ASC)
-- ==========================================================

SELECT
    p.product_name,
    b.brand_name,
    p.price,

    CASE
        WHEN p.price >= 50000 THEN 'Premium'
        WHEN p.price >= 30000 THEN 'Mid-Range'
        ELSE 'Budget'
    END AS price_category

FROM products AS p

INNER JOIN brands AS b
    ON p.brand_id = b.brand_id

ORDER BY
    p.price DESC,
    p.product_name ASC;



    -- ==========================================================
-- Task 37 : Product Stock Status
-- ==========================================================
--
-- Retrieve the following information:
--   • Product Name
--   • Brand Name
--   • Stock
--   • Stock Status
--
-- Requirements:
--   • Use CASE WHEN
--   • Stock = 0        -> Out of Stock
--   • Stock <= 10      -> Low Stock
--   • Stock <= 50      -> In Stock
--   • Otherwise        -> High Stock
--
-- Sort the results by:
--   1. Stock (ASC)
--   2. Product Name (ASC)
-- ==========================================================

SELECT
    p.product_name,
    b.brand_name,
    p.stock,

    CASE
        WHEN p.stock > 50 THEN 'High Stock'
        WHEN p.stock BETWEEN 11 AND 50 THEN 'In Stock'
        WHEN p.stock BETWEEN 1 AND 10 THEN 'Low Stock'
        ELSE 'Out of Stock'
    END AS stock_status

FROM products AS p

INNER JOIN brands AS b
    ON p.brand_id = b.brand_id

ORDER BY
    p.stock ASC,
    p.product_name ASC;




-- ==========================================================
-- Task 38 : Product Count by Price Category
-- ==========================================================
--
-- Retrieve the following information:
--   • Price Category
--   • Total Products
--
-- Requirements:
--   • Use CASE WHEN
--   • Use COUNT()
--   • Use GROUP BY
--
-- Price Category Rules:
--   • Price >= 50000 -> Premium
--   • Price >= 30000 -> Mid-Range
--   • Otherwise      -> Budget
--
-- Sort the results by:
--   1. Total Products (DESC)
-- ==========================================================

SELECT
    CASE
        WHEN p.price >= 50000 THEN 'Premium'
        WHEN p.price >= 30000 THEN 'Mid-Range'
        ELSE 'Budget'
    END AS price_category,

    COUNT(p.product_id) AS total_products

FROM products AS p

GROUP BY
    CASE
        WHEN p.price >= 50000 THEN 'Premium'
        WHEN p.price >= 30000 THEN 'Mid-Range'
        ELSE 'Budget'
    END

ORDER BY
    total_products DESC;



    -- ==========================================================
-- Task 39 : Sales Report by Price Category
-- ==========================================================
--
-- Retrieve the following information:
--   • Price Category
--   • Total Products
--   • Total Sales
--   • Average Price
--
-- Requirements:
--   • Use CASE WHEN
--   • Use COUNT()
--   • Use SUM()
--   • Use AVG()
--   • Use GROUP BY
--
-- Price Category Rules:
--   • Price >= 50000 -> Premium
--   • Price >= 30000 -> Mid-Range
--   • Otherwise      -> Budget
--
-- Display Average Price with 2 decimal places.
--
-- Sort the results by:
--   1. Total Sales (DESC)
--   2. Average Price (DESC)
-- ==========================================================

SELECT

CASE
    WHEN p.price >= 50000 THEN 'Premium'
    WHEN p.price >= 30000 THEN 'Mid-Range'
    ELSE 'Budget'
END AS price_category,

COUNT(p.product_id) AS total_products,

SUM(p.sales) AS total_sales,

ROUND(AVG(p.price),2) AS average_price

FROM products AS p

GROUP BY

CASE
    WHEN p.price >= 50000 THEN 'Premium'
    WHEN p.price >= 30000 THEN 'Mid-Range'
    ELSE 'Budget'
END

ORDER BY
    total_sales DESC,
    average_price DESC;



    -- ==========================================================
-- Task 40 : High Performing Price Categories
-- ==========================================================
--
-- Retrieve the following information:
--   • Price Category
--   • Total Products
--   • Total Sales
--   • Average Price
--
-- Requirements:
--   • Use CASE WHEN
--   • Use COUNT()
--   • Use SUM()
--   • Use AVG()
--   • Use GROUP BY
--   • Use HAVING
--
-- Price Category Rules:
--   • Price >= 50000 -> Premium
--   • Price >= 30000 -> Mid-Range
--   • Otherwise      -> Budget
--
-- Show only categories where:
--   • Total Sales > 500
--   • Total Products >= 3
--
-- Display Average Price with 2 decimal places.
--
-- Sort the results by:
--   1. Total Sales (DESC)
--   2. Average Price (DESC)
-- ==========================================================

SELECT

CASE
    WHEN p.price >= 50000 THEN 'Premium'
    WHEN p.price >= 30000 THEN 'Mid-Range'
    ELSE 'Budget'
END AS price_category,

COUNT(p.product_id) AS total_products,

SUM(p.sales) AS total_sales,

ROUND(AVG(p.price),2) AS average_price

FROM products AS p

GROUP BY

CASE
    WHEN p.price >= 50000 THEN 'Premium'
    WHEN p.price >= 30000 THEN 'Mid-Range'
    ELSE 'Budget'
END

HAVING
    total_sales > 500
    AND total_products >= 3

ORDER BY
    total_sales DESC,
    average_price DESC;



-- ==========================================================
-- Task 41 : Sales by Price Category
-- ==========================================================
--
-- Retrieve the following information:
--   • Premium Sales
--   • Mid-Range Sales
--   • Budget Sales
--
-- Requirements:
--   • Use SUM()
--   • Use CASE WHEN
--   • Do NOT use GROUP BY
--
-- Price Category Rules:
--   • Price >= 50000 -> Premium
--   • Price >= 30000 -> Mid-Range
--   • Otherwise      -> Budget
-- ==========================================================

SELECT

    SUM(
        CASE
            WHEN p.price >= 50000 THEN p.sales
            ELSE 0
        END
    ) AS premium_sales,

    SUM(
        CASE
            WHEN p.price >= 30000
                 AND p.price < 50000
            THEN p.sales
            ELSE 0
        END
    ) AS mid_range_sales,

    SUM(
        CASE
            WHEN p.price < 30000
            THEN p.sales
            ELSE 0
        END
    ) AS budget_sales

FROM products AS p;



-- ==========================================================
-- Task 42 : Product Count by Price Category
-- ==========================================================
--
-- Retrieve the following information:
--   • Premium Products
--   • Mid-Range Products
--   • Budget Products
--
-- Requirements:
--   • Use COUNT()
--   • Use CASE WHEN
--   • Do NOT use GROUP BY
--
-- Price Category Rules:
--   • Price >= 50000 -> Premium
--   • Price >= 30000 -> Mid-Range
--   • Otherwise      -> Budget
-- ==========================================================

SELECT

    COUNT(
        CASE
            WHEN p.price >= 50000 THEN 1
            ELSE NULL
        END
    ) AS premium_products,

    COUNT(
        CASE
            WHEN p.price >= 30000
                 AND p.price < 50000 THEN 1
            ELSE NULL
        END
    ) AS mid_range_products,

    COUNT(
        CASE
            WHEN p.price < 30000 THEN 1
            ELSE NULL
        END
    ) AS budget_products

FROM products AS p;



-- ==========================================================
-- Task 43 : Average Price by Price Category
-- ==========================================================
--
-- Retrieve the following information:
--   • Premium Average Price
--   • Mid-Range Average Price
--   • Budget Average Price
--
-- Requirements:
--   • Use AVG()
--   • Use CASE WHEN
--   • Use ROUND(..., 2)
--   • Do NOT use GROUP BY
--
-- Price Category Rules:
--   • Price >= 50000 -> Premium
--   • Price >= 30000 -> Mid-Range
--   • Otherwise      -> Budget
-- ==========================================================

SELECT

    ROUND(
        AVG(
            CASE
                WHEN p.price >= 50000 THEN p.price
                ELSE NULL
            END
        ),
        2
    ) AS premium_average_price,

    ROUND(
        AVG(
            CASE
                WHEN p.price >= 30000
                     AND p.price < 50000
                THEN p.price
                ELSE NULL
            END
        ),
        2
    ) AS mid_range_average_price,

    ROUND(
        AVG(
            CASE
                WHEN p.price < 30000
                THEN p.price
                ELSE NULL
            END
        ),
        2
    ) AS budget_average_price

FROM products AS p;



-- ==========================================================
-- Task 44 : Complete Sales Dashboard
-- ==========================================================
--
-- Retrieve the following information:
--
-- Product Counts
--   • Premium Products
--   • Mid-Range Products
--   • Budget Products
--
-- Sales
--   • Premium Sales
--   • Mid-Range Sales
--   • Budget Sales
--
-- Average Prices
--   • Premium Average Price
--   • Mid-Range Average Price
--   • Budget Average Price
--
-- Requirements:
--   • Use CASE WHEN
--   • Use COUNT()
--   • Use SUM()
--   • Use AVG()
--   • Use ROUND()
--
-- Do NOT use:
--   • GROUP BY
--   • HAVING
--   • Subquery
-- ==========================================================

SELECT

    -- Product Counts
    COUNT(
        CASE
            WHEN p.price >= 50000 THEN 1
            ELSE NULL
        END
    ) AS premium_products,

    COUNT(
        CASE
            WHEN p.price >= 30000
                 AND p.price < 50000 THEN 1
            ELSE NULL
        END
    ) AS mid_range_products,

    COUNT(
        CASE
            WHEN p.price < 30000 THEN 1
            ELSE NULL
        END
    ) AS budget_products,

    -- Sales
    SUM(
        CASE
            WHEN p.price >= 50000 THEN p.sales
            ELSE 0
        END
    ) AS premium_sales,

    SUM(
        CASE
            WHEN p.price >= 30000
                 AND p.price < 50000 THEN p.sales
            ELSE 0
        END
    ) AS mid_range_sales,

    SUM(
        CASE
            WHEN p.price < 30000 THEN p.sales
            ELSE 0
        END
    ) AS budget_sales,

    -- Average Prices
    ROUND(
        AVG(
            CASE
                WHEN p.price >= 50000 THEN p.price
                ELSE NULL
            END
        ),
        2
    ) AS premium_average_price,

    ROUND(
        AVG(
            CASE
                WHEN p.price >= 30000
                     AND p.price < 50000 THEN p.price
                ELSE NULL
            END
        ),
        2
    ) AS mid_range_average_price,

    ROUND(
        AVG(
            CASE
                WHEN p.price < 30000 THEN p.price
                ELSE NULL
            END
        ),
        
    ) AS budget_average_price

FROM products AS p;
