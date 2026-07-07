SELECT *
FROM trades

SELECT DISTINCT stock_symbol
FROM trades

SELECT DISTINCT sector
FROM trades

SELECT *
FROM trades
LIMIT 10

SELECT *
FROM trades
ORDER BY trade_date DESC
LIMIT 5;


SELECT * 
FROM trades
WHERE trade_type = 'BUY'

SELECT * 
FROM trades
WHERE trade_type = 'SELL'

SELECT *
FROM trades
WHERE profit > 1000

SELECT *
FROM trades
WHERE profit < 0

SELECT *
FROM trades
WHERE sector = 'Technology'

SELECT *
FROM trades
WHERE  IN('Energy','Bank')

SELECT * 
FROM trades
WHERE total_amount BETWEEN 10000 AND 50000

SELECT *
FROM trades
WHERE investor_name LIKE 'A%'

SELECT * 
FROM trades
WHERE stock_symbol LIKE '%A%'

SELECT *
FROM trades
WHERE trade_date BETWEEN 2000 AND 2015


UPDATE trades
SET price = 10
WHERE id = 1

UPDATE trades
SET quantity = 10
WHERE id = 2

UPDATE trades
SET sector = 'Banking'
WHERE id = 3

DELETE trades
WHERE id = 1

DELETE trades
WHERE trade_date < 2000



