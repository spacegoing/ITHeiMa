
create database class3;

show databases;

use class3;

create table test (f_a float(6));

alter table test modify f_a float(23);



delete from test where abs(f_a-123456789012345678901239)<1e22;

delete from test;

insert into test values (1e39);

select f_a+1.0 from test;

desc test;




use employees;

desc employees;

select * from employees where hire_date between '1986-06-26' and '1987-06-26';

select * from employees where first_name like '_iche%';



































