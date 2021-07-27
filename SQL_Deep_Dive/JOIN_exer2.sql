-- JOIN exercises

/*
* DB: Employees
* Table: employees
* Question: Show me for each employee which department they work in
*/
SELECT	emp.emp_no,
		emp.first_name,
		dept.dept_name
FROM employees as emp
JOIN dept_emp AS emp_dep
ON emp.emp_no = emp_dep.emp_no
JOIN departments AS dept
ON emp_dep.dept_no = dept.dept_no
ORDER BY emp.emp_no;

-- Solution using USING keyword instead of ON
SELECT	emp.emp_no,
		emp.first_name,
		dept.dept_name
FROM employees AS emp
JOIN dept_emp AS emp_dept USING(emp_no)
JOIN departments AS dept USING(dept_no)
ORDER BY emp.emp_no;
