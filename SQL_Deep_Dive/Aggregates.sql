-- Aggregates

-- COUNT() function

-- How many employees work at the company?
SELECT	COUNT(emp_no) AS "Employee Total"
FROM employees;

-- Get the highest salary available
SELECT	CONCAT('$',MAX(salary))  AS "Highest Salary",
		COUNT(salary) AS "Total Salaries"
FROM salaries;

-- Get total amount of salaries spent
SELECT	CONCAT('$',SUM(salary)) AS "Salaries Total"
FROM salaries;



-- Exercise: Aggregate Functions

-- Question 1: What is the average salary for the company?
-- Table: Salaries
SELECT	ROUND(AVG(salary), 2) AS "Salaries Average"
FROM salaries;


-- Question 2: What year was the youngest person born in the company?
-- Table: employees
SELECT 	MAX(birth_date) AS "Youngest Employees"
FROM employees;


-- BEFORE YOU START
/*
 * What database should I use for these exercises?
 * Name: France
 */
-- 
-- Question 1: How many towns are there in france?
-- Table: Towns
SELECT COUNT(id) AS "Towns Total"
FROM towns;


-- BEFORE YOU START
/*
 * What database should I use for these exercises?
 * Name: World
 */
-- 

-- Question 1: How many official languages are there?
-- Table: countrylanguage
SELECT COUNT (language) AS "Language Total"
FROM countrylanguage
WHERE isofficial = 'true';

-- Question 2: What is the average life expectancy in the world?
-- Table: country
SELECT 	ROUND(AVG(lifeexpectancy)) AS "Life Expectancy Average"
FROM country;

-- Question 3: What is the average population for cities in the netherlands?
-- Table: city
SELECT 	ROUND(AVG(population)) AS "Population Average"
FROM city
WHERE countrycode = 'NLD';

