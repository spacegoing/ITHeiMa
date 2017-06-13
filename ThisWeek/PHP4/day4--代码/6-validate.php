<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-12 11:22:31
 */
header("content-type:text/html;charset=utf8");
// ①接收数据
$user     =isset($_POST['user']) ?$_POST['user'] :"";
$password =isset($_POST['password']) ?$_POST['password'] :"";
$remember =isset($_POST['remember']) ?$_POST['remember'] :"";
// ②判断数据
if (empty($user) || empty($password)) {
	header("refresh:3;url=./6-login.php");
	die("用户名及密码不能为空");
}
// echo '123';
//③ 验证数据
$conf =[
	'host'     =>"localhost:3306",
	'user'     =>"root",
	'password' =>'root',
	'charset'  =>'utf8',
	'db'       =>'fs2'
];

$link =@mysql_connect($conf['host'],$conf['user'],$conf['password']);
if(!$link) die("服务器忙");
mysql_query("set names ".$conf['charset']);
mysql_select_db($conf['db']);

// 查询用户相关的信息
$sql ="select * from user where user ='$user'";
$res =mysql_query($sql);
// 用户名错误
if (!$res || mysql_num_rows($res) == 0) {
	header("refresh:3;url=./6-login.php");
	die("用户名错误");
}
$line =mysql_fetch_assoc($res);
// 密码加密后保存
if (md5($password)  !==$line['password']) {
	header("refresh:3;url=./6-login.php");
	die("用户名或者密码错误");
}
// 验证通过
// echo '123';
if (!empty($remember)) {
	// 保存用户名即可
	setcookie("fs2_user",$user,time()+3600*24*7,'/',".fs2.com");
}
header("location:./index.php");