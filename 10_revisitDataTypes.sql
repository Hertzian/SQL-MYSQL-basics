-- CHAR/VARCHAR
-- Is faster for fixed length text than VARCHAR
CREATE DATABASE new_testing;
USE new_testing;
--
CREATE TABLE dogs (
    name CHAR(5),
    breed VARCHAR(10)
);
--
INSERT INTO dogs
(name, breed)
VALUES
('Bob', 'beagle'),
('Robby', 'corgi'),
('Princess Jane', 'retriever');
--
SELECT * FROM dogs;

-- Numbers 
-- DECIMAL(5,2) -- very accurate
-- DECIMAL(<total-number-of-digits>,<digits-after-decimal>)
-- Example: 999.99
CREATE TABLE items (price DECIMAL(5,2));
-- 
INSERT INTO items
(price)
VALUES
(7), -- 7.00
(79896754), -- 999.99
(34.88), -- 34.88
(298.9999), -- 299.00
(1.9999); -- 2.00

-- FLOAT and DOUBLE
-- Used for store larger numbers using less space,
-- It comes at the cost of precision
CREATE TABLE thingies(price FLOAT);
INSERT INTO thingies (price) VALUES(88.45);-- 88.45
INSERT INTO thingies (price) VALUES(8877.45);-- 8877.45
INSERT INTO thingies (price) VALUES(8877665544.45);-- 887767000

-- DATE, TIME and DATETIME
-- DATE, Values with a date but no time 'YYYY-MM-DD' Format
-- TIME, Values with a time but no date 'HH:MM:SS' Format
-- DATETIME, Values with a date and time 'YYYY-MM-DD HH:MM:SS' Format

CREATE TABLE people(
    name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES
('Toaster', '2017-04-21', '19:12:43', '2017-04-21 19:12:43'),
('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42'),
('Padma', '1983-11-11', '10:07:35', '1983-11-11 0:07:35');

-- CURDATE(), Current date
-- CURTIME(), Current time
-- NOW(), Now
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES
('Microwave', CURDATE(), CURTIME(), NOW());

-- Formatting DATES
SELECT name, birthdate FROM people;
SELECT name, DAY(birthdate) FROM people;

-- formating Dates (and times)
-- DAY(), Day number
-- DAYNAME(), Day name
-- DAYOFWEEK(), Day number of week
-- DAYOFYEAR(), Day number of year
-- MONTH(), Month number 
-- MONTHNAME(), Month name
-- HOUR(), The hour
-- MINUTE(), The minute
SELECT CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) FROM people;
SELECT DATE_FORMAT(birthdate, '%M %W %D %Y') AS Fechas FROM people;
SELECT DATE_FORMAT(birthdate, '%m / %d / %Y') AS Fechas FROM people;
SELECT DATE_FORMAT(birthdate, '%m / %d / %Y at %h : %m') AS Fechas FROM people;

-- to know the difference between dates
-- DATEDIFF(date_1, date_2)
SELECT DATEDIFF(NOW(), birthdate) FROM people;
SELECT name, CONCAT(DATEDIFF(NOW(), birthdate), ' days') AS Days FROM people;

-- DATE_ADD(first_date, INTERVAL <unit_to_add>)
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;
-- To add 15 months AND 10 hours
SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;

-- Timestamps
CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);
INSERT INTO comments (content) VALUES ('lol what a funny article');
INSERT INTO comments (content) VALUES ('I found this offensive');
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO comments2 (content) VALUES ('lol what a funny article');
INSERT INTO comments2 (content) VALUES ('I found this offensive');
INSERT INTO comments2 (content) VALUES ('lololololol');
INSERT INTO comments2 (content) VALUES ('I like cats and dogs');
UPDATE comments2 SET content='I laughted a lot' WHERE content='lololololol';

CREATE TABLE inventory (
    item_name VARCHAR(30),
    price DECIMAL(8, 2),
    quantity INT
);

SELECT CURTIME();
SELECT CURDATE();
SELECT DAY(CURDATE());
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(NOW(),'%D'); 
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(),'%m/%d/%Y');
SELECT DATE_FORMAT(CURDATE(), '%M %D at %h:%m');

CREATE TABLE tweets (
    content VARCHAR(150),
    username VARCHAR(30),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO tweets (content, username) VALUES ('This is a tweet example...', 'lalito');
