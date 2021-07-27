Distinct

/* 
Distinct removes duplicates data.
*/
SELECT 	COUNT(salary)
FROM salaries

SELECT	DISTINCT COUNT(salary)
FROM salaries;


-- Exercises
/*
* DB: Employees
* Table: titles
* Question: What unique titles do we have?
*/

SELECT DISTINCT title
FROM titles;

-- How may job titles?
WITH CTE1 AS (
	SELECT 	DISTINCT title AS title
	FROM titles
)
SELECT COUNT(*) AS "Job Titles Count"
FROM CTE1;


/*
* DB: Employees
* Table: employees
* Question: How many unique birth dates are there?
*/
SELECT	COUNT(DISTINCT(birth_date)) AS birth_date
FROM employees;

-- Using WITH
WITH CTE1 AS (
	SELECT DISTINCT birth_date AS birth_date
	FROM employees
)
SELECT COUNT(*)
FROM CTE1;



