==============  08. Creating DataBase and tables

Choosing correct datatypes while creating DataBase

Boolean
Character
Numeric
Temporal - time related
UUID - universal unique id 
Array
Jsom
Hstore - key value pairs 
special type - network address, geometric type

documentation : https://www.postgresql.org/docs/current/datatype.html

*****
while creating a database and table, take a long time to plan for long term storage.
REMEMBER - You can always remove historical information you have decided you are not using
but, you can go back in time to add in information.



-- 		Primary or foreign key

Primary is a column or a group of column used to identify a row uniquely in a table.
SELECT * FROM cusotomer
-- customer_id column has a PK paramerter which says it is a Primary key in PgAdmin.

Foreign key is a field or a group of fields in a table that uniquely identifies the row in another table.

Table containing foreign key --> child table/ referencing table
Table to which foreign key references/connect --> parent table / referenced table.

a table can have multiple foreign keys for referencing and connection.

customer_id is a foreign key as it is a Primary key to the cusotomer table.

Foreing key is constraint for the table you can find the constraint in the schema of the table.
inside table below column dropdown we will have constraint drop down

SELECT * from payment

-- Constraints

these are the rules enforced on data columns on the table
these are used to prevent invalid data from database.
- NOT NULL constraints
- UNIQUE constraints
- FOREIGN KEY : constraints data based on column in another table
- PRIMARY KEY : uniquely identifies each row and column 
- CHECK constrains : Ensures all the value in a column satisfies the condition
- EXCLUSION
- REFERENCES


CREATE keyword is used to create table

syntax :
CREATE TABLE table_name (
col_name TYPE col_constraints,
col_name TYPE col_constraints,
)

CREATE TABLE table_name (
col_name TYPE col_constraints,
col_name TYPE col_constraints,
table_constraints table_constraint
) INHERITS existing_table_name;


SERIAL datatype : is used to create a sequence i.e. mostly used for creating id.
If you delete any col from data the SERIAL number doesnot change the value for rest of data.
It increaser by 1.



Create a new database
rigth click on database dropdown > create > give it a name > savr & refresh -- done

-- creating table
-- make sure you run the table only once
-- if you run it multiple time it say already exist
	
CREATE TABLE account (
	user_id SERIAL PRIMARY KEY,
	user_name VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
)


CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
)

-- creating a table that has reference to the account and job table

CREATE TABLE account_job(
	-- user_id takes the user_id of the account and enters its id as an integer
	user_id INTEGER REFERENCES account(user_id), 	
	job_id INTEGER REFERENCES job(job_id),
	hire_date	TIMESTAMP
)

-- keep refreshing in order to see the changes you made.


-- 		INSERT

insert allows you to insert the rows to the table
giving all the value to there column and matching there constraints.


>>> inserting into tables
	
SELECT * FROM account

INSERT INTO account(username, password,email,created_on)
VALUES ('Jose', 'password','jose@mail.com',CURRENT_TIMESTAMP)

-- 
SELECT * FROM  job

INSERT INTO job(job_name)
VALUES ('Astronaut')

INSERT INTO job(job_name)
VALUES ('President')


-- 
SELECT * FROM account_job
	
INSERT INTO account_job(user_id, job_id, hire_date)
VALUES
(1,1,CURRENT_TIMESTAMP)

-- Tring to reference the id wich is not ther to see error
-- gives error : invalid foreign key constraints 
INSERT INTO account_job(user_id, job_id, hire_date)
VALUES
(7,1,CURRENT_TIMESTAMP)



-- 		UPDATE

this is used to update the details in the column of the table
	we can also use condition WHERE

we can change the complete column at once i.e. reset the value.
	
UPDATE account
SET last_login = CURRENT_TIMESTAMP

we can take data from another column using (update join)

UPDATE tableA
SET originat_col = tableB.new_col
FROM tableB
WHERE tableA.id = tableB.id

we can also return the affected rows

UPDATE account
SET lost_login = created_on
RETURNING account_id, last_login

>>> -------- updating

SELECT * FROM account

UPDATE account
SET last_login = CURRENT_TIMESTAMP

UPDATE account
SET last_login = created_on


-- we are updating the hire date similar to thr account creaeted on
SELECT * FROM account_job

UPDATE account_job
SET hire_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id

SELECT * FROM account


-- 
UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING email, created_on, last_login


-- 		DELETE

syntax :
DELETE FROM tableA
WHERE row_id = 1

DELETE FROM tableA
USING tableB
WHERE tableA.id = tableB.id

SELECT * FROM job

INSERT INTO job(job_name)
VALUES ('Cowboy')

--	return will return the row removed
DELETE FROM job
WHERE job_name = 'Cowboy'
RETURNING job_id,job_name


-- 		ALTER clause

this allows us to change structure of the existing table.

CREATE TABLE information(
	info_id SERIAL PRIMARY KEY,
	title VARCHAR(500) NOT NULL,
	person VARCHAR(50) NOT NULL UNIQUE
)

SELECT * FROM information

-- changing the name using alter key

ALTER TABLE information
RENAME TO new_info

SELECT * FROM new_info

-- we can alter the constraints

-- new info has a condition that person col should not be empty
-- below code will give error
INSERT INTO new_info(title)
VALUES ('some new title')

-- we are altering this constraints
ALTER TABLE new_info
ALTER COLUMN person DROP NOT NULL

-- now we can to the insert query giving only one column
INSERT INTO new_info(title)
VALUES ('some new title')


-- DROP keyword.
used to remove the complete column in a table

ALTER TABLE table_name
DROP COLUMN col_name CASCADE

CASCADE will remove the all the dependencies to that table.


-- CHECK CONSTRAINTS

CREATE TABLE employees(
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthday DATE CHECK (birthday > '1900-01-01'),
	hire_date DATE CHECK (hire_date > employees.birthday),
	salary INTEGER CHECK (salary > 0)
)

select * from employees

INSERT INTO employees (
	first_name,
	last_name,
	birthday,
	hire_date,
	salary
) 
VALUES (
	'Jose',
	'portia',
	'1999-11-03',
	'2010-01-01',
	100
)
