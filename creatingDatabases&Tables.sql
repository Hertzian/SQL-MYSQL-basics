#start the cli
mysql-ctl cli;

#show databases
show databases;

#general command to create a database
CREATE DATABASE <name>;
CREATE DATABASE soap_store_db;

#delete database
DROP DATABASE <NAME>;
DROP DATABASE soap_store_db;

#use a specific database
USE <database name>;
USE soap_store_db;

#info to know which db is in use
SELECT DATABASE();

CREATE DATABASE tweets;
table USER
username varchar(15);
content varchar(140);
favs int;

# create tables
CREATE TABLE cats (
    name VARCHAR(100),
    age INT
);

# show tables
SHOW TABLES;

# show columns from tables
SHOW COLUMNS FROM <table name>;
SHOW COLUMNS FROM cats;

# show columns short version 
DESC <table name>;
DESC cats;

# deleting tables
DROP TABLE <table name>;
DROP TABLE cats;

-- Not null
CREATE TABLE cats2(
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

-- to set default values
CREATE TABLE cats3(
    name VARCHAR(100) default 'unnamed',
    age INT DEFAULT 99
);

CREATE TABLE cats4(
    name VARCHAR(100) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
);

-- Primary keys
CREATE TABLE unique_cats(
    cat_id INT NOT NULL,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

CREATE TABLE unique_cats(
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY(cat_id)
);

CREATE TABLE employees(
    id INT NOT NULL AUTO_INCREMENT,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    age INT NOT NULL,
    current_status VARCHAR(200) NOT NULL DEFAULT 'employed',
    PRIMARY KEY(id)
);

CREATE TABLE employees(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    age INT NOT NULL,
    current_status VARCHAR(200) NOT NULL DEFAULT 'employed',
);

INSERT INTO employees(first_name, last_name, age) VALUES
('Dora', 'Smith', 58);