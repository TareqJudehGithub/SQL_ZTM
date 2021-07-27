/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/
SELECT	ord.orderid,
		cust.customerid,
		cust.firstname,
		cust.state
FROM orders AS ord
JOIN customers AS cust
ON ord.customerid = cust.customerid
WHERE cust.state IN ('OH', 'NY', 'OR')
ORDER BY ord.orderid;



/*
* DB: Store
* Table: products
* Question: Show me the inventory for each product
*/
SELECT	pro.prod_id,
		pro.title,
		pro.category,
		pro.actor,
		pro.special
FROM inventory AS inv
JOIN products AS pro
ON inv.prod_id = pro.prod_id
ORDER BY pro.prod_id;



