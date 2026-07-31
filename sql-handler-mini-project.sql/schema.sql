DROP DATABASE IF EXISTS sql_handler_project;
CREATE DATABASE sql_handler_project;
USE sql_handler_project;

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS brands;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers
(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE brands
(
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(50) UNIQUE
);

CREATE TABLE categories
(
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE products
(
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    brand_id INT,
    category_id INT,
    price DECIMAL(10,2),
    stock INT,

    FOREIGN KEY (brand_id)
        REFERENCES brands(brand_id),

    FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);

CREATE TABLE sales
(
    sale_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT,
    product_id INT,

    quantity INT,
    total_amount DECIMAL(10,2),

    sale_date DATE,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);