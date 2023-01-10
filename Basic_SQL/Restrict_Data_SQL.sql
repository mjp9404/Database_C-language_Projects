-- SET ECHO, LINESIZE, AND PAGESIZE --
SET ECHO ON;
SET LINESIZE 132;
SET PAGESIZE 66;

--#1 DISPLAY BOOKS AS COMPUTER LESS THAN $30 OR AFTER SETTELED PUBDATE --
SELECT title, pubdate AS "Pub Date", category, retail AS "Retail Price"
FROM books
WHERE (category = 'COMPUTER' AND retail < 30) or  pubdate > '31-DEC-05'
ORDER BY pubdate;

--#2 DISPLAY ORDER SHIPPED--
SELECT order#, customer#, orderdate AS "Date Ord"
FROM orders
WHERE shipdate is NULL
ORDER BY customer#, order#;

--#3 DISPLAY ORDER SHIPPED BETWEEN THE DATE WITHOUT WA STATE--
SELECT order#, shipdate, shipstate AS SH
FROM orders
WHERE (shipdate BETWEEN '01-APR-09' AND '03-APR-09') AND shipstate != 'WA'
ORDER BY shipdate;

--#4 DISPLAY BOOKS BY PUBID OR RETAIL PRICE--
SELECT title, pubid, retail
FROM books
WHERE pubid BETWEEN 2 AND 4 OR retail < 30
ORDER BY title;


--#5 DISPLAY CUSTOMER WITH REFERRENCE, ADDRESS, OR EMAIL--
SELECT customer#, address, referred, email
FROM customers
WHERE referred = 1003 OR address LIKE '%P.O. BOX%' OR email LIKE '%@axe.com'
ORDER BY customer#;