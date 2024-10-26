=========================== 01. Installation

SQl : structured query language

PostgreSQL : syntax are same/similar for other languages

course Overview
- DataBase : are system that allows you to use large amount of data & organize them.
- They are used to store large amount of data.
- We can store the user data and retrieve them.

DB is made up of tables.
Table is made up of rows and columns.


SQl : is the way we communicate with our DB its the way we can insert or retrieve the data.


Installation
- PostgreSQL : SQl engine that stores data and reads queries and returns information.
- PgAdmin : Graphical User Interface (GUI) for connecting with PostgreSQL.

********** PassWord of PostgreSQL : Postresql@123
********** PassWord of PgAdmin : password

Restore the server.
- right click on PostgreSQL 16 after connecting
- create > DataBase > dvdrental (this will create an empty database) we are going to restore the database
- right click on dvdrental database > Restore > Format : custom for tar > give the file location (check show hidden file)
- restore option tab (now in data tab) > predata, data, post data : set to YES.
- ONCE you did this just hit refresh option so that they can reflect the changes.
- To check go to query tool option > Perform a query and ask for information back (SELECT * FROM film;) 

To Perform any query just select the query tool options

























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



























=========================== 03. function (Intermediate)

GROUP BY is a sql statement that will allow us to aggregate data and apply function to better understanding.


	
---- AGGREGATE function

these function will take some value and will return the output.
eg :- AVG(), COUNT(), MAX(), MIN(), SUM()

AGGREGATE functions happens only with the SELECT clause & HAVING clause.

AVG() - this will return the floating point.
COUNT() - simply return the number of rows.

SELECT * FROM film;

-- this will return the minimum of the column & it happens only with the numerics. 
SELECT MIN(replacement_cost) FROM film;

-- gives max
SELECT MAX(replacement_cost),MIN(replacement_cost) FROM film;


-- COUNT : this will return the number of rows in a table
SELECT COUNT(*) FROM film;

-- AVG
SELECT AVG(replacement_cost) FROM film;

-- ROUND : decimal upto how many places, (what to round, how many decimal places)
SELECT ROUND(AVG(replacement_cost),2) FROM film;

-- SUM
SELECT SUM(replacement_cost) FROM film;



---- GROUP BY - part 1

GROUP BY allows us to aggregate column per some category.
we need a categorical column for GROUP BY.
column should be non continuous.

Syntax :
SELECT category_col, AGG(data-col)
FROM table
GROUP BY category_col


---- GROUP BY - part 2

SELECT * FROM payment;

-- customer_id is categorical
SELECT customer_id FROM payment
GROUP BY customer_id;

-- this will return the customer id in order
SELECT customer_id FROM payment
GROUP BY customer_id
ORDER BY customer_id;

-- This will give us the total sum that a customer have spend in Ascending/ Descending
-- Also you can say that you can get the list of customer who spend the most
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC

-- here we are knowing how many transaction has been done by the customer
-- Similarly it can return me the list of customer who did the most transaction
SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount) DESC

-- thhis gives me customer had spend how much with respective staff(salesperson)
-- we will get the column arranged with the select statement
SELECT customer_id,staff_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY customer_id


-- goup by with date/time
-- Date function removes the time stamp and returns you only the date.
SELECT DATE(payment_date) FROM payment;

-- Date having the least amount of transaction we can use desc for most spending
SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount);


*** QUICK CHALLENGE

1. we have 2 staff member with staff id of 1 & 2. we want to give bonus to the staff member that handled the most payments (interms of transaction and not $).
How many payment did each staff handled and who gets the bonus.

SELECT * FROM payment

SELECT staff_id, COUNT(amount) FROM payment
GROUP BY staff_id
ORDER BY COUNT(amount) DESC


2. corporate HQ is conducating a studying on relationship between replacement cost and a movie MPAA rating.
	WHAT is avg replacement cost per MPAA rating ?
	(NOTE : you need to expand the avg column to view correct result)

SELECT * from film
limit 1;

SELECT rating, ROUND(AVG(replacement_cost),2) FROM film
GROUP BY rating
ORDER BY ROUND(AVG(replacement_cost),2)



3. We are running a promotion to reward top 5 customer with coupons.
	What are the ids of the top 5 customers in terms of spend.

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
limit 5;


---- HAVING CLAUSE

Allows us to filter after the aggregation has already taken place.

eg :
SELECT company, SUM(sales) FROM financial_table
WHERE company != 'Google'
GROUP BY company
HAVING SUM(sales) > 1000


SELECT * FROM payment
limit 1;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id


SELECT customer_id, SUM(amount) FROM payment
WHERE customer_id NOT IN (184,87,477)
GROUP BY customer_id

-- we cannot filter with WHERE but we can use having

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100


--
SELECT store_id, count(customer_id) FROM customer
GROUP BY store_id

SELECT store_id, count(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT(*) > 300


*** QUICK CHALLENGE

1. Assign platinum status service for our most loyal customers who have 40 or more transaction payments. 
	what customer_id are eligible.

SELECT * from payment
limit 1
	
SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40

2. What are customer_id who spend more than $100 in payment transaction with staff_id 2.

	

SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100
































=========================== 04. Assesment 1

1. Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.

The answer should be customers 187 and 148.

SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 110
	

	
2. How many films begin with the letter J?

The answer should be 20.

SELECT * FROM film
limit 1

SELECT COUNT(*) FROM film
WHERE title LIKE 'J%';



3. What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?

The answer is Eddie Tomlin

SELECT * FROM customer
limit 1

SELECT customer_id, first_name, last_name FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;




















=========================== 05. JOINs

-- 		AS clause

renaming(ALIASING) the column name or any name.

SELECT customer_id FROM payment

SELECT customer_id  AS ci
FROM payment

SELECT SUM(amount) AS net_revenue
FROM payment;

*** AS operator is executed at the very end of the query.

SELECT COUNT(amount)
FROM payment

SELECT COUNT(amount) AS num_transations
FROM payment

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100
	
-- we cannot use SUM(amount) as total_spent as we have used AS it is only done at the end & if we use it it will give us an error.

-- This will give us error as we have used aliased name in 4th line
SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING total_spent > 100
	
SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100



=================		JOIN

JOIN allows us to combine multiple tables together.

JOIN is short hand for INNER JOIN 

syntax :	Grab table A and B and JOIN them with the common column 
	
SELECT * FROM TableA
INNER JOIN TableB
ON TableA.col_match = TableB.col_match 

--		we are joining the 2 table with customer id in order to get the emails of only customer who have done the payment.
SELECT * FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id

-- 		if the column name are different in both the table if they tends to have the same column name we can have 
--		inner joins will only show me the customer who are in both table payment and customer
SELECT payment_id, payment.customer_id, first_name, email FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id


--		Outer Join

this allows us to speciffy how to deal with values only present on one of the tables being joined.

syntax :
SELECT * FROM TableA
FULL OUTER JOIN TableB
ON TableA.col_match = Table.col_match

it does not matter with the position of the tableA and tableB as they are symmectrical in order.


-- you need to qualify the joins with WHERE
this can be used to find where the results are unique to either of the table

We have new privacy rule with customer
where we want to make sure all the payment we have is associated with the current customer
and all the customer we have is associated with a historical payment.

SELECT * FROM customer
limit 1;

-- selecting and getting every single row and everysinle column from both the tablea
SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id

-- but we want the privacy so we can add WHERE clause
SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null 
OR payment.payment_id IS null

we will get an empty table is bcuz we dont have any unique info
i.e everyone of the customer who made the paymnet is the customer 

SELECT COUNT(DISTINCT customer_id) FROM customer

-- LEFT OUTER JOIN
result in the set of join that are in the left table 

syntax:
SELECT * FROM TableA
LEFT OUTER JOIN TableB
ON Table.col_match = tableB.col_match

tableA id the left table and join tableB where there is match 
we are going to return where data is found matches in both table
if there is something unique in tableB then it should not be left joined
But if there is no match then still we will have the data of the left table and rest data that is not matched will be showed as null
HERE table order matters as we have the left and right.

we can still ignore the unique data by using WHERE clause tableid is null.

LEFT OUTER JOIN -- can also called as -- LEFT JOIN
	

SELECT * FROM film
limit 1

SELECT * FROM inventory
limit 1

keep in mind each row in the film table may have zero or many rows in the inventory table.
	i.e for film_id 1 we have copies in both the stores 1 & 2.
	
-- this will give me every films data regardnig where i can find them
SELECT film.film_id, title, inventory_id, store_id 
FROM film
LEFT JOIN inventory ON
inventory.film_id = film.film_id

-- this will give me the name which are not in the inventory
SELECT film.film_id, title, inventory_id, store_id 
FROM film
LEFT JOIN inventory ON
inventory.film_id = film.film_id	
WHERE inventory.film_id IS NULL


-- RIGHT JOIN

Right join is same as left join it is just switched with the position.
i.e. it is just flipped and reverse of left join.

syntax:
SELECT * FROM TableA
RIGHT OUTER JOIN TableB
ON Table.col_match = tableB.col_match

We can use WHERE clause similarly


-- UNIONS

Is used to combine a result of set of two or more select statement.

SELECT col_1 FROM tableA
UNION
SELECT col_1 FROM tableB

It just grab the results of the same column names and stack on top of one another.




	
*** QUICK CHALLENGE

1. California tax changed. we need to inform this to our cusotomer make the list of customers living in california


SELECT * FROM customer

SELECT * FROM address

SELECT * FROM address
INNER JOIN customer
ON address.address_id = customer.address_id

SELECT address.address_id, district, email FROM address
INNER JOIN customer
ON address.address_id = customer.address_id

SELECT address.address_id, district, email FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'California'

we can interchange the position of the 2 table as inner join does not complain.

	
	
2. A customer walk in and is huge fan of "Nick Wahlberg" and wants to which movie he is in.
	Get the list of movie for this actor

SELECT * FROM actor

SELECT * FROM film_actor
WHERE actor_id = 2
-- actor_id is connected with actor table 

SELECT * FROM film
-- film_id is connected with film actor table

SELECT title, first_name, last_name FROM actor
LEFT JOIN film_actor
ON actor.actor_id = film_actor.actor_id
LEFT JOIN film
ON film_actor.film_id = film.film_id
WHERE first_name = 'Nick' AND last_name = 'Wahlberg'



























=========================== 06. Advanced SQl commands

-- 		Timestamps and extract function : part-1

These function are usefull while creating our database and designing it.
TIME - contains time
DATE - contains date
TIMESTAMP - containes date and time
TIMESTAMPTZ - contains date,time and timezone

Carefull consideration you can remove these time function if you dont need after creating your db but you cannot add it.
eg : you are creating the login logout time then we will use time function to do this but if we have not added the date while creating it we cannot use it later.

>>
this will give you info about your system 
SHOW ALL
	
SHOW TIMEZONE

-- now is used for timestamps
SELECT NOW()
SELECT TIMEOFDAY()
SELECT CURRENT_TIME
SELECT CURRENT_DATE



--			PART 2.

EXTRACT() - allows you to extract and obtain the sub_component of date value.

AGE() - returns the age of the timestamps

TO_CHAR() - general functions to convert data types to text.

>>
SELECT * FROM payment

SELECT EXTRACT(YEAR FROM payment_date) 
AS pay_year
FROM payment
	
SELECT EXTRACT(MONTH FROM payment_date) 
AS pay_month
FROM payment
	
SELECT AGE(payment_date)
FROM payment
	
SELECT TO_CHAR(payment_date, 'Mon/dd/YYYY')
FROM payment


--		STRING functions

SELECT * FROM cusotomer

SELECT length(first_name) FROM customer

SELECT first_name || ' ' || last_name AS full_name
FROM cusotomer

SELECT upper(first_name) FROM customer

SELECT LEFT(first_name, 1) || last_name || '@gmail.com'


-- SUB QUERY

allows to construct complex queries.

Basically performing query on the result of another query.

The query written inside parenthesis is the sub query.
1st this query will run and then the main query is executeed.
	
syntax eg :
SELECT student,grade
FROM test_scores
WHERE grade > (SELECT AVG(grade)
FROM test_scores)

-- above code after sub query
SELECT student,grade
FROM test_scores
WHERE grade > (70)


-- 			EXISTS operator

this returns bool for calculation

SELECT column_name
FROM table_name
WHERE EXISTS
(SELECT column_name FROM
table_name WHERE condition);


SELECT * FROM film

SELECT AVG(rental_rate) FROM film

SELECT title, rental_rate
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film)

When a sub query is returning a numeric value we should use comparison operator.
When a sub query is returning a list of value we should use IN opertor.

SELECT * FROM rental
SELECT * FROM inventory

SELECT inventory.film_id
FROM rental
INNER JOIN inventory 
ON inventory.inventory_id = rental.inventory_id 
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30'


-- using above query as sub query

SELECT film_id, title
FROM film
WHERE film_id 
IN (SELECT inventory.film_id
FROM rental
INNER JOIN inventory 
ON inventory.inventory_id = rental.inventory_id 
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')



SELECT first_name, last_name
FROM customer as c
WHERE EXISTS
(SELECT * FROM payment as P
WHERE p.customer_id = c.customer_id
AND amount > 11)



----		SELF JOIN

Its a query in which table is joined to itself.
SELF comparing is useful.

IT can be done by using the aliases

syntax :

SELECT tableA.col, tableB.col
FROM table AS tableA
JOIN table AS tableB
tableA.some_col = tableB.other_col


>> FIND all the pair of films having the same length

SELECT f1.title, f2.title, f1.length 
FROM film AS f1
INNER JOIN film AS f2
ON f1.film_id != f2.film_id AND f1.length = f2.length








==============  07. Section

In order to lead incorporate the database
PgAdmin > Postresql > database > right click > create > name the data base > save > right click > restore > enter the file location > it will be hidden > use \file name 

When we will open the data base after restoring.
We will have 2 types of schemas 	1. Public schema 	2. Cd schema


We can use cd schema by dot method

SELECT * FROM cd.facilities
SELECT * FROM cd.bookings



--- 	Assesment test 2

Question sheet : https://docs.google.com/document/d/1wiuYbTQslmfolQWgeVPB356csjK6yqOUBhgC7fM44o8/edit

1. How can you retrieve all the info from cd facilities

SELECT * FROM cd.facilities


2. Print the list of all the facilities and cost.

SELECT name, membercost FROM cd.facilities



3. How can we produce a list of facility that charges a member

SELECT * FROM cd.facilities
WHERE membercost != 0


4. How can you produce a list of facilities that charges a member and the fee is less than 1/50th of the monthly maintanenc cost.
	return facid, facility name, member cost and monthly maintanence of facility

SELECT facid, name, membercost, monthlymaintenance 
FROM cd.facilities
WHERE membercost > 0 
AND (membercost < monthlymaintenance/50.0)



5. How can you produce list of facilities with the word 'Tenis' in it.

SELECT * FROM cd.facilities
WHERE name LIKE '%Tennis%';


6. How can you retrieve the data of facilities with id 1 and 5. Try doing without OR

-- without OR
SELECT * FROM cd.facilities
WHERE facid IN (1,5)

-- with OR
SELECT * FROM cd.facilities
WHERE facid = 1 OR facid = 5


	
7. Produce a list of member who joined after the start of september 2012. Return memid, surname, firstname, joindate

SELECT * FROM cd.members
WHERE joindate >= '2012-09-01'


7. How can you produce order list of the 1st 10 names in the members table. The list should not contain duplicate.

SELECT Distinct(surname) from cd.members
ORDER BY surname
LIMIT 10


9. You'd like to get the signup date of your last member. How can you retrieve this information?'

SELECT * FROM cd.members
ORDER BY joindate DESC
LIMIT 1

-- OR
SELECT MIN(joindate) FROM cd.members


10. Produce a count of the number of facilities that have a cost to guests of 10 or more.

SELECT COUNT(*) FROM cd.facilities
WHERE guestcost >= 10


11. Produce a list of the total number of slots booked per facility in the month of September 2012. 
	Produce an output table consisting of facility id and slots, sorted by the number of slots.


SELECT facid, sum(slots) AS "Total Slots" 
FROM cd.bookings 
WHERE starttime >= '2012-09-01' 
AND starttime < '2012-10-01' 
GROUP BY facid 
ORDER BY SUM(slots);


12. Produce a list of facilities with more than 1000 slots booked.
	Produce an output table consisting of facility id and total slots, sorted by facility id.

SELECT facid, sum(slots) AS "Total Slots" 
FROM cd.bookings 
GROUP BY facid 
HAVING SUM(slots) > 1000
ORDER BY facid;


13. How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? 
	Return a list of start time and facility name pairings, ordered by the time.

SELECT * FROM cd.bookings
SELECT * FROM cd.facilities

facid is the common in both

SELECT cd.bookings.starttime AS start, cd.facilities.name 
AS name 
FROM cd.facilities 
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid 
WHERE cd.facilities.facid IN (0,1) 
AND cd.bookings.starttime >= '2012-09-21' 
AND cd.bookings.starttime < '2012-09-22' 
ORDER BY cd.bookings.starttime;


14. How can you produce a list of the start times for bookings by members named 'David Farrell'?

SELECT cd.bookings.starttime 
FROM cd.bookings 
INNER JOIN cd.members ON 
cd.members.memid = cd.bookings.memid 
WHERE cd.members.firstname='David' 
AND cd.members.surname='Farrell';
































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




