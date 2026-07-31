USE sql_handler_project;

INSERT INTO customers(first_name,last_name,city)
VALUES
('Ahmet','Yılmaz','Trabzon'),
('Mehmet','Kaya','İstanbul'),
('Ayşe','Demir','Ankara'),
('Fatma','Çelik','Samsun'),
('Ali','Aydın','İzmir'),
('Zeynep','Koç','Bursa'),
('Hasan','Şahin','Rize'),
('Elif','Aksoy','Ordu');

INSERT INTO brands(brand_name)
VALUES
('Apple'),
('Samsung'),
('Lenovo'),
('HP'),
('Asus'),
('Dell');

INSERT INTO categories(category_name)
VALUES
('Laptop'),
('Telefon'),
('Tablet'),
('Aksesuar');

INSERT INTO products
(product_name,brand_id,category_id,price,stock)
VALUES
('MacBook Air M3',1,1,52000,20),
('iPhone 16',1,2,64000,15),
('Galaxy S25',2,2,56000,18),
('ThinkPad X1',3,1,48000,12),
('HP Victus',4,1,39000,25),
('Asus TUF A15',5,1,42000,14),
('Dell XPS 13',6,1,51000,10),
('Galaxy Tab',2,3,18000,30),
('Magic Mouse',1,4,3500,50),
('Wireless Charger',2,4,1800,80);

INSERT INTO sales
(customer_id,product_id,quantity,total_amount,sale_date)
VALUES
(1,1,1,52000,'2026-01-15'),
(2,2,1,64000,'2026-01-20'),
(3,5,1,39000,'2026-02-02'),
(4,3,2,112000,'2026-02-10'),
(5,4,1,48000,'2026-03-01'),
(1,10,3,5400,'2026-03-05'),
(2,9,2,7000,'2026-03-18'),
(6,8,1,18000,'2026-04-01'),
(7,6,1,42000,'2026-04-08'),
(8,7,1,51000,'2026-04-15'),
(3,2,1,64000,'2026-05-05'),
(4,10,5,9000,'2026-05-11'),
(5,3,1,56000,'2026-05-25'),
(6,5,2,78000,'2026-06-01'),
(7,1,1,52000,'2026-06-12'),
(8,9,4,14000,'2026-06-20'),
(1,3,1,56000,'2026-07-01'),
(2,6,1,42000,'2026-07-07'),
(3,8,2,36000,'2026-07-15'),
(4,4,1,48000,'2026-07-25');