-- Comparison operators

-- != not equal to:
SELECT 	*
FROM inventory
WHERE sales != 13;
-- OR <> also works as not equal to
--WHERE sales <> 13;

-- >= greater than or equal to
SELECT 	*
FROM inventory
WHERE sales >= 13;

-- <= less than or equal to
SELECT 	*
FROM inventory
WHERE sales <= 13;

-- In range
SELECT 	*
FROM inventory
WHERE sales Between 10 AND 13;


SELECT *
FROM customers;

-- How many female customers do we have from the state of Oregon (OR)?
SELECT COUNT(*)
FROM customers
WHERE gender = 'F' AND state = 'OR';
-- Answer is 106

-- Who over the age of 44 has an income of 100 000 or more? (excluding 44)
SELECT	*
FROM customers
WHERE age > 44 AND income >= 100000;

-- Who between the ages of 30 and 50 has an income less than 50 000?
-- (include 30 and 50 in the results)
SELECT 	*
FROM customers
WHERE age BETWEEN 30 AND 50 AND income < 50000;

-- What is the average income between the ages of 20 and 50? (Excluding 20 and 50)
SELECT 	ROUND(AVG(income)) AS "Average Income"
FROM customers
WHERE age > 20 AND age < 50;


