-- Retrieve all customer data
SELECT *
FROM customers;
-- Retrieve all order data
SELECT *
FROM orders;
-- Retrieve each customer's country, name and score
SELECT country, first_name,score
FROM customers;
-- Retrieve customer with score not equal to 0
SELECT *
FROM customers
WHERE score != 0;
-- Retrieve customers from Germany
SELECT *
FROM customers
WHERE country = 'Germany';
-- Retrieve all customers and sort the results with the highest score first
SELECT *
FROM customers
ORDER BY score DESC;
/*
Retrieve all customers and sort the results by country 
and then by the highest score
*/
SELECT *
FROM customers
ORDER BY
	country ASC,
    score DESC;
-- Find the total score for each country
SELECT 
	country,
    SUM(score) AS total_score
FROM customers
GROUP BY country
ORDER BY total_score;
/* Find the average score for each country
considering onlycustomers  with score not equal to 0
and return only these countries with an average score greater than 430.alter
*/
SELECT country,
	AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING avg_score > 430
ORDER BY avg_score;
-- Retrieve the top 3 customers with highest score value
SELECT  *
FROM customers
ORDER BY score ASC
LIMIT 2;


