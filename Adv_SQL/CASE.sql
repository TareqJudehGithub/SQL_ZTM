SELECT	*
FROM orders;

-- Conditional query
SELECT
	orderid,
	orderdate,
	customerid,
	totalamount,
	CASE
		WHEN totalamount > 200 THEN 'VIP Customer' 
		ELSE 'Standard Customer' END AS "Customer"
FROM orders
ORDER BY 1;


-- Conditional filter using WHERE clause
  -- If the customer Id is less than 10, then show only customer with total amount of 100 or less, else 
  -- show customer with total amount of greater than a 100
SELECT	orderid,
		orderdate,
		customerid,
		totalamount
FROM orders
WHERE CASE WHEN customerid < 10 THEN totalamount <- 100 ELSE totalamount > 100 END
ORDER BY customerid;


-- conditionals in aggregate functions:
  -- if a customer spend more than a 100, then refund a $100.
  
SELECT	customerid,
		totalamount,
		SUM(
			CASE
				WHEN totalamount > 100 THEN totalamount -100
				ELSE totalamount
				END
		) AS total_after_discount
FROM orders
GROUP BY 1, 2
ORDER BY 1;


-- Exercise
/**
* Database: Store
* Table: products
* Create a case statement that's named "price class" where if a product is over 20 dollars you show 'expensive'
* if it's between 10 and 20 you show 'average' 
* and of is lower than or equal to 10 you show 'cheap'.
*/

SELECT	prod_id,
		title,
		price,
		CASE
			WHEN price > 20 THEN 'expensive'
			WHEN price BETWEEN 10 AND 20 then 'average'
			ELSE 'cheap'
			END AS "price class"
FROM products;



NULLIF(param1, param2)
/* 
 - IF param1 matches param2, we gonna get NULL
 - If param1 does not match param 2, param1 will be returned.
 - NULLIF() is a good way to fill the empty rows with a NULL.
 - NULLIF() is a good way to avoid 'Divide by zero' error.

*/

-- Excercise

/*
* DB: Store
* Table: products
* Question: Show NULL when the product is not on special (0)
*/

-- Using CASE
SELECT 	prod_id,
		title,
		price,
		special,
		CASE
			WHEN special = 0 THEN NULLIF(NULL, 0) 
			ELSE special END
FROM products
ORDER BY prod_id;


-- Using NULLIF
SELECT 	prod_id,
		title,
		price,
		special,
		NULLIF(special, 0) 
FROM products
ORDER BY prod_id;




