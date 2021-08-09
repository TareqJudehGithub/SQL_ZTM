/* 
WINDOW functions
 - WINDOW functions creates a new column based on functions performed on a subset or
   a 'window' of the data.
 - WINDOW function is a function that takes arguments.
 - WINDOW function must be followed by OVER keyword.
 - WINDOW function applies against each row, so it can take longer to run.
 - WINDOW function is useful when combining an aggregate column with individual rows.
 - WINDOW keyword act as an alias to prevent code repetition inside the OVER() keyword.
 
 - PARITION BY
	 - PARITION BY divides rows into groups to apply the function against.
	 - PARITION BY is optional.
	 - PARITION BY draws more insights and deeper conclusions.
 
 - ORDER BY inside windowfunctions
 	- 
*/


-- compare each salary against the highest salary
SELECT	*,
		MAX(salary) OVER(sal_desc) AS max_salary
FROM salaries
--WINDOW keyword is an alias that can be used with OVER() as an arguement
WINDOW sal_desc AS (ORDER BY salary DESC)
LIMIT 100;


-- PARTITION BY
-- compare each salary against the average of total salaries.
SELECT	emp.emp_no,
		emp.first_name || ' ' || emp.last_name AS emp_name,
		dept.dept_name,
		sal.salary,
		-- parition salary per department
		AVG(sal.salary) OVER(PARTITION BY dept.dept_name) AS avg_salary
FROM employees AS emp
JOIN salaries AS sal USING(emp_no)
JOIN dept_emp AS emp_dep USING(emp_no)
JOIN departments AS dept USING(dept_no)

-- WINDOW emp_asc AS (ORDER BY emp.emp_no)
LIMIT 1000;


/* 
ORDER BY
 - ORDER BY orders (sorts) the result in OVER()
 - ORDER BY changes the frame of the window function.
 
*/

-- In this example, ORDER BY counts the salaries total for each emp
SELECT	emp_no,
		COUNT(salary) OVER(ORDER BY emp_no) AS sary_total
FROM salaries
GROUP BY 1



