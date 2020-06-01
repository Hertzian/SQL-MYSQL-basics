-- Insert
-- Order matters!
INSERT INTO cats(
    name,
    age
) VALUES(
    'Jetson',
    7
);

INSERT INTO cats(
    age
    name,
) VALUES(
    7
    'Jetson',
);

SELECT * FROM cats;

INSERT INTO cats(
    name,
    age
) VALUES
('Charlie', 10),
('Sadie', 3),
('Lazy Bear', 1);

CREATE TABLE people(
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT
);

INSERT INTO people(
    first_name, last_name, age
)VALUES
('Tina', 'Belcher', 13),
('Bob','Belcher',42),
('Linda','Belcher',45),
('Phillip', 'Frond', 38),
('Calvin','Fischoeder', 70);

DROP TABLE people;

INSERT INTO cats( name, age) VALUES ('This cat is named Charlie which is
also a human name. In fact I know a couple of Charlies. Fun fact...',10);

-- to show warnings
SHOW WARNINGS;