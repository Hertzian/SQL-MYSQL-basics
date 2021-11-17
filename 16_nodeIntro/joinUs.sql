CREATE DATABASE join_us;
USE join_us;
-- SELECT CURDATE();
-- SELECT 1+4;

CREATE TABLE users (
    -- id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    email VARCHAR(255) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW()
);

-- exercises
-- Challenge 1
-- find earliest date a user joined (as earliest_date)
-- with date correct format
SELECT 
DATE_FORMAT(MIN(created_at), '%M %D %Y') AS earliest_date
FROM users;

-- Challenge 2
-- find email of the first earliest user
SELECT * FROM users
WHERE created_at = (
    SELECT MIN(created_at) FROM users
);

-- Challenge 3
-- Users according to the month they joined
SELECT MONTHNAME(created_at) AS month, COUNT(*) AS count
FROM users
GROUP BY month
ORDER BY count DESC;

-- Challenge 4
-- Count number of users with yahoo emails
SELECT COUNT(*) AS yahoo_users
FROM users
WHERE email LIKE '%@yahoo.com'; 

-- Challenge 5
-- Calculate total number of users for each email host
SELECT
    CASE
        WHEN email LIKE '%@gmail.com' THEN 'gmail'
        WHEN email LIKE '%@yahoo.com' THEN 'yahoo'
        WHEN email LIKE '%@hotmail.com' THEN 'hotmail'
        ELSE 'other'
    END AS provider,
    COUNT(*) AS total_users
FROM users
GROUP BY provider
ORDER BY total_users DESC;
