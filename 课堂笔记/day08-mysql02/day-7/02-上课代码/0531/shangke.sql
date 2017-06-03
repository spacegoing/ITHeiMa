
#创建一个数据库
create database php;

#再创建一个数据库
create database shangke;

# 再创建一个数据库 ,数据库的名字是 2017
create database 2017; -- 错误

# 如果必须以数字需要用`(tab键上边和~线一起的) 包裹起来
#语法形式为 `数据库名` 
create database `2017`; -- 正确

#系统的关键字作为数据库名也是不可以的
create database create; -- 错误

create database `create`;-- 正确的

#我就是用中文
create database 中文;

#以为是需要用 `包裹起来
create database `中文`;

# 设置编码
set names gbk;

#显示都有哪些数据库
show databases;

#查看数据库创建的语句
show create database php;

#删除数据 -- `create`
drop database `create`; -- 也尽量对数据库名包裹起来

#改变一下 `2017`数据库的编码格式,默认是 utf8
alter database `2017` charset gbk;

#查看 `2017`数据库的编码格式
show create database `2017`;


----------------第4讲 数据表的操作
----------------以后我上课用的数据库都是 shangke 这个数据库
#创建一个表
create table table_1 (
		name varchar(20)
);

#指定数据库有2种形式
#第一种形式就是采用 表名前边指定数据库
#以 数据库名.数据表名 的形式来指定数据库
create table shangke.table_1 (
	name varchar(20)
);

#第二种形式 是隐式的指定数据库
#隐式指定数据库是采用 use 数据库名 的形式来指定
use shangke;-- 先指定

#再创建数据表,这个时候数据表的名字就不需要 指定数据库名了
create table table_2 (
	name varchar(20)
);

#推荐大家使用 第二种形式

#创建表格必须有字段,表格不能脱离字段
create table table_4 (); -- 错误

#创建一个学生表,学号,姓名,性别,年龄
create table table_5 (
	id int,
	name varchar(20),
	sex varchar(5),
	age int
);

create table table_6 (
	id int,
	name varchar(10),
); -- 错误

#显示有哪些表
show tables;

#查看数据表创建的语句
show create table table_5;

#查看表结构
describe table_5;

#查看表结构的简写
desc table_5;

#删除表
drop table table_5;

#如果删除一个不存在的表,会报错
drop table table_5;

# if exists 如果存在
drop table if exists table_5;

-----------------------第4讲里的 修改表
#先显示有哪些表
show tables;
#给表重命名,先改一个
rename table  table_1 to new_table_1;
#显示一下
show tables;
#改多个
rename table table_2 to new_table_2,table_3 to new_table_3;

------------------------修改表的字段
# 我们给new_table_3 添加一个字段
alter table new_table_3
add bieming varchar(10);

# 给new_talbe_3 删除一个字段 bieming
alter table new_table_3
drop bieming;

# 修改一下 name的名字
alter table new_table_3
change name new_name varchar(10);
#没有给新字段指定类型
alter table new_table_3
change new_name name; -- 错误

#修改new_talbe_3 的name字段为int类型
alter table new_table_3
modify new_name int;

#将原来默认的utf8编码格式改为gbk
alter table new_table_3
charset gbk;


--------------------第5讲 数据的增删改查

#先来创建一个表格
#学生表,学号,姓名,性别,年龄
create table t_666 (
	id int,
	name varchar(10),
	sex varchar(10),
	age int
);
#插入数据
insert into t_666(id,name,sex,age) values (1,'亮哥','boy',16);

# 如果我们每个字段都有数据插入,这个时候 字段列表可以省略
# 值一定要和字段的顺序一致(一一对应)
insert into t_666 values (2,'中哥','girl',22);

#如果我们只插入部分字段,需要在字段列表中显示
#显示的顺序无所谓,但是values的值的顺序必须和 前边的字段顺序一一对应
insert into t_666(age,name) values (80,'凤姐');

#查询所有数据
select * from t_666;

#指定查询字段
select name,sex from t_666;

#删除数据
delete from t_666; -- 所有的数据都删了

#重新插入了3条数据
#我们删除指定条件的数据
# 名字这个字段是 凤姐的信息 删除
delete from t_666 where name='凤姐';

# 删除id为1的那条信息
delete from t_666 where id=1;

#如果我要查询 id > 1 的数据
select * from t_666 where id>1;

#更新数据, 注意一定要有条件判断
#如果没有条件判断,所有的数据都会更新
update t_666 set name = '午哥';

#更新id=1的名字为你的名字
update t_666 set name='余亚峰' where id=1;


---------- 字符为什么会出现乱码
# 我们通过quit/exit 退出客户端连接
# 再次重新连接
#使用上课数据库
use shangke;
#插入一条 name字段 为中文的数据到t_666中
insert into t_666(name) values ('中文');

#我们需要告诉服务器我这里的编码格式是 gbk
# 发送了这条指令之后,服务器就认识了
set names gbk;

#再次插入的时候,就能够认识中文了
insert into t_666(name) values ('中文');



# 数据库的编码格式,数据库默认是 utf8编码
show create database demo;
#改变数据库的编码格式
alter database demo charset gbk;

#查看数据库支持哪些校对集
show collation;



#创建一个innodb的表
create table innodb_1 (
	name varchar(10)
) engine = innodb;

#创建一个myisam的表
create table myisam_1 (
	name varchar(10)
) engine = myisam;


---------------------------------数据类型
#int
#M只是指定数据的宽度,如果数据宽度不够,左边会补空格
create table int_1 (
	a tinyint(3),
	b int(5)
);

#insert into 可以插入多个数据,多个数据以 逗号分隔
#insert into 表名(字段列表) values (值列表),(值列表)[,(值列表)];
#插入数据
insert into int_1 values 
	(1,10),
	(12,100),
	(123,1000);


#创建一个表,包含2个字段tinyint 有符号, tinyint无符号
create table int_2 (
	a tinyint,			-- 有符号 
	b tinyint unsigned -- 无符号
);

insert into int_2 values (127,255); -- 正确

#php可以进行数据类型转换
#mysql中不存在自动类型转换,如果超过它的范围就报错
insert into int_2 values (128,256); -- 错误,已经超过范围了

#添加一个bool字段给int_2
alter table int_2
add c bool;


#创建一个表,有2个字段float,double
create table float_1 (
	a float,
	b double
);
#浮点数肯定都有一个有效位数
insert into float_1 values (1234567890.123456789,1234567890.123456789);

insert into float_1 values (1.23456789098,1.234567890123456789);

select * from float_1;

#添加一个定点数(decimal) 给flaot_1 添加一个字段
alter table float_1
add qian decimal; -- 相当于 decimal(10,0)

insert into float_1(qian) values (123456789.123456789);
#数据是可以插入进去,但是我们查询的时候,只会显示 10位,为什么呢?
#decimal 默认只保存10位整形,0位小数
select * from float_1;

#修改float_1 中 qian字段的类型
alter table float_1
modify qian decimal(15,5); -- 整数10位,小数5位

#插入数据
insert into float_1(qian) values (1234567890.123456789); -- 正确的

insert into float_1(qian) values (1234567890123.12345678); -- 错误的
select * from float_1;


#M的值也必须在 对应的有效位数之内
#创建一个表,2个字段 类型为分别为float(5,2) double(10,2);
# float/double(M,D). M表示有效位数的总位数, D表示小数的有效位数
create table float_2 (
	a float(5,2),
	b double(10,2)
);

insert into float_2 values (1234.234,12345678.234); -- 错误

----------------------------时间类型
#创建一个表,有2个字段,分为被datetime和timestamp
create table time_1 (
	a datetime,
	b timestamp
);
#插入数据的形式一样
#标准的时间格式是 YYYY-MM-DD HH:MM:SS
# 把字符串转换成时间 
insert into time_1 values ('2017-06-01 10:58:11','2017-06-01 10:58:11');

select * from time_1;

#插入的时间的格式的分隔符可以随意,但是这个日期的格式最好按照标准来
insert into time_1 values ('2017,06,12 10,10,10','2017/06/01 12/12/12');-- 正确的
insert into time_1 values ('20110111121212','2017-06-01 10:58:11'); -- 没有分割也是正确的

insert into time_1 values ('2011141111212121','2017-06-01 10:58:11'); -- 错误的

#通过 now() 这个 mysql内置函数来插入现在的时间
insert into time_1 values (now(),now());


#我们只插入一个 datetime 值
insert into time_1 (a) values ('2017-06-01 10:58:11');

select * from time_1;

#给time_1 表 添加一个字段
alter table time_1 
add c timestamp;

insert into time_1(a) values ('20000101121212');


#给time_1添加一个字段
alter table time_1
add d date;
#insert into 表名(字段列表)
# 字段列表可以随意个字段
insert into time_1(d) values ('2017-06-01');

insert into time_1(d) values ('20170602'); -- 没有分隔符,也是正确的

#添加一个字段类型是 time
alter table time_1
add e time;
#time有2个含义:
#第一个含义就是时间: 11:28:30
insert into time_1(e) values ('11:28:30');
#第二个含税就是表示 时间间隔
#表示间隔的时候 可以以 'D HH:MM:SS' 的形式 
#D 表示天数
insert into time_1(e) values ('1 11:28:30');

insert into time_1(e) values ('1112233'); -- 也是正确的,知道就行


-------------------------字符串
#创建2个字段分别为char和varchar 长度都为5
create table string_1 (
	a char(5), -- char 是定长
	b varchar(5) -- varchar 是变长
);
#char 和varchar 最多可以放的字符是 5个
insert into string_1 values ('itcas','传智播客');

insert into string_1 values ('itcast','a'); -- 错误

insert into string_1 values ('a','a');

#添加一个text字段
alter table string_1
add c text;

insert into string_1(c) values (
	' 你做的网站很多bug,还不如把我招进去'
);



#添加一个性别字段
alter table string_1 
add sex enum('male','female','undefined');

#插入数据的时候,sex的字段的值必须是 enum后边的一个值
insert into string_1(sex) values ('male');
insert into string_1(sex) values ('female');
	insert into string_1(sex) values ('undefined');

insert into string_1(sex) values ('男'); -- 错误

#enum 的数据,在数据库中是以整形的形式保存的
select sex+0 from string_1;

insert into string_1(sex) values (2);


#我们添加一个 爱好字段
alter table string_1
add hobby set('basketball','football','pingpang');

insert into string_1(hobby) values ('basketball,football');

insert into string_1(hobby) values ('pingpang');

#一下是错误的,因为 values后边 一个引号对应一个字段
insert into string_1(hobby) values ('basketball','football'); -- 错误的


#我们插入一个新的数据,爱好的值是 6
insert into string_1(hobby) values (6); -- 6 = 2+4;

insert into string_1(hobby) values (8); -- 错误的


#创建一个学生表
#学生id,学生姓名,学生性别,学生的入学时间,学生的电话号码,
# 学生的爱好,学生的自我简介

create table student_1 (
	id tinyint unsigned , -- unsigned 增加了正数的范围
	name varchar(5) , -- char(5) 也是可以的
	sex enum('男','女'),
	enter date, -- date 就是年月日 , 如果是datetime有点太细
	tel char(11),
	hobby set('学习','看书','看美女'),
	intro text
) engine = innodb charset=utf8;

insert into student_1 values 
	(1,'李南','男','2017-04-19','13812345678',4,'我就是来看美女了,就是这样霸气,潇洒');



------------------------------列约束

#null 和not null
create table student_2  (
	id tinyint unsigned,
	name varchar(5) not null
);
# 因为name为一个非空字段,你插入数据的时候 name必须有值
insert into student_2 (id) values (1); -- 错误

insert into student_2(id,name) values (1,'it'); -- 正确

insert into student_2(name) values ('heima'); -- 正确

#我们重新定义 name 字段
alter table student_2
modify name varchar(5) not null default '匿名';

#修改完字段之后
desc student_2;
#当设置完默认值之后,我们再插入数据,
#name字段不选择插入数据的时候,会使用默认值
insert into student_2(id) values (2);


#主键约束,我们可以单独定义一个字段,例如学号
#因为这个学号没有重复的.
alter table student_2
modify id int unsigned primary key;

#再想插入数据的时候,这个时候id就不能重复
insert into student_2 values (2,'aaa'); -- 出错,因为id=2的记录已经存在

insert into student_2 values (3,'abc'); 

#设置主键的两种方式
#第一种就是在数据类型后边 添加 primary key 关键字
create table student_3 (
	id int unsigned primary key,
	name varchar(10)
);

desc student_3;

#第二种形式 在定义完字段之后,再单独的定义主键
create table student_4 (
	id int unsigned,
	name varchar(10),
	primary key(id)
);

desc student_4;

#多个字段作为一个主键
create table student_5 (
	name varchar(10),
	height float(5,2),
	weight float(5,2),
	style enum('长发','短发','五发'),
	primary key (name,height) -- 可以定义多个字段
);

desc student_5;

insert into student_5(name,height) values
		 ('刘松',175.3),
		 ('刘松',180.2);

#接下来就冲突了
insert into student_5(name,height) values ('刘松',180.2);



#自动增长
create table student_6(
	id int unsigned primary key auto_increment,
	name varchar(10) not null default '匿名'
);

#再次插入数据的时候,我们就不用关系id的值
insert into student_6(name) values ('刘备'),('张飞'),('貂蝉');

#修改自动增长在默认值
create table student_7(
	id int unsigned primary key auto_increment,
	name varchar(10) not null default '匿名'
) auto_increment = 100;

insert into student_7(name) values ('刘备'),('张飞'),('貂蝉');

select * from student_7;

# 我们还可以再指定id的值吗?
#这样是可以的,因为id没有重复
insert into student_7(id,name) values (1,'周瑜');


#创建一个表,有三个字段
#一个主键,2个唯一键
create table student_8 (
	id int primary key auto_increment, -- 主键
	name varchar(10) unique, -- 唯一键
	title varchar(10) unique -- 唯一键
);

desc student_8;
# id字段如果想用系统的默认值可以写 null
insert into student_8 values (null,'刘备','皇帝');

insert into student_8(title) values ('美女');
#因为对应的title是一个唯一键,所以皇帝只能是刘备
insert into student_8(title) values ('皇帝'); 

#刘备之前也插入进去过,所以再次添加次数据是错误的
insert into student_8(name) values ('刘备');


#注释
#说明一下: primary key 默认有 not null 约束
#主键的默认值从100开始
create table student_9 (
	id tinyint unsigned primary key comment '这个字段是主键',
	name varchar(10) not null default '匿名' comment '名字',
	sex enum('男','女') comment '性别',
	hobby set('basketball','football','pingpang') comment '喜好',
	intro text comment '自我介绍' 
) auto_increment = 100;

#commnet的注释只会在 show create table中有显示
show create table  student_9;


#创建两个表,一个表有索引,一个表的字段没有索引
create table index_1 (
	a int primary key, -- 主键索引
	b varchar(10) unique key, -- 唯一性索引
	c varchar(10),
	key(c) -- 设置普通索引
);

create table index_2 (
	a int primary key, -- 主键索引
	b varchar(10) unique key, -- 唯一性索引
	c varchar(10)
);




-----------------------外键

#创建一个班级表
create table class_1  (
	id int unsigned primary key auto_increment,
	class_name varchar(20)
)engine = innodb;

#创建一个学生表
create table student (
	id int primary key auto_increment,
	name varchar(10),
	sex enum('male','female'),
	class_id int unsigned,	-- class id 的类型必须和 class_1 中 id类型保持一致
	foreign key(class_id) references class_1(id) -- 这样就设置好了外键
) engine = innodb;

#插入一条班级信息
insert into class_1 values (null,'全栈2期'); -- 默认id = 1

#插入一条学生信息
insert into student values (null,'孙光','male',1);
#注意:现在班级只有班级号为1的班级
insert into student values (null,'abc','male',2);
	
