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
