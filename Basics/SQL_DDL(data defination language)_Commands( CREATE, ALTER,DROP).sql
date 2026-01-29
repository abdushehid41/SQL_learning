/* Create a new table called Persons
 with columns: Id, Person_name,birth_date and phone_number
 */
 CREATE TABLE Persons (
	id INT NOT NULL,
    person_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    phone_number VARCHAR (15) NOT NULL,
    CONSTRAINT pk_persons PRIMARY KEY (id)
 );
 -- Add a new column called email to the persons table
 ALTER TABLE Persons
 ADD email VARCHAR(50) NOT NULL;
 -- Remove a column phone_number from persons table
 ALTER TABLE Persons
 DROP COLUMN phone_number; 
 -- Delete the table Persons from database
	DROP TABLE Persons;