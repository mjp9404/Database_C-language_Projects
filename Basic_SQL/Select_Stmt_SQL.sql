-- SET ECHO, LINESIZE, AND PAGESIZE --
SET ECHO ON;
SET LINESIZE 132;
SET PAGESIZE 66;


--#1 DISPLAY NAMES OF ALL THE AUTHORS --
SELECT fname AS "First",
lname AS "Last"
FROM author;


--#2 DISPLAY ALL ORDER INFORMATION --
SELECT order#|| '-' || item# "Order-Item #", isbn "Book ISBN", quantity "Qty", paideach "Price", quantity * paideach "Line Total" ,paideach * .05 "GST", 
paideach +(paideach * .05) "Total Price" from orderitems;



--#3 CREATE A List OF ALL AUTHOR ID-
SELECT DISTINCT authorID AS "ID"
FROM BookAuthor;


--#4 DISPLAY ALL ORDERS AND THE NUMBER OF DAYS--
SELECT customer# || '-' || order# "Cust#-Order#", shipdate-orderdate "Days to Ship"
FROM orders;


--#5 DISPLAY ALL CUSTOMER INFORMATION --
SELECT LastName || ', ' || FirstName "Name", Address ||', '|| City||', '||State||', '||Zip  "Address"
FROM customers;