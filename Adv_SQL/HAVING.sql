/*
HAVING
- HAVING keyword is a filter used after GROUP BY.
- HAVING REPLACES WHERE IN aggregation functions, where HAVING applies to groups as a whole instead of individual 
  rows.
- HAVING vs WHERE 
	WHERE applies to individual records.
	HAVING applies to group of records, just like GROUP BY.


*/
SELECT 	dept.dept_name,
		COUNT(emp.emp_no) AS "total_emp"
FROM employees AS emp
JOIN dept_emp AS emp_dep
ON emp.emp_no = emp_dep.emp_no
JOIN departments AS dept
ON emp_dep.dept_no = dept.dept_no
GROUP BY 1
HAVING COUNT(emp.emp_no) > 25000;


-- Exercises
/*
*  Show me all the employees, hired after 1991, that have had more than 2 titles
*  Database: Employees
*/

SELECT	emp.emp_no,
		first_name || ' ' || last_name AS emp_name,
		hire_date,
		COUNT(tit.title) AS titles
FROM employees AS emp
JOIN titles AS tit
ON emp.emp_no = tit.emp_no
GROUP BY 1, 2, 3
HAVING EXTRACT(YEAR FROM hire_date) > 1991 AND COUNT(tit.title) > 2
ORDER BY emp.emp_no;



/*
*  Show me all the employees that have had more than 15 salary changes that work in the department development
*  Database: Employees
*/

SELECT	emp.emp_no,
		emp.first_name || ' ' || emp.last_name AS emp_name,
		COUNT(sal.salary) AS salary_change
FROM employees AS emp
JOIN salaries AS sal
ON emp.emp_no = sal.emp_no
JOIN dept_emp AS emp_dep
ON emp.emp_no = emp_dep.emp_no
JOIN departments AS dep
ON emp_dep.dept_no = dep.dept_no
WHERE dep.dept_name = 'Development'
GROUP BY 1, 2
HAVING COUNT(sal.salary) > 15
ORDER BY 1;


/*
*  Show me all the employees that have worked for multiple departments
*  Database: Employees
*/

SELECT	emp.emp_no,
		emp.first_name || ' ' || emp.last_name AS emp_name,
		COUNT(dep.dept_no) AS total_dept
FROM employees AS emp
JOIN dept_emp AS emp_dep
ON emp.emp_no = emp_dep.emp_no
JOIN departments AS dep
ON emp_dep.dept_no = dep.dept_no
GROUP BY 1, 2
HAVING COUNT(dep.dept_no) > 1
ORDER BY 1;


SELECT e.emp_no, count(de.dept_no) as "worked for # departments"
FROM employees as e
JOIN dept_emp AS de USING(emp_no)
GROUP BY e.emp_no
HAVING count(de.dept_no) > 1
ORDER BY e.emp_no;









