/* 
 Functions list in SQL:
  - (SUM/AVG/MAX/MIN)
  - FIRST_VALUE 	returns a value evaluated against the first row within its partition.
  - LAST_VALUE		returns a value evaluated against the last row within its partition.
  - NTH_VALUE		returns a value evaluated against the nth row in an ordered partition.
  - PERCENT_RANK	returns the relative rank of the current row (rank-1) /(total rows - 1).
  - RANK			Rank the current row within its partition with gaps.
  - ROW_NUMBER		Number the current row within its partition starting from 1
  - LAG/LEAD	 	Access values from the previous or next row.
*/

/* FIRST_VALUE
 	- Returns the very first value (first row) in a partition.
	- With FIRST_VALUE, framing (or RANGE) does not matter, since it's the first value.
	- With First_value, we should ORDER BY the same column in an asceding order.
	- In case of a lowest value scenario, it's best to use MIN instead of FIRST_VALUE.
	
*/

-- compare all prices to the lowest price 
SELECT	*
FROM products;


SELECT 	prod_id,
		category,
		title, 
		price,
		FIRST_VALUE(price) OVER(PARTITION BY category ORDER BY price)
		--OR much easier way:
--		MIN(price) OVER(PARTITION BY category ORDER BY category)
FROM products

WHERE category = 1;

/* 
LAST_VALUE
 - LAST_VALUE is more efficient in a scenario where a the last value (i.e current salary) is 
   needed, But not the highest value.
*/

-- compare all prices to the lowest price 
SELECT 	prod_id,
		category,
		title, 
		price,
		-- Using MAX()which is more efficient in this example:
		MAX(price) OVER(PARTITION BY category ORDER BY category) AS highest_price
		
		-- Using LAST_VALUE()
		/*
		LAST_VALUE(price) OVER(
			PARTITION BY category 
			ORDER BY price
			RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
		) AS highest_price
		*/
FROM products;



















