
/*=========================================================
    SELECT
=========================================================*/

SELECT *
FROM books;

SELECT title
FROM books;

SELECT title, price
FROM books;


/*=========================================================
    WHERE
=========================================================*/

SELECT *
FROM books
WHERE price > 1000;

SELECT *
FROM books
WHERE stock < 10;

SELECT *
FROM books
WHERE published_year > 2020;


/*=========================================================
    ORDER BY
=========================================================*/

SELECT *
FROM books
ORDER BY price DESC;

SELECT *
FROM books
ORDER BY price ASC
LIMIT 5;

SELECT *
FROM books
ORDER BY title;


/*=========================================================
    LIMIT
=========================================================*/

SELECT *
FROM books
LIMIT 3;

SELECT *
FROM books
ORDER BY price DESC
LIMIT 1;


/*=========================================================
    BETWEEN
=========================================================*/

SELECT *
FROM books
WHERE price BETWEEN 500 AND 1000;

SELECT *
FROM books
WHERE published_year BETWEEN 2015 AND 2025;


/*=========================================================
    LIKE
=========================================================*/

SELECT *
FROM books
WHERE title LIKE '%Python%';

SELECT *
FROM books
WHERE author LIKE 'Robert%';

SELECT *
FROM books
WHERE publisher LIKE '%Press%';


/*=========================================================
    IN
=========================================================*/

SELECT *
FROM books
WHERE category IN ('Programming', 'Science', 'Finance');

SELECT *
FROM books
WHERE book_id IN (2, 5, 9, 15);


/*=========================================================
    DISTINCT
=========================================================*/

SELECT DISTINCT category
FROM books;

SELECT DISTINCT publisher
FROM books;

SELECT DISTINCT language
FROM books;


/*=========================================================
    UPDATE
=========================================================*/

UPDATE books
SET price = 5
WHERE book_id = 3;

UPDATE books
SET price = price * 90 / 100
WHERE category = 'Programming';

UPDATE books
SET stock = 10
WHERE stock < 5;


/*=========================================================
    DELETE
=========================================================*/

DELETE FROM books
WHERE book_id = 20;

DELETE FROM books
WHERE stock = 0;

DELETE FROM books
WHERE published_year < 1995;