/* 
- A subquery is a construct that allows us to build extreme queries.
- A subquery also called an INNER QUERY or INNER SELECT.
- A subquery is query within another query.
- If a subquery is being run in the FROM clause, we need to include an alias
  for that subquery at the end. Look at Example 2 for more information.
- We cannot manipulate subqueries results internally (ORDER BY is ignored).
  
 
 Subquery vs join
  - Subquery are queries that stand alone.
  - Subquery can return a single result (Example 1) or a row set (Example 2).
  - JOINs combine tables based on a match condition.
  - JOINs can only return a row set, joins never returns a single result.
  - JOINs can be used in the outer queries.
  - JOINs are more performant that subqueries.
  - Use single row operators with single row subquries.
  - If a subquery return NULL, it may not return a result at all.
  - Types of subqueries:
   	- Single row
	- Multiple row
	- Multiple column
	- correlated
	- nested
	
 
*/

-- Single row subqueries examples

-- Example 1. Comparing avg salary with all salaries using Subquery
SELECT 	(SELECT ROUND(AVG(salary)) FROM salaries) AS avg_salary,
		salary
FROM salaries;


-- Example 2. Get me the average salary for the 10 highest employees salary in the company
SELECT ROUND(AVG(salary)) AS avg_salary
FROM (
	SELECT	salary
	FROM salaries
	ORDER BY salary DESC
	limit 10
) AS sub1;


-- Example 3. Get me all salaries that are above the average salary
SELECT 	salary
-- 		AVG(salary) OVER() AS avg_salary
FROM salaries
WHERE salary > (
	SELECT AVG(salary)
	FROM salaries
);
/* 
In Example 3, if we wanted to include the average salaries, the average
will be calculated based on the subquery, so we need to use window functions
in this case.
*/
EXPLAIN ANALYZE
SELECT	salary,
		AVG(salary) OVER() AS avg_salary
FROM salaries
ORDER BY 1 ASC;


-- Here is a statement of all employees salaries that are above the salary average,
-- showing both salary and avg_salary columns, using WITH.

EXPLAIN ANALYZE
WITH CTE1 AS (
	SELECT	salary,
			AVG(salary) OVER() AS avg_salary
			FROM salaries	
)
SELECT 	salary,
		avg_salary
FROM CTE1
WHERE salary > avg_salary
ORDER BY salary;


-- Multiple row
-- Get me all employees working in 'd005', 'd008', 'd001'
EXPLAIN ANALYZE
SELECT	emp_no,
		first_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN ('d005', 'd008', 'd001')
);

-- solution using JOINs.
EXPLAIN ANALYZE
SELECT DISTINCT	emp.emp_no,
		emp.first_name
FROM employees AS emp
JOIN dept_emp AS dept
ON emp.emp_no = dept.emp_no
WHERE dept.dept_no IN ('d005', 'd008', 'd001');

-- Running EXPLAIN ANALYZE, we can see that Subquery performs faster here.


SELECT	*
FROM dept_emp


-- Miltiple Columns query


-- correlated subqueries
 -- a subquery related to its parent.
 -- reference one or more columns in the outer statement
 -- runs against each row
 -- references from the inside query to the outside, but not the opposite way.
 
-- curent salary for each employee 
SELECT 	s.emp_no,
		s.salary,
		s.from_date
FROM salaries AS s
WHERE from_date = (
	SELECT MAX(s2.from_date) AS max
	FROM salaries AS s2
	WHERE s2.emp_no = s.emp_no
)
ORDER BY emp_no;


-- nested subqueries
 -- subquery inside another subquery
 -- nested subqueries are not particulary useful.
 
 
 
-- Using Subqueries
 
-- Get me all employess older than the average age
EXPLAIN ANALYZE
SELECT	emp_no,
		first_name||' '||last_name,
		AGE(hire_date) AS age,
		(SELECT AVG(AGE(hire_date)) FROM employees AS avg_age) 
FROM employees
WHERE AGE(hire_date) > (
	SELECT AVG(AGE(hire_date))
	FROM employees
)
ORDER BY 1 DESC;


-- Solution using WITH
EXPLAIN ANALYZE
WITH CTE1 AS (
	SELECT 	emp_no,
			first_name||' '|| last_name AS emp_name,
			AGE(hire_date) AS age
	FROM employees
)
SELECT  
		AVG(age) OVER() AS avg_age,
		age 
FROM CTE1
WHERE age > (
	SELECT AVG(AGE(hire_date))
	FROM employees
)
ORDER BY emp_no;


-- Show the title by salary (title starting salary)for each employee
SELECT 
		emp.emp_no,
 		emp.first_name||' '||emp.last_name AS emp_name,
		tit.title,
		sal.from_date AS from_date,
		sal.salary
FROM salaries AS sal
JOIN titles AS tit 
ON sal.emp_no = tit.emp_no AND tit.from_date = sal.from_date + INTERVAL '2 days'
JOIN employees AS emp 
ON sal.emp_no = emp.emp_no
ORDER BY emp.emp_no;


-- In the above example, if we don't include from_date in the USING(), then 
-- we will see duplicates of the same employee.


-- Show the most recent employee salaries:
EXPLAIN ANALYZE
SELECT 	emp_no,
		from_date,
		salary
FROM salaries AS outer_sub
WHERE from_date = (
	-- correlated subquery
	SELECT	MAX(from_date)
	FROM salaries AS inner_sub
	WHERE inner_sub.emp_no = outer_sub.emp_no
)
ORDER BY emp_no;

EXPLAIN ANALYZE
SELECT 	emp_no,
		from_date,
		salary
FROM salaries AS s
JOIN last_salary AS l
ON s.emp_no = l.emp_id AND s.from_date = l.date
ORDER BY emp_no;



 