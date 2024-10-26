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