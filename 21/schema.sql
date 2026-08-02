DROP DATABASE IF EXISTS bank_management_system;
CREATE DATABASE bank_management_system;
USE bank_management_system;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    birth_date DATE,
    city VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    balance DECIMAL(12,2) DEFAULT 0,
    status ENUM('Active','Blocked','Closed') DEFAULT 'Active',
    account_type ENUM('Checking','Savings') DEFAULT 'Checking',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_accounts_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_account INT NULL,
    receiver_account INT NULL,
    transaction_type ENUM('Deposit','Withdraw','Transfer') NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    description VARCHAR(255),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_transactions_sender
        FOREIGN KEY (sender_account)
        REFERENCES accounts(account_id),
    CONSTRAINT fk_transactions_receiver
        FOREIGN KEY (receiver_account)
        REFERENCES accounts(account_id)
);

CREATE TABLE cards (
    card_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    card_number VARCHAR(16) UNIQUE NOT NULL,
    card_type ENUM('Debit','Credit') NOT NULL,
    card_status ENUM('Active','Blocked','Expired') DEFAULT 'Active',
    expiry_date DATE,
    CONSTRAINT fk_cards_account
        FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)
);

CREATE TABLE loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    loan_amount DECIMAL(12,2) NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL,
    loan_status ENUM('Pending','Approved','Rejected','Paid') DEFAULT 'Pending',
    start_date DATE,
    end_date DATE,
    CONSTRAINT fk_loans_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);