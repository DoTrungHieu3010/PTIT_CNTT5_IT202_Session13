create database ex02;
use ex02;

create table products (
    id int auto_increment primary key,
    name varchar(50) not null,
    price decimal(12,2) default 0
);

create table order_items (
    order_id int not null,
    product_id int not null,
    quantity int default 1
);

insert into products (name, price) values
('laptop dell', 20000000),
('iphone 15', 25000000),
('tai nghe bluetooth', 1500000),
('chuot khong day', 500000),
('ban phim co', 2000000),
('man hinh lg', 4500000),
('loa bluetooth', 1800000);

insert into order_items (order_id, product_id, quantity) values
(1, 1, 1),
(2, 3, 2),
(3, 2, 1),
(4, 5, 1),
(5, 1, 1),
(6, 4, 3),
(7, 6, 1);

select *
from products
where id 
in ( select product_id from order_items);


