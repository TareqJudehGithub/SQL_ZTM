NULL

/* - A NULL value is different from a zero value
   - NULL values are values that are empty
   - NULL is used to represent an empty value, not =
   - Always check for NULLs when necessary
   - Filter out NULLs
   - Use IS for filtering NULL, NOT NULL, TRUE, or FALSE
    */  
          WHERE name IS NULL;
          WHERE is_logged IS NOT FALSE;
          WHERE total IS NOT NULL;
      /*  
*/

-- This statement below will return everything and reject nothing
SELECT	bcolor
FROM distinct_demo
WHERE bcolor IS NULL
OR  bcolor IS NOT NULL;