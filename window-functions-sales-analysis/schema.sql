-- schema.sql
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS categories;

CREATE TABLE categories(
 category_id INT PRIMARY KEY AUTO_INCREMENT,
 category_name VARCHAR(100) NOT NULL);

CREATE TABLE customers(
 customer_id INT PRIMARY KEY AUTO_INCREMENT,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 city VARCHAR(50),
 registration_date DATE);

CREATE TABLE products(
 product_id INT PRIMARY KEY AUTO_INCREMENT,
 category_id INT,
 product_name VARCHAR(120),
 price DECIMAL(10,2),
 stock INT,
 FOREIGN KEY(category_id) REFERENCES categories(category_id));

CREATE TABLE orders(
 order_id INT PRIMARY KEY AUTO_INCREMENT,
 customer_id INT,
 product_id INT,
 quantity INT,
 total_amount DECIMAL(10,2),
 order_date DATE,
 FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
 FOREIGN KEY(product_id) REFERENCES products(product_id));
