-- =====================================================
-- DATA : customers
-- =====================================================

INSERT INTO customers
(first_name,last_name,email,phone,national_id,birth_date,city,registration_date,status)
VALUES
('Ahmet','Yılmaz','ahmet.yilmaz@gmail.com','05010000001','12345678901','1994-05-14','İstanbul','2022-01-15','Active'),

('Mehmet','Demir','mehmet.demir@gmail.com','05010000002','12345678902','1988-07-21','Ankara','2021-11-12','Active'),

('Ayşe','Kaya','ayse.kaya@gmail.com','05010000003','12345678903','1998-03-02','Trabzon','2023-04-08','Active'),

('Fatma','Çelik','fatma.celik@gmail.com','05010000004','12345678904','1995-12-09','Samsun','2022-08-19','Active'),

('Ali','Şahin','ali.sahin@gmail.com','05010000005','12345678905','1991-09-17','Bursa','2020-06-01','Blocked'),

('Mustafa','Koç','mustafa.koc@gmail.com','05010000006','12345678906','1986-04-11','İzmir','2019-02-22','Active'),

('Emine','Arslan','emine.arslan@gmail.com','05010000007','12345678907','1997-01-29','Antalya','2023-02-13','Active'),

('Hüseyin','Aydın','huseyin.aydin@gmail.com','05010000008','12345678908','1993-11-06','Adana','2021-05-25','Inactive'),

('Zeynep','Öztürk','zeynep.ozturk@gmail.com','05010000009','12345678909','2000-08-30','Ordu','2024-01-11','Active'),

('Can','Kurt','can.kurt@gmail.com','05010000010','12345678910','1999-10-01','Rize','2023-06-17','Active');



-- =====================================================
-- DATA : branches
-- =====================================================

INSERT INTO branches
(branch_name,city,address,phone,opening_date,status)
VALUES
('İstanbul Merkez','İstanbul','Kadıköy / İstanbul','02160000001','2010-01-01','Active'),

('Ankara Merkez','Ankara','Çankaya / Ankara','03120000002','2011-02-10','Active'),

('İzmir Şubesi','İzmir','Konak / İzmir','02320000003','2012-05-15','Active'),

('Trabzon Şubesi','Trabzon','Ortahisar / Trabzon','04620000004','2015-09-08','Active'),

('Samsun Şubesi','Samsun','İlkadım / Samsun','03620000005','2017-04-03','Active');



-- =====================================================
-- DATA : employees
-- =====================================================

INSERT INTO employees
(branch_id,first_name,last_name,email,phone,position,salary,hire_date,status)
VALUES

(1,'Burak','Yıldız','burak.yildiz@bank.com','05550000001','Manager',85000,'2018-05-10','Active'),

(1,'Gamze','Aksoy','gamze.aksoy@bank.com','05550000002','Customer Representative',42000,'2020-06-18','Active'),

(2,'Murat','Çetin','murat.cetin@bank.com','05550000003','Manager',83000,'2017-03-09','Active'),

(3,'Selin','Demir','selin.demir@bank.com','05550000004','Customer Representative',40000,'2022-01-14','Active'),

(4,'Onur','Koç','onur.koc@bank.com','05550000005','Cashier',36000,'2021-08-01','Active'),

(5,'Elif','Kara','elif.kara@bank.com','05550000006','Customer Representative',39000,'2023-02-20','Active');



-- =====================================================
-- DATA : accounts
-- =====================================================

INSERT INTO accounts
(customer_id, branch_id, account_number, account_type, balance, currency, opened_date, status)
VALUES

(1,1,'1000000000000001','Checking',18500.00,'TRY','2022-01-15','Active'),
(1,1,'1000000000000002','Savings',95000.00,'TRY','2022-02-10','Active'),

(2,2,'1000000000000003','Checking',32000.00,'TRY','2021-11-15','Active'),
(2,2,'1000000000000004','Investment',150000.00,'USD','2022-03-01','Active'),

(3,4,'1000000000000005','Checking',12500.00,'TRY','2023-04-08','Active'),
(3,4,'1000000000000006','Savings',48000.00,'EUR','2023-06-15','Active'),

(4,5,'1000000000000007','Checking',7400.00,'TRY','2022-08-20','Active'),
(4,5,'1000000000000008','Savings',87000.00,'TRY','2022-10-02','Active'),

(5,3,'1000000000000009','Checking',2500.00,'TRY','2020-06-01','Frozen'),

(6,3,'1000000000000010','Checking',41000.00,'TRY','2019-02-22','Active'),
(6,3,'1000000000000011','Investment',215000.00,'USD','2020-04-10','Active'),

(7,2,'1000000000000012','Checking',9500.00,'TRY','2023-02-15','Active'),

(8,4,'1000000000000013','Checking',3000.00,'TRY','2021-05-25','Closed'),

(9,5,'1000000000000014','Checking',62000.00,'TRY','2024-01-12','Active'),
(9,5,'1000000000000015','Savings',140000.00,'EUR','2024-02-01','Active'),

(10,4,'1000000000000016','Checking',11000.00,'TRY','2023-06-18','Active');



-- =====================================================
-- DATA : cards
-- =====================================================

INSERT INTO cards
(account_id, card_number, card_type, cvv, expiry_date, credit_limit, status)
VALUES

(1,'5401000000000001','Debit','421','2029-12-31',0,'Active'),
(2,'5401000000000002','Credit','542','2029-11-30',75000,'Active'),

(3,'5401000000000003','Debit','312','2028-08-31',0,'Active'),
(4,'5401000000000004','Credit','631','2030-06-30',100000,'Active'),

(5,'5401000000000005','Debit','812','2029-03-31',0,'Active'),
(6,'5401000000000006','Credit','901','2030-05-31',50000,'Active'),

(7,'5401000000000007','Debit','453','2028-10-31',0,'Active'),
(8,'5401000000000008','Credit','724','2031-01-31',120000,'Active'),

(9,'5401000000000009','Debit','268','2027-07-31',0,'Blocked'),

(10,'5401000000000010','Debit','187','2029-04-30',0,'Active'),
(11,'5401000000000011','Credit','653','2031-02-28',200000,'Active'),

(12,'5401000000000012','Debit','397','2028-12-31',0,'Active'),

(13,'5401000000000013','Debit','281','2026-11-30',0,'Expired'),

(14,'5401000000000014','Debit','904','2030-09-30',0,'Active'),
(15,'5401000000000015','Credit','615','2032-03-31',90000,'Active'),

(16,'5401000000000016','Debit','744','2029-05-31',0,'Active');



-- =====================================================
-- DATA : loans
-- =====================================================

INSERT INTO loans
(
    customer_id,
    account_id,
    loan_type,
    amount,
    interest_rate,
    remaining_balance,
    start_date,
    end_date,
    status
)
VALUES

(1,1,'Personal',50000,2.15,27500,'2023-01-10','2028-01-10','Active'),

(2,3,'Housing',850000,1.89,720000,'2022-05-12','2032-05-12','Active'),

(3,5,'Vehicle',320000,2.05,210000,'2023-08-20','2029-08-20','Active'),

(4,7,'Personal',75000,2.45,0,'2021-03-01','2026-03-01','Closed'),

(5,9,'Commercial',150000,2.80,120000,'2024-02-15','2030-02-15','Pending'),

(6,10,'Housing',1200000,1.75,980000,'2020-09-01','2035-09-01','Active'),

(7,12,'Personal',40000,2.30,31000,'2024-01-01','2028-01-01','Active'),

(8,13,'Vehicle',280000,2.10,150000,'2022-07-15','2028-07-15','Active'),

(9,14,'Commercial',450000,2.65,390000,'2023-06-10','2031-06-10','Active'),

(10,16,'Personal',60000,2.20,45000,'2024-04-18','2029-04-18','Active');



-- =====================================================
-- DATA : transactions
-- =====================================================

INSERT INTO transactions
(
    sender_account,
    receiver_account,
    amount,
    transaction_type,
    transaction_date,
    status,
    description
)
VALUES

(1,3,2500.00,'Transfer','2024-01-05 09:15:00','Completed','Mobile Transfer'),

(3,1,1250.00,'Transfer','2024-01-06 13:42:00','Completed','Refund'),

(2,5,10000.00,'Transfer','2024-01-08 15:22:00','Completed','Investment'),

(5,7,3200.00,'Transfer','2024-01-09 11:15:00','Completed','Family Support'),

(7,9,750.00,'Transfer','2024-01-10 10:08:00','Completed','Payment'),

(10,12,15000.00,'Transfer','2024-01-12 16:50:00','Completed','Business Payment'),

(12,14,8200.00,'Transfer','2024-01-14 09:45:00','Completed','Invoice'),

(14,16,2400.00,'Transfer','2024-01-15 14:36:00','Completed','Transfer'),

(16,10,1850.00,'Transfer','2024-01-16 18:05:00','Completed','Transfer'),

(1,5,5000.00,'Transfer','2024-01-18 08:12:00','Completed','Transfer'),

(3,7,4500.00,'Transfer','2024-01-20 12:21:00','Completed','Rent'),

(7,1,900.00,'Transfer','2024-01-21 17:40:00','Completed','Refund'),

(9,3,1800.00,'Transfer','2024-01-22 15:30:00','Completed','Transfer'),

(10,5,6400.00,'Transfer','2024-01-24 09:00:00','Completed','Transfer'),

(12,1,950.00,'Transfer','2024-01-25 19:10:00','Completed','Transfer'),

(5,14,7300.00,'Transfer','2024-01-26 10:30:00','Completed','Business'),

(2,10,12000.00,'Transfer','2024-01-27 11:55:00','Completed','Salary'),

(16,3,2850.00,'Transfer','2024-01-29 14:00:00','Completed','Transfer'),

(14,5,3100.00,'Transfer','2024-01-30 16:35:00','Completed','Transfer'),

(9,16,4200.00,'Transfer','2024-02-01 09:18:00','Completed','Transfer');