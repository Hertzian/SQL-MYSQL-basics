-- Access MariaDB server
-- $>  sudo mysql -u -root
-- $>  sudo mariadb -u -root

-- If password:
-- $>  sudo mysql -u -root -p
-- $>  sudo mariadb -u -root -p

-- once youre in, create dummy DB
CREATE DATABASE <your_dummy_database>;

-- See all Databases
SHOW DATABASES; 

-- Once your see your dummy DB, create new user:
CREATE USER <user_test>@localhost IDENTIFIED BY <user_password>;

-- Check user status
SELECT User FROM mysql.user;

-- Grant privileges to mariadb user:
-- This is for gave all privileges on all DB's
GRANT ALL PRIVILEGES ON *.* TO <user_test>@localhost IDENTIFIED BY <user_password>;

-- To gran privileges only for one db:
GRANT ALL PRIVILEGES ON <your_or_any_db>.* TO <user_test>@localhost;

-- To refresh privileges once new ones have been awared:
FLUSH PRIVILEGES;

-- To show privileges on user created
SHOW GRANTS FOR <user_test>@localhost;

-- To remove mariadb user account
DROP USER <user_test>@localhost;
