
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
