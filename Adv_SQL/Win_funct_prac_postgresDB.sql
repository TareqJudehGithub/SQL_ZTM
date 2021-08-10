-- Get me the maximum total_amt_usd order and compare with the rest of total_amt_usd orders for Walmart.
SELECT	acc.id AS acc_id,
		acc.name AS acc_name,
		ord.total_amt_usd,
		MAX(ord.total_amt_usd) OVER() AS max_order 
FROM orders AS ord
JOIN accounts AS acc
ON ord.account_id = acc.id
WHERE acc.name = 'Walmart'
ORDER BY ord.occurred_at;

-- Get me the most recent total_amt_usd for each account
SELECT	
	DISTINCT
		acc.id AS acc_id,
		MAX(ord.occurred_at) OVER(
			PARTITION BY acc.id
			ORDER BY ord.occurred_at 
			RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
		) AS date,
		LAST_VALUE(ord.total_amt_usd) OVER(
			PARTITION BY acc.id
			ORDER BY ord.occurred_at 
			RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
		) AS total_amt_usd
FROM orders AS ord
JOIN accounts AS acc
ON ord.account_id = acc.id
WHERE acc.name = 'Walmart';


ORDER BY 3 DESC;


SELECT	acc.id AS acc_id,
		acc.name AS acc_name,
		ord.occurred_at,
		ord.total_amt_usd
FROM orders AS ord
JOIN accounts AS acc
ON ord.account_id = acc.id
WHERE acc.name = 'Walmart'
ORDER BY ord.occurred_at DESC
LIMIT 5;