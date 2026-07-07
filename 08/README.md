```markdown
# 📚 Book Store SQL Project

A SQL practice project designed to improve database querying skills using a realistic bookstore database.

This project focuses on writing SQL queries involving multiple tables, JOIN operations, aggregate functions, filtering, grouping, and data analysis.

---

## 📌 Project Objectives

- Practice SQL fundamentals
- Learn different types of JOIN operations
- Improve database querying skills
- Build a GitHub portfolio project
- Understand relationships between database tables

---

## 🛠 Technologies

- SQL
- SQLite (or compatible SQL databases)

---

## 📂 Project Structure

```

book-store-sql-project/
│
├── schema.sql
├── data.sql
├── queries.sql
└── README.md

```

---

## 🗄 Database Schema

The database consists of five related tables.

### Customers

Stores customer information.

| Column | Description |
|---------|-------------|
| customer_id | Customer ID |
| name | Customer Name |
| city | Customer City |

---

### Authors

Stores author information.

| Column | Description |
|---------|-------------|
| author_id | Author ID |
| author_name | Author Name |

---

### Categories

Stores book categories.

| Column | Description |
|---------|-------------|
| category_id | Category ID |
| category_name | Category Name |

---

### Books

Stores book information.

| Column | Description |
|---------|-------------|
| book_id | Book ID |
| title | Book Title |
| author_id | Author ID |
| category_id | Category ID |
| price | Book Price |

---

### Orders

Stores customer orders.

| Column | Description |
|---------|-------------|
| order_id | Order ID |
| customer_id | Customer ID |
| book_id | Book ID |
| quantity | Purchased Quantity |
| order_date | Order Date |

---

## 📊 SQL Topics Covered

- SELECT
- WHERE
- ORDER BY
- LIMIT
- INNER JOIN
- LEFT JOIN
- Aggregate Functions
  - COUNT()
  - SUM()
  - AVG()
  - MAX()
- GROUP BY
- DISTINCT
- Aliases (AS)
- Calculated Columns

---

## ✅ Implemented Queries

1. List all orders with detailed information.
2. List orders placed by customers from Ankara.
3. Count total orders for each customer.
4. Calculate total books purchased by each customer.
5. Find the best-selling book.
6. Count books in each category.
7. Count books written by each author.
8. Calculate total spending for each customer.
9. Find customers who bought books costing more than 500 TL.
10. Find customers who never placed an order.
11. Find books that have never been sold.
12. Find categories without any books.
13. Find the author of the most expensive book.
14. Find the last order date of each customer.
15. Find the book generating the highest revenue.
16. Calculate total revenue by author.
17. Calculate total books sold by city.
18. List the top 3 customers by purchased books.
19. Calculate the average book price for each category.
20. Generate a complete customer sales report.

---

## 🎯 Learning Outcomes

After completing this project, I gained practical experience with:

- Designing relational database schemas
- Working with primary and foreign keys
- Writing complex JOIN queries
- Using aggregate functions effectively
- Grouping and filtering data
- Performing sales analysis with SQL
- Building portfolio-ready SQL projects

---

## 🚀 Future Improvements

- Add HAVING examples
- Add Subqueries
- Add Common Table Expressions (CTEs)
- Add Window Functions
- Create Views
- Add Index examples
- Optimize complex queries

---

## 👨‍💻 Author

**Arda**

Software Engineering Student

Currently learning:

- C
- C++
- Python
- SQL

---

## ⭐ Repository Purpose

This repository is part of my software engineering learning journey and is intended to improve my SQL skills through hands-on practice with realistic database scenarios.

Thank you for visiting this project!
```
