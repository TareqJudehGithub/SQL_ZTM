-- IN keyword
/* 
 - IN checks if a value matches any value in a list of values
*/

SELECT 	*
FROM customers
WHERE customerid IN (1, 3, 10);

-- Exercises
/*
* DB: Store
* Table: orders
* Question: How many orders were made by customer 7888, 1082, 12808, 9623
*/
-- Solution
SELECT 	* 
FROM orders
WHERE customerid IN (7888, 1002, 12808, 9623)
ORDER BY customerid;


/*
* DB: World
* Table: city
* Question: How many cities are in the district of Zuid-Holland, Noord-Brabant and Utrecht?
*/
-- Solution
SELECT 	COUNT(city)
FROM city
WHERE district IN ('Zuid-Holland', 'Noord-Brabant', 'Utrecht');
