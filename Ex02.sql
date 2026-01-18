create database ex01;
use ex01;

create table customers (
    id int auto_increment primary key,
    name varchar(50) not null,
    email varchar(50) unique
);

create table orders (
    id int auto_increment primary key,
    customer_id int not null,
    order_date date,
    total_amount decimal(12,2) default 0,
    foreign key (customer_id) references customers(id)
);

insert into customers (name, email) values
('a','a@gmail.com'),
('b','b@gmail.com'),
('c','c@gmail.com'),
('d','d@gmail.com'),
('e','e@gmail.com'),
('f','f@gmail.com'),
('g','g@gmail.com');

insert into orders (customer_id, total_amount) values
(1, 2500000),
(2, 1800000),
(3, 3200000),
(1, 1500000),
(4, 4200000),
(5, 900000),
(6, 2700000);

select *
from customers
where id in (
    select customer_id
    from orders
);
