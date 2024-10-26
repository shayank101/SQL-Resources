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