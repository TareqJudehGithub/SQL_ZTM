/* 
VIEWS
 - Views allow us to store and query previously ran queries.
 - Views are the output of the queries we run.
 - Views act like tables, so when we create views we could query them.
 - Views take little space to store. We only store the difintion of a view,
   not all the data returned.
 - There are two types of views:
 	1. Materialized views
	   Stored the data on the physical device (stores the data physically), and updates
	   the data when the table changes (CRUD operations).
	2. Non-materialized views.
	   Query gets re-run each time the view is called on.
	   
 - VIEWs pros and cons:
   - pros:
    1. JOIN syntax with filtering id easier to read.
	2. VIEWs are easier to reason about. 
   
   - cons:
    - We have to write a syntax for creating the VIEW. 
   
*/

-- Non-materialized views.


CREATE VIEW view_name AS your_query;
-- Creates a view
-- CREATE command saves/stores the query under Views tab in DB
-- view_name accepts "" but not ''


CREATE OR REPLACE VIEW view_name AS query;
-- updates a view syntax


ALTER VIEW view_name RENAME TO new_view_name;
-- ALTAR VIEW allows us to alter a view, and rename it to a different name.



DROP VIEW [IF EXISTS] view_name;
-- Deletes a view syntax
-- [IF EXISTS] prevents errors





-- Get me the current salary of all employees and compare it to their starting salary

-- This is the solution using FIRST_VALUE/LAST_VALUE window functions
SELECT	DISTINCT emp.emp_no,
		emp.first_name ||' '||emp.last_name AS emp_name,
		dep.dept_name,
		LAST_VALUE(sal.salary) OVER(
			PARTITION BY emp.emp_no
			ORDER BY sal.from_date
			RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
		) AS current_salary,
		FIRST_VALUE(sal.salary) OVER (
			PARTITION BY emp.emp_no
			ORDER BY sal.from_date
-- 			RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
		) AS latest_date
		
FROM employees AS emp
JOIN salaries AS sal USING(emp_no)
JOIN dept_emp AS emp_dep
ON emp.emp_no = emp_dep.emp_no
JOIN departments AS dep
ON emp_dep.dept_no = dep.dept_no
ORDER BY emp.emp_no;



-- Now let's solve that problem using VIEW:

-- 1. First we create a VIEW and store and MAX(from_date) in salaries table:
CREATE VIEW last_salar_change AS (
	SELECT	emp.emp_no,
		MAX(sal.from_date)
		FROM employees AS emp
		JOIN salaries AS sal USING(emp_no)
		JOIN dept_emp AS emp_dep
		ON emp.emp_no = emp_dep.emp_no
		JOIN departments AS dep
		ON emp_dep.dept_no = dep.dept_no
		GROUP BY 1
		ORDER BY emp.emp_no
);

-- renaming view due to a typo
ALTER VIEW last_salar_change RENAME TO last_salary;


-- updating a column name in the view
ALTER VIEW last_salary
RENAME COLUMN max TO date;

ALTER VIEW last_salary
RENAME COLUMN emp_no TO emp_id;


-- querying a view
SELECT 	*
FROM last_salary
WHERE date BETWEEN '2000-01-01' AND '2002-12-31';


-- 2. JOIN salaries table with the newly created VIEW
SELECT	
	s.emp_no AS emp_ID,
	e.first_name||' '||e.last_name AS emp_name,	
	l.date,
	s.salary
FROM salaries AS s
JOIN employees AS e ON s.emp_no = e.emp_no
JOIN last_salary AS l 
ON s.emp_no = l.emp_id 
-- * AND s.from_date = l.date
WHERE s.from_date = l.date
ORDER BY s.emp_no;

-- * We coulde use ON or WHERE for the from_date.


-- Exercises
/*
*  Create a view "90-95" that:
*  Shows me all the employees, hired between 1990 and 1995
*  Database: Employees
*/

CREATE VIEW "90-95" AS (
	SELECT *
	FROM employees
	WHERE EXTRACT(YEAR FROM hire_date) BETWEEN 1990 AND 1995
	ORDER BY hire_date
);

-- created VIEW above check:
SELECT	*
FROM "90-95";

-- Now, count how many employee hired from 1990 to 1995:
SELECT	COUNT(*) AS employees
FROM "90-95";


/*
*  Create a view "bigbucks" that:
*  Shows me all employees that have ever had a salary over 80000
*  Database: Employees
*/

CREATE VIEW bigbucks AS (
	SELECT emp.emp_no,
			emp.first_name||' '||emp.last_name AS emp_name,
			sal.salary
	FROM employees AS emp
	JOIN salaries AS sal
	ON emp.emp_no = sal.emp_no
	WHERE sal.salary > 80000
	ORDER BY emp.emp_no
);

SELECT *
FROM bigbucks
WHERE emp_name LIKE '%s';













