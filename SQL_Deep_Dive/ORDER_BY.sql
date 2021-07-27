-- ORDER BY
/* 
ORDER BY is a visualization tool that sorts out data in an ascending or 
a desending order.
*/

SELECT *
FROM employees
ORDER BY first_name, last_name DESC;


-- Using expressions with ORDER BY
SELECT	first_name,
		length(first_name)
FROM employees
ORDER BY length(first_name) DESC;


-- Exercises
/*
* DB: Employees
* Table: employees
* Question: Sort employees by first name ascending and last name descending
*/
SELECT	first_name,
		last_name
FROM employees
ORDER BY first_name, last_name DESC;


/*
* DB: Employees
* Table: employees
* Question: Sort employees by age
*/
SELECT	*,
		EXTRACT(year FROM AGE(NOW(), birth_date))  AS age
FROM employees
ORDER BY birth_date;

-- OR
SELECT * FROM employees
ORDER BY birth_date

/*
* DB: Employees
* Table: employees
* Question: Sort employees who's name starts with a "k" by hire_date
*/
SELECT *
FROM employees
WHERE first_name ILIKE 'k%'
ORDER BY hire_date;