/*
Subquery tools
 - EXISTS
  	- EXISTS checks if the subquery returns any rows.
	- IN	 checks if the value is equal to any of the rows in the return *(NULL yields NULL).
	
	* If we are trying to check a value against NULL, we'll get NULL.
	
	- NOT IN  the opposite of IN.  Show everything other than the NOT IN filter.
	- ANY/SOME checks each row against the operator and if any comparison matches return TRUE.
	- ALL is the inverse of ANY. All checks each row against the operator and if all comparisons
	  match, then it returns TRUE.
	- Single value comparison. 
		A subquery must return a single row.
		Checks comparator against row.
	
*/

-- EXISTS
-- which customers have an income over 90000 and have ordrerd more than 400
SELECT 	c.firstname||' '||c.lastname AS cust_name,
		c.income
FROM customers AS c
WHERE EXISTS (
	SELECT	* 
	FROM orders AS o
	WHERE c.customerid = o.customerid AND totalamount > 400 AND income > 90000
);

-- IN
-- Get me all products in categories 'Comedy', 'Family', and 'Classics'
SELECT prod_id
FROM products
WHERE category IN (
SELECT category FROM categories
	WHERE categoryname IN ('Comedy', 'Family', 'Classics')
);


-- ANY
EXPLAIN ANALYZE
SELECT 	p.prod_id,
		p.category,
		c.categoryname
FROM products AS p
JOIN categories AS c
ON p.category = c.category
--OR WE could:
-- WHERE c.categoryname IN ('Comedy', 'Family', 'Classics')
WHERE p.category = ANY (
	SELECT category FROM categories
	WHERE categoryname IN ('Comedy', 'Family', 'Classics')
);


-- ALL
-- returns all sales above average sales for all product categories
SELECT 	p.prod_id,
		i.sales
FROM products AS p
JOIN inventory AS i USING(prod_id)
WHERE i.sales > ALL (
	SELECT AVG(sales) FROM inventory
	JOIN products AS p1 USING(prod_id)
	GROUP BY  p1.category
);


-- Single value comparison
SELECT	p.prod_id,
		p.category,
		c.categoryname
FROM products AS p
JOIN categories AS c
ON p.category = c.category
WHERE p.category = (
	SELECT category	FROM categories
	WHERE categoryname IN ('Comedy')
);


