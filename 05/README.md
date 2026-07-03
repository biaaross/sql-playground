# SQL HAVING Analysis

This project is part of my SQL learning journey. The goal of this project is to understand how the **HAVING** clause works together with **GROUP BY** and aggregate functions.

I used a sample **books** database and wrote different SQL queries to filter grouped data based on specific conditions.

---

## Topics Covered

* GROUP BY
* HAVING
* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()

---

## Project Structure

```text
sql-having-analysis/
│
├── schema.sql
├── data.sql
├── queries.sql
├── README.md
└── LICENSE
```

---

## Database

The project uses a **books** table with the following columns:

* Book ID
* Title
* Author
* Publisher
* Category
* Language
* Price
* Stock
* Published Year

The database contains **25 sample books** from different categories.

---

## SQL Queries

### COUNT() + HAVING

* Categories with at least 2 books
* Publishers with at least 2 books
* Languages with at least 5 books

### SUM() + HAVING

* Categories with total stock greater than 20
* Publishers with total book price greater than 2000
* Languages with total stock greater than 30

### AVG() + HAVING

* Categories with an average price greater than 1000
* Publishers with an average price greater than 900
* Languages with an average price greater than 700

### MIN() + HAVING

* Categories whose lowest price is greater than 500
* Publishers whose lowest price is greater than 600

### MAX() + HAVING

* Categories whose highest price is greater than 1500
* Publishers whose highest price is greater than 1700

### Bonus Report

A complete report for each category including:

* Total books
* Total stock
* Average price
* Lowest price
* Highest price

Only categories with an average price greater than **800** and a total stock greater than **20** are included.

---

## SQL Concepts Used

* CREATE TABLE
* PRIMARY KEY
* AUTOINCREMENT
* NOT NULL
* CHECK
* DEFAULT
* INSERT INTO
* SELECT
* GROUP BY
* HAVING
* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()
* AS

---

## What I Learned

Through this project, I learned the difference between **WHERE** and **HAVING**.

* **WHERE** filters rows before grouping.
* **HAVING** filters groups after `GROUP BY` has been applied.

This helped me understand how to generate and filter grouped reports using SQL.

---

## Purpose

The purpose of this project is to improve my SQL reporting skills and practice using the **HAVING** clause with aggregate functions.

This repository is part of my learning journey, where I build small SQL projects and document my progress on GitHub.

The next topic in my SQL learning journey will be **JOIN**.
