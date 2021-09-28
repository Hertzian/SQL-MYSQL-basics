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
-- find earliest date a user joined (as earliest_date)
-- with date correct format
SELECT created_at AS earliest_date
FROM users
ORDER BY created_at DESC LIMIT 1;
-- find email of the first earliest user

-- Users according to the month they joined
-- columns: month count

-- Count number of users with yajoo emails
SELECT COUNT(email)
AS yahoo_users
WHERE email
LIKE '%yahoo.com'; 
