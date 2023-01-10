SET ECHO ON
SET LINESIZE 132
SET PAGESIZE 66
SPOOL C:\cprg250s\Lab11.3_Output.txt

/* Question 1
show all authors who have no book orders. */
SELECT authorid "AUTH", fname, lname
FROM author
MINUS
SELECT authorid "AUTH", fname, lname
FROM author
NATURAL JOIN bookauthor
NATURAL JOIN orderitems
ORDER BY 3;

/*Question 2
assume the gift is based on total value of each line item (orderitem) in an order
show the promotion gifts for each order. Solve using traditional join and join..on*/

SELECT order#, item#, title, quantity, paideach, quantity * paideach AS "Item Total", gift
FROM books b, orderitems oi, promotion p
WHERE b.isbn = oi.isbn 
AND (oi.quantity * oi.paideach BETWEEN p.minretail AND p.maxretail)
ORDER BY 1,2,3;

SELECT order#, item#, title, quantity, paideach, quantity * paideach AS "Item Total", gift
FROM books b
JOIN orderitems oi ON (b.isbn = oi.isbn)
JOIN promotion p ON (oi.quantity * oi.paideach BETWEEN p.minretail AND p.maxretail)
ORDER BY 1,2,3;

/* Question 3
show all customers and the books they have ordered.
Include books they have not ordered. */
SELECT customer#, firstname, lastname, title
FROM customers
JOIN orders USING (customer#)
JOIN orderitems USING (order#)
FULL OUTER JOIN books USING (isbn)
ORDER BY 3;

/* find all customers who have ordered the same book as the person 
who referred them */

SELECT r.firstname, r.lastname, c.firstname, c.lastname, b.title
FROM customers c, customers r, books b, orders o, orderitems oi
WHERE c.referred = r.customer#
AND b.isbn = oi.isbn
AND oi.order# = o.order#
AND o.customer# = r.customer#
INTERSECT
SELECT r.firstname, r.lastname, c.firstname, c.lastname, b.title
FROM customers c, customers r, books b, orders o, orderitems oi
WHERE o.customer# = c.customer#
AND b.isbn = oi.isbn
AND oi.order# = o.order#;