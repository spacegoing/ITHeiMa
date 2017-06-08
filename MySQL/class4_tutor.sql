create database 4_tutor;

use 4_tutor;

CREATE TABLE IF NOT EXISTS `stu` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(10) DEFAULT NULL,
`sex` enum('男','女') DEFAULT NULL,
`city` varchar(10) DEFAULT NULL,
`depart_id` tinyint(4) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `col` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`depart_name` varchar(10) DEFAULT NULL,
`room` varchar(20) DEFAULT NULL,
`tel` varchar(20) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

insert into stu values (1,'邢飞','男','江西', 1),
(2,'杨大传','男','四川', 2), (3,'许娜','女','黑龙江', 1),
(4,'王磊','男','河北', 3), (5,'江荣华','女','河北', 3),
(6,'赵龙','男','江西', 1);

insert into col values (1, '计算机系', '行政楼302', '010-11111111'), (2, '数学系', '科研楼108', '010-22222222'), (3, '物理系', '行政楼305', '010-33333333');

select * from stu;

select * from col;

#1
select * from stu s inner join col c
on s.depart_id=c.id where depart_name='计算机系';

#2
select * from col where id=(select depart_id from stu where name='许娜');

#3
select depart_name from col where room like '行政楼%';

#4
select count(*) from stu group by sex;

#5
select depart_name from col where id=(select depart_id from
(select count(*) as num,depart_id from stu
group by depart_id
order by num desc limit 1) as mid);

#有多个最高值怎么办

select * from stu where depart_id=(
select depart_id from 
)

select depart_id from (select count(*) as cc,depart_id from stu group by depart_id) as count_dep where cc=max(cc);

select count_dep.depart_id from
count_dep
where count_dep.cc=
(select max(cc) as mc from(select count(*) as cc, depart_id from stu group by depart_id));



show tables;
desc stu_info;

#6
select count(*) as num,sex from stu where depart_id=
(select depart_id from
(select count(*) as num,depart_id from stu
group by depart_id
order by num desc limit 1) as mid)
group by sex;

#7
select name from stu where city=(select city from stu where name='邢飞');

#8
select depart_name from col where id in (select depart_id from stu where city='河北');

#9
select * from stu where depart_id=(select depart_id from stu where sex='女' and city='河北');

drop database 4_tutor;













