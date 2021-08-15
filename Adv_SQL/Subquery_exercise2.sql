/*
* DB: Employees
* Table: employees
* Question: Filter employees who have emp_no 110183 as a manager
*/
SELECT	e.emp_no,
		e.first_name||' '||e.last_name AS emp_name,
		dept_manager.dept_no AS dept_id,
		dept.dept_name AS department
FROM employees AS e
JOIN dept_emp AS dep_emp ON e.emp_no = dep_emp.emp_no
JOIN departments AS dept ON dept.dept_no = dep_emp.dept_no
JOIN dept_manager ON dept_manager.dept_no = dep_emp.dept_no
WHERE dept_manager.emp_no = 110183;


-- Now, count that number:

SELECT	
		dept_manager.dept_no AS dept_id,
		dept.dept_name AS department,
		COUNT(e.emp_no) AS employee_count
FROM employees AS e
JOIN dept_emp AS dep_emp ON e.emp_no = dep_emp.emp_no
JOIN departments AS dept ON dept.dept_no = dep_emp.dept_no
JOIN dept_manager ON dept_manager.dept_no = dep_emp.dept_no
WHERE dept_manager.emp_no = 110183
GROUP BY 1, 2;

