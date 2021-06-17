-- Documentation in SQL

-- filter employee to a specific first_name and last_name (Mayumi Schuller)
SELECT *
FROM employees
WHERE first_name = 'Mayumi' AND last_name = 'Schueller';

/* Common SELECT mistakes 

 - Using " instead of '
 	- Use '' for text and string, and use "" for tables (i.e after AS clause when naming a table)
	- In case a table started with an uppercase, use "" to call the table. example:
		SELECT * FROM "User";
	- As we can see in the ablove statement, SQL is case insensitive. 	
*/ 


WITH CTE1 AS 
(
	SELECT 	first_name AS first_name,
			last_name AS last_name
	FROM employees
),
CTE2 AS
(
	SELECT CONCAT(first_name, ' ', last_name) AS full_name
	FROM CTE1
)
SELECT 	LEFT(full_name, POSITION(' ' in full_name) -1) AS first,
		RIGHT(full_name, LENGTH(full_name) - STRPOS(full_name, ' ')) AS last
FROM CTE2;






