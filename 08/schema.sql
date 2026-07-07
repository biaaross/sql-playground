-- ==========================================
-- BOOK STORE DATABASE
-- Schema
-- ==========================================

-- Eğer tablolar varsa sil
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Categories;

-- ==========================================
-- Customers
-- ==========================================

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);

-- ==========================================
-- Authors
-- ==========================================

CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);

-- ==========================================
-- Categories
-- ==========================================

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- ==========================================
-- Books
-- ==========================================

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_books_author
        FOREIGN KEY (author_id)
        REFERENCES Authors(author_id),

    CONSTRAINT fk_books_category
        FOREIGN KEY (category_id)
        REFERENCES Categories(category_id)
);

-- ==========================================
-- Orders
-- ==========================================

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL CHECK(quantity > 0),
    order_date DATE NOT NULL,

    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id),

    CONSTRAINT fk_orders_book
        FOREIGN KEY (book_id)
        REFERENCES Books(book_id)
);