-- COUNT
SELECT COUNT(*) FROM books;
SELECT COUNT(author_fname) FROM books;
SELECT COUNT(DISTINCT author_fname) FROM books;
SELECT COUNT(author_lname) FROM books;
SELECT COUNT(DISTINCT author_lname) FROM books;
SELECT author_fname, author_lname FROM books;
SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;
-- How many title contain 'the'?
SELECT title FROM books WHERE title LIKE '%the%';
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

-- GROUP BY
SELECT title, author_lname FROM books;
SELECT title, author_lname FROM books
GROUP BY author_lname;
-- COUNT how many books each author has written
SELECT author_lname, COUNT(*)
FROM books GROUP BY author_lname;
--
SELECT title, author_fname, author_lname FROM books;
-- 
SELECT title, author_fname, author_lname FROM books
GROUP BY author_lname;-- form big rows
-- 
SELECT title, author_fname, author_lname, COUNT(*) FROM books
GROUP BY author_lname;-- this counts books in the big rows
-- 
SELECT author_fname, author_lname, COUNT(*) FROM books
GROUP BY author_lname;-- this counts books in the big rows
-- 
SELECT author_fname, author_lname, COUNT(*) FROM books
GROUP BY author_lname, author_fname;-- this combines author_lname, author_fname
-- 
SELECT released_year FROM books;--
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;--
SELECT 
CONCAT(
    'In ',
    released_year,
    ' ',
    COUNT(*),
    ' book(s) released'
) 
AS 'How many books'
FROM books GROUP BY released_year;-- fancy string way

-- MIN and MAX
-- Find the minimum and the maximum
SELECT MIN(released_year)
FROM books;
SELECT MAX(pages)
FROM books;

-- Subqueries
-- What if i want the title of the longest book?
SELECT title, pages FROM books
WHERE pages = (
    SELECT MAX(pages) 
    FROM books
);
-- faster way
SELECT * FROM books
ORDER BY pages ASC LIMIT 1;

-- Using MIN/MAX With GROUP BY
-- Find the year each author published their first book
SELECT
    author_fname,
    author_lname,
    MIN(released_year)
FROM books
GROUP BY author_lname, author_fname;
--
SELECT
    author_fname AS Name,
    author_lname AS 'Last name',
    MIN(released_year) AS Year
FROM books
GROUP BY author_lname, author_fname
ORDER BY released_year;
-- -Find the longest page count for each author
SELECT 
    author_fname,
    author_lname,
    MAX(pages)
FROM books
GROUP BY author_lname, author_fname;
-- Fancy
SELECT 
CONCAT(
    author_fname,
    ' ',
    author_lname
) AS Author,
MAX(pages) AS Pages,
released_year AS Year
FROM books
GROUP BY author_lname, author_fname
ORDER BY pages;

--SUM
SELECT SUM(pages) FROM books;
SELECT SUM(released_year) FROM books;
-- SUM + GROUP BY
-- Sum all pages each author has written
SELECT author_fname, author_lname, SUM(pages)
FROM books
GROUP BY author_lname, author_fname;
--
SELECT author_fname, author_lname, SUM(released_year)
FROM books
GROUP BY author_lname, author_fname;

--AVG
-- Calculate te average released_year across all books
SELECT AV(released_year) FROM books;
SELECT AV(pages) FROM books;
-- Calculate the average stock quantity for books released in the same year
SELECT AVG(stock_quantity)
FROM books
GROUP BY released_year;
--
SELECT released_year, AVG(stock_quantity)
FROM books
GROUP BY released_year;
--
SELECT author_fname, author_lname, AVG(pages)
FROM books
GROUP BY author_fname, author_lname;

--Examples
-- Print the bumber of books in the database
SELECT COUNT(*) AS 'How many' FROM books;
-- How many books were released in each year
SELECT 
released_year AS Year,
COUNT(*) AS 'How many'
FROM books
GROUP BY released_year;
-- Print the total number of book in stock
SELECT SUM(stock_quantity) AS stock
FROM books;
--Find the average released_year for each author
SELECT
CONCAT(
    author_fname, ' ', author_lname
) AS author,
AVG(released_year) AS year
FROM books
GROUP BY author_fname, author_lname;
-- Find the fullname of the author who wrote the longest book
SELECT 
CONCAT(
    author_fname, ' ', author_lname
) AS Author,
MAX(pages) AS Pages
FROM books
GROUP BY pages
ORDER BY  pages DESC LIMIT 1;
-- 
SELECT
CONCAT(
    author_fname, ' ', author_lname
) AS Author
pages AS Pages
FROM books
WHERE pages = (
    SELECT MAX(pages)
    FROM books
);
-- Make this happen
SELECT
released_year AS year,
COUNT(*) AS '# books',
AVG(pages) AS 'avg pages'
FROM books
GROUP BY released_year;
