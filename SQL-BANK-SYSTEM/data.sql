USE bank_system;

-- =========================================
-- BRANCHES
-- =========================================

INSERT INTO branches (branch_name, city, address) VALUES
('Merkez Şube','İstanbul','Kadıköy'),
('Ankara Şube','Ankara','Çankaya'),
('İzmir Şube','İzmir','Konak'),
('Trabzon Şube','Trabzon','Ortahisar'),
('Bursa Şube','Bursa','Nilüfer');

-- =========================================
-- CUSTOMERS
-- =========================================

INSERT INTO customers(first_name,last_name,email,phone,birth_date) VALUES
('Ahmet','Yılmaz','ahmet@gmail.com','5551000001','1995-01-15'),
('Mehmet','Kaya','mehmet@gmail.com','5551000002','1998-02-20'),
('Ayşe','Demir','ayse@gmail.com','5551000003','1999-03-10'),
('Fatma','Çelik','fatma@gmail.com','5551000004','1997-07-18'),
('Can','Aydın','can@gmail.com','5551000005','1996-05-21'),
('Emre','Koç','emre@gmail.com','5551000006','2000-08-12'),
('Zeynep','Arslan','zeynep@gmail.com','5551000007','1994-12-11'),
('Burak','Şahin','burak@gmail.com','5551000008','1993-09-09'),
('Elif','Öztürk','elif@gmail.com','5551000009','1998-11-14'),
('Merve','Aksoy','merve@gmail.com','5551000010','1997-10-30');

-- =========================================
-- ACCOUNTS
-- =========================================

INSERT INTO accounts
(customer_id,branch_id,account_number,account_type,balance,status)
VALUES
(1,1,'TR0000000001','Checking',15000,'Active'),
(2,1,'TR0000000002','Savings',22000,'Active'),
(3,2,'TR0000000003','Checking',1800,'Active'),
(4,2,'TR0000000004','Savings',9500,'Active'),
(5,3,'TR0000000005','Checking',4500,'Active'),
(6,3,'TR0000000006','Savings',8200,'Active'),
(7,4,'TR0000000007','Checking',30000,'Active'),
(8,4,'TR0000000008','Savings',1500,'Active'),
(9,5,'TR0000000009','Checking',6400,'Active'),
(10,5,'TR0000000010','Savings',9800,'Active');

-- =========================================
-- CARDS
-- =========================================

INSERT INTO cards
(account_id,card_number,card_type,cvv,expire_date,status)
VALUES
(1,'5400000000000001','Debit','111','2029-12-31','Active'),
(2,'5400000000000002','Credit','112','2029-12-31','Active'),
(3,'5400000000000003','Debit','113','2028-10-31','Active'),
(4,'5400000000000004','Credit','114','2028-09-30','Blocked'),
(5,'5400000000000005','Debit','115','2030-01-31','Active'),
(6,'5400000000000006','Credit','116','2029-05-31','Active'),
(7,'5400000000000007','Debit','117','2029-06-30','Active'),
(8,'5400000000000008','Credit','118','2028-08-31','Active'),
(9,'5400000000000009','Debit','119','2030-03-31','Active'),
(10,'5400000000000010','Credit','120','2029-11-30','Active');

-- =========================================
-- LOANS
-- =========================================

INSERT INTO loans
(customer_id,loan_amount,interest_rate,loan_term,remaining_balance,status)
VALUES
(1,100000,2.10,36,85000,'Approved'),
(2,75000,1.95,24,42000,'Approved'),
(3,50000,2.50,12,50000,'Pending'),
(5,120000,1.80,48,95000,'Approved'),
(8,30000,2.90,18,30000,'Rejected');

-- =========================================
-- TRANSACTIONS
-- =========================================

INSERT INTO transactions
(sender_account,receiver_account,transaction_type,amount,description)
VALUES
(NULL,1,'Deposit',5000,'ATM Deposit'),
(1,NULL,'Withdraw',1000,'ATM Withdraw'),
(2,3,'Transfer',2500,'Money Transfer'),
(4,5,'Transfer',1000,'Money Transfer'),
(NULL,6,'Deposit',7000,'Cash Deposit'),
(7,NULL,'Withdraw',3000,'ATM Withdraw'),
(8,2,'Transfer',450,'Transfer'),
(NULL,9,'Deposit',2000,'Cash Deposit'),
(10,1,'Transfer',1500,'Transfer'),
(5,NULL,'Withdraw',500,'ATM Withdraw');