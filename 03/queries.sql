/*=========================================================
                    AGGREGATE FUNCTIONS
=========================================================*/

/*=========================================================
                        COUNT()
=========================================================*/

-- Total number of books
SELECT COUNT(*)
FROM books;

-- Number of Programming books
SELECT COUNT(*)
FROM books
WHERE category = 'Programming';

-- Number of Finance books
SELECT COUNT(*)
FROM books
WHERE category = 'Finance';

-- Number of books published after 2020
SELECT COUNT(*)
FROM books
WHERE published_year > 2020;

-- Number of unique categories
SELECT COUNT(DISTINCT category)
FROM books;

-- Number of unique publishers
SELECT COUNT(DISTINCT publisher)
FROM books;

-- Number of books containing "The" in the title
SELECT COUNT(*)
FROM books
WHERE title LIKE '%The%';

-- Number of English books
SELECT COUNT(*)
FROM books
WHERE language = 'English';



/*=========================================================
                          SUM()
=========================================================*/

-- Total price of all books
SELECT SUM(price)
FROM books;

-- Total stock
SELECT SUM(stock)
FROM books;

-- Total stock of Programming books
SELECT SUM(stock)
FROM books
WHERE category = 'Programming';

-- Total price of Science books
SELECT SUM(price)
FROM books
WHERE category = 'Science';

-- Total price of books published after 2015
SELECT SUM(price)
FROM books
WHERE published_year > 2015;

-- Total stock of books priced between 500 and 1000
SELECT SUM(stock)
FROM books
WHERE price BETWEEN 500 AND 1000;



/*=========================================================
                          AVG()
=========================================================*/

-- Average book price
SELECT AVG(price)
FROM books;

-- Average stock
SELECT AVG(stock)
FROM books;

-- Average price of Programming books
SELECT AVG(price)
FROM books
WHERE category = 'Programming';

-- Average price of Finance books
SELECT AVG(price)
FROM books
WHERE category = 'Finance';

-- Average price of books published after 2020
SELECT AVG(price)
FROM books
WHERE published_year > 2020;



/*=========================================================
                          MIN()
=========================================================*/

-- Lowest book price
SELECT MIN(price)
FROM books;

-- Oldest publication year
SELECT MIN(published_year)
FROM books;

-- Lowest Programming book price
SELECT MIN(price)
FROM books
WHERE category = 'Programming';

-- Lowest Science book price
SELECT MIN(price)
FROM books
WHERE category = 'Science';



/*=========================================================
                          MAX()
=========================================================*/

-- Highest book price
SELECT MAX(price)
FROM books;

-- Newest publication year
SELECT MAX(published_year)
FROM books;

-- Highest Programming book price
SELECT MAX(price)
FROM books
WHERE category = 'Programming';

-- Highest Finance book price
SELECT MAX(price)
FROM books
WHERE category = 'Finance';



/*=========================================================
                         BONUS
=========================================================*/

-- Multiple aggregate functions in a single query
SELECT
    AVG(price) AS average_price,
    SUM(stock) AS total_stock,
    MAX(price) AS highest_price,
    MIN(price) AS lowest_price
FROM books;