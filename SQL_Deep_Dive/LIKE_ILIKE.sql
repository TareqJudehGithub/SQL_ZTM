-- LIKE and ILIKE

/* 
- LIKE enables us to filter by subsets in values but it's case sensitive.
- ILIKE ignores case sensitivity.
*/

-- firstname starts with a B 
SELECT firstname
FROM customers
WHERE firstname LIKE 'B%';

-- firstname starts with a B or a b
SELECT firstname
FROM customers
WHERE firstname ILIKE 'b%'

-- actor name starts with PES and ends with S
SELECT	*
FROM products
WHERE actor LIKE 'PEN%S';


-- Exercises
/*
* DB: Employees
* Table: employees
* Question: Find the age of all employees who's name starts with M.
* Sample output: https://imgur.com/vXs4093
* Use EXTRACT (YEAR FROM AGE(birth_date)) we will learn about this in later parts of the course
*/
SELECT	*
FROM employees;


SELECT 	emp_no,
		first_name,
EXTRACT (YEAR FROM AGE(birth_date)) as "age" 
FROM employees
WHERE first_name ILIKE 'M%';

/*
* DB: Employees
* Table: employees
* Question: How many people's name start with A and end with R?
* Expected output: 1846
*/
SELECT	COUNT(*)
FROM employees
WHERE first_name ILIKE 'A%R';



/*
* DB: Store
* Table: customers
* Question: How many people's zipcode have a 2 in it?.
* Expected output: 4211 
*/
SELECT	COUNT(customerid) AS "total accounts"
FROM customers
WHERE CAST(zip AS text) LIKE '%2%';	
-- OR WHERE zip::text LIKE '%2%';

SELECT	*
FROM customers;

/*
* DB: Store
* Table: customers
* Question: How many people's zipcode start with 2 with the 3rd character being a 1.
* Expected output: 109 
*/
SELECT	COUNT(customerid) AS "total accounts"
FROM customers
WHERE CAST(zip AS text) LIKE '2_1%';
-- OR WHERE zip::text LIKE '2_1';


/*
* DB: Store
* Table: customers
* Question: Which states have phone numbers starting with 302?
* Replace null values with "No State"                                                  
* Expected output: https://imgur.com/AVe6G4c
*/
SELECT	COALESCE(state, 'No state') AS state
FROM customers
WHERE CAST(phone AS text) LIKE '302%';
-- OR phone::text LIKe '302'