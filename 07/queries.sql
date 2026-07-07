SELECT *
FROM products;

SELECT product_name,price
FROM products;

SELECT brand,category
FROM products;

SELECT *
FROM products
WHERE price > 1000;

SELECT * 
FROM products
WHERE stock < 20;

SELECT *
FROM products
WHERE release_year > 2022;

SELECT *
FROM products
WHERE rating > 4.5;

SELECT *
FROM products
ORDER BY price DESC;

SELECT * 
FROM products
ORDER BY price ASC;

SELECT * 
FROM products
ORDER BY sales DESC;

SELECT * 
FROM products
ORDER BY rating DESC;

SELECT *
FROM products
LIMIT 10;

SELECT * 
FROM products
ORDER BY price DESC
LIMIT 5;

SELECT * 
FROM products
ORDER BY sales DESC
LIMIT 3;

SELECT * 
FROM products
WHERE product_name LIKE '%Pro%';

SELECT *
FROM products
WHERE brand LIKE '%ASUS%';

SELECT *
FROM products
WHERE country LIKE 'USA';

SELECT *
FROM products
WHERE price BETWEEN 500 AND 2000;

SELECT * 
FROM products
WHERE rating BETWEEN 4.0 AND 5.0;

SELECT *
FROM products
WHERE release_year BETWEEN 2020 AND 2025;

SELECT * 
FROM products
WHERE brand IN('ASUS', 'Apple', 'Dell');

SELECT *
FROM products
WHERE category IN('Laptop', 'Smartphone');

SELECT * 
FROM products
WHERE country IN('USA', 'Japan');

SELECT DISTINCT brand
FROM products;

SELECT DISTINCT category
FROM products;

SELECT DISTINCT country
FROM products;

UPDATE products
SET price = 10
WHERE product_id = 1;

UPDATE products
SET stock = 10
WHERE stock = 0;

UPDATE products
SET price = price * 90 / 100
WHERE brand = 'ASUS';

DELETE FROM products
WHERE stock = 0;

DELETE FROM products
WHERE release_year < 2018;

DELETE FROM products
WHERE rating < 2;

SELECT COUNT(*)
FROM products;

SELECT SUM(stock)
FROM products;

SELECT AVG(price)
FROM products;

SELECT MAX(price)
FROM products;

SELECT MIN(price)
FROM products;

SELECT AVG(rating)
FROM products

SELECT SUM(sales)
FROM products

SELECT category,
COUNT(*) AS total_products
FROM products
GROUP BY category

SELECT COUNT(*)
FROM products
GROUP BY brand

SELECT COUNT(sales)
FROM products
GROUP BY brand

SELECT AVG(price)
FROM products
GROUP BY category

SELECT COUNT(stock)
FROM products
GROUP BY country

SELECT brand
FROM products
HAVING COUNT(stock>=2)


