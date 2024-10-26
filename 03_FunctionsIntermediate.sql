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
c