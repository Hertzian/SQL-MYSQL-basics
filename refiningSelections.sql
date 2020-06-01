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
--next anotation