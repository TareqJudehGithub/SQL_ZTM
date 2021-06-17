
-- AND and OR
-- WHERE order of operation

-- AND is chained to the statement before it (chains multiple criteria to filter).
-- OR  orders SQL to start over a new query search (new filter).


-- Exercise: Filtering Data
-- How many female customers do we have from the state of Oregon (OR) and New York (NY).

SELECT 	firstname,
		lastname,
		state,
		gender
FROM customers
WHERE (state = 'NY' OR state = 'OR') AND gender = 'F';

-- We notice here, the parantheses combined both state statements as one, because 
-- without them, we would had to repeat AND gender = 'F' twice next to each state statement.
