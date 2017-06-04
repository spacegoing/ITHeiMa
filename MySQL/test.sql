show databases;

use employees;

show tables;

select * from ;

## Slides ##

create database slides;
use slides;

create table s_enrol(
studentid int,
courseno text,
semester text,
status text,
enroldate text
);
insert into s_enrol values (456, 'comp1130', '2015s1', 'active', '25/02/2015'),
(457, 'comp1130', '2015s1', 'active', '25/02/2015');

create table s_student(
studentid int,
name text,
dob text,
email text
);
insert into s_student values (456, 'tom', '25/01/1998', 'tom@gmail.com'),
(458,'peter','20/02/1991', 'peter@hotmail.com');

delete * from s_enrol;

drop database test;


## TYDB ##

# Q: Why case sensitive?
use tydb;
show tables;

show create database tydb;
show create table Vendors;

select vend_name, prod_name, prod_price from Vendors, Products
where Vendors.vend_id = Products.vend_id;

select * from OrderItems;
select * from Products;
select * from Vendors;

select * from Orders;

select * from Customers;

select * from Orders o1, Orders o2 where o1.order_num = 1;



select cust_name,cust_state,(select count(*)
from Orders
where Orders.cust_id = Customers.cust_id) as orders
from Customers order by cust_name;

select cust_name,cust_state,count(*) as orders
from Orders o left join Customers c
on o.cust_id=c.cust_id group by o.cust_id;

select count(cust_name) as orders from Customers where cust_id=102;

show collation;
























