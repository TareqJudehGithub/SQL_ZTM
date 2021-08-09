-- GROUP BY  - Part II

-- Get me the most recent date that employees got a salary raise.
SELECT	emp.emp_no,
		emp.first_name || ' ' || emp.last_name AS emp_name,
		MAX(sal.from_date) AS recent_salary
FROM employees as emp
JOIN salaries AS sal
ON emp.emp_no = sal.emp_no
GROUP BY 1, 2
ORDER BY emp.emp_no;


-- Get me total salaries for every employee in the company.
SELECT	emp.emp_no,
		emp.first_name || ' ' || emp.last_name AS emp_name,
		SUM(sal.salary) AS sum_salaries
FROM employees as emp
JOIN salaries AS sal
ON emp.emp_no = sal.emp_no
GROUP BY 1, 2
ORDER BY emp.emp_no;


-- Get me the max salary for each employee in the company
SELECT	emp.emp_no,
		CONCAT(emp.first_name, '' , emp.last_name) AS emp_name,
		MAX(sal.salary) AS max_salary
FROM employees AS emp
JOIN salaries AS sal
ON emp.emp_no = sal.emp_no
GROUP BY 1, 2
ORDER BY 1;





