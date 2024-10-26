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
