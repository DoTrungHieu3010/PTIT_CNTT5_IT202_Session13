create database ex03;
use ex03;

create table orders (
    id int auto_increment primary key,
    customer_id int not null,
    order_date date,
    total_amount decimal(12,2) default 0
);

insert into orders (customer_id, order_date, total_amount) values
(1, '2025-01-01', 1500000),
(2, '2025-01-02', 2500000),
(3, '2025-01-03', 1800000),
(4, '2025-01-04', 4200000),
(5, '2025-01-05', 900000);

select *
from orders
where total_amount > (select avg(total_amount) from orders);

