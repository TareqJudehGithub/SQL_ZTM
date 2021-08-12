-- INDEX example

SELECT	"name",
		district,
		countrycode
FROM city
WHERE countrycode IN ('TUN', 'BE', 'NL');

EXPLAIN ANALYZE -- explains and analyzes the execution of a query.
SELECT	"name",
		district,
		countrycode
FROM city
WHERE countrycode IN ('TUN', 'BE', 'NL');

-- Creating a new index on City table
CREATE INDEX id_country_code
ON city (countrycode);


-- Create a partial index
CREATE INDEX idx_countrycode
ON city (countrycode)
WHERE countrycode IN ('TUN', 'BE', 'NL');

EXPLAIN ANALYSE
SELECT	"name",
		district,
		countrycode
FROM city
WHERE countrycode IN ('PSE', 'ZWE', 'USA');


-- Using index with algorithms
 
-- Syntax
CREATE INDEX index_name
ON table_name USING <method> (column1, column2, column3,.. );

-- create a new index called id_countrycode on table city, using
-- HASH algorithm on column countrycode
CREATE INDEX id_countrycode
ON city USING HASH (countrycode)


EXPLAIN ANALYSE
SELECT	"name",
		district,
		countrycode
FROM city
WHERE countrycode IN ('PSE', 'ZWE', 'USA');



 