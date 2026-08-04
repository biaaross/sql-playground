USE bank_management;

INSERT INTO branches
(
branch_name,
city,
address,
phone
)

VALUES

('Istanbul Central',
'Istanbul',
'Levent / Istanbul',
'02120000001'),

('Ankara Central',
'Ankara',
'Kizilay / Ankara',
'03120000002'),

('Izmir Central',
'Izmir',
'Konak / Izmir',
'02320000003'),

('Trabzon Branch',
'Trabzon',
'Ortahisar / Trabzon',
'04620000004'),

('Samsun Branch',
'Samsun',
'Ilkadim / Samsun',
'03620000005'),

('Bursa Branch',
'Bursa',
'Osmangazi / Bursa',
'02240000006'),

('Antalya Branch',
'Antalya',
'Muratpasa / Antalya',
'02420000007'),

('Adana Branch',
'Adana',
'Seyhan / Adana',
'03220000008'),

('Konya Branch',
'Konya',
'Selcuklu / Konya',
'03320000009'),

('Gaziantep Branch',
'Gaziantep',
'Sehitkamil / Gaziantep',
'03420000010');

INSERT INTO customers
(
customer_number,
national_id,
first_name,
last_name,
birth_date,
gender,
phone,
email,
city,
address,
register_date
)

VALUES

(
10000001,
'11111111111',
'Arda',
'Kucukbas',
'2005-03-15',
'Male',
'05550000001',
'arda@gmail.com',
'Trabzon',
'Trabzon',
'2024-09-01'
),

(
10000002,
'11111111112',
'Ahmet',
'Yilmaz',
'1998-04-22',
'Male',
'05550000002',
'ahmet@gmail.com',
'Ankara',
'Ankara',
'2023-06-18'
),

(
10000003,
'11111111113',
'Ayse',
'Demir',
'1999-08-01',
'Female',
'05550000003',
'ayse@gmail.com',
'Istanbul',
'Istanbul',
'2022-05-10'
),

(
10000004,
'11111111114',
'Mehmet',
'Kara',
'1987-01-11',
'Male',
'05550000004',
'mehmet@gmail.com',
'Samsun',
'Samsun',
'2021-10-01'
),

(
10000005,
'11111111115',
'Fatma',
'Yildiz',
'1995-12-25',
'Female',
'05550000005',
'fatma@gmail.com',
'Izmir',
'Izmir',
'2020-07-18'
);

INSERT INTO accounts
(
customer_id,
branch_id,
account_number,
iban,
balance,
status,
opened_date
)

VALUES

-- Arda
(1,4,'100000000001','TR100000000000000000000001',12500.75,'Active','2024-09-01'),
(1,4,'100000000002','TR100000000000000000000002',35000.00,'Active','2024-09-02'),
(1,4,'100000000003','TR100000000000000000000003',4200.50,'Active','2025-01-15'),

-- Ahmet
(2,2,'100000000004','TR100000000000000000000004',8200.00,'Active','2023-06-18'),
(2,2,'100000000005','TR100000000000000000000005',1500.25,'Blocked','2023-07-05'),

-- Ayşe
(3,1,'100000000006','TR100000000000000000000006',18750.80,'Active','2022-05-10'),
(3,1,'100000000007','TR100000000000000000000007',950.00,'Active','2022-08-01'),

-- Mehmet
(4,5,'100000000008','TR100000000000000000000008',5200.15,'Active','2021-10-01'),
(4,5,'100000000009','TR100000000000000000000009',78000.00,'Active','2022-03-11'),

-- Fatma
(5,3,'100000000010','TR100000000000000000000010',13400.90,'Active','2020-07-18'),
(5,3,'100000000011','TR100000000000000000000011',2500.00,'Closed','2021-01-05');

INSERT INTO cards
(
account_id,
card_number,
card_type,
cvv,
pin_code,
expiry_date,
status
)

VALUES

-- Arda
(1,'5400123412340001','Debit','321','1453','2030-09-30','Active'),
(2,'5400123412340002','Credit','654','2580','2031-03-31','Active'),
(3,'5400123412340003','Debit','781','7531','2029-12-31','Active'),

-- Ahmet
(4,'5400123412340004','Debit','456','9512','2030-06-30','Active'),
(5,'5400123412340005','Credit','147','3579','2029-11-30','Blocked'),

-- Ayşe
(6,'5400123412340006','Debit','852','1111','2030-04-30','Active'),
(7,'5400123412340007','Credit','369','2222','2031-08-31','Active'),

-- Mehmet
(8,'5400123412340008','Debit','159','3333','2032-02-29','Active'),
(9,'5400123412340009','Credit','753','4444','2031-12-31','Active'),

-- Fatma
(10,'5400123412340010','Debit','951','5555','2029-10-31','Active'),
(11,'5400123412340011','Credit','357','6666','2028-05-31','Expired');

INSERT INTO loans
(
customer_id,
amount,
interest_rate,
monthly_payment,
start_date,
end_date,
status
)

VALUES

-- Arda
(1,150000,2.49,6850,'2025-01-15','2028-01-15','Active'),

-- Ahmet
(2,50000,2.19,2450,'2024-05-20','2026-05-20','Active'),

-- Ayşe
(3,80000,1.89,3100,'2023-08-01','2026-08-01','Paid'),

-- Mehmet
(4,300000,2.79,12500,'2024-11-10','2029-11-10','Active'),

-- Fatma
(5,25000,1.75,1100,'2022-01-15','2024-01-15','Paid'),

-- Arda (İkinci Kredi)
(1,20000,1.59,980,'2026-02-01','2028-02-01','Active'),

-- Ahmet
(2,120000,2.35,5200,'2025-06-18','2029-06-18','Cancelled'),

-- Mehmet
(4,75000,2.05,2900,'2023-04-12','2026-04-12','Paid');

INSERT INTO transactions
(
transaction_reference,
sender_account,
receiver_account,
transaction_type,
amount,
balance_after,
description,
transaction_date
)

VALUES

-- PARA YATIRMA

('TRX202600001',NULL,1,'Deposit',2500,15000.75,'ATM Deposit','2026-01-05 10:15:00'),

('TRX202600002',NULL,2,'Deposit',5000,40000.00,'Cash Deposit','2026-01-07 09:20:00'),

('TRX202600003',NULL,4,'Deposit',2000,10200.00,'Salary','2026-01-10 08:10:00'),

('TRX202600004',NULL,6,'Deposit',3500,22250.80,'Cash Deposit','2026-01-11 14:25:00'),

('TRX202600005',NULL,8,'Deposit',7500,12700.15,'ATM Deposit','2026-01-12 11:35:00'),

------------------------------------------------------------

-- PARA ÇEKME

('TRX202600006',1,NULL,'Withdraw',1000,14000.75,'ATM Withdraw','2026-01-13 09:10:00'),

('TRX202600007',4,NULL,'Withdraw',700,9500.00,'ATM Withdraw','2026-01-13 15:42:00'),

('TRX202600008',6,NULL,'Withdraw',5000,17250.80,'Cash Withdraw','2026-01-14 16:10:00'),

('TRX202600009',8,NULL,'Withdraw',2000,10700.15,'ATM Withdraw','2026-01-15 10:25:00'),

('TRX202600010',10,NULL,'Withdraw',1400,12000.90,'Cash Withdraw','2026-01-16 13:40:00'),

------------------------------------------------------------

-- HAVALE / EFT

('TRX202600011',1,4,'Transfer',1500,12500.75,'Rent Payment','2026-01-17 12:20:00'),

('TRX202600012',4,1,'Transfer',900,8600.00,'Refund','2026-01-18 09:15:00'),

('TRX202600013',2,6,'Transfer',3000,37000.00,'Family Transfer','2026-01-18 14:45:00'),

('TRX202600014',6,10,'Transfer',4500,12750.80,'Invoice Payment','2026-01-19 08:55:00'),

('TRX202600015',8,1,'Transfer',5000,5700.15,'Business Transfer','2026-01-20 17:10:00'),

('TRX202600016',10,8,'Transfer',1200,10800.90,'Friend Transfer','2026-01-21 15:00:00'),

('TRX202600017',3,7,'Transfer',600,3600.50,'Transfer','2026-01-22 13:22:00'),

('TRX202600018',7,3,'Transfer',250,700.00,'Transfer','2026-01-23 11:41:00'),

('TRX202600019',9,2,'Transfer',8000,70000.00,'Investment','2026-01-24 10:15:00'),

('TRX202600020',2,9,'Transfer',1500,35500.00,'Transfer','2026-01-25 18:25:00');

INSERT INTO transfers
(
transaction_id,
transfer_fee,
transfer_status
)

VALUES

(11,5,'Completed'),

(12,5,'Completed'),

(13,8,'Completed'),

(14,10,'Completed'),

(15,15,'Completed'),

(16,5,'Completed'),

(17,3,'Completed'),

(18,3,'Completed'),

(19,12,'Completed'),

(20,5,'Completed');

INSERT INTO payments
(
account_id,
payment_type,
invoice_number,
amount,
payment_date
)

VALUES

(1,'Electric','ELC1001',450,'2026-01-05'),

(1,'Internet','NET2001',350,'2026-01-07'),

(2,'Water','WTR3001',180,'2026-01-09'),

(4,'Gas','GAS4001',620,'2026-01-11'),

(6,'Phone','TEL5001',220,'2026-01-13'),

(8,'Electric','ELC1002',710,'2026-01-15'),

(10,'Internet','NET2002',400,'2026-01-18'),

(3,'Phone','TEL5002',260,'2026-01-19'),

(7,'Water','WTR3002',140,'2026-01-20'),

(9,'Gas','GAS4002',950,'2026-01-22');

INSERT INTO logs
(
log_level,
log_message
)

VALUES

('INFO','Database initialized successfully'),

('INFO','Customer account created'),

('INFO','New debit card issued'),

('INFO','Loan created successfully'),

('INFO','Money deposited'),

('INFO','Money withdrawn'),

('INFO','Money transferred'),

('INFO','Electric bill paid'),

('WARNING','Credit card blocked'),

('WARNING','Customer account blocked'),

('WARNING','Wrong PIN entered'),

('WARNING','Large withdrawal detected'),

('ERROR','Transfer failed'),

('ERROR','Loan payment failed'),

('ERROR','Database connection timeout'),

('INFO','Salary deposited'),

('INFO','Interest calculated'),

('INFO','Account balance updated'),

('INFO','Monthly report generated'),

('INFO','Daily backup completed');