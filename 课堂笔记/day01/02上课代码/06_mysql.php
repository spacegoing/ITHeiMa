<?php
/**
*
*
*/

// 声明一个变量
// 调用系统的函数
// 参数1: 主机:mysql端口号
// 参数2: 用户名
// 参数3: 密码
$link = mysql_connect("127.0.0.1:3306","root","123456");

var_dump($link);

?>