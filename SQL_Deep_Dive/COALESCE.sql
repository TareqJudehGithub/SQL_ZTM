/* 
COALESCE clause, enables us to replace NULL value with a value of our choice
- In aggregations, SQL ignores NULL values
*/
-- COALESCE structure
SELECT   *,
         COALESCE(column_name, <'custome value'>) AS alias_name
FROM table_name;

SELECT 	bcolor,
		COALESCE(
			bcolor,
-- 			fcolor,
			'no_value'
		) AS all_colors
FROM distinct_demo;

SELECT 	bcolor,
		COALESCE(
			bcolor,
-- 			fcolor,
			'no_value'
		) AS all_colors
FROM distinct_demo;





-- Exercises

SELECT	*
FROM "Students";
/*
* DB: https://www.db-fiddle.com/f/PnGNcaPYfGoEDvfexzEUA/0
* Question: 
* Assuming a students minimum age for the class is 15, what is the average age of 
a student?
*/
SELECT 	ROUND(AVG(COALESCE(age, 15))) AS "Average Age"
FROM "Students";
-- Answer is 34 years

/*
* DB: https://www.db-fiddle.com/f/PnGNcaPYfGoEDvfexzEUA/0
* Question: 
* Replace all empty first or last names with a default?
*/
SELECT 	id,
		COALESCE(name, 'first name') AS "Default first",
		COALESCE(lastname, 'last name') AS "Default last",
		COALESCE(age, 15) AS age
FROM "Students";





