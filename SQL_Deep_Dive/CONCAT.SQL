-- Columns Concatenation
-- We can concat('text', 'text') and we can aslo concat(COLUMN1, COLUMN2)

SELECT *
FROM employees;

SELECT  emp_no,
        first_name,
        last_name,
        CONCAT(first_name, ' ', last_name) AS full_name,
        first_name || ' ' || last_name AS "Full Name"
FROM employees
LIMIT 10;

SELECT  CONCAT(emp_no, ' ', title) AS "Job Title"
FROM titles;







