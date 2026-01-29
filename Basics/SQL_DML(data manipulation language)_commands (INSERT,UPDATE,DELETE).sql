-- Add two rows to the customers table. (Manually)
	INSERT INTO customers (id,first_name,country,score)
    VALUES (6, 'Abdi', 'Ethiopia',NULL),
			(7,'Abel', NULL, 100);
            SELECT * FROM customers;
            
-- Insert data from 'customers' table  to 'persons' table. (From source table)
	INSERT INTO Persons (id,person_name,birth_date,phone_number)
    SELECT 
		id,
		first_name,
		NULL,
		'UnKnown'
    FROM customers;
    
-- Change the score of the customer ID 6 to 0
UPDATE customers
SET score = 0
WHERE id = 6;

-- Change the score of customer ID 7 to 400 and update the country to Ethiopia
UPDATE customers
SET score = 400,
	country = 'Erhiopia'
WHERE id = 7;

-- Delete all custerms with an ID greater than 5.
DELETE FROM customers
WHERE id > 5;

-- Delete all data from table persons
SET SQL_SAFE_UPDATES = 0;
DELETE FROM persons;
TRUNCATE TABLE persons;


