
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




-------------------------

create table test (
	id int ,
	a varchar(10) not null
);

insert into test(id) values (1); -- 错误

create table test_1 (
	id int unsigned primary key, -- 主键,没有给它设置自动增长
	name varchar(20)
);

insert into test_1 values (1,'aaa');

insert into test_1 values (null,'abc');

create table test_2  (
	id int unsigned primary key auto_increment,
	name varchar(20)
);

insert into test_2 values (null,'abc');

#组合主键
create table test_3 (
	name varchar(20),
	height float(5,2),
	weight float(6,2),
	primary key (name,height) -- 作为组合主键
);

insert into test_3  values ('刘松','180','65'),
		('刘松','175','60');

insert into test_3 values ('刘','180',64.1);










------------------------------------第3天 外键


#先创建父表( 班级表)
create table foreign_class (
	id int unsigned primary key auto_increment,
	class_name varchar(20),
	class_room varchar(20)
);

#再创建子表(学生表)
#添加外键在 子表中
create table foreign_student (
	id int unsigned primary key auto_increment,
	name varchar(20) not null default '匿名' comment '名字',
	sex enum('male','female'),
	class_id  int unsigned comment '外键值',	-- 外键的类型需要和父表的类型一致
	foreign key (class_id) references foreign_class(id)  -- 添加外键
) engine = innodb; -- 确保表的引擎肯定是 innodb

#插入数据
insert into foreign_class(class_name,class_room) values 
		('全栈2期','202'),
		('全栈3期','102');
# insert into 表名(字段名) values (值列表),(值列表)[,(值列表)];
#inset 可以一次性插入多条数据
insert into foreign_student(name,sex,class_id) values 
		('张三','male',1),
		('李四','female',2);

insert into foreign_student(name,sex,class_id) values 
		('张三','male',3);


#我们要想删除 外键,必须通过 show create table 这条指令来查看外键的名字
show create table foreign_student;

#删除外键
alter table foreign_student
drop foreign key foreign_student_ibfk_1;

#外键删除之后
insert into foreign_student(name,sex,class_id) values 
		('张三','male',3);

delete from foreign_student where id=4;

#添加外键
alter table foreign_student 
add foreign key (class_id) references foreign_class(id);

#我们 给 子表设置级联操作为 删除的时候 为 set null
#结果是 当我们删除了主表之后, 对应的子表的 class_id 的字段的值都为null

show create table foreign_student;

select * from foreign_student;

#修改 foreign_student 的外键约束
alter table foreign_student
drop foreign key foreign_student_ibfk_1;

# 添加外键约束
alter table foreign_student
add foreign key (class_id) references foreign_class(id) on delete set null;
#删除删除
delete from foreign_class where id = 1;

select * from foreign_student;


#外键只有innodb支持

#先创建父表( 班级表)
create table foreign_class_myisam (
	id int unsigned primary key auto_increment,
	class_name varchar(20),
	class_room varchar(20)
);

#再创建子表(学生表)
#添加外键在 子表中
create table foreign_student_myisam (
	id int unsigned primary key auto_increment,
	name varchar(20) not null default '匿名' comment '名字',
	sex enum('male','female'),
	class_id  int unsigned comment '外键值',	-- 外键的类型需要和父表的类型一致
	foreign key (class_id) references foreign_class(id)  -- 添加外键
) engine = myisam;

show create table foreign_student_myisam;


#创建一个表
create table ruchong_1 (
	a varchar(10)
);

insert into ruchong_1 values ('abc');

#蠕虫复制
insert into ruchong_1 select * from ruchong_1;


select * from foreign_student;

insert into ruchong_1(a) select name from foreign_student;


#主键冲突
create table ruchong_2 (
	id int unsigned primary key auto_increment,
	name varchar(10)
);

insert into ruchong_2 values (1,'itcast');

#主键冲突了
insert into ruchong_2 values (1,'abc');
#
insert into ruchong_2 values (1,'abc')
	on duplicate key update name = 'abc'; -- 不需要写主键
#替换
replace into ruchong_2 values (1,'hehehe');

#给蠕虫2添加1个字段
alter table ruchong_2
add tatata varchar(10);

insert into ruchong_2(name,tatata) values ('aaaaaaaa','ttttttt');

#替换 -- 先删除原纪录,再插入先记录
replace into ruchong_2(id,name) values (2,'abc');

replace into ruchong_2(id,name) values (3,'abc');



select * from ruchong_2;

delete from ruchong_2 where id = 3;

select * from ruchong_2;

#再插入一条语句
insert into ruchong_2(name) values ('新来滴');
#刚才插入的id 是几???
select * from ruchong_2;



#truncate 清空
truncate ruchong_2 ;

insert into ruchong_2(name) values ('新来滴');

select * from ruchong_2;

# select 选项
#distinct 是去重的意思
select distinct name from ruchong_2;

#创建三个字段,分别是 数学,语文,英语
create table select_1 (
	maths float(5,2),
	chinese float(5,2),
	english float(5,2)
);

insert into select_1 values (100,93,96);

select maths+chinese+english as sum from select_1;
select maths as "数学",chinese as "语文",english as "英文" from select_1;


select * from (select * from ruchong_2 ) as s;


#创建一个学生表,学号,姓名,性别,年龄,地址,班级,成绩
create table php_student (
	id int unsigned primary key auto_increment comment '主键',
	name varchar(20) not null default '匿名' comment '姓名',
	sex enum('male','female'),
	age int unsigned,
	address varchar(30),
	class_id int,
	score int unsigned
);
insert into php_student(name,sex,age,address,class_id,score) values 
	('悟空','male',700,'花果山',2,99),
	('八戒','male',666,'高老庄',2,92),
	('沙和尚','male',500,'流沙河',2,60),
	('唐僧','male',22,'长安',2,100),
	('白骨精','female',200,'人间',3,80),
	('蜘蛛精','female',300,'人间',3,82);


#where一般和条件判断运算符配合使用
select * from php_student where score > 90;
#mysql 可没有赋值语句,这个=就是判断
select * from php_student where score = 90;

#between and
select * from php_student where score between 80 and 90;

select * from php_student where score between 80 and 80;

#in 和not in
#只是返回score = 80或者 score  = 85 或者score = 90
select * from php_student where score in(80,85,90);

#not in 和in相反,只要不满足 score = 80或者 score  = 85 或者score = 90都返回
select * from php_student where score  not in(80,85,90);

#逻辑或
select * from php_student where score = 80 or score = 85 or score = 90;

#逻辑与
select * from php_student where score > 60 and sex = 'female';

#like属于模糊查询 
# %	通配任意个字符
# _ 通配一个字符
#是以 白开头的 %放后边
select * from php_student where name like '白%';
#_只能匹配一个字符
select * from php_student where name like '白_';
#精前边有文字
select * from php_student where name like '%精';
#精在哪里都行
select * from php_student where name like '%精%';
#精后边必须有一个文字
select * from php_student where name like '%精_';

update php_student set name = '白白骨精' where id = 5;

select * from php_student where name like '__精';

#group by 分组子句
#name,sex,age,address,class_id,score
('悟空','male',700,'花果山',2,99),
	('八戒','male',666,'高老庄',2,92),
	('沙和尚','male',500,'流沙河',2,60),
	('唐僧','male',22,'长安',2,100),
	('白骨精','female',200,'人间',3,80),
	('蜘蛛精','female',300,'人间',3,82)

select * from php_student 
where 1
group by sex;

# 以性别进行分组,来获取 age字段的最大值和最小值
select name,sex,max(age) from php_student 
where 1
group by sex;

# 以性别进行分组,来获取 age字段的最大值,socre的最小值
select sex,max(age),min(score) from php_student 
where 1
group by sex;


select sex,max(age) as '年龄最大值' ,
min(score) as '成绩的最小值',	
avg(score) as '成绩的平均分',
count(name) as '每组的个数',
sum(score) as '每组的总分'  
from php_student 
where 1 -- group by 在where 后边
group by sex;

#插入一条 女性的数据,让 成绩 和年龄都为null
insert into php_student(name,sex,address,class_id) values 
		('女儿国国王','female','女儿国',3);

#统计 score的平均分
select sex,avg(score) from php_student
where 1
group by sex;

#统计 score的个数
select sex,count(score) from php_student
where 1
group by sex;

select * from php_student;
#以 班级id作为分组
select count(name) from php_student
where 1
group by class_id;



# having子句, 分组之后,我们对数据再次进行帅选的时候,只能用having子句
select score from php_student
where 1
group by sex
having avg(score) > 80;


select score from php_student
group by sex
where avg(score) > 80;


# 如果查询语句中,只有having子句或者where子句
# having子句和where子句的作用是一样的

select * from php_student where score > 85;

select * from php_student having score > 85;

#
select count(score),avg(score) from php_student 
where 1 -- 记住 group by 前边有个where
group by sex
having avg(score) > 82;

select * from php_student
group by sex;

insert into php_student(name,score) values 
	('阿三',100);

-- select max(score),name from php_student;

select name,age,score,sex from php_student 
where score = (select max(score) from php_student);



#order by子句
#我们的数据,默认它是由一个索引的,这个索引是 主键索引
select * from php_student;

select * from php_student
where 1
order by score desc; -- desc 降序

insert into php_student(name,age,score) values 
	('abc',20,100);

select * from php_student
where 1
order by score desc,age asc;

#limit 一个参数,表示返回 几条数据
select * from php_student
where 1
order by score desc limit 10;


select * from php_student;
#limit yeshu,numofperpage;
#yeshu 表示第几页. 我们的页数也从0开始
#numofperpage: 每页多少条数据,一般都是10,20
select * from php_student limit 0,2;

select * from php_student limit 2,2; -- 从第3条开始返回2条





























------------------------------- 联合查询

#我想获取分数最高的一个人 和 分数最低的一个人
select * from php_student order by score desc limit 1;
select * from php_student order by score asc limit 1;

#联合查询
(select * from php_student order by score desc limit 1)
union 
(select * from php_student order by score asc limit 1);

-- select [选项] all|distinct
# 联合查询 就是将子查询联合起来
# union 默认是 去重
#记住的方式: 就填写选项就可以!!!
select * from php_student
union all
select * from php_student;

#联合查询的数目必须一致
select name,sex from php_student
union distinct
select name,sex,score from php_student;


#联合查询的顺序一定要一致
select name,sex from php_student
union distinct
select name,sex from php_student;

#如果每个子查询字段不一致,
#显示的内容就会按照第一个的字段(值)的顺序显示
select name,sex from php_student
union distinct
select score,address from php_student;


#联合查询如果用到了 order by子句 一定要括起来
select * from php_student order by score desc limit 1
union 
select * from php_student order by score asc limit 1;




-----------------------交叉连接
create table php_student_info (
	id int unsigned primary key auto_increment,
	qq varchar(20),
	wechat varchar(20),
	lianxi varchar(20),
	jiating_address varchar(20)
);

insert into php_student_info(qq,wechat,lianxi,jiating_address) values 
		('111111111','11111111111','你联系不到我的','火星18号路'),
		('222222222','22222222222','我的电话以关机','土星250号'),
		('333333333','33333333333','18312345678','北京');

#交叉连接
select * from php_student cross join php_student_info;

select * from php_student cross join php_student_info cross join test_1;


#内连接 inner join
# on 相当于where ,on的执行效率比where快一些
# 获取字段的值是采用 表名.字段名 的形式 
select * from php_student inner join php_student_info
on php_student.id = php_student_info.id;

#on 相当于where 我们也可以使用where
select * from php_student inner join php_student_info
where php_student.id = php_student_info.id;

# inner 可以省略 默认就是 内连接
select * from  php_student join php_student_info
on php_student.id = php_student_info.id;

# 内连接,最开始也是做的笛卡尔积,后边有on这个条件进行了过滤
#如果 内连接没有on这个条件 还是交叉连接的结果
select * from php_student join php_student_info;

#昨天说过 select后边的字段或者是表达式 可以通过as 取一个别名
# 这个别名只在当前sql语句中生效
#我们的表名也可以其一个别名,用 as 这个别名你就别加 引号
#给表其了别名之后,我们可以在对应的on中使用
select * from php_student as s inner join php_student_info  as i
on s.id = i.id;

#别名相同不可以
select * from php_student as s inner join php_student_info  as s
on s.id = s.id;

# select 后边可以指定字段
#如果我们再获取字段信息的时候,如果2个表中字段名有重复的,
#必须以 表名.字段 的形式来获取指定的数据
select id,name,qq from php_student as s join php_student_info as i
on s.id = i.id; -- 错误


select s.id,name,qq from php_student as s join php_student_info as i
on s.id = i.id;


#创建一个 班级表
#班级id, 班级名称,班级room
create table php_class (
	id int unsigned auto_increment,
	name varchar(20),	-- 班级名
	room varchar(20), -- 教室名
	primary key(id)
);

insert into php_class (name,room) values 
	('全栈1期','606'),
	('全栈2期','202'),
	('全栈3期','000'),
	('全栈4期','000');

# 这个题目和对应的查询语句是有问题的,我们只是为了给大家演示 别名 和 关联条件
# 查询已经上课的所有学生的信息(学生姓名,学生年龄,班级名,教室名)
select s.name,age,room,c.name from php_student as s join php_class as c
on s.class_id = c.id;


# 左外连接查询,左外连接查询以左表为主
# 左表关联右表的时候,如果右表没有对应的信息,会显示null

select * from php_student;

select * from php_student_info;

#左外连接
select * from php_student as s left outer join php_student_info as i 
on s.id = i.id;



insert into php_student_info values 
	(100,'aaaaaaa','11111111111','哈哈哈哈','火18号路'),
		(101,'bbbbbb','22222222222','呵呵呵呵','250号'),
		(102,'cccccc','33333333333','啦啦啦','上海');
#右外连接
select * from php_student as s right outer join php_student_info as i 
on s.id = i.id;



#右外连接中的on改成了where
select * from php_student as s right outer join php_student_info as i 
where php_student.id = php_student_info.id;


#标量子查询 , 子查询的结果就是一个单一值
#max,min,avg 都是单一值
#找到分数大于平均值的人
select * from php_student 
where score > (select avg(score) from php_student);

#唐僧所在的班级的所有人
#先查找名字为唐僧的班级的id
#查找到id之后,再查找班级id= 我们查找出来的那个
#精确查找
select class_id from php_student where name = '唐僧';
#在查找班级id=2的所有的人
select * from php_student 
where class_id = (select class_id from php_student where name = '唐僧');


#列子查询 就是 select返回一列数据
#返回所有开班的学生信息;

#先查询出已经开班的 id列表
select id from php_class;

select * from php_student where class_id in (select id from php_class);


#行子查询,就是以一行的数据返回给我们.
#查询年龄最小,分数最高的人的记录
select min(age),max(score) from php_student;

select * from php_student 
where (age,score) = (select min(age),max(score) from php_student);


select min(age) from php_student;
select max(score) from php_student;

select * from php_student
where age = (select min(age) from php_student) 
and score = (select max(score) from php_student);


select * from php_student left join php_student_info
on php_student.id = php_student_info.id;

select * from php_student 
having score > avg(score);


#我们想获取 班级前5名的 平均分
#子查询如果作为 数据源 (防止from后边)一定要其一个 别名
select avg(score) from 
(select * from php_student order by score desc limit 5)  as s;

#查询班级前10名的人
select * from php_student order by score desc limit 5



# 我们查询已经开班的所有学生的信息
select * from php_student where exists(select id from php_class);

select * from php_student where exists(select * from php_class where id > 4);


#备份数据
select * into outfile "C:/Users/Ricky/Desktop/a.txt" 
from php_student;

#加载数据
load data infile "C:/Users/Ricky/Desktop/a.txt"
into table php_student;
