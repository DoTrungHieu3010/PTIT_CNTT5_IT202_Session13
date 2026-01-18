create database ex04;
use ex04;

create table customers (
    id int auto_increment primary key,
    name varchar(50) not null,
    email varchar(50) unique
);

create table orders (
    id int auto_increment primary key,
    customer_id int not null,
    order_date date,
    total_amount decimal(12,2) default 0
);

insert into customers (id, name, email) values
(1, 'a',  'a@gmail.com'),
(2, 'b',  'b@gmail.com'),
(3, 'c',   'c@gmail.com'),
(4, 'd',   'd@gmail.com'),
(5, 'e',   'e@gmail.com');

insert into orders (id, customer_id, order_date, total_amount) values
(1, 1, '2025-01-01', 1500000),
(2, 1, '2025-01-03', 2500000),
(3, 2, '2025-01-04', 1800000),
(4, 3, '2025-01-05', 3200000),
(5, 3, '2025-01-06', 2100000),
(6, 4, '2025-01-07',  900000);

select name, (select count(*) from orders where orders.customer_id = customers.id) 
as total_orders
from customers;

select *
from customers
where id in (
    select customer_id
    from orders
    group by customer_id
    having sum(total_amount) = (
        select max(total_)
    )
);

       
   


