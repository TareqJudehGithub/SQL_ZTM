/* 
SUM
 - gets sum if the values within a group depending on the framing
*/

-- Get me how much cumulativley a customer has ordered at our store.

SELECT	cust.customerid,
 		ord.totalamount,
		SUM(ord.totalamount) OVER(PARTITION BY cust.customerid ORDER BY ord.orderid) AS cum_total_amount
FROM customers AS cust
JOIN orders AS ord USING(customerid)
WHERE cust.customerid = 41

/* 
- In the above scenario, we returned customer 41 ordering history in column ord.totalamount, and in column
cum_total_amount we returned a cumulative study of that customer orders over time.
- Notice how we ordered by orderid, we also could order by orderdate.
*/

GROUP BY 1, 2

ORDER BY 1


SELECT 	*
FROM orders;

SELECT 	*
FROM orderlines;

SELECT 	*
FROM products;
