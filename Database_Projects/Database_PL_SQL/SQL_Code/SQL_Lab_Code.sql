-- CREATE A NEW SEQUENCE --
CREATE SEQUENCE seq_movie_id START WITH 20
INCREMENT BY 5;

DROP SEQUENCE seq_movie_id;

-- DISPLAY THE SEQUENCE INFORMATION FROM DATA DICTIONARY --

DESCRIBE USER_SEQUENCES;

SELECT *
FROM USER_SEQUENCES;

-- DISPLAY THE NEXT SEQUENCE NUMBER --

SELECT seq_movie_id.NEXTVAL
FROM DUAL;

-- ADD FAVORITE MOVIE --

INSERT INTO MM_MOVIE (movie_id, movie_title, movie_cat_id, movie_value, movie_qty)
VALUES (seq_movie_id.NEXTVAL,'John Wick',5 , 15, 5);

SELECT *
FROM mm_movie;

DELETE MM_MOVIE
WHERE movie_title = 'John Wick'; 


-- CREATE A VEW CALLED VW_MOVIE_RENTAL --

CREATE OR REPLACE VIEW VW_MOVIE_RENTAL AS
SELECT movie_title, rental_id, last
  FROM mm_rental re 
  JOIN mm_movie mo
    ON re.movie_id = mo.movie_id  
  JOIN mm_member me
    ON re.member_id = me.member_id;


-- DISPLAY THE DATA --

DESCRIBE VW_MOVIE_RENTAL;

-- CREATE PUBLIC SYNONYM CALLED m_type --

CREATE PUBLIC SYNONYM m_type
FOR cprg307.mm_movie_type;

-- TEST THIS NEW SYNONYM BY DESCRIBE--

DESCRIBE m_type;

