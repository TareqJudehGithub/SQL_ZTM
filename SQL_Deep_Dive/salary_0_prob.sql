-- Using AVG and CAST to find diff between correct and wrong salary average
WITH CTE1 AS 
(
	SELECT	salary,
			REPLACE(CAST(salary AS varchar(255)), '0', '') AS str_salary
	FROM salaries
	LIMIT 10
),
CTE2 AS
(
SELECT 	
--  		salary,
-- 		REPLACE(str_salary, '0', '')
		AVG(salary) AS AVG_Salary,
		AVG(CAST (str_salary AS int8)) AS "AVG Salary w/o 0"	
FROM CTE1
)
SELECT CEIL(AVG_Salary - "AVG Salary w/o 0") AS "Error Difference"
FROM CTE2;

SELECT (4047 - 1795);
