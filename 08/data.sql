-- ==========================================
-- BOOK STORE DATABASE
-- Sample Data
-- ==========================================

-- =========================
-- Customers
-- =========================

INSERT INTO Customers (customer_id, name, city) VALUES
(1, 'Arda', 'Ankara'),
(2, 'Mehmet', 'İstanbul'),
(3, 'Ayşe', 'İzmir'),
(4, 'Zeynep', 'Bursa'),
(5, 'Can', 'Ankara');

-- =========================
-- Authors
-- =========================

INSERT INTO Authors (author_id, author_name) VALUES
(1, 'George Orwell'),
(2, 'J.K. Rowling'),
(3, 'Robert C. Martin'),
(4, 'Yuval Noah Harari');

-- =========================
-- Categories
-- =========================

INSERT INTO Categories (category_id, category_name) VALUES
(1, 'Novel'),
(2, 'Programming'),
(3, 'History'),
(4, 'Science');

-- =========================
-- Books
-- =========================

INSERT INTO Books
(book_id, title, author_id, category_id, price)
VALUES
(1, '1984', 1, 1, 250.00),
(2, 'Animal Farm', 1, 1, 180.00),
(3, 'Harry Potter', 2, 1, 350.00),
(4, 'Clean Code', 3, 2, 500.00),
(5, 'Clean Architecture', 3, 2, 650.00),
(6, 'Sapiens', 4, 3, 420.00);

-- =========================
-- Orders
-- =========================

INSERT INTO Orders
(order_id, customer_id, book_id, quantity, order_date)
VALUES
(1, 1, 4, 1, '2026-06-10'),
(2, 1, 6, 2, '2026-06-11'),
(3, 2, 3, 1, '2026-06-12'),
(4, 3, 1, 2, '2026-06-15'),
(5, 3, 2, 1, '2026-06-16'),
(6, 5, 4, 3, '2026-06-20');