/* 
 - UNION combine multiple SELECT statements results removing duplicates.
 - UNION vs UNION ALL
 	- UNION removes duplicates.
	- UNION ALL does not remove duplicates.
	- We must include an alias for column names when using UNION.
*/

SELECT	NULL AS prod_id,
		SUM(quantity) AS total_sales
FROM orderlines

UNION

SELECT	prod_id AS prod_id,
		SUM(quantity) AS total_sales
FROM orderlines
GROUP BY 1
ORDER BY 1 DESC;


SELECT	*
FROM orderlines;


--WITH and subquaries are alternatives to UNION.
WITH CTE1 AS (
	SELECT	ord.prod_id AS prod_id,
	SUM(ord.quantity) AS sales
	FROM orderlines AS ord
	GROUP BY 1
)
SELECT  SUM(sales) AS total_sales
FROM CTE1;

