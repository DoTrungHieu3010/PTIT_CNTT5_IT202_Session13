CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE customers (
    customer_id   INT PRIMARY KEY,       
    customer_name VARCHAR(100),            
    email         VARCHAR(100),          
    city          VARCHAR(50)              
);

CREATE TABLE products (
    product_id   INT PRIMARY KEY,       
    product_name VARCHAR(100),              
    price        DECIMAL(12,2),             
    category     VARCHAR(50)              
);

CREATE TABLE orders (
    order_id    INT PRIMARY KEY,          
    customer_id INT,                     
    order_date  DATE,                   
    status      VARCHAR(30),              
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,        
    order_id      INT,                     
    product_id    INT,                 
    quantity      INT,                 
    unit_price    DECIMAL(12,2),           
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO customers VALUES
(1, 'Nguyen Van An',  'an@gmail.com',   'Ha Noi'),
(2, 'Tran Thi Binh',  'binh@gmail.com', 'Da Nang'),
(3, 'Le Van Cuong',   'cuong@gmail.com','Ho Chi Minh'),
(4, 'Pham Thi Dao',   'dao@gmail.com',  'Ha Noi'),
(5, 'Hoang Van Em',   'em@gmail.com',   'Can Tho');

INSERT INTO products VALUES
(1, 'Laptop Dell',          20000000, 'Electronics'),
(2, 'iPhone 15',            25000000, 'Electronics'),
(3, 'Tai nghe Bluetooth',    1500000, 'Accessories'),
(4, 'Chuột không dây',        500000, 'Accessories'),
(5, 'Bàn phím cơ',           2000000, 'Accessories');

INSERT INTO orders VALUES
(101, 1, '2025-01-05', 'Completed'),
(102, 2, '2025-01-06', 'Completed'),
(103, 3, '2025-01-07', 'Completed'),
(104, 1, '2025-01-08', 'Completed'),
(105, 4, '2025-01-09', 'Completed'),
(106, 5, '2025-01-10', 'Completed'),
(107, 2, '2025-01-11', 'Completed'),
(108, 3, '2025-01-12', 'Completed');

SELECT *
FROM products;
select avg(price)
from products;

select * 
from products
WHERE price > (SELECT AVG(price)FROM products);






