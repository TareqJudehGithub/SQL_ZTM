/* 
GROUB BY
 - GROUP BY summarize or aggregate data by groups.
 - GROUP BY splits data into chunks or groups.
 - GROUP BY is useful for in-depth knowlege by group.. like payroll by department, or by a certain 
   date.
 - GROUP BY is used excusively with aggregate functions.
 - When we GROUP BY, we apply the function per group, not the entire dataset.
 - GROUP BY reduce all records found for the matching group to a single record.
 - SPLIT-APPLY-COMBINE strategy.
 - 
 
*/

SELECT 	emp_dep.dept_no,
		dep.dept_name,
		COUNT(emp.first_name) AS total_emp
FROM dept_emp AS emp_dep
JOIN departments AS dep USING(dept_no) 
JOIN employees AS emp USING(emp_no)
GROUP BY 1, 2;

SELECT	*
FROM dept_emp;

SELECT	*
FROM departments;


-- Exercises

/*
*  How many people were hired on any given hire date?
*  Database: Employees
*  Table: Employees
*/

SELECT	e.hire_date, 	
		COUNT(emp_no) AS emp_count
FROM employees as e
GROUP BY 1;

/*
*   Show me all the employees, hired after 1991 and count the amount of positions they've had
*  Database: Employees
*/

SELECT 	e.emp_no,
		COUNT(t.title) AS emp_count
FROM employees as e
JOIN titles as t
ON e.emp_no = t.emp_no
WHERE EXTRACT(YEAR from e.hire_date) > 1991
GROUP BY 1;


/*
*  Show me all the employees that work in the department development and the from and to date.
*  Database: Employees
*/

SELECT 	e.emp_no,
		e.first_name,
		dept.dept_name,
		emp_dep.from_date,
		emp_dep.to_date
FROM employees as e
JOIN dept_emp AS emp_dep USING(emp_no)
JOIN departments AS dept
ON emp_dep.dept_no = dept.dept_no
WHERE dept.dept_name ILIKE 'Dev%'
ORDER BY e.emp_no, emp_dep.from_date;

SELECT e.emp_no, de.from_date, de.to_date
FROM employees as e
JOIN dept_emp AS de USING(emp_no)
WHERE de.dept_no = 'd005'
GROUP BY e.emp_no, de.from_date, de.to_date
ORDER BY e.emp_no, de.to_date;

