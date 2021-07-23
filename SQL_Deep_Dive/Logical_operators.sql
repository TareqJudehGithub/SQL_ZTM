/* 
Logical operators
AND		=> both expressions are true in order to return a result.
OR 		=> either of the expressions is true in order to return a result.
NOT		=> neither are true.

Order of operations:
FROM => WHERE => SELECT
 - First we select from the table.
 - Then we filter data in that table.
 - finally, we select which columns to return.
*/ 
SELECT	*
FROM customers
WHERE NOT gender = 'M';

/*

Operator Precedence in SQL
 A statement having multiple operators is evaluated based on the priority of
 operators.

1. Parantheses () are the most important. They will always take the first 
   priority.
2. Multiplication and Division comes 2nd.
3. Subtraction and Addition is next.
4. NOT 
5. AND
6. OR     the least important operator

()  =>  * /  =>  - +  =>  NOT  => AND  => OR

Always remember the following: HIGHEST to LOWEST

1. Parenthesis

2. Arithmetic Operators

3. Concatenation Operators

4. Comparison Conditions

5. IS NULL, LIKE, NOT IN, etc.

6. NOT

7. AND

8. OR

*/



