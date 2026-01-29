-- LEFT ANTI JOINS
-- Get all customers who haven't place any orders
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
	ON c.id = o.customer_id
 WHERE  o.customer_id IS NULL;

/* RIGHT ANTI JOINS
Get all orders without matching customers
*/
SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
	ON c.id = o.customer_id
WHERE c.id IS NULL;

-- Get all orders without matching customers (USING LEFT JOINS)
SELECT *
FROM orders AS o 
LEFT JOIN customers AS c
	ON c.id = o.customer_id
 WHERE c.id IS NULL;
 
 -- FULL ANTI JOINS
 -- Find customers without orders and orders without customers
 SELECT *
 FROM customers AS c
 LEFT JOIN orders AS o
	ON c.id = o.customer_id
WHERE O.customer_id IS NULL
	 UNION
SELECT *
FROM customers AS c 
RIGHT JOIN orders AS o
	ON o.customer_id = c.id
WHERE c.id IS NULL;

/* Get all customers along with their orders, but only anly for customers who has placed orders
		(WITHOUT USING JOIN) */
SELECT * 
FROM customers AS c
LEFT JOIN orders AS o
	ON c.id = o.customer_id
WHERE o.customer_id IS NOT NULL;

-- CROSS JOIN
-- Generate all possible combinations of customers and orders. 
SELECT *
FROM customers
CROSS JOIN orders;

    