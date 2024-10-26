=========================== 02. Introduction

Challenge 
You are hired as a consultant for a dvd rental store

In order to locate all the table and there column in PgAdmin GUI
click on arrows for drop down
dvdrental DB > Schemas > Public > table > column

Fundamental of SQl (sql Syntax)

============    SELECT
It is used to retrieve data from the DataBase.
select this column from this table and stop.
>> SELECT (-column_name-) FROM (-table_name-);


Asterisk (*) this is use to say -ALL-
select all from actor table and stop
>> SELECT * FROM actor;
>> SELECT last_name, first_name FROM actor;


we have query histor tab just beside the query editor tab.
this hisory tab store all the query you have written and executed.


Challenge structure/Format
- Business situation
- Challenge question
- expected answers
- Hints
- Solutions


*** Quick Challenge SELECT

-- - we want to send out a promotional email to our existing customers.
-- - Use a SELECT statement to grab the 1st and last name of every customer and their email address.

>> SELECT first_name, last_name, email FROM customer_table;





=======================     SELECT DISTINCT

DISTINCT keyword is used where you only want unique and distinct value to your column.
works only for column

i.e. we will get no repetition or a duplicate entry.

>> SELECT DISTINCT (-column-) FROM table;
>> SELECT name FROM color_table


>> SELECT DISTINCT (release_year) FROM film;
>> SELECT DISTINCT (rental_rate) FROM film;


*** Quick Challenge

- A family is not familiar with movie rating, simply what types of rating do we have.
- Just get the distint method on the ratng column


>> SELECT DISTINCT (rating) FROM film;







=======================     COUNT function

- returns the number of the rows.
- Since count is a function we have to give the paramerter i.e condition in the Paranthesis.

>> SELECT COUNT(name) FROM table;
-- this will give you the number of rows for name column

>> SELECT COUNT(DISTINCT name) FROM table;
-- this will return you the number of distinct data row for name column


SELECT COUNT(*) FROM payment;
-- - number of rows in the payment.
-- - we can also do this for any column.

SELECT amount FROM payment;
-- - Shows all the amount rows.

SELECT DISTINCT amount FROM payment;
-- - Shows all the distinct amount

SELECT COUNT (DISTINCT amount) FROM payment;
-- - Gives the number of rows for distinct amount column.





=======================     WHERE clause

- WHERE statement allows you to specify condition on column for the rows to be returned.
- i.e. return me rows of the column price WHERE value < 100.
- Comparison operator.
- Logical operator.

>>
SELECT name,choice FROM table;
WHERE name = "David"

You can write the conditions in 1 line or miltiple lines.

SELECT name,choice FROM table;
WHERE name = "David" AND choice = "Red"


SELECT * FROM customer
WHERE first_name='Jared';


SELECT * FROM film
WHERE rental_rate >= 4 
AND replacement_cost >= 19.99
AND rating= 'R';

SELECT COUNT(*) FROM film
WHERE rental_rate >= 4 
AND replacement_cost >= 19.99
AND rating= 'R';

SELECT COUNT(*) FROM film
WHERE rating= 'R' OR rating='PG-13';

SELECT COUNT(*) FROM film
WHERE rating != 'R';


*** Quick Challenge

1.
a customer forgot their wallet at store. we need to track their email to inform them.
The nmae of the customer is 'Nancy Thomas'

SELECT email FROM customer
WHERE first_name = 'Nancy'
AND last_name = 'Thomas'

2. 
Customer wants to know what the movie 'Outlaw Hanky' is about.
Give them description of this movie

SELECT description FROM film
WHERE title = 'Outlaw Hanky';

3.
Customer is late on their movie return and we have mailed the letter to their address @ '259 Ipoh Drive'. we should call them to inform them.
retrieve their phone number.

SELECT phone FROM address
WHERE address = '259 Ipoh Drive';





=======================     ORDER BY

Syntax:
SELECT col_1, col_2
FROM table
ORDER BY col_1 ASC/DESC;

bydefault it will do ASC

-- Ascending order
SELECT * FROM customer
ORDER BY first_name

-- Descending order
SELECT * FROM customer
ORDER BY first_name DESC
	
-- Arranging store id and then the customer name
SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id, first_name

-- This gives the same result as above it jsut returns the column and not the store id
SELECT first_name, last_name FROM customer
ORDER BY store_id, first_name




=======================     LIMIT

Allows us to limit the number of rows returned for a query.

limit command is written at the very end of your query & is the last command to be executed.
.. it simply says 'How many rows do you want'

-- This will give us the most recent payments
SELECT * FROM payment
ORDER BY payment_date DESC


-- This will give us the 5 most recent payments
SELECT * FROM payment
ORDER BY payment_date DESC
LIMIT 5;


-- This will give us the 5 most recent payments and except transaction amount of 0.00
SELECT * FROM payment
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 5;

-- This is just to know the header and their datatypes.
SELECT * FROM payment
LIMIT 1;


*** Quick Challenge

1.
-- we want to reward our 1st 10 paying customers.
-- What are the id's of the 1st 10 customers who created payment ?

SELECT customer_id 
FROM cusotomer
ORDER BY payment_date ASC
LIMIT 10;

2.
-- customer want to quickly rent a video to watch at short lunch break.
-- What are the title of 5 shortest movie in length runtime.

SELECT * FROM film 
LIMIT 1;

SELECT title,length FROM film
ORDER BY length ASC
limit 5;



3. 
IF prev customer can watch any movie that is 50 min or less in run time, how many options does she have?

SELECT COUNT(title) FROM film
WHERE length <= 50;




=======================     BETWEEN command

BETWEEN keyword operator
this can be used to match a value against a range of values 'BETWEEN' Low and high limit.
i.e. value >= low AND value <= high
Inclusive of the end points.

NOT BETWEEN
exclusive of the range limit/end points.
to get the numbers outside the range.
value 'NOT BETWEEN' low AND high

BETWEEN can also be used with date.
If they are in the format of ISO-8601 format i.e YYYY-MM-DD (2000-10-17).
date BETWEEN '2000-10-17' AND '2001-01-17'

SELECT * FROM payment
LIMIT 2;

SELECT * FROM payment
WHERE amount BETWEEN 8 and 9;

SELECT COUNT(*) FROM payment
WHERE amount BETWEEN 8 and 9;

SELECT COUNT(*) FROM payment
WHERE amount NOT BETWEEN 8 and 9;

-- Between with date is excluded with last number
SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' and '2007-02-15';





=======================     IN operator


Checks whether the value is included in the list.

SELECT color FROM table
WHERE color IN ('red','blue')

can also be combined with not
SELECT color FROM table
WHERE color NOT IN ('red','blue')

SELECT DISTINCT(amount) 
FROM payment
LIMIT 2;


SELECT COUNT(*) FROM payment
WHERE amount IN (0.99,1.98,1.99)

SELECT COUNT(*) FROM payment
WHERE amount NOT IN (0.99,1.98,1.99)

SELECT * FROM customer
WHERE first_name IN ('John', 'Jake', 'Julie')





=======================     LIKE , ILIKE

We have worked with the string
But now we need to know about the patterns.

i.e emails ending with @gmail.com, name starting with 'A'
talking about patterns

LIKE 
allows us to Perform pattern matching against starting data with the use of wildcard character.
wildcard character are :- 1. Percent        2. Underscore

all names begin with A : 'A%'
all names ends with A : '%A'

get the next word , letters : version#_ _ i.e. version#54

get all with pattern : _her%
only 1 char before her and ends with any number of char : Cheryl, Theresa, Sherri

similar to regex in python and many more language.

-- start with J
SELECT * FROM customer
WHERE first_name LIKE 'J%';

SELECT COUNT(*) FROM customer
WHERE first_name LIKE 'J%';

-- f_name and l_name
SELECT * FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';

-- name has er in between
SELECT * FROM customer
WHERE first_name LIKE '%er%';

-- only 1 char is allowed before er
SELECT * FROM customer
WHERE first_name LIKE '_er%';

-- NOT use only 1 char is allowed before er
SELECT * FROM customer
WHERE first_name NOT LIKE '_er%';

SELECT * FROM customer
WHERE first_name NOT LIKE 'A%'
ORDER BY last_name;

SELECT * FROM customer
WHERE first_name NOT LIKE 'A%' AND last_name NOT LIKE 'B%'
ORDER BY last_name;








=======================     General Challenge


1. How many payment transactions were greater than 5$?

SELECT COUNT(amount) FROM payment
WHERE amount >= 5;


2. How many actor have a first_name that starts with p?

SELECT COUNT(*) FROM actor
WHERE first_name Like 'P%'

3. How many unique districts are our customers from ?

-- SELECT * from address
-- LIMIT 1;

SELECT DISTINCT COUNT(district) FROM address;
----- OR ---------
SELECT DISTINCT(COUNT(district)) FROM address;



4. retrieve the list of names of this distinct districts of above question

SELECT DISTINCT district FROM address;



5. How many films with rating of 'R' and replacement_cost between 5 and 15$.

-- SELECT * FROM film
-- LIMIT 1;

SELECT COUNT(*) FROM film 
WHERE rating = 'R' 
AND replacement_cost BETWEEN 5 and 15;



6. How many films has the word 'Truman' somewhere in the title ?

SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman%';
