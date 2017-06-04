#1
#1.1
# mysql -uroot -proot
use quanzhan2;
#1.2
insert into user values ('诸葛亮', '13456789555', '研究生', '2017-05-30');
#1.3
update user set Tel='19012345678' where Name='关羽';
#1.4
delete * from user where Name='张飞';
#1.5
select * from user where Name='刘备';

#2
#2.1
select * from product where price=(select max(price) from product);
#2.2
select pro_id from product where pro_id=(select max(pro_id) from product);
#2.3
select min(price) from product;
#2.4
select min(pro_id) from product;
#2.5
select count(pro_name) from product;
#2.6
select avg(price) from product;
#2.7
select avg(price) from product where pro_name like '%联想%';
#2.8
select * from product order by protype_id asc, price desc;
#2.9
select * from product order by price desc limit 3;
#2.10
select count(*) from product group by chandi;


# Fake Data
create database class3_ass;

use class3_ass;

CREATE TABLE IF NOT EXISTS `product` (
`pro_id` int(11) NOT NULL AUTO_INCREMENT,
`pro_name` varchar(100) NOT NULL,
`protype_id` int(11) NOT NULL,
`price` decimal(10,2) NOT NULL,
`pinpai` varchar(25) NOT NULL,
`chandi` varchar(25) NOT NULL,
PRIMARY KEY (`pro_id`),
KEY `pro_name` (`pro_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='商品信息表' AUTO_INCREMENT=16 ;

INSERT INTO `product` (`pro_id`, `pro_name`, `protype_id`, `price`, `pinpai`, `chandi`) VALUES
(1, '康佳（KONKA）42英寸全高清液晶电视', 1, '1999.00', '康佳', '深圳'),
(2, '索尼（SONY）4G手机（黑色）', 2, '3238.00', '索尼', '深圳'),
(3, '海信（Hisense）55英寸智能电视', 1, '4199.00', '海信', '青岛'),
(4, '联想（Lenovo）14.0英寸笔记本电脑', 3, '5499.00', '联想', '北京'),
(5, '索尼（SONY）13.3英寸触控超极本', 3, '11499.00', '索尼', '天津'),
(11, '索尼（SONY）60英寸全高清液晶电视', 1, '6999.00', '索尼', '北京'),
(12, '联想（Lenovo）14.0英寸笔记本电脑', 3, '2999.00', '联想', '北京'),
(13, '联想 双卡双待3G手机', 2, '988.00', '联想', '北京'),
(15, '惠普（HP）黑白激光打印机', 3, '1169.00', '惠普', '天津');

CREATE TABLE IF NOT EXISTS `product_type` (
`protype_id` int(11) NOT NULL AUTO_INCREMENT,
`protype_name` varchar(50) NOT NULL,
PRIMARY KEY (`protype_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='商品类型表' AUTO_INCREMENT=12 ;

INSERT INTO `product_type` (`protype_id`, `protype_name`) VALUES
(1, '家用电器'),
(2, '手机数码'),
(3, '电脑办公'),
(4, '图书音像'),
(5, '家居家具'),
(6, '服装配饰'),
(7, '个护化妆'),
(8, '运动户外'),
(9, '汽车用品'),
(10, '食品酒水'),
(11, '营养保健');

show databases;

use employees;

show tables;

select * from employees limit 10;

select * from employees where emp_no=(select max(emp_no) from employees);

select * from employees order by emp_no desc, first_name asc limit 10;





























