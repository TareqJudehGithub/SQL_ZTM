
/* 
Indexes
 - An index is construct to improve query performance.
 - An index is like a content to help us find data faster.
 - An index speeds us queries.
 - An index slows down data insertion and updates.
 
 Types on indexes
 	- Single column. 	
		- Apply an index against a single column.
	    - Single column indexes are the most frequent used columns in a query.
	- Multi column.  	
	   	- Apply an index against a multiple column.
		- Retrieves data that satisfies multiple conditions.
	- Unique. 		 	
		- There can be no two of the same values within that index, like a primary key.
		- For speed and integrity
	- Partial			
		- Apply an index against part of the data.
		- Index over a subset of a table.
		CREATE INDEX index_name
		ON table_name 
		WHERE salary > 50000
		
	- Implicit 
		- Automatically created by the database.
		- Primay key
		- unique key
		So when we create a primary key, the database automatically indexes it.
 
 When/where do we use indexes?
	- Foreign keys
	- Primary keys and unique columns(like username or email columns).
	- Columns that end up in the ORDER BY/WHERE clause often.

 When not to use indexes?
  - Just to add an index. Indexes are heavy.
  - Against small tables.
  - Against tables that are updated frequently. The system will be spending lots of time re-indexing.
  - Against columns that contain null values, that will hurt the indexing speed.
  - Against columns that have large values, like comments columns.
*/

-- Create an index
CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, column3,.. );
-- We create an index against a table.
-- we specify which column(s)


-- When do I use a specific type of index?































