-- Not equal
SELECT title FROM books WHERE released_year != 2017;
SELECT title, released_year FROM books WHERE author_lname != 'Gaiman';

-- Not like
SELECT title FROM books WHERE title LIKE 'W';
SELECT title FROM books WHERE title LIKE 'W%';
SELECT title FROM books WHERE title LIKE '%W%';
SELECT title FROM books WHERE title NOT LIKE 'W%';
SELECT title FROM books WHERE title NOT LIKE '%W%';

-- Greater Than
SELECT * FROM books WHERE released_year > 2000;
-- Selects all > 2000 but not 2000
SELECT * FROM books WHERE released_year > 2000 ORDER BY released_year ASC;
-- This is inclusive, selects all > 2000 
SELECT * FROM books WHERE released_year >= 2000 ORDER BY released_year ASC;
SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100;
-- Return 1, because 1 is the same as True in other programing languages
SELECT 99 > 1;
-- Return 0, because 0 is False, as explained before
SELECT 99 > 100;
-- Return true
SELECT 100 > 5;
-- Return false 
SELECT -15 > 15;
-- Return true
SELECT 9 > -10;
-- Return false
SELECT 1 > 1;
-- Return true
SELECT 1 >= 1;
-- Return false
SELECT 'a' > 'b';
-- Return false
SELECT 'A' > 'a';
-- These estatements are equivalent
SELECT title, author_lname FROM books WHERE author_lname = 'Eggers';
SELECT title, author_lname FROM books WHERE author_lname = 'eggers';
SELECT title, author_lname FROM books WHERE author_lname = 'eGGers';

-- Less than
SELECT * FROM books WHERE released_year < 2000;
SELECT * FROM books WHERE released_year <= 2000;
-- false
SELECT 3 < -10;
-- true
SELECT -10 < -9;
-- true
SELECT 42 <= 42;
-- true
SELECT 'h' < 'p';
-- true
SELECT 'Q' <= 'q';
-- false
SELECT 'Q' < 'q';

-- Logical AND &&
-- Better to use AND, && will be deprecated
SELECT * FROM books WHERE author_lname = 'Eggers';
SELECT * FROM books WHERE released_year > 2010;
SELECT * FROM books WHERE author_lname = 'Eggers' AND released_year > 2010;
SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Eggers' AND released_year > 2010;
SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Eggers' && released_year > 2010;
-- false
SELECT 1 < 5 && 7 = 9;
-- true
SELECT -10 > -20 && 0 <= 0;
-- false
SELECT -40 <= 0 AND 10 > 40;
-- true
SELECT 54 <= 54 && 'a' = 'A';
SELECT * FROM books
WHERE author_lname = 'Eggers' AND
released_year > 2010 AND
title LIKE '%novel%';

-- Logical OR ||
-- Better to use OR, || will be deprecated
-- Only one side must be true
SELECT * FROM books WHERE author_lname = 'Eggers' || released_year > 2010;
-- true
SELECT 40 <= 100 || -2 > 0;
-- true
SELECT 10 > 5 || 5 = 5;
-- true
SELECT 'a' = 5 || 3000 > 2000;
SELECT title, author_lname, released_year, stock_quantity FROM books 
WHERE author_lname = 'Eggers' || 
released_year > 2010 OR 
stock_quantity > 100;

-- Between
SELECT title, released_year 
FROM books 
WHERE released_year >= 2004 
AND released_year <= 2015;
SELECT title, released_year
FROM books
WHERE released_year
BETWEEN 2004
AND 2015;
SELECT title, released_year 
FROM books
WHERE released_year
NOT BETWEEN 2004
AND 2015;
-- Convert the string into DATETIME
SELECT CAST('2017-05-02' AS DATETIME);
SELECT name, birthdt
FROM people
WHERE birthdt 
BETWEEN '1980-01-01'
AND '2001-01-01';
-- Is good practice to use CAST en BETWEEN, to make sure all the datatypes are the same
SELECT name, birthdt
FROM people
WHERE birthdt 
BETWEEN CAST('1980-01-01', AS DATETIME)
AND CAST('2001-01-01' AS DATETIME);

-- IN
SELECT title, author_lname
FROM books
WHERE author_lname = 'Carver'
OR author_lname = 'Lahiri'
OR author_lname = 'Smith';
-- The same:
SELECT title, author_lname
FROM books
WHERE author_lname
IN ('Carver', 'Lahiri', 'Smith');
SELECT title, released_year
FROM books
WHERE released_year
IN (2017, 1985);
-- NOT IN
SELECT title, released_year
FROM books
WHERE released_year != 2000 
AND released_year != 2002
AND released_year != 2004
AND released_year != 2006
AND released_year != 2008
AND released_year != 2010
AND released_year != 2012
AND released_year != 2014
AND released_year != 2016
ORDER BY released_year
DESC;
-- Better way
SELECT title, released_year
FROM books
WHERE released_year
NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016)
ORDER BY released_year
DESC;
SELECT title, released_year
FROM books
WHERE released_year >= 2000
AND released_year
NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016)
ORDER BY released_year
DESC;
-- to test if a value is odd
SELECT title, released_year
FROM books
WHERE released_year >= 2000
AND released_year % 2 != 0;
-- to test if a value is even 
SELECT title, released_year
FROM books
WHERE released_year >= 2000
AND released_year % 2 != 1;

-- Case statements
SELECT title, released_year,
    CASE
        WHEN released_year >= 2000
            THEN 'Modern Lit'
        ELSE '20th Century Lit'
    END AS Genre
FROM books
ORDER BY released_year;
SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50
            THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100
            THEN '**'
        ELSE '***'
    END AS Stock
FROM books
ORDER BY stock_quantity;
-- Not necesary to select 'stock_quantity'
SELECT title
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50
            THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100
            THEN '**'
        ELSE '***'
    END AS Stock
FROM books
ORDER BY stock_quantity;
SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50
            THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100
            THEN '**'
        WHEN stock_quantity BETWEEN 101 AND 150
            THEN '***'
        ELSE '****'
    END AS Stock
FROM books
ORDER BY stock_quantity;
-- another option
SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity <= 50
            THEN '*'
        WHEN stock_quantity <= 100
            THEN '**'
        ELSE '***'
    END AS Stock
FROM books
ORDER BY stock_quantity;

-- Exercises
-- false
SELECT 10 != 10;
-- true
SELECT 15 > 14 AND 99 - 5 <= 94;
-- true
SELECT 1 IN (5,3) OR 9 BETWEEN 8 AND 10;
--
SELECT title, released_year
FROM books
WHERE released_year < 1980;
--
SELECT * 
FROM books
WHERE author_lname = 'Eggers'
OR author_lname = 'Chabon';
SELECT * 
FROM books
WHERE author_lname 
IN ('Eggers', 'Chabon');
--
SELECT title, author_lname, released_year 
FROM books
WHERE author_lname = 'Lahiri'
AND released_year > 2000;
--
SELECT title, pages 
FROM books
WHERE pages
BETWEEN 100
AND 200;
SELECT title, pages
FROM books
WHERE pages >= 100
AND pages <= 200;
--
SELECT title, author_lname 
FROM books
WHERE author_lname
LIKE 'C%'
OR author_lname
LIKE 'S%';
SELECT title, author_lname
FROM books
WHERE SUBSTR(author_lname, 1, 1) = 'C'
OR SUBSTR(author_lname, 1, 1) = 'S';
SELECT title, author_lname
FROM books
WHERE SUBSTR(author_lname, 1, 1) IN ('C', 'S');
--
SELECT title, author_lname,
    CASE
        WHEN title LIKE '%stories%'
            THEN 'Short Stories'
        WHEN title IN ('Just Kids','A Heartbreaking Work of Staggering Genius')
            THEN 'Memoir'
        ELSE 'Novel'
    END AS 'Type'
FROM books
ORDER BY Type;
--
SELECT author_fname, author_lname, 
    CASE
        WHEN COUNT(*) = 1 
            THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS 'Count'
FROM books
GROUP BY author_lname, author_fname 
ORDER BY Count;















