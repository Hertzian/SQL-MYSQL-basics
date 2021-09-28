-- Create
INSERT INTO cats(
    name,
    age
)
VALUES
('taco' 12);

CREATE TABLE cats(
    cat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCAHR(100),
    breed VARCHAR(100),
    age INT
)

INSERT INTO cats(name, breed, age)
VALUES
('Ringo','Tabby',4),
('Cindy','Maine Coon',10),
('Dumbledore','Maine Coon',11),
('Egg','Persian',4),
('Misty','Tabby',13),
('George Michael','Ragdoll',9),
('jackson','Shpynx',7);

-- Read
SELECT * FROM cats;
SELECT cat_id FROM cats;
SELECT name FROM cats;
SELECT name, age FROM cats;
SELECT age, breed, name, cat_id FROM cats;

-- Where
SELECT * FROM cats WHERE age = 4;
SELECT * FROM cats WHERE name = 'Egg'; -- case insensitive
SELECT * FROM cats WHERE name = 'eGg'; -- case insensitive

-- SELECT Challenges
SELECT cat_id FROM cats;
SELECT name, breed FROM cats;
SELECT name, age FROM cats WHERE breed = 'Tabby';
SELECT cat_id, age FROM cats WHERE cat_id = age;
SELECT *  FROM cats WHERE cat_id = age;

-- Aliases
SELECT cat_id AS id, name FROM cats;
SELECT cat_id AS gato_id, name AS nombre FROM cats;
SELECT name AS 'cat name', breed AS 'kitty breed' FROM cats;
SELECT name AS 'nombre del gato', breed AS 'camada de gatos' FROM cats;

-- Update
UPDATE cats 
SET breed = 'Shorthair'
WHERE breed = 'Tabby';
-- 
UPDATE cats
SET age = 14
WHERE name = 'Misty';
-- Rule of thumb,
-- Try SELECTing before UPDATE
-- 
-- Change jackson name to jack;
SELECT * FROM cats WHERE name = 'Jackson';
UPDATE cats SET name = 'Jack' WHERE name = 'jackson';
-- Change Ringo´s breed to shorthair
SELECT * FROM cats WHERE name = 'Ringo';
UPDATE cats SET breed = 'British Shorthair' WHERE name = 'Ringo';
-- Update both main coons ages to be 12
SELECT * FROM cats WHERE breed = 'Maine Coon';
UPDATE cats SET age = 12 WHERE breed = 'Maine Coon';

-- Delete
SELECT * FROM cats WHERE name = 'Egg';
DELETE FROM cats WHERE name = ' Egg';
DELETE FROM cats;-- Deletes all data in this table!
SELECT * FROM cats WHERE age = 4;
DELETE FROM cats WHERE age = 4;
SELECT * FROM cats WHERE age = cat_id;
DELETE FROM cats WHERE age = cat_id;
SELECT * FROM cats;
DELETE FROM cats;
-- Rule of thumb,
-- Try SELECTing before DELETE

-- Challenge 1
CREATE DATABASE shirts_db;
USE shirts_db;
CREATE TABLE shirts (
    shirt_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    article VARCHAR(100),
    color VARCHAR(100);
    shirt_size VARCHAR(1),
    last_worn INT
);
INSERT INTO shirts
(article, color, shirt_size, last_worn)
VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);
SELECT * FROM shirts;
INSERT INTO shirts
(color, article, shirt_size, last_worn)
VALUES
('purple', 'polo shirt', 'M', 50);
SELECT article, color FROM shirts;
-- 
SELECT article, color, shirt_size, last_worn 
FROM shirts 
WHERE shirt_size = 'M';
-- 
SELECT * FROM shirts WHERE article = 'polo shirt';
UPDATE shirts SET shirt_size = 'L' WHERE article = 'polo shirt';
SELECT * FROM shirts WHERE last_worn = 15;
-- 
UPDATE shirts 
SET last_worn = 0 
WHERE last_worn = 15;
-- 
SELECT * FROM shirts WHERE color = 'white';
UPDATE shirts
SET shirt_size = 'XS', color = 'off white'
WHERE color = 'white';
-- 
SELECT * FROM shirts WHERE last_worn = 200;
DELETE FROM shirts WHERE last_worn = 200;
SELECT * FROM shirts WHERE article = 'tank top';
DELETE FROM shirts WHERE article = 'tank top';
SELECT * FROM shirts;
DELETE FROM shirts;
DROP TABLE shirts;


