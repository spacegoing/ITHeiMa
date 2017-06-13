use fs2;
#用户名，密码，用户编号
create table user(
uid int unsigned primary key auto_increment,
user varchar(24) not null unique key,
password char(32) not null default ""
)engine =myisam auto_increment =100 charset  =utf8;
#插入测试数据
insert into user  values (null,"fs02",md5("123456"));
