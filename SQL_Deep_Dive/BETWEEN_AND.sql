/* 
BETWEEN AND
 BETWEEN AND is more readable and more sustainable
*/

/* 
Exercises:
Who between the ages of 30 and 50 has an income less than 50 000?
(include 30 and 50 in the results)
*/
SELECT  firstname,
		lastname,
		age,
		income
FROM customers
WHERE (age BETWEEN 30 AND 50) AND income < 50000
ORDER BY age;

-- What is the average income between the ages of 20 and 50? (Including 20 and 50)
/*
* Write your query here
*/
SELECT ROUND(AVG(age)) AS "Average Age"
FROM customers
WHERE AGE BETWEEN 20 AND 50;

