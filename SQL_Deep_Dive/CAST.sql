/*
CAST
 CAST converts a data type to another
*/
CAST(salary AS text);
-- OR
salary::text;

SELECT	tax,
		CAST(tax AS text) AS tax_text
FROM orders;


