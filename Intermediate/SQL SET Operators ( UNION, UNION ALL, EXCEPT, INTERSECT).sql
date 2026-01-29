-- SQL SET OPERATORS
-- Combine the data from employees and customers in to one table
SELECT
	customerid,
    firstname,
    lastname
FROM customers
	UNION
SELECT
	employeeid,
    firstname,
    lastname
FROM employees;


-- Combine the data from employees and customers in to one table, Including duplicates
SELECT
	customerid,
    firstname,
    lastname
FROM customers
	UNION ALL
SELECT
	employeeid,
    firstname,
    lastname
FROM employees;

-- Find the employess who are not customers at the same time
SELECT
	employeeid,
    firstname,
    lastname
FROM employees 
	EXCEPT
SELECT
	customerid,
    firstname,
    lastname
FROM customers;

-- Find employees who are also customers
SELECT
	customerid,
    firstname,
    lastname
FROM customers
	INTERSECT
SELECT
	employeeid,
    firstname,
    lastname
FROM employees;
 -- SQL TASKS
 /*
 Orders are stored in to separate tables(Orders and Orders Archive).
 Combine all orders in to one reports without duplicates
 */
 SELECT *
 FROM orders
	UNION
 SELECT *
 FROM orders_archive;