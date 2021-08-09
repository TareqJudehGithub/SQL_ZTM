SELECT	*
FROM orders;

SELECT	orderid,
		orderdate,
		totalamount,
		MAX(totalamount) OVER(ORDER BY orderdate) AS max_total_amount
FROM orders;
