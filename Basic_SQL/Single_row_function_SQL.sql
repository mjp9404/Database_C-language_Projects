SQL> 
SQL> -- Q1 --
SQL> SELECT isbn,
  2      INITCAP(title) "Title",
  3      NVL2(discount, 'Fixed Discount', '20% Discount') "Discount Type",
  4      TO_CHAR(retail, '$9,990.00') "Orig Price",
  5      NVL2(discount, TO_CHAR(ROUND (retail * 0.05,2), '$9,990.00'), 
  6          TO_CHAR(ROUND (retail * 0.20,2), '$9,990.00')) "Discount",
  7      NVL2(discount, TO_CHAR(ROUND (retail - retail * 0.05, 2), '$9,990.00'),
  8          TO_CHAR(ROUND(retail - retail * 0.20, 2),'$9,990.00')) "Final $"
  9  FROM books
 10  ORDER BY 2;

ISBN       Title                          Discount Type  Orig Price Discount   Final $   
---------- ------------------------------ -------------- ---------- ---------- ----------
8117949391 Big Bear And Little Dove       20% Discount        $8.95      $1.79      $7.16
1059831198 Bodybuild In 10 Minutes A Day  20% Discount       $30.95      $6.19     $24.76
4981341710 Building A Car With Toothpicks Fixed Discount     $59.95      $3.00     $56.95
3437212490 Cooking With Mushrooms         20% Discount       $19.95      $3.99     $15.96
8843172113 Database Implementation        20% Discount       $55.95     $11.19     $44.76
9959789321 E-Business The Easy Way        20% Discount       $54.50     $10.90     $43.60
1915762492 Handcranked Computers          20% Discount       $25.00      $5.00     $20.00
3957136468 Holy Grail Of Oracle           Fixed Discount     $75.95      $3.80     $72.15
0132149871 How To Get Faster Pizza        Fixed Discount     $29.95      $1.50     $28.45
9247381001 How To Manage The Manager      20% Discount       $31.95      $6.39     $25.56
2491748320 Painless Child-Rearing         Fixed Discount     $89.95      $4.50     $85.45
0401140733 Revenge Of Mickey              20% Discount       $22.00      $4.40     $17.60
2147428890 Shortest Poems                 20% Discount       $39.95      $7.99     $31.96
0299282519 The Wok Way To Cook            20% Discount       $28.75      $5.75     $23.00

14 rows selected. 

SQL> 
SQL> -- Q2 --
SQL> SELECT RPAD(INITCAP(firstname ||' '|| lastname), 21, ' ') "Customer",
  2      LPAD(order#, 10, ' ') "Order #",
  3      RPAD(TO_CHAR(orderdate, 'fmMonth DD, YYYY'), 20, ' ') "Order Date",
  4      RPAD(TO_CHAR(shipdate, 'fmMonth DD, YYYY'), 20, ' ') "Ship Date",
  5      RPAD(NVL(to_char(NVL(LPAD(shipdate-orderdate, 4, ' '), '')), 'Not Shipped'), 15, ' ') "Days to Ship"
  6  FROM orders
  7  NATURAL JOIN customers
  8  ORDER BY lastname;

Customer              Order #    Order Date           Ship Date            Days to Ship   
--------------------- ---------- -------------------- -------------------- ---------------
Kenneth Falah               1004 April 1, 2009        April 5, 2009           4           
Kenneth Falah               1015 April 4, 2009                             Not Shipped    
Tammy Giana                 1014 April 4, 2009        April 5, 2009           1           
Tammy Giana                 1007 April 2, 2009        April 4, 2009           2           
Cindy Girard                1009 April 3, 2009        April 5, 2009           2           
Cindy Girard                1000 March 31, 2009       April 2, 2009           2           
Kenneth Jones               1020 April 5, 2009                             Not Shipped    
Jasmine Lee                 1013 April 3, 2009        April 4, 2009           1           
Jake Lucas                  1001 March 31, 2009       April 1, 2009           1           
Jake Lucas                  1011 April 3, 2009        April 5, 2009           2           
Reese Mcgovern              1002 March 31, 2009       April 1, 2009           1           
Greg Montiasa               1019 April 5, 2009                             Not Shipped    
Greg Montiasa               1005 April 1, 2009        April 2, 2009           1           
Bonita Morales              1018 April 5, 2009                             Not Shipped    
Bonita Morales              1003 April 1, 2009        April 1, 2009           0           
Becca Nelson                1012 April 3, 2009                             Not Shipped    
Thomas Pierson              1008 April 2, 2009        April 3, 2009           1           
Steve Schell                1017 April 4, 2009        April 5, 2009           1           
Leila Smith                 1016 April 4, 2009                             Not Shipped    
Jennifer Smith              1010 April 3, 2009        April 4, 2009           1           
Leila Smith                 1006 April 1, 2009        April 2, 2009           1           

21 rows selected. 

SQL> 
SQL> -- Q3 --
SQL> SELECT INITCAP(firstname ||' '|| lastname) "Customer", 
  2      order# "Order #", 
  3      title "Title", 
  4      orderdate "Order Date", 
  5      pubdate "Pub Date", 
  6      ROUND(MONTHS_BETWEEN (orderdate,pubdate)) "Months old"
  7  FROM customers
  8  JOIN orders USING (customer#)
  9  JOIN orderitems USING (order#)
 10  JOIN books USING (isbn)
 11  ORDER BY lastname, order#;

Customer                 Order # Title                          Order Dat Pub Date  Months old
--------------------- ---------- ------------------------------ --------- --------- ----------
Kenneth Falah               1004 PAINLESS CHILD-REARING         01-APR-09 17-JUL-04         56
Kenneth Falah               1015 COOKING WITH MUSHROOMS         04-APR-09 28-FEB-04         61
Tammy Giana                 1007 BIG BEAR AND LITTLE DOVE       02-APR-09 08-NOV-05         41
Tammy Giana                 1007 E-BUSINESS THE EASY WAY        02-APR-09 01-MAR-06         37
Tammy Giana                 1007 HOLY GRAIL OF ORACLE           02-APR-09 31-DEC-05         39
Tammy Giana                 1007 DATABASE IMPLEMENTATION        02-APR-09 04-JUN-03         70
Tammy Giana                 1014 REVENGE OF MICKEY              04-APR-09 14-DEC-05         40
Cindy Girard                1000 COOKING WITH MUSHROOMS         31-MAR-09 28-FEB-04         61
Cindy Girard                1009 REVENGE OF MICKEY              03-APR-09 14-DEC-05         40
Cindy Girard                1009 COOKING WITH MUSHROOMS         03-APR-09 28-FEB-04         61
Kenneth Jones               1020 COOKING WITH MUSHROOMS         05-APR-09 28-FEB-04         61
Jasmine Lee                 1013 DATABASE IMPLEMENTATION        03-APR-09 04-JUN-03         70
Jake Lucas                  1001 HOW TO MANAGE THE MANAGER      31-MAR-09 09-MAY-03         71
Jake Lucas                  1001 PAINLESS CHILD-REARING         31-MAR-09 17-JUL-04         56
Jake Lucas                  1011 PAINLESS CHILD-REARING         03-APR-09 17-JUL-04         57
Reese Mcgovern              1002 DATABASE IMPLEMENTATION        31-MAR-09 04-JUN-03         70
Greg Montiasa               1005 SHORTEST POEMS                 01-APR-09 01-MAY-05         47
Greg Montiasa               1019 REVENGE OF MICKEY              05-APR-09 14-DEC-05         40
Bonita Morales              1003 COOKING WITH MUSHROOMS         01-APR-09 28-FEB-04         61
Bonita Morales              1003 DATABASE IMPLEMENTATION        01-APR-09 04-JUN-03         70
Bonita Morales              1003 BODYBUILD IN 10 MINUTES A DAY  01-APR-09 21-JAN-05         50
Bonita Morales              1018 DATABASE IMPLEMENTATION        05-APR-09 04-JUN-03         70
Bonita Morales              1018 COOKING WITH MUSHROOMS         05-APR-09 28-FEB-04         61
Becca Nelson                1012 REVENGE OF MICKEY              03-APR-09 14-DEC-05         40
Becca Nelson                1012 PAINLESS CHILD-REARING         03-APR-09 17-JUL-04         57
Becca Nelson                1012 BIG BEAR AND LITTLE DOVE       03-APR-09 08-NOV-05         41
Becca Nelson                1012 HANDCRANKED COMPUTERS          03-APR-09 21-JAN-05         50
Thomas Pierson              1008 COOKING WITH MUSHROOMS         02-APR-09 28-FEB-04         61
Steve Schell                1017 BIG BEAR AND LITTLE DOVE       04-APR-09 08-NOV-05         41
Leila Smith                 1006 E-BUSINESS THE EASY WAY        01-APR-09 01-MAR-06         37
Jennifer Smith              1010 DATABASE IMPLEMENTATION        03-APR-09 04-JUN-03         70
Leila Smith                 1016 PAINLESS CHILD-REARING         04-APR-09 17-JUL-04         57

32 rows selected. 

