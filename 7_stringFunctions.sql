CREATE TABLE cats (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY(cat_id)
);

-- To run sql files
-- source <file-route/filename>

-- Book data
CREATE DATABASE book_shop;
USE book_shop;
CREATE TABLE books(
    book_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT
);

INSERT INTO books 
(title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

-- CONCAT()
CONCAT(<column>, <another_column>, <x>);-- No spaces
CONCAT(<column>, 'text', <another_column>, 'more text');

-- Example
CONCAT(author_fname, ' ', author_lname);
SELECT CONCAT(author_fname, ' ', author_lname)
 AS 'fullname' FROM books;
--  
SELECT 
author_fname AS first,
author_lname AS last,
CONCAT(author_fname, ' ', author_lname) AS full
FROM books;

-- CONCAT_WS()
SELECT
CONCAT(title, '-', author_fname, '-', author_lname)
FROM books;
-- 
SELECT
CONCAT_WS(' - ', title, author_fname, author_lname)
FROM books;

-- SUBSTRING()
SELECT SUBSTRING('Hello World', 1, 4);-- Hell
SELECT SUBSTRING('Hello World', 3, 8);-- llo Worl
SELECT SUBSTRING('Hello World', 7);-- World
SELECT SUBSTRING('Hello World', 3);-- llo World
SELECT SUBSTRING('Hello World', -3);-- rld
SELECT SUBSTRING('Hello World', 7);-- o World
SELECT SUBSTRING("Where I'm Calling From: Selected Stories", 1, 10);
SELECT SUBSTRING(title, 1, 10) FROM books;
SELECT
    CONCAT(
        SUBSTRING(title, 1, 10),
        '...'
    )
AS 'Short title'
FROM books;

-- REPLACE()
SELECT REPLACE('Hello World', 'Hell', '%$#@'); -- %$#@o World
SELECT REPLACE('Hello World', 'l', '7'); -- He77o Wor77d
SELECT REPLACE('Hello World', 'o', '0'); -- Hell0 W0rld
SELECT REPLACE('HellO World', 'o', '*'); -- HellO W*rld
SELECT REPLACE('cheese bread coffee milk', ' ', ' and '); -- cheese and bread and coffee and milk
SELECT REPLACE(title, 'e', '3') AS 'Lleva 3´s' FROM books;
SELECT
    CONCAT(
        SUBSTRING(
            REPLACE(title, 'e', '3'),
            1,
            10
        ),
        '...'
    )
AS
'Que jalada'
FROM books;

-- REVERSE()
SELECT REVERSE('Hello World'); -- dlroW olleH
SELECT
    REVERSE(author_fname)
AS 'Authors'
FROM books;
SELECT
    CONCAT(
        'woof', 
        REVERSE('woof')
    );
SELECT
    CONCAT(
        author_fname, 
        REVERSE(author_fname)
    )
AS 'Batidillo'
FROM books;

-- CHAR_LENGTH()
SELECT CHAR_LENGTH('Hello World'); -- 11
SELECT
    author_fname 
    AS 'Nombre',
    CONCAT(
        author_fname,
        ' - ',
        CHAR_LENGTH(author_fname),
        ' chars.'
    )
AS 'Caracteres'
FROM books;

-- UPPER() & LOWER()
SELECT UPPER('Hello World'); -- HELLO WORLD
SELECT LOWER('Hello World'); -- hello world
SELECT UPPER(title) FROM books;
SELECT 
    CONCAT(
        'My favourite book is ',
        UPPER(title),
        ' from ',
        author_fname,
        ' ',
        author_lname
    )
    AS 'Favorito'
FROM books
WHERE title = 'White noise';

-- Challenges
-- Reverse and uppercase the following sentence:
-- Why does my cat look at me with such hatred?
SELECT 
    REVERSE(
        UPPER(
        'Why does my cat look at me with such hatred?'
        )
    );

SELECT
    REPLACE(
        CONCAT(
            'I',
            ' ',
            'like',
            ' ',
            'cats'
        ),
        ' ',
        '-'
    ); -- replaces ' ' with '-'

-- Replace spaces in titles with ->
SELECT
    REPLACE(
        title,
        ' ',
        '->'
    )
AS title
FROM books;

-- print forwards and backwards last name with palindrome and custom columns name
SELECT
author_lname
AS
'forwards',
REVERSE(
    author_lname
)
AS
'backwards'
FROM books;

-- print full authors name in caps with custom column name
SELECT
    UPPER(
        CONCAT(
            author_fname,
            ' ',
            author_lname
        )
    )
AS 'Full name in caps'
FROM books;

-- column name 'blurb', title ' was released in ' year
SELECT
    CONCAT(
        title,
        ' was released in ',
        released_year
    )
AS 'blurb' 
FROM books;

-- print book titles and the length of each title
SELECT
title,
CHAR_LENGTH(
title
)
AS 'character count'
FROM books;

-- print short title, author, quantity
SELECT
CONCAT(
    SUBSTRING(title, 1, 10),
    '...'
)
AS 'Short title',
CONCAT(
    author_lname,
    ', ',
    author_fname
)
AS 'Author',
CONCAT(
    stock_quantity,
    ' in stock'
)
AS 'Quantity'
FROM books;
