CREATE DATABASE IF NOT EXISTS banking_system;
USE banking_system;

-- =====================================================
-- TABLE: customers
-- =====================================================

CREATE TABLE customers
(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    email VARCHAR(100) NOT NULL UNIQUE,

    phone VARCHAR(20) NOT NULL UNIQUE,

    national_id CHAR(11) NOT NULL UNIQUE,

    birth_date DATE NOT NULL,

    city VARCHAR(50) NOT NULL,

    registration_date DATE NOT NULL DEFAULT (CURRENT_DATE),

    status ENUM
    (
        'Active',
        'Inactive',
        'Blocked'
    )
    NOT NULL
    DEFAULT 'Active'
);


-- =====================================================
-- TABLE: branches
-- =====================================================

CREATE TABLE branches
(
    branch_id INT AUTO_INCREMENT PRIMARY KEY,

    branch_name VARCHAR(100) NOT NULL,

    city VARCHAR(50) NOT NULL,

    address VARCHAR(200) NOT NULL,

    phone VARCHAR(20) NOT NULL UNIQUE,

    opening_date DATE NOT NULL,

    status ENUM
    (
        'Active',
        'Inactive'
    )
    NOT NULL DEFAULT 'Active'
);


-- =====================================================
-- TABLE: employees
-- =====================================================

CREATE TABLE employees
(
    employee_id INT AUTO_INCREMENT PRIMARY KEY,

    branch_id INT NOT NULL,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    email VARCHAR(100) NOT NULL UNIQUE,

    phone VARCHAR(20) NOT NULL UNIQUE,

    position VARCHAR(50) NOT NULL,

    salary DECIMAL(12,2) NOT NULL,

    hire_date DATE NOT NULL,

    status ENUM
    (
        'Active',
        'Inactive'
    )
    NOT NULL DEFAULT 'Active',

    CONSTRAINT fk_employee_branch
        FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);


-- =====================================================
-- TABLE: accounts
-- =====================================================

CREATE TABLE accounts
(
    account_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL,

    branch_id INT NOT NULL,

    account_number CHAR(16) NOT NULL UNIQUE,

    account_type ENUM
    (
        'Checking',
        'Savings',
        'Investment'
    )
    NOT NULL,

    balance DECIMAL(12,2)
    NOT NULL
    DEFAULT 0.00,

    currency ENUM
    (
        'TRY',
        'USD',
        'EUR'
    )
    NOT NULL
    DEFAULT 'TRY',

    opened_date DATE NOT NULL,

    status ENUM
    (
        'Active',
        'Frozen',
        'Closed'
    )
    NOT NULL
    DEFAULT 'Active',

    CONSTRAINT fk_account_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_account_branch
        FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);


-- =====================================================
-- TABLE: cards
-- =====================================================

CREATE TABLE cards
(
    card_id INT AUTO_INCREMENT PRIMARY KEY,

    account_id INT NOT NULL,

    card_number CHAR(16) NOT NULL UNIQUE,

    card_type ENUM
    (
        'Debit',
        'Credit'
    )
    NOT NULL,

    cvv CHAR(3) NOT NULL,

    expiry_date DATE NOT NULL,

    credit_limit DECIMAL(12,2)
    DEFAULT 0.00,

    status ENUM
    (
        'Active',
        'Inactive',
        'Blocked',
        'Expired'
    )
    NOT NULL
    DEFAULT 'Active',

    CONSTRAINT fk_card_account
        FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);


-- =====================================================
-- TABLE: loans
-- =====================================================

CREATE TABLE loans
(
    loan_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL,

    account_id INT NOT NULL,

    loan_type ENUM
    (
        'Personal',
        'Vehicle',
        'Housing',
        'Commercial'
    )
    NOT NULL,

    amount DECIMAL(12,2) NOT NULL,

    interest_rate DECIMAL(5,2) NOT NULL,

    remaining_balance DECIMAL(12,2) NOT NULL,

    start_date DATE NOT NULL,

    end_date DATE NOT NULL,

    status ENUM
    (
        'Pending',
        'Active',
        'Closed'
    )
    NOT NULL DEFAULT 'Pending',

    CONSTRAINT fk_loan_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_loan_account
        FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);


-- =====================================================
-- TABLE: transactions
-- =====================================================

CREATE TABLE transactions
(
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,

    sender_account INT NOT NULL,

    receiver_account INT NOT NULL,

    amount DECIMAL(12,2) NOT NULL,

    transaction_type ENUM
    (
        'Transfer',
        'Deposit',
        'Withdraw'
    )
    NOT NULL,

    transaction_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    status ENUM
    (
        'Pending',
        'Completed',
        'Failed',
        'Cancelled'
    )
    NOT NULL DEFAULT 'Pending',

    description VARCHAR(255),

    CONSTRAINT fk_sender_account
        FOREIGN KEY (sender_account)
        REFERENCES accounts(account_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_receiver_account
        FOREIGN KEY (receiver_account)
        REFERENCES accounts(account_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);


-- =====================================================
-- TABLE: transaction_history
-- =====================================================

CREATE TABLE transaction_history
(
    history_id INT AUTO_INCREMENT PRIMARY KEY,

    transaction_id INT NOT NULL,

    sender_account INT NOT NULL,

    receiver_account INT NOT NULL,

    amount DECIMAL(12,2) NOT NULL,

    transaction_type ENUM
    (
        'Transfer',
        'Deposit',
        'Withdraw'
    )
    NOT NULL,

    transaction_date DATETIME NOT NULL,

    status ENUM
    (
        'Pending',
        'Completed',
        'Failed',
        'Cancelled'
    )
    NOT NULL,

    description VARCHAR(255),

    archived_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_history_transaction
        FOREIGN KEY (transaction_id)
        REFERENCES transactions(transaction_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_history_sender
        FOREIGN KEY (sender_account)
        REFERENCES accounts(account_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_history_receiver
        FOREIGN KEY (receiver_account)
        REFERENCES accounts(account_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);


-- =====================================================
-- TABLE: audit_logs
-- =====================================================

CREATE TABLE audit_logs
(
    log_id INT AUTO_INCREMENT PRIMARY KEY,

    table_name VARCHAR(100) NOT NULL,

    operation_type ENUM
    (
        'INSERT',
        'UPDATE',
        'DELETE'
    )
    NOT NULL,

    record_id INT NOT NULL,

    description VARCHAR(300) NOT NULL,

    performed_by VARCHAR(100),

    log_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);