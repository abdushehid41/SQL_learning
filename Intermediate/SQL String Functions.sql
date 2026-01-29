-- STRING FUNCTION
-- Show a list of customers, first name together with their country in one column. 
SELECT 
	first_name,
    country,
    CONCAT(first_name, ' ', country) AS name_country
FROM customers;

-- Transform the customers' first name in to lowercase and last name into uppercase
SELECT 
	first_name,
    country,
    LOWER(first_name) AS lower_name,
    UPPER(first_name) AS upper_name
FROM customers;
-- TRIM
-- Find the customers whose the first name contains leading or trailing spaces
SELECT 
first_name
FROM customers
 WHERE first_name != TRIM(first_name);
 
 -- REPLACE
 -- Remove dash (-) from phone number
 SELECT
 '123-456-789' AS old_phone,
 REPLACE('123-456-789','-','/') AS clean_phone;
 
 -- Replace file extent from txt to csv
 SELECT 
'report.txt' AS txt_file,
REPLACE('report.txt','txt','csv') AS csv_file;

-- LENGTH
-- Calculate the length of each customer's first name
SELECT
first_name,
LENGTH(first_name) AS length
FROM customers;

-- LEFT AND RIGHT
-- Retrieve the first two characters of the first name
SELECT 
first_name,
LEFT(TRIM(first_name),2) AS two_laters
FROM customers;
 
 -- Retrieve the last two characters of the first name
SELECT 
first_name,
RIGHT(TRIM(first_name),2) AS two_laters
FROM customers;

-- SUBSTRING
-- Retrieve a list of customer's first names removing the first characters
SELECT 
	first_name,
    SUBSTR(first_name,2,LENGTH(first_name)) AS sub_str
FROM customers;
 