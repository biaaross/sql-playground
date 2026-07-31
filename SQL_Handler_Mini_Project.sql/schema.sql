CREATE TABLE brands
(
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    brand_name VARCHAR(100) NOT NULL
);


CREATE TABLE products
(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    brand_id INT,
    price DECIMAL(10,2),

    FOREIGN KEY (brand_id)
    REFERENCES brands(brand_id)
);