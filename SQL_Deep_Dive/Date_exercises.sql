
/*
* DB: Employees
* Table: employees
* Question: Get me all the employees above 60, use the appropriate date functions
*/
-- Using 
SELECT	*
FROM employees;
WITH CTE1 AS (
SELECT 
	emp_no AS Id,
	first_name,
	last_name,
	birth_date,
	AGE(NOW(), birth_date) AS emp_age
	FROM employees
),
CTE2 AS (
SELECT 
	first_name || ' ' || last_name AS Emp_name,
	EXTRACT (
	YEAR
	FROM emp_age
	) AS Age
FROM CTE1
)
SELECT 	*
FROM CTE2
WHERE Age >= 60;

-- Without using WITH
SELECT	
		emp_no,
		first_name || ' ' || last_name AS full_name,
		birth_date,
		EXTRACT(YEAR FROM AGE(birth_date)) AS age
FROM employees
WHERE 
	EXTRACT (
		YEAR
		FROM AGE(birth_date) 
) > 60;


/*
* DB: Employees
* Table: employees
* Question: How many employees where hired in February?
*/

SELECT 	COUNT(*)
FROM employees
WHERE EXTRACT(MONTH FROM hire_date) = 2;


/*
* DB: Employees
* Table: employees
* Question: How many employees were born in november?
*/

SELECT 	COUNT(*)
FROM employees
WHERE EXTRACT(MONTH FROM birth_date) = 11;

/*
* DB: Employees
* Table: employees
* Question: Who is the oldest employee? (Use the analytical function MAX)
*/

SELECT 	emp_no,
		first_name || ' ' || last_name AS full_name,
 		MAX(EXTRACT(YEAR FROM AGE(birth_date))) AS emp_age
FROM employees
GROUP BY 1, 2
LIMIT 1;


