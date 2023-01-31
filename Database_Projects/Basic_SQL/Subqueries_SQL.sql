SQL> 
SQL> 
SQL> 
SQL> 
SQL> -- Q1 --
SQL> SELECT state "ST", 
  2      customer#, 
  3      title
  4  FROM customers
  5      JOIN orders o USING (customer#)
  6      JOIN orderitems USING (order#)
  7      JOIN books b USING(isbn)
  8  WHERE shipstate !='TX' AND title IN (SELECT title
  9                                      FROM customers c
 10                                          JOIN orders o USING(customer#)
 11                                          JOIN orderitems oi USING(order#)
 12                                          JOIN books b USING(isbn)
 13                                      WHERE state = 'TX')
 14  ORDER BY title, state;

ST  CUSTOMER# TITLE                         
-- ---------- ------------------------------
FL       1015 BIG BEAR AND LITTLE DOVE      
MI       1017 BIG BEAR AND LITTLE DOVE      
FL       1001 DATABASE IMPLEMENTATION       
FL       1001 DATABASE IMPLEMENTATION       
IL       1011 DATABASE IMPLEMENTATION       
NJ       1019 DATABASE IMPLEMENTATION       
WY       1014 DATABASE IMPLEMENTATION       
FL       1003 E-BUSINESS THE EASY WAY       
GA       1018 REVENGE OF MICKEY             
MI       1017 REVENGE OF MICKEY             
WA       1005 REVENGE OF MICKEY             

11 rows selected. 

SQL> 
SQL> 
SQL> -- Q2 --
SQL> SELECT title, shipstate "ST"
  2  FROM books
  3      NATURAL JOIN orderitems
  4      NATURAL JOIN orders
  5  WHERE isbn IN (SELECT isbn
  6                  FROM orders
  7                      NATURAL JOIN orderitems
  8                  GROUP BY isbn
  9                      HAVING COUNT(DISTINCT(shipstate)) = (SELECT MAX(COUNT(DISTINCT(shipstate))) "Max different states"
 10                                                           FROM orders
 11                                                              NATURAL JOIN orderitems
 12                                                           GROUP BY isbn))
 13  GROUP BY title, shipstate
 14  ORDER BY 1, 2;

TITLE                          ST
------------------------------ --
COOKING WITH MUSHROOMS         FL
COOKING WITH MUSHROOMS         ID
COOKING WITH MUSHROOMS         NJ
COOKING WITH MUSHROOMS         WA
COOKING WITH MUSHROOMS         WY
DATABASE IMPLEMENTATION        FL
DATABASE IMPLEMENTATION        IL
DATABASE IMPLEMENTATION        NJ
DATABASE IMPLEMENTATION        TX
DATABASE IMPLEMENTATION        WY

10 rows selected. 

SQL> 
SQL> 
SQL> -- Q3 --
SQL> SELECT title
  2  FROM books
  3      NATURAL JOIN orderitems
  4  GROUP BY title
  5      HAVING COUNT(*) = (SELECT MAX(COUNT(*))
  6                          FROM orderitems
  7                          GROUP BY isbn);

TITLE                         
------------------------------
COOKING WITH MUSHROOMS

SQL> 
SQL> -- Q4 --
SQL> SELECT DISTINCT category, 
  2      title, 
  3      orderdate
  4  FROM orders
  5      NATURAL JOIN books
  6      NATURAL JOIN orderitems
  7  WHERE (category, orderdate) IN (SELECT category, MAX(orderdate)
  8                                  FROM orders
  9                                      NATURAL JOIN books
 10                                      NATURAL JOIN orderitems
 11                                  GROUP BY category)
 12  ORDER BY category;

CATEGORY     TITLE                          ORDERDATE
------------ ------------------------------ ---------
BUSINESS     HOW TO MANAGE THE MANAGER      31-MAR-09
CHILDREN     BIG BEAR AND LITTLE DOVE       04-APR-09
COMPUTER     DATABASE IMPLEMENTATION        05-APR-09
COOKING      COOKING WITH MUSHROOMS         05-APR-09
FAMILY LIFE  REVENGE OF MICKEY              05-APR-09
FITNESS      BODYBUILD IN 10 MINUTES A DAY  01-APR-09
LITERATURE   SHORTEST POEMS                 01-APR-09

7 rows selected. 

SQL> 
SQL> 
SQL> -- Q5 --
SQL> SELECT customer#,
  2         title
  3  FROM customers
  4      JOIN orders USING(customer#)
  5      JOIN orderitems USING(order#)
  6      JOIN books USING(isbn)
  7  WHERE title IN (SELECT title
  8                  FROM books
  9                      NATURAL JOIN orderitems oi
 10                      NATURAL JOIN orders o
 11                  GROUP BY title
 12                      HAVING COUNT(*) = (SELECT MIN(COUNT(*))
 13                                          FROM orderitems
 14                                          GROUP BY isbn))
 15  ORDER BY customer#;

 CUSTOMER# TITLE                         
---------- ------------------------------
      1001 BODYBUILD IN 10 MINUTES A DAY 
      1007 HOLY GRAIL OF ORACLE          
      1010 HOW TO MANAGE THE MANAGER     
      1017 HANDCRANKED COMPUTERS         
      1018 SHORTEST POEMS                

