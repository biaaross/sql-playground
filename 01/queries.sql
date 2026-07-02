SELECT *
FROM books

SELECT title
FROM books

SELECT *
FROM books
WHERE category = 'Programming'

SELECT *
FROM books
WHERE price>1000

SELECT *
FROM books
WHERE stock>10

SELECT *
FROM books
WHERE published_year > 2020

SELECT *
FROM books
WHERE language  = 'Turkish'

SELECT *
FROM books
ORDER BY price DESC
LIMIT 1

SELECT * 
FROM books
ORDER BY price ASC
LIMIT 5

SELECT *
FROM books
WHERE category = 'Programming'
ORDER BY price DESC

SELECT *
FROM books
WHERE category = 'Science'

SELECT *
FROM books
WHERE price >= 500 AND price <= 1500

SELECT *
FROM books
WHERE stock <= 5

SELECT * 
FROM books
ORDER BY publisher

SELECT * 
FROM books
ORDER BY published_year DESC
LIMIT 3


