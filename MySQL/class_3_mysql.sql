
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

select count(first_name),first_name as freq from employees group by first_name limit 10;

select count(first_name) from employees limit 10;

select avg(emp_no) from ( select * from employees limit 10 ) as a;


select first_name, count(*) as num from employees group by first_name;

create table test (
emp_no int(11),
first_name varchar(14),
gender enum('M','F'),
hire_date date
);

insert into test (select emp_no,first_name,gender,hire_date from employees limit 20);

select * from test;

select first_name,gender,emp_no from test group by gender, emp_no desc;





















