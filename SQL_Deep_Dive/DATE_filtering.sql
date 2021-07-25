Date

/* 
Universal Coordinate Time (UTC)
Greenwich Mean Time (GMT)
- UTC is a time standard
- GMT is a time zone
- Postgresql stores date and time in UTC format
*/

-- SHOW date and times in current timezone
SHOW TIME ZONE;

-- Set Postgres session in UTC time for the CURRENT session only:
SET TIME ZONE 'UTC';

-- How to set timezone to a certain timezone for all sessions using ALTER USER:
-- Set timezone to UTC:
ALTER USER postgres SET TIMEZONE='UTC';
-- ALTER USER postgres SET timezone 'Asia/Amman';
ALTER USER postgres SET TIMEZONE='Asia/Amman';

/* 
How should we format date and time in Postgres?
 - Postgres uses ISO-8601
 - Date/Time format in sql: YYYY-MM-DDTHH:MM:SS
     2021-07-25T1:38:16+02:00
*/

-- Timestamps
SELECT now();
-- returns current date and time

-- Create new table
CREATE TABLE timezones (
	ts TIMESTAMP WITHOUT TIME ZONE,
	tz TIMESTAMP WITH TIME ZONE
);
-- Add values to table timezones
INSERT INTO timezones VALUES (
	TIMESTAMP WITHOUT TIME ZONE '2000-01-01 10:00:00-05',
	TIMESTAMP WITH TIME ZONE '2000-01-01 10:00:00-05'
);
INSERT INTO timezones VALUES (
	TIMESTAMP WITHOUT TIME ZONE '2021-07-25 02:01:00+03',
	TIMESTAMP WITH TIME ZONE '2021-07-25 02:01:00+03'
);

SELECT 	*
FROM timezones;

-- Date Operators for Postgres

-- Get current date in two ways:
SELECT NOW()::DATE;
SELECT CURRENT_DATE;
 
 -- Using TO_CHAR command to return date in a specific format:
SELECT TO_CHAR(CURRENT_DATE, 'dd/mm/yyyy');
SELECT TO_CHAR(CURRENT_DATE, 'yyyy/mm/dd');


-- Get current time:
SELECT NOW()::TIME;
SELECT CURRENT_TIME;

-- Trying some functions from Postgres official documentation website:
SELECT localtime;
SELECT timeofday();

-- Calculate diff between two dates
SELECT DATE '2000-01-01';

-- Postgres formats date to ISO-8601 date format:
SELECT DATE '2000/1/1';

-- Calculate age:
SELECT AGE(DATE '1975-06-27');

-- Calculate age between two dates:
SELECT AGE(DATE '2000-01-01', DATE '2021-07-25');

-- Extract information using EXTRACT:
SELECT 	EXTRACT (DAY FROM DATE '1975-06-27') AS Day,
		EXTRACT (MONTH FROM DATE '1975-06-27') AS Month,
		EXTRACT (YEAR FROM DATE '1975-06-27') AS Year;

-- Rounding dates

-- Round year (to the begining of the year)
SELECT DATE_TRUNC('year', date '1975-06-27');

-- Round month to the begining of the month:
SELECT DATE_TRUNC('month', date '1975-06-27');

SELECT 	orderid,
		DATE_TRUNC('month', orderdate)
FROM orders
WHERE orderdate BETWEEN '2004-01-01' AND '2004-03-01'
ORDER BY orderdate DESC;

SELECT DATE_TRUNC('month', date '1975-06-27');
-- If we round by 'day' it will set TIMESTAMP to zero


-- Intervals
/* 
- Interval reflects a peroid of time 
- For future or past dates manipulations.
*/

SELECT	NOW() - INTERVAL '30 day';
SELECT DATE '2020-01-01' - INTERVAL '2 WEEK';
SELECT NOW() + INTERVAL '1 YEAR';

SELECT orderdate - INTERVAL '1 month'
FROM orders
ORDER BY orderdate DESC;
 
SELECT orderdate
FROM orders
ORDER BY orderdate DESC;

-- Extracting INTERVALs
SELECT
	EXTRACT (
		YEAR
		FROM
		INTERVAL '5 YEARS 18 MONTHS'
	) AS YEARS;
	
	
-- Exercises:


/*
* DB: Store
* Table: orders
* Question: How many orders were made in January 2004?
*/

-- Using EXTRACT()
SELECT 	COUNT(*) 
FROM orders
WHERE EXTRACT(YEAR FROM orderdate) = 2004 AND EXTRACT(MONTH FROM orderdate) = 1;

-- Using DATE_TRUNCT()

SELECT 	COUNT(*)
FROM orders
WHERE DATE_TRUNC('MONTH', orderdate) = '2004-01-01';









		





