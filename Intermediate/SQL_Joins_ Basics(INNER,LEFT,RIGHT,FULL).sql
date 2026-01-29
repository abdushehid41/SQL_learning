/* INNER JOIN
Get all customers along with their orders but for customers who 
have placed an order */
SELECT 
	c.id,
	c.first_name,
	o.customer_id,
	o.sales
FROM customers AS c
INNER JOIN orders AS o
	ON c.id = o.customer_id;
    
/* LEFT JOIN
Get all customers along with their orders, including these whithout orders
*/
SELECT 
	c.id,
	c.first_name,
	o.customer_id,
	o.sales
FROM customers AS c
LEFT JOIN orders AS o
	ON c.id = o.customer_id;

/* RIGHT JOIN
Get all customers along with their orders,
Including orders without matching customers
*/
SELECT 
	c.id,
	c.first_name,
	o.customer_id,
	o.sales
FROM customers AS c
RIGHT JOIN orders AS o
	ON c.id = o.customer_id;

/* Get all customers along with their orders, 
including orders with out matching customers
	(using LEFT JOIN) */

SELECT 
	c.id,
	c.first_name,
	o.customer_id,
	o.sales
FROM  orders AS o
LEFT JOIN customers AS c
	ON c.id = o.customer_id;
    
/* FULL JOIN is not work in MYSQL so i need to use the union of left and right join
Get all customers and all orders even if there is no match
*/
SELECT 
	c.id,
	c.first_name,
	o.customer_id,
	o.sales
FROM customers AS c
LEFT JOIN orders AS o
	ON c.id = o.customer_id
    UNION
SELECT 
	c.id,
	c.first_name,
	o.customer_id,
	o.sales
FROM customers AS c
RIGHT JOIN orders AS o
	ON c.id = o.customer_id;
