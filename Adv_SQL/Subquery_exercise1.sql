-- Exercise:
/* TRY TO WRITE THESE AS JOINS FIRST */
/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or 
  Oregon (OR) state
* ordered by orderid
*/


SELECT	o.orderid,
		c.customerid,
		c.firstname||' '||lastname AS customer_name,
		c.state
FROM orders AS o
JOIN customers	AS c
ON o.customerid = c.customerid
WHERE c.state IN ('OH', 'NY', 'OR')
-- (
-- 	SELECT customerid 
-- 	FROM customers
-- 	WHERE state IN ('OH', 'NY', 'OR')
-- )
ORDER BY o.orderid;


-- OR
SELECT c.firstname, c.lastname, o.orderid 
FROM orders AS o, 
	(
    	SELECT customerid, state, firstname, lastname
		FROM customers
	) AS c
WHERE  o.customerid = c.customerid AND 
c.state IN ('NY', 'OH', 'OR')
ORDER BY o.orderid;
