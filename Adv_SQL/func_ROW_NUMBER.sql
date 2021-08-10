/* 
ROW_NUMBER
 - Numbers the current row within the partition starting from 1 regardless of framing.
 - ROW_NUMBER() does not take a parameter; it generates a value.
 - ROW_NUMBER ignores RANGE BETWEEN or ROW_NUMBER ignore window framing
*/


-- Scenario: Get me where my product is positioned in the catogory by price range

SELECT	prod_id,
		category,
		price,
		ROW_NUMBER() OVER (over_filter) AS "position"
FROM products
WINDOW over_filter AS (PARTITION BY category ORDER BY price);