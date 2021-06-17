-- Exercise: Simple queires.
SELECT  *
FROM employees;

SELECT  *
FROM departments;

-- How many times has employee 10001 had a raise?
SELECT  emp_no,
        COUNT(salaries) AS raise_count
FROM salaries
WHERE emp_no = 10001
GROUP BY 1;
-- >>> 17

-- What title does employee 10006 have?
SELECT *
FROM titles
WHERE emp_no = 10006;
-- >>> Senior Enginer

-- Renaming columns
SELECT  emp_no AS "Employee ID",
        birth_date AS "Birth Date",
        first_name AS "First Name"
FROM employees
LIMIT 10;
