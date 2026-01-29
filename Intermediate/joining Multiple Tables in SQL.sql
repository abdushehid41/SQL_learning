-- JOINING MULTIPLE TABLES
/* Using salesDB, Retrieve the list of all orders along with related 
customers,product and employee details. 
	for each order display 
- orderid, customer's name, product's name,sales amount, product price, sales person's name*/
/*
SELECT *
FROM orders;
SELECT *
FROM customers;
SELECT * 
FROM products;
SELECT *
FROM employees;
*/
SELECT 
	o.orderid,
    o.sales,
    c.firstname AS customers_firstname ,
    c.lastname AS customers_lastname,
    p.product AS product_name,
    p.price,
    e.firstname AS employee_firstname,
    e.lastname AS  employee_lastname
FROM orders AS o
LEFT JOIN customers AS c
	ON o.customerid = c.customerid
LEFT JOIN products AS p
	ON o.productid = p.productid
LEFT JOIN employees AS e
	ON o.salespersonid = e.employeeid;
	