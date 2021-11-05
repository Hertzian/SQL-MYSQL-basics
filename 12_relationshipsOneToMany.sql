-- One to many
CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email)
VALUES 
('Boy', 'George', 'george@gmail.com'),
('George', 'Michael', 'gm@gmail.com'),
('David', 'Bowie', 'david@gmail.com'),
('Blue', 'Steele', 'blue@gmail.com'),
('Bette', 'Davis', 'bette@gmail.com'),
('Maroma', 'Aguilar', 'maroma@gmail.com');

INSERT INTO orders(order_date, amount, customer_id)
VALUES
('2016/02/10', 99.99, 1),
('2017/11/11', 35.50, 1),
('2014/12/12', 800.67, 2),
('2015/01/03', 12.50, 3),
('1999/04/11', 450.25, 5);

SELECT * FROM orders;
SELECT * FROM customers WHERE last_name = 'George';
SELECT * FROM orders WHERE customer_id = 1;
--
SELECT * FROM orders WHERE customer_id = 1;
SELECT * FROM customers WHERE last_name = 'George';
--
SELECT * FROM orders WHERE customer_id =
(
    SELECT id FROM customers
    WHERE last_name = 'George'
);
--
SELECT * FROM customers, orders;

-- Cross Join
-- Implicit inner Join
SELECT * FROM customers, orders WHERE customers.id = orders.customer_id;
SELECT first_name, last_name, order_date, amount FROM customers, orders WHERE customers.id = orders.customer_id;
SELECT first_name, last_name, amount, order_date 
FROM customers, orders 
WHERE customers.id = orders.customer_id;
--
-- Explicit inner Join
SELECT * FROM customers 
JOIN orders
ON customers.id = orders.customer_id;
SELECT first_name, last_name, amount, order_date 
FROM customers 
JOIN orders
ON customers.id = orders.customer_id;
SELECT first_name, last_name, customers.id AS user_id, customer_id, amount, order_date
FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id;
SELECT first_name, last_name, c.id AS user_id, customer_id, amount, order_date
FROM customers AS c
JOIN orders AS o
ON c.id = o.customer_id;
-- Arbitrary Join - dont do this!
SELECT * FROM customers
JOIN orders
ON customers.id = orders.id;
-- Order matter!
SELECT * FROM orders, customers;
SELECT * 
FROM orders
JOIN customers
ON customers.id = orders.customer_id;

-- It can be possible combine actions
SELECT first_name, last_name, customers.id AS user_id, customer_id, amount, order_date
FROM customers
JOIN orders
ON customers.id = orders.customer_id
ORDER BY order_date;
SELECT first_name, last_name, amount, order_date
FROM customers
JOIN orders
ON customers.id = orders.customer_id
GROUP BY orders.customer_id;
SELECT first_name, last_name, SUM(amount) AS total_spent, order_date
FROM customers
JOIN orders
ON customers.id = orders.customer_id
GROUP BY orders.customer_id
ORDER BY total_spent;
-- Left Join
SELECT first_name, last_name, order_date, amount FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id;
SELECT first_name, last_name, order_date, amount 
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id
GROUP BY customers.id;
SELECT first_name, last_name, SUM(amount)
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id
GROUP BY customers.id;
SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS total_spent
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;








