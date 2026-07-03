# SQL GROUP BY Analysis

This project is part of my SQL learning journey. The main goal of this project is to understand how the **GROUP BY** statement works and how it can be combined with aggregate functions to analyze data.

I used a sample **books** database and wrote different SQL queries to generate reports based on categories, publishers, languages, and publication years.

---

## Topics Covered

* GROUP BY
* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()

---

## Project Structure

```text
sql-groupby-analysis/
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

### COUNT()

* Count books by category
* Count books by publisher
* Count books by language
* Count books by publication year

### SUM()

* Total stock by category
* Total price by category
* Total stock by publisher
* Total stock by language

### AVG()

* Average price by category
* Average price by publisher
* Average price by language

### MIN()

* Lowest book price by category
* Lowest book price by publisher
* Lowest book price by language

### MAX()

* Highest book price by category
* Highest book price by publisher
* Highest book price by language

### Bonus Report

A complete report for each category including:

* Total books
* Total stock
* Average price
* Lowest price
* Highest price

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
* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()
* AS

---

## Purpose

The purpose of this project is to practice the **GROUP BY** statement and improve my SQL reporting skills.

This repository is part of my learning process, where I regularly build small SQL projects and share my progress on GitHub.

The next topic in my SQL journey will be **HAVING**.
