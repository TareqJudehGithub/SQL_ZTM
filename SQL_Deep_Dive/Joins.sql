/* 
Multi table selections
 JOINs
  - Joins combine columns from one table with columns in another.
  - Joins take a column from one table that can map to the column
    of another table.
  - Joins link primary key to a foreign key (using ON clause)
  - Ways of joining data:
  
*/

-- Example of multi table selections
SELECT	a.emp_no,
		a.first_name,
		b.salary
FROM employees AS a, salaries b
WHERE a.emp_no = b.emp_no
ORDER BY a.emp_no
LIMIT 500;


INNER JOIN  (JOIN)
/*
 - INNER JOIN (also known as JOIN) returns matching records from both tables
 - Table on the FROM clause is the left table
 - table on the JOIN clause is the table on the right
 - INNER JOIN is the most common type of joins
 
*/

-- Example of inner joins
SELECT 	a.emp_no AS emp_id,
		a.first_name || ' ' || a.last_name AS full_name,
		b.salary
FROM employees AS a
JOIN salaries AS b
ON a.emp_no = b.emp_no
ORDER BY a.emp_no
LIMIT 1000;


-- Three tables join
-- Find out employees who got a title change
SELECT 	a.emp_no,
		a.first_name || ' ' || last_name AS full_name,
		b.salary,
		c.title,
		b.from_date AS promotion_date
FROM employees AS a
JOIN salaries AS b
ON a.emp_no = b.emp_no
JOIN titles AS c
ON a.emp_no = c.emp_no 
AND (
		b.from_date = c.from_date
	OR
		(b.from_date + INTERVAL '2 days') = c.from_date
	)
ORDER BY a.emp_no, b.from_date;

-- Adding AND c.from_date = b.from_date when joining titles eliminates dates duplications.
-- b.from_date = c.from_date retuns starting date
-- (b.from_date + INTERVAL '2 days') = c.from_date returns promotion date

SELECT	*
FROM salaries
ORDER BY from_date


SELECT	*
FROM titles



/* 
 SELF JOIN
 - SELF JOIN can be done when a table has a foreign key referencing its primary key.
 - SELF JOIN is joining a table to it self.
 - SELF JOIN is the same as INNER JOIN.
 - SELF JOINs are not common.
 - 
*/


/* 
OUTER JOIN
 - OUTER JOIN add data that do no match
 - OUTER JOIN has two types: LEFT JOIN and RIGHT JOIN
 	- LEFT JOIN adds the data that don't have a match from the right table.
	- In LEFT JOIN, the table in the FROM statement is the left table.
	- RIGHT JOIN add the data that don't have a match from the left table.
	- In RIGHT JOIN, the table in the JOIN statement is the right table.
	- Other joins:
		- CROSS JOIN
		- FULL JOIN
*/

SELECT	emp.emp_no,
		dep.emp_no,
		emp.first_name || ' ' || emp.last_name AS fullname
FROM employees AS emp
LEFT JOIN dept_manager AS dep
ON emp.emp_no = dep.emp_no
-- Filter only managers employees using WHERE clause
WHERE dep.emp_no IS NOT NULL;

-- Join tables employees, salaries, and titles returning employee ID, salary, and title.
-- Show title changes by adding OR statement in ON title statement
-- SHOW all salaries between promotions using LEFT JOIN
SELECT	emp.emp_no,
		emp.first_name || ' ' || emp.last_name AS fullname,
		COALESCE(tit.title, 'No title change') AS title,
		sal.salary,
		sal.from_date,
		COALESCE(tit.from_date::text, 'No promation')AS promotion_date
FROM employees AS emp
JOIN salaries AS sal
ON emp.emp_no = sal.emp_no
-- LEFT JOIN returns all salaries before job promotion
LEFT JOIN titles as tit 
ON emp.emp_no = tit.emp_no 
AND (
	sal.from_date = tit.from_date
	OR 
	tit.from_date = (sal.from_date + INTERVAL '2 DAYS')
)
ORDER BY emp.emp_no;


/*
implifying JOINs with the USING keyword
 - USING is most useful in simple joins
 - ON is the recommended to use for joins.
*/
SELECT 	emp.emp_no,
		emp.first_name,
		dept.dept_name
FROM employees AS emp
JOIN dept_emp AS emp_dep USING(emp_no)
JOIN departments AS dept USING(dept_no)
ORDER BY emp.emp_no;



