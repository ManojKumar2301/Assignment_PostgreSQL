--BASIC QUERIES
--List all customers sorted by join_date (newest first).
SELECT * FROM customers ORDER BY join_date DESC;

--Find all orders placed in January 2023.
SELECT * FROM orders WHERE order_date >= '2023-01-01' AND order_date < '2023-02-01';

--Calculate the total revenue from all orders.
SELECT SUM(order_items.quantity * products.price) as total_revenue FROM order_items INNER JOIN products ON order_items.product_id=products.product_id;

--Joins and Relationships
--Show all orders with customer names and order dates.
SELECT customers.name, orders.order_date FROM customers INNER JOIN orders on customers.customer_id = orders.customer_id;

--List products that have never been ordered.
SELECT products.product_name
FROM Products
LEFT JOIN Order_Items order_items ON products.product_id = order_items.product_id
WHERE order_items.product_id IS NULL;

--Find the top-spending customer (total spent across all orders).
SELECT customers.name, SUM(order_items.quantity * products.price) AS total_spent
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
INNER JOIN order_items ON orders.order_id = order_items.order_id
INNER JOIN products ON order_items.product_id = products.product_id
GROUP BY customers.name
ORDER BY total_spent DESC
LIMIT 1;

--Data Manipulation
--Update the price of "Laptop" to 899.99.
UPDATE products SET price=899.99 WHERE product_name='Laptop';

--Delete all orders placed before 2023-01-02.
DELETE FROM orders WHERE order_date < '2023-01-02';

--Add a new product "Headphones" priced at 149.99.
INSERT INTO products (product_name, price) VALUES ('Headphones', 149.99);

--Advanced Challenges
--Calculate the average order value per customer.
SELECT customers.name, AVG(order_items.quantity * products.price) AS average_order_value
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
INNER JOIN order_items ON orders.order_id = order_items.order_id
INNER JOIN products ON order_items.product_id = products.product_id
GROUP BY customers.name
ORDER BY average_order_value DESC;

--Create an index to optimize querying orders by customer_id.
CREATE INDEX customer_orders ON orders (customer_id);

SELECT * FROM orders WHERE customer_id = 2;

--Find products ordered more than 2 times in total.
SELECT product_name, SUM(order_items.quantity) AS total_ordered
FROM order_items
INNER JOIN products ON order_items.product_id = products.product_id
GROUP BY product_name
HAVING SUM(order_items.quantity) > 2;
