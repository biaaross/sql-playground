USE bank_management_system;

INSERT INTO customers (first_name,last_name,email,phone,birth_date,city) VALUES
('Arda','Kucukbas','arda1@example.com','5550000001','2005-01-10','Trabzon'),
('Ahmet','Yilmaz','ahmet@example.com','5550000002','1998-04-11','Ankara'),
('Ayse','Demir','ayse@example.com','5550000003','2000-08-15','Istanbul'),
('Mehmet','Kaya','mehmet@example.com','5550000004','1997-03-01','Izmir'),
('Elif','Can','elif@example.com','5550000005','2002-07-09','Samsun');

INSERT INTO accounts (customer_id,account_number,balance,status,account_type) VALUES
(1,'TR000000000001',12500,'Active','Checking'),
(1,'TR000000000002',3500,'Active','Savings'),
(2,'TR000000000003',850,'Blocked','Checking'),
(3,'TR000000000004',6400,'Active','Checking'),
(4,'TR000000000005',22000,'Active','Savings'),
(5,'TR000000000006',0,'Closed','Checking');

INSERT INTO transactions(sender_account,receiver_account,transaction_type,amount,description) VALUES
(NULL,1,'Deposit',5000,'Initial Deposit'),
(1,4,'Transfer',750,'Rent'),
(4,NULL,'Withdraw',300,'ATM'),
(NULL,5,'Deposit',1000,'Cash Deposit'),
(2,1,'Transfer',250,'Transfer');

INSERT INTO cards(account_id,card_number,card_type,card_status,expiry_date) VALUES
(1,'4000000000000001','Debit','Active','2029-12-31'),
(2,'4000000000000002','Debit','Active','2028-10-31'),
(4,'5000000000000001','Credit','Active','2029-06-30');

INSERT INTO loans(customer_id,loan_amount,interest_rate,loan_status,start_date,end_date) VALUES
(1,50000,2.10,'Approved','2026-01-01','2031-01-01'),
(3,15000,2.80,'Pending','2026-05-01','2029-05-01'),
(4,8000,1.95,'Paid','2024-01-01','2025-01-01');