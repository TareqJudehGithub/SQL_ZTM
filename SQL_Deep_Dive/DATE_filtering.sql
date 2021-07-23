Date

/* 
Universal Coordinate Time (UCT)
Greenwich Mean Time (GMT)
- UCT is a time standard
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



