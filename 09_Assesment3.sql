================== 09 : Assesment 3

Assessment Test 3
Welcome to your final assessment test! This will test your knowledge of the previous section, focused on creating databases and table operations. This test will actually consist of a more open-ended assignment below:

Complete the following task:

Create a new database called "School" this database should have two tables: teachers and students.

The students table should have columns for student_id, first_name,last_name, homeroom_number, phone,email, and graduation year.

The teachers table should have columns for teacher_id, first_name, last_name,

homeroom_number, department, email, and phone.

The constraints are mostly up to you, but your table constraints do have to consider the following:

 We must have a phone number to contact students in case of an emergency.

 We must have ids as the primary key of the tables

Phone numbers and emails must be unique to the individual.

Once you've made the tables, insert a student named Mark Watney (student_id=1) who has a phone number of 777-555-1234 and doesn't have an email. He graduates in 2035 and has 5 as a homeroom number.

Then insert a teacher names Jonas Salk (teacher_id = 1) who as a homeroom number of 5 and is from the Biology department. His contact info is: jsalk@school.org and a phone number of 777-555-4321.

Keep in mind that these insert tasks may affect your constraints!

Best of luck and example scripts are available in the next lecture.


-- Solutions

Solutions to Assessment Test 3
To create the database  simply right-click on the databases drop down menu and select "New Database".

Then you can use the following SQL scripts to execute the tasks:

To create the students table:

CREATE TABLE students(
student_id serial PRIMARY KEY,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL, 
homeroom_number integer,
phone VARCHAR(20) UNIQUE NOT NULL,
email VARCHAR(115) UNIQUE,
grad_year integer);


To create the teachers table:

CREATE TABLE teachers(
teacher_id serial PRIMARY KEY,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL, 
homeroom_number integer,
department VARCHAR(45),
email VARCHAR(20) UNIQUE,
phone VARCHAR(20) UNIQUE);
Then for inserting the student information:

INSERT INTO students(first_name,last_name, homeroom_number,phone,grad_year)VALUES ('Mark','Watney',5,'7755551234',2035);


Then for inserting the teacher information:

INSERT INTO teachers(first_name,last_name, homeroom_number,department,email,phone)VALUES ('Jonas','Salk',5,'Biology','jsalk@school.org','7755554321');




=============== 10. section conditional

-- CASE statement
We can use this to only execute the SQL code when certain conditions are met.
similar to the if conditions in coding language

syntax:
CASE 
WHEN condition1 THEN result1
WHEN condition2 THEN result2
ELSE some_other_result
END

eg :
SELECT a
CASE WHEN a = 1 THEN 'one'
	 WHEN a = 2 THEN 'two'
ELSE 'other' AS label
END
FROM test;


-- CAST

this operator is used to change the data type from one form to another.

SELECT CAST ('5' AS INTEGER)

SHORTHAND : THIS IS ONLY PRESENT IN POSTGRESQL ENGINE

SELECT '10' :: INTEGER

SELECT * FROM rental

-- inventory_id is int we will convert it to varchar using cast to calculate length of the char

SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) FROM rental



we can enter multiple values at once

eg :
we have a table which has 2 col : name & department

INSERT INTO employees(
	name,
	department
)
VALUES
('jay', 'A')
('Sam', 'A')
('Claire', 'B')

SELECT * FROM customer
SELECT * FROM address

-- WE have created a new view, 
-- now whenever we want to access this view we can call it by the name we have given to it
CREATE VIEW customer_info AS
SELECT first_name, last_name, address 
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id

-- getting data from view
SELECT * FROM customer_info

-- we have added 1 more col successfully
CREATE OR REPLACE VIEW customer_info AS
SELECT first_name, last_name, address, district 
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id

-- we can also drop them like table
DROP VIEW IF EXIST customer_info

--  rename view
ALTER VIEW customer_info RENAME TO c_info.. 

SELECT * FROM c_info



---		IMPORT / EXPORT FILE

https://stackoverflow.com/questions/2987433/how-to-import-csv-file-data-into-a-postgresql-table

https://www.enterprisedb.com/postgres-tutorials/how-import-and-export-data-using-csv-files-postgresql

https://stackoverflow.com/questions/21018256/can-i-automatically-create-a-table-in-postgresql-from-a-csv-file-with-headers




