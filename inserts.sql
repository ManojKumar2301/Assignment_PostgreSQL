--DATA INSERTION

--CUSTOMERS INSERTION
INSERT INTO customers (name, email) 
VALUES 
  ('John Doe', 'john@gmail.com'),
  ('Jane Smith', 'jane@gmail.com'),
  ('Manoj Kumar', 'manoj@gmail.com');

SELECT* FROM customers;

--PRODUCTS INSERTION
INSERT INTO products (product_name, price) 
VALUES 
  ('Laptop', '999.99'),
  ('Smartphone', '499.99');

SELECT * FROM PRODUCTS;

--ORDERS INSERTION
INSERT INTO orders (order_id, customer_id, order_date) 
VALUES 
  (101, 1, '2023-01-01'),
  (102, 2, '2023-01-02');

SELECT * FROM ORDERS;

--ORDER_ITEMS INSERTION
INSERT INTO order_items (order_id, product_id, quantity) 
VALUES 
  (101, 1, 1),
  (101, 2, 2),
  (102, 1, 3);

SELECT * FROM order_items
