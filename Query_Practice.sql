-- Check SQL version:
SELECT VERSION();

SELECT	id,
		occurred_at,
		total_amt_usd
FROM orders
ORDER BY occurred_at DESC
LIMIT 10;

SELECT 	id,
		account_id,
		total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;


SELECT 	id,
		account_id,
		total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id
LIMIT 20;


SELECT	*
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

SELECT	name,
		website,
		primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

-- divides the standard_amt_usd by the standard_qty to 
-- find the unit price for standard paper for each order. 

SELECT 	id AS "Order ID",
		account_id AS "Account ID",
		ROUND(standard_amt_usd / standard_qty, 2) AS "Unit Price"
FROM orders
LIMIT 10;


SELECT 	id AS "Order ID",
		account_id AS "Account ID",
		ROUND(poster_amt_usd / (standard_amt_usd + gloss_amt_usd + poster_amt_usd), 2) AS "Poster Revenue"
FROM orders
WHERE poster_amt_usd > 0
LIMIT 10;


-- Logical Operators

-- LIKE
SELECT 	*
FROM accounts
WHERE name LIKE '%s';

-- IN
SELECT 	*
FROM orders
WHERE account_id IN (1001, 1091, 1081)
ORDER BY occurred_at DESC
LIMIT 10;

SELECT	*
FROM accounts
WHERE name IN ('Walmart', 'Apple');


SELECT	name,
		primary_poc,
		sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

SELECT	*
FROM web_events
WHERE channel IN ('organic', 'adwords');


-- NOT

SELECT	name,
		primary_poc,
		sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

SELECT	*
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');

SELECT	*
FROM accounts
WHERE name NOT LIKE 'C%';

SELECT	*
FROM accounts
WHERE name NOT LIKE '%one%';


SELECT 	*
FROM accounts
WHERE name NOT LIKE '%s';

-- BETWEEN AND
SELECT 	*
FROM orders
WHERE occurred_at BETWEEN '2013-01-01' AND '2016-12-31';

SELECT	*
FROM orders
WHERE (standard_qty BETWEEN 1000 AND 1500) AND poster_qty = 0 AND gloss_qty = 0;



-- Using the accounts table, find all the companies whose names do not start with 'C' and end with 's'.
SELECT	*
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s';




SELECT *
FROM web_events
WHERE (occurred_at BETWEEN '2016-01-01' AND '2016-12-31') AND channel IN ('organic', 'adwords');


-- OR

SELECT	id,
		gloss_qty,
		poster_qty
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000


SELECT 	name,
		accounts.primary_poc
FROM accounts
WHERE 	(name LIKE 'C%' OR name LIKE 'W%')
  		AND (primary_poc lIKE '%ana%' OR accounts.primary_poc LIKE '%Ana%' )
		AND (accounts.primary_poc NOT LIKE '%eana%');


-- Joins (INNER JOIN)
SELECT 	*
FROM orders AS ord
JOIN accounts AS acc
ON ord.account_id = acc.id;

SELECT 	*
FROM orders AS ord
JOIN accounts AS acc
ON ord.account_id = acc.id
JOIN web_events AS web
ON acc.id = web.account_id;

SELECT *
FROM web_events;


SELECT	acc.primary_poc,
		web.occurred_at,
		web.channel,
		acc.name
FROM accounts AS acc
JOIN web_events AS web
ON acc.id = web.account_id
WHERE acc.name = 'Walmart'
ORDER BY web.occurred_at;

-- LEFT JOIN

SELECT	acc.primary_poc,
		web.occurred_at,
		web.channel,
		acc.name
FROM accounts AS acc
LEFT JOIN web_events AS web
ON acc.id = web.account_id
WHERE acc.name = 'Walmart'
ORDER BY web.occurred_at;

SELECT DISTINCT
		acc.name,
		events.channel
FROM web_events AS events
JOIN accounts AS acc
ON events.account_id = acc.id
WHERE acc.id = 1001;










