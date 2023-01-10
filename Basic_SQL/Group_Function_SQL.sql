SET ECHO ON
SET LINESIZE 200
SET PAGESIZE 66

SPOOL c:\cprg250s\Lab_11.5.spl

--Q1--
SELECT INITCAP (fname ||' '||lname) "Author Name",
TO_CHAR(ROUND(SUM(paideach * quantity), 2),'$9,990.00') "Value",
TO_CHAR(ROUND(SUM(paideach * quantity *0.01), 2),'$9,990.00') "Commision"
FROM author
JOIN bookauthor USING (authorid)
JOIN books USING (isbn)
JOIN orderitems USING (isbn)
GROUP BY GROUPING SETS((fname, lname),())
ORDER BY fname;

--Q2--
SELECT INITCAP(firstname) "First", INITCAP(lastname) "Last",
COUNT (lname) "Number Authors"
FROM customers c
JOIN orders o ON (o.customer# = c.customer#)
JOIN orderitems oi ON (oi.order# = o.order#)
JOIN bookauthor ba ON (ba.isbn = oi.isbn)
JOIN author a ON (a.authorid = ba.authorid)
GROUP BY lastname, firstname
HAVING COUNT(*)>1
ORDER BY lastname;

--Q3--
SELECT INITCAP((name)) "Publisher",
    TO_CHAR(ROUND(AVG(retail - cost),2),'$9,990.00') "Avg Profit"
FROM books JOIN publisher USING(pubid)
GROUP BY name
ORDER BY name;

--Q4--
SELECT INITCAP(name) "Publisher",
TO_CHAR(ROUND(AVG(retail - cost),2),'$99999.99') "Avg Profit"
FROM books JOIN publisher USING(pubid)
GROUP BY GROUPING SETS (name, ())
ORDER BY name;

--Q5--
SELECT case grouping(name)
when 0 then INITCAP(name)
else 'Total'
end "Publisher",
TO_CHAR(ROUND(AVG(retail - cost),2),'$99999.99') "Avg Profit"
FROM books JOIN publisher USING(pubid)
GROUP BY GROUPING SETS (name,())
ORDER BY name;