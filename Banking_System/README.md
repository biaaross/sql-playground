# Bank System SQL Project

## Overview

This project is a MySQL-based banking database project developed for practicing advanced SQL concepts.

The current module implements a stored function that generates a customer's financial profile based on the customer's banking data.

---

## Function

### fn_customer_financial_profile

The function receives a customer ID and returns a financial summary as a single text message.

### Parameter

* `p_customer_id INT`

### Return Type

* `VARCHAR(500)`

---

## Features

* Customer financial profile generation
* Account summary
* Total account balance calculation
* Active loan analysis
* Active loan amount calculation
* Card summary
* Transaction summary
* Financial score calculation
* Error handling for invalid customer IDs

---

## SQL Concepts Used

* CREATE FUNCTION
* DECLARE
* CONTINUE HANDLER
* CTE (WITH)
* LEFT JOIN
* Aggregate Functions
* COUNT()
* SUM()
* IFNULL()
* CASE WHEN
* UNION ALL
* SELECT INTO
* SIGNAL SQLSTATE
* IF / ELSEIF / ELSE
* CONCAT()
* RETURN

---

## Example Usage

```sql
SELECT fn_customer_financial_profile(1);
```

Example Output

```
Customer: John Smith
Accounts: 2
Total Balance: 35000.00
Active Loans: 1
Loan Amount: 12000.00
Total Cards: 2
Active Cards: 1
Transactions: 18
Financial Score: Good
```

---

## Project Structure

```
Bank_System/

tables/

functions/
    fn_customer_financial_profile.sql

README.md
TASKS.md
```

---

## Future Improvements

* Stored Procedures
* Database Views
* Triggers
* Transaction Management
* Audit Logs
* Performance Optimization
