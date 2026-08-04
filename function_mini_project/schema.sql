CREATE DATABASE IF NOT EXISTS bank_management;
USE bank_management;

-- ===========================
-- BRANCHES
-- ===========================

CREATE TABLE branches
(
    branch_id INT AUTO_INCREMENT PRIMARY KEY,

    branch_name VARCHAR(100) NOT NULL,

    city VARCHAR(50) NOT NULL,

    address VARCHAR(255),

    phone VARCHAR(20),

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ===========================
-- CUSTOMERS
-- ===========================

CREATE TABLE customers
(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    birth_date DATE NOT NULL,

    gender ENUM('Male','Female'),

    phone VARCHAR(20),

    email VARCHAR(100),

    city VARCHAR(50),

    address VARCHAR(255),

    register_date DATE NOT NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ===========================
-- EMPLOYEES
-- ===========================

CREATE TABLE employees
(
    employee_id INT AUTO_INCREMENT PRIMARY KEY,

    branch_id INT NOT NULL,

    first_name VARCHAR(50),

    last_name VARCHAR(50),

    position VARCHAR(50),

    salary DECIMAL(10,2),

    hire_date DATE,

    phone VARCHAR(20),

    email VARCHAR(100),

    FOREIGN KEY(branch_id)
    REFERENCES branches(branch_id)
);

-- ===========================
-- ACCOUNTS
-- ===========================

CREATE TABLE accounts
(
    account_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL,

    branch_id INT NOT NULL,

    account_number VARCHAR(20) UNIQUE,

    balance DECIMAL(12,2) DEFAULT 0,

    status ENUM
    (
        'Active',
        'Blocked',
        'Closed'
    ) DEFAULT 'Active',

    opened_date DATE,

    FOREIGN KEY(customer_id)
    REFERENCES customers(customer_id),

    FOREIGN KEY(branch_id)
    REFERENCES branches(branch_id)
);

-- ===========================
-- CARDS
-- ===========================

CREATE TABLE cards
(
    card_id INT AUTO_INCREMENT PRIMARY KEY,

    account_id INT NOT NULL,

    card_number VARCHAR(16) UNIQUE NOT NULL,

    card_type ENUM
    (
        'Debit',
        'Credit'
    ) NOT NULL,

    cvv CHAR(3) NOT NULL,

    expiry_date DATE NOT NULL,

    status ENUM
    (
        'Active',
        'Blocked',
        'Expired'
    ) DEFAULT 'Active',

    FOREIGN KEY(account_id)
    REFERENCES accounts(account_id)
);

-- ===========================
-- LOANS
-- ===========================

CREATE TABLE loans
(
    loan_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL,

    amount DECIMAL(12,2) NOT NULL,

    interest_rate DECIMAL(5,2),

    start_date DATE,

    end_date DATE,

    status ENUM
    (
        'Active',
        'Paid',
        'Cancelled'
    ) DEFAULT 'Active',

    FOREIGN KEY(customer_id)
    REFERENCES customers(customer_id)
);

-- ===========================
-- TRANSACTIONS
-- ===========================

CREATE TABLE transactions
(
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,

    sender_account INT NULL,

    receiver_account INT NULL,

    transaction_type ENUM
    (
        'Deposit',
        'Withdraw',
        'Transfer'
    ) NOT NULL,

    amount DECIMAL(12,2) NOT NULL,

    description VARCHAR(255),

    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(sender_account)
    REFERENCES accounts(account_id),

    FOREIGN KEY(receiver_account)
    REFERENCES accounts(account_id)
);

-- ===========================
-- TRANSFERS
-- ===========================

CREATE TABLE transfers
(
    transfer_id INT AUTO_INCREMENT PRIMARY KEY,

    transaction_id INT NOT NULL,

    transfer_fee DECIMAL(10,2) DEFAULT 0,

    transfer_status ENUM
    (
        'Pending',
        'Completed',
        'Cancelled'
    ) DEFAULT 'Completed',

    FOREIGN KEY(transaction_id)
    REFERENCES transactions(transaction_id)
);

CREATE TABLE transactions
(
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,

    transaction_reference VARCHAR(40) UNIQUE NOT NULL,

    sender_account INT NULL,

    receiver_account INT NULL,

    transaction_type ENUM
    (
        'Deposit',
        'Withdraw',
        'Transfer'
    ) NOT NULL,

    amount DECIMAL(12,2) NOT NULL,

    balance_after DECIMAL(12,2),

    description VARCHAR(255),

    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(sender_account)
        REFERENCES accounts(account_id),

    FOREIGN KEY(receiver_account)
        REFERENCES accounts(account_id)
);