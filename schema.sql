--CUSTOMERS TABLE
CREATE TABLE customers(
customer_id SERIAL PRIMARY KEY, 
name VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL, 
join_date DATE DEFAULT CURRENT_DATE);

--PRODUCTS TABLE
CREATE TABLE products(
product_id SERIAL PRIMARY KEY, 
product_name VARCHAR(50) NOT NULL,
price DECIMAL(10, 2)CHECK (price > 0));

--ORDERS TABLE
CREATE TABLE orders(
order_id INT PRIMARY KEY, 
customer_id INTEGER REFERENCES customers(customer_id) ON DELETE CASCADE,
order_date DATE DEFAULT CURRENT_DATE);

--ORDER_ITEMS TABLE
CREATE TABLE order_items(
order_item_id SERIAL PRIMARY KEY, 
order_id INT REFERENCES orders (order_id) ON DELETE CASCADE, 
product_id INT REFERENCES products(product_id) ON DELETE CASCADE,
quantity INT CHECK (quantity >= 1));

--SCHEMA OF EACH TABLE
\d customers
\d products
\d orders
\d order_items
