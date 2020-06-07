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

