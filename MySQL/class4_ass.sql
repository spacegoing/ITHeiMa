create database lichang;
use lichang;

create table employee (
empid int primary key,
name varchar(5),
sex varchar(2),
title varchar(10),
birthday date,
depid int
);


create table department (
depid int primary key,
depname varchar(10)
);

create table salary (
empid int primary key,
basesalary int,
titlesalary int,
deduction int
);

insert into employee values (1001, '张三', '男', '高级工程师', '1975-01-01',111), (1002, '李四', '女', '助攻', '1985-01-01',111),(1003, '王五', '男', '工程师', '1978-11-11',222), (1004, '赵六', '男', '工程师', '1979-01-01',222);
insert into department values (111,'生产部'),(222,'销售部'),(333,'人事部');
insert into salary values (1001,2200,1100,200),(1002,1200,200,100),(1003,1900,700,200),(1004,1950,700,150);

select * from employee;

select * from department;

select * from salary;

desc employee;
desc department;
desc salary;


# 3
alter table department add dept_intro text;

#5
update employee set title='工程师' where name='李四';
update salary set basesalary=1700, titlesalary=600 where empid=
(select empid from employee where name='李四');

#6
delete from department where depname='人事部';

#7
select s.empid, name, (basesalary+titlesalary-deduction) as '实发工资',
(titlesalary+basesalary) as '应发工资' from employee e inner join salary s
on e.empid=s.empid;








drop database lichang;

























