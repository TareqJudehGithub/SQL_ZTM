
/*
*  Count the number of towns per region
*
*  Database: France
*  Table: Regions (Join + Window function)
*/

SELECT
	DISTINCT 
		r.id AS region_id,
		r.name AS region_name,
		COUNT(t.code) OVER(PARTITION BY r.name ORDER BY r.name ) AS town_name
FROM regions AS r
JOIN departments AS dep
ON r.code = dep.region
JOIN towns AS t
ON dep.code = t.department
ORDER BY r.name;

