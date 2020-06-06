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
SELECT title, author_fname, author_lname FROM books;
SELECT title, author_fname, author_lname FROM books
GROUP BY author_lname;-- form big rows