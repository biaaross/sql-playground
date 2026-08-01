DROP DATABASE IF EXISTS bank_system;
CREATE DATABASE bank_system;
USE bank_system;

-- ==========================
-- CUSTOMERS
-- ==========================

CREATE TABLE customers
(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20) UNIQUE,
    birth_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==========================
-- BRANCHES
-- ==========================

CREATE TABLE branches
(
    branch_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    address VARCHAR(255)
);

-- ==========================
-- ACCOUNTS
-- ==========================

CREATE TABLE accounts
(
    account_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL,

    branch_id INT NOT NULL,

    account_number VARCHAR(20) UNIQUE NOT NULL,

    account_type ENUM
    (
        'Checking',
        'Savings'
    ) NOT NULL,

    balance DECIMAL(12,2)
    DEFAULT 0
    CHECK(balance>=0),

    status ENUM
    (
        'Active',
        'Closed',
        'Blocked'
    )
    DEFAULT 'Active',

    created_at TIMESTAMP
    DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY(branch_id)
        REFERENCES branches(branch_id)
);
-- =========================================
-- CARDS
-- =========================================

CREATE TABLE cards
(
    card_id INT AUTO_INCREMENT PRIMARY KEY,

    account_id INT NOT NULL,

    card_number VARCHAR(20) UNIQUE NOT NULL,

    card_type ENUM
    (
        'Debit',
        'Credit'
    ) NOT NULL,

    cvv CHAR(3) NOT NULL,

    expire_date DATE NOT NULL,

    status ENUM
    (
        'Active',
        'Blocked',
        'Expired'
    )
    DEFAULT 'Active',

    FOREIGN KEY(account_id)
        REFERENCES accounts(account_id)
);

-- =========================================
-- LOANS
-- =========================================

CREATE TABLE loans
(
    loan_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL,

    loan_amount DECIMAL(12,2) NOT NULL,

    interest_rate DECIMAL(5,2) NOT NULL,

    loan_term INT NOT NULL,

    remaining_balance DECIMAL(12,2),

    status ENUM
    (
        'Pending',
        'Approved',
        'Rejected',
        'Completed'
    )
    DEFAULT 'Pending',

    created_at TIMESTAMP
    DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(customer_id)
        REFERENCES customers(customer_id)
);

-- =========================================
-- TRANSACTIONS
-- =========================================

CREATE TABLE transactions
(
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,

    sender_account INT,

    receiver_account INT,

    transaction_type ENUM
    (
        'Deposit',
        'Withdraw',
        'Transfer'
    ) NOT NULL,

    amount DECIMAL(12,2) NOT NULL,

    transaction_date TIMESTAMP
    DEFAULT CURRENT_TIMESTAMP,

    description VARCHAR(255),

    FOREIGN KEY(sender_account)
        REFERENCES accounts(account_id),

    FOREIGN KEY(receiver_account)
        REFERENCES accounts(account_id)
);