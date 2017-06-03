
create database sql_class_itheima;

show databases;

use sql_class_itheima;

create table int_2 (
a tinyint,
b tinyint unsigned
);

desc int_2;

alter table int_2 add c bool;

create table float_decimal(
qian decimal(15,5)
);

insert into float_decimal values (1234567890.123456);

select * from float_decimal;

create table test (
a float(0-23,1) 4 bytes,
);

insert into test(a) values (1.2);

select * from test;

desc test;

insert into test values (1234.123,1234.1235);

select * from test;


create table time_1(
stamp timestamp,
date_time datetime
);

insert into time_1(date_time) values ('1992-01-01');

select * from time_1;

CREATE TABLE myset (col SET('a', 'b', 'c', 'd'));

alter table myset add inc int auto_increment;









































