/* 
NOT 
 - The not keyword removes result

*/
-- NOT
SELECT	age
FROM customers
WHERE NOT age = 55
ORDER BY age DESC;
