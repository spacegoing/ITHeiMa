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



show collation;
























