drop table if exists stu_depart;
create table stu_depart (
	id int unsigned primary key auto_increment,
	depart_name varchar(10),
	room varchar(10),
	tel varchar(20)
) engine = innodb;
drop table if exists stu_info;
create table stu_info (
	id int unsigned primary key auto_increment,
	name varchar(10),
	sex enum('男','女'),
	city varchar(10),
	depart_id int unsigned,
	foreign key(depart_id) references stu_depart(id)
) engine = innodb;

insert into stu_depart(depart_name,room,tel) values 
	('计算机系','行政楼302','010-1111111'),
	('数学系','科研楼108','010-2222222'),
	('物理系','行政楼305','010-3333333');

insert into stu_info(name,sex,city,depart_id) values
	('邢飞','男','江西',1),
	('杨大传','男','四川',2),
	('许娜','女','黑龙江',1),
	('王磊','男','河北',3),
	('姜荣华','女','河北',3),
	('赵龙','男','江西',1);

#1) 查出“计算机系”的所有学生信息
select * from stu_info where depart_id in(
select id from stu_depart where depart_name = '计算机系');
#2) 查出“许娜”所在的院系信息；
select * from stu_depart where id = 
(select depart_id from stu_info where name = '许娜');
#3) 查出在“行政楼”办公的院系名称；
select * from stu_depart where room like '%行政楼%';
#4) 查出男生女生各多少人；
select sex,count(*) from stu_info group by sex;
#5) 查出人数最多的院系信息。
select d.id,d.depart_name,d.room,d.tel from 
stu_depart as d join stu_info as s
group by d.id order by count(d.id) desc limit 1;
#6) 查出人数最多的院系的男女生各多少人。
select s.sex,count(s.sex) from 
stu_info as s  
where s.depart_id = (select d.id from 
stu_depart as d join stu_info as s
group by d.id order by count(d.id) desc limit 1)
group by sex;
#7) 查出跟“邢飞”同籍贯的所有人。
select * from stu_info where city = (
select city from stu_info where name = '邢飞');
#8) 查出有“河北”人就读的院系信息。
select * from stu_depart where id in 
(select depart_id from stu_info where city = '河北');
#9) 查出跟“河北女生”同院系的所有学生的信息
select * from stu_info where 
depart_id in (select depart_id from stu_info where city = '河北' and sex = '女');

