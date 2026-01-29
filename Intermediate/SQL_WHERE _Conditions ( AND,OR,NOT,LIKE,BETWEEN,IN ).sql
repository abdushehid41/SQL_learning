-- Retreive all customers who are from USA and have a score greater than 500.
SELECT *
FROM customers
WHERE country = 'USA' AND score > 500;

-- Retreive all customers who are either from USA or have a score greater than 500.
SELECT *
FROM customers
WHERE country = 'USA' OR score > 500;

-- Retreive all customers whose score is not less than 500
SELECT *
FROM customers
WHERE NOT score < 500;

-- Retreive all customers whose scores falls in the range between 100 and 500
SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500;
 -- OR
SELECT *
FROM customers
WHERE score >= 100 AND score <= 500;

-- Retrieve all customers from either Germany or USA
SELECT *
FROM customers
WHERE country IN ('Germany','USA');

-- FIND ALL CUSTOMERS WHOSE FIRST NAME STARTS WITH 'M'
SELECT *
FROM customers
WHERE first_name LIKE 'M%';

-- find the customers whose first name ends with 'n'
SELECT *
FROM customers
WHERE first_name LIKE '%n';

-- Find all customers whose first name contains 'r'
SELECT *
FROM customers
WHERE first_name LIKE '%r%';

-- Find all customers whose first name has 'r' in third position
SELECT *
FROM customers
WHERE first_name LIKE '__r%';