INSERT INTO books
    (title,author_fname,author_lname,released_year,stock_quantity,pages)
VALUES
    ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
    ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
    ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

-- Select only unique distinct value
SELECT DISTINCT author_lname FROM books;
SELECT DISTINCT released_year FROM books;

SELECT author_fname, author_lname FROM books;
SELECT DISTINCT CONCAT(author_fnameM, ' ', author_lname) FROM books;
SELECT DISTINCT author_fname, author_lname FROM books;

-- ORDER BY
-- Sorting results
--ASC by default as ascending
SELECT author_lname FROM books ORDER BY author_lname;
SELECT DISTINCT author_lname FROM books ORDER BY author_lname;
SELECT title FROM books;
SELECT tile FROM books ORDER BY title;

--DESC as descending
SELECT author_lname FROM books ORDER BY author_lname DESC;
SELECT released_year FROM books ORDER BY released_year;
SELECT title, released_year, pages FROM books ORDER BY released_year;
-- This refers to 'author_fname' because 2nd position   
SELECT title, author_fname, author_lname FROM books ORDER BY 2;
-- This order by pos 1 then by pos 2
SELECT author_fname, author_lname FROM books ORDER BY author_lname, author_fname;
SELECT author_fname, author_lname FROM books ORDER BY 2, 1;

--LIMIT
SELECT title FROM books LIMIT 3;
SELECT * FROM books LIMIT 10;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5;
--LIMIT 0, 5; --starting point, quantity after starting point, as an array 
SELECT title, released_year FROM books ORDER BY 2 DESC LIMIT 0,5;
-- 11 nth item
SELECT title, released_year FROM books ORDER BY 2 DESC LIMIT 10,1;
-- Select FROM 95 to the end of the table
SELECT * FROM <table-name> LIMIT 95, 18446744073709551615;

--LIKE, % are wildcards
... WHERE author_fname LIKE '%da%';
SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
--Start with 'da'
SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';
SELECT title FROM books WHERE title LIKE '%the';
SELECT title FROM books WHERE title LIKE '%the%';
--Any character but exactly 1 for each underscore
...WHERE stock_quantity LIKE '____'; -- 4 underscores
-- Anything
 SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '%';
 SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';
 -- (235)234-0987
 ... LIKE '(___)___-____';
 -- To scape chars \, 
 ...WHERE title LIKE '%\%%'; 
SELECT title FROM books;
SELECT title FROM books WHERE title LIKE '%\%%';
SELECT title FROM books WHERE title LIKE '%\_%';

-- Challenges
-- Titles that contain 'stories'
SELECT title 
FROM books 
WHERE title 
LIKE '%stories%';
-- Find the longest book
-- Print out title and page count
SELECT title, pages 
FROM books ORDER BY pages DESC LIMIT 1;
-- Print a summary containing the title and year, for the 3 most recent books
SELECT CONCAT(title, ' - ', released_year) 
AS Summary
FROM books 
ORDER BY released_year 
DESC LIMIT 3;
-- Find all books with an author_lname that contains a space(" ")
SELECT title, author_lname
FROM books 
WHERE author_lname LIKE '% %';
-- Find the 3 books with the lowest stock
-- select title, year and stock
SELECT title, released_year, stock_quantity 
FROM books ORDER BY stock_quantity LIMIT 3; 
-- or:
... FROM books ORDER BY 3 LIMIT 3;
-- Print title and author_lname, sorted first by author and then by title
SELECT title, author_lname 
FROM books ORDER BY author_lname, title;
-- or
FROM books ORDER BY 2,1;
-- Sorted Alphabetically by Last name
SELECT 
UPPER(
    CONCAT(
        'my favourite author is ', author_fname, ' ', author_lname, '!'
    )
)
AS Yell
FROM books ORDER BY author_lname;
    