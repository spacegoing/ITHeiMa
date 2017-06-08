# 创建数据库
create database qiruihua;

# 隐式指定数据库
use qiruihua;

# 统一客户端和服务端编码格式
set names gbk;

# 创建表
# 雇员表
create table emoloyee (
	empid int unsigned auto_increment,
	name varchar(10),
	sex enum('male','female'),
	title varchar(20),
	birthday date,
	depid int unsigned,
	primary key(empid)
);
# 部门表
create table department(
	depid int unsigned auto_increment,
	depname varchar(20),
	primary key(depid)
);
# 工资表
create table salary(
	empid int unsigned,
	basesalary decimal(10,2),
	titlesalary decimal(10,2),
	deduction decimal(10,2),
	primary key(empid)
);

#修改表结构,在部门表中添加简介字段
alter table department
add depdesc text;

#插入数据
insert into emoloyee values (1001,'张三','male','高级工程师','1975-01-01','111'),
	(1002,'李四','female','助理工程师','1985-01-01','111'),
	(1003,'王五','male','工程师','1978-01-01','222'),
	(1004,'赵六','male','工程师','1979-01-01','222');

insert into department values (111,'生产部',null),
	(222,'销售部',null),
	(333,'人事部',null);

insert into salary values (1001,2200,1100,200),
	(1002,1200,200,100),
	(1003,1900,700,200),
	(1004,1950,700,150);

#修改李四的职称为工程师,将他的基本工资改为 1700,职务工资为600
update salary set basesalary = 1700,titlesalary = 600
	where empid = 1002;

#删除人事部门的部门记录
delete from department where depid = 333;

#查询出每个雇员的雇员编号,实发工资和应发工资
select empid,(basesalary+titlesalary-deduction) as shiji ,(basesalary+titlesalary) as yingfa from salary;

#查询出姓 张 且年龄小于 50 的员工记录
select * from emoloyee where name like '张%' and (year(now()) - year(birthday)) < 50;

#查询出雇员编号,名字,实发工资和应发工资
select emoloyee.empid,name,(basesalary+titlesalary-deduction) as shiji ,(basesalary+titlesalary) as yingfa
from emoloyee join salary 
on emoloyee.empid = salary.empid;

#10 查询雇员的雇员编号，姓名，职称，部门名称，实发工资。
select e.empid,e.name,e.title,d.depname,(s.basesalary+s.titlesalary-s.deduction) as shiji 
from emoloyee as e 
join department as d
join salary as s 
on e.depid = d.depid and e.empid = s.empid;

#11 查询销售部门的雇员姓名，基本工资
select e.name,s.basesalary from 
emoloyee as e 
join salary as s
on e.depid = 222 and e.empid = s.empid;

#12 统计各职称的人数
select title,count(title) from emoloyee group by title;

#13 统计各部门的部门名称，实发工资总和，平均工资
select d.depname, sum(s.basesalary+s.titlesalary-s.deduction),avg(s.basesalary+s.titlesalary-s.deduction)
from emoloyee as e 
join department as d
join salary as s
on e.empid = s.empid and e.depid = d.depid
group by d.depid;

#14 查询比销售部门所有员工基本工资都高的雇员姓名
select emoloyee.name from 
emoloyee join salary
on emoloyee.empid = salary.empid
where 
(salary.basesalary > (select max(basesalary) from (select basesalary from emoloyee join salary 
on emoloyee.empid = salary.empid
where emoloyee.depid = (select department.depid from department where
depname = '销售部')) as source))
and 
emoloyee.depid not in (select department.depid from department where
depname = '销售部');

-- 思路:
#找到销售部门的id --- 结果是 222
(select department.depid from department where
depname = '销售部'); 
#找到销售部门的人员的基本工资
select basesalary from emoloyee join salary
on emoloyee.empid = salary.empid
where emoloyee.depid = 222;
#找出销售人员的最大值工资
select max(basesalary) from (select basesalary from emoloyee join salary
on emoloyee.empid = salary.empid
where emoloyee.depid = 222) as source;
#添加不在销售销售部门的条件
emoloyee.depid not in (222);
#替换部门id222 
select emoloyee.name from 
emoloyee join salary
on emoloyee.empid = salary.empid
where 
(salary.basesalary > (select max(basesalary) from (select basesalary from emoloyee join salary 
on emoloyee.empid = salary.empid
where emoloyee.depid = (select department.depid from department where
depname = '销售部')) as source))
and 
emoloyee.depid not in (select department.depid from department where
depname = '销售部');

#或者这样
select e.name 
from emoloyee as e 
join department as d
join salary as s 
on e.depid = d.depid and e.empid = s.empid
where e.depid not in (222)
and s.basesalary > (select max(s.basesalary) from emoloyee as e 
join department as d
join salary as s
on e.depid = d.depid and e.empid = s.empid
where e.depid in (222));