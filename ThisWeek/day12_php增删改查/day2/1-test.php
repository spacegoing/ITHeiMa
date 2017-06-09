<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-09 09:34:15
 */
header("content-type:text/html;charset=utf8");
require_once "./functions.php";
// 显示环境信息
// phpinfo();
// 创建数据库连接
/*$host     ="localhost:3306"; //主机名
$user     ="root";
$password ='root';
$link =mysql_connect($host,$user,$password);
var_dump($link);
// resource(3) of type (mysql link) */

$conf =[
	'host'=>'localhost:3306',
	'user'=>'root',
	'password'=>'root',
	'charset'=>'utf8',
	'db_name'=>'fs234'
];

$link =@mysql_connect($conf['host'],$conf['user'],$conf['password']);
// var_dump($link);
// resource(3) of type (mysql link) 
// 资源型或者false
// if (!$link) {
// 	die("服务器忙！");
// }
// if分支只有一个语句
// if (!$link) die("服务器忙！");
// 短路运算：第一表达式为真，后面的表达式不执行
$link or die("服务器忙！");
// echo "success";

// 设置字符集
// mysql_query('set names utf8');
mysql_query('set names '.$conf['charset']);
// 选择数据库
// mysql_query("use ".$conf['db_name']);
mysql_select_db($conf['db_name']);
// echo "错误信息是：".mysql_error().'<br>';
// // 错误信息是：Unknown database 'fs234'
// echo "错误代码是：".mysql_errno();
// 调用自定义错误处理函数
sql_error();


// ...
mysql_close();
// mysql_query('set names '.$conf['charset']);
