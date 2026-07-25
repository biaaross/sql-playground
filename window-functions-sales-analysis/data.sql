-- data.sql
INSERT INTO categories(category_name) VALUES
('Laptop'),('Phone'),('Tablet'),('Monitor'),('Accessory');
INSERT INTO customers(first_name,last_name,city,registration_date) VALUES
('Ahmet','Yılmaz','İstanbul','2024-01-10'),
('Ayşe','Kaya','Ankara','2024-02-11'),
('Mehmet','Demir','İzmir','2024-03-01'),
('Ece','Arslan','Bursa','2024-03-15'),
('Can','Koç','Trabzon','2024-04-01');
INSERT INTO products(category_id,product_name,price,stock) VALUES
(1,'MacBook Air M4',89000,10),
(1,'Galaxy Book',54000,15),
(2,'iPhone 16 Pro',75000,20),
(2,'Galaxy S25 Ultra',68000,18),
(3,'iPad Air',42000,12),
(4,'LG UltraWide',17000,9),
(5,'MX Master 3S',4500,30),
(5,'Keychron K2',4200,20);
INSERT INTO orders(customer_id,product_id,quantity,total_amount,order_date) VALUES
(1,1,1,89000,'2025-01-01'),
(2,3,1,75000,'2025-01-03'),
(3,2,1,54000,'2025-01-08'),
(4,4,1,68000,'2025-01-10'),
(5,5,2,84000,'2025-01-15'),
(1,7,2,9000,'2025-01-20'),
(2,8,1,4200,'2025-01-21'),
(3,6,1,17000,'2025-01-22');
