<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-12 10:32:09
 */
header("content-type:text/html;charset=utf8");
// 假设已经完成登录
$user ="fs12345";
// 第一次 
if (empty($_COOKIE['userName'])) {
	echo "欢迎".$user.'<br>';
	// setcookie("userName",$user,time()+3600*24*7);
	// // 登录时间：使用时间戳
	// setcookie("loginTime",time(),time()+3600*24*7);
}else{
// 其他次
	echo "欢迎".$user.'<br>';
	// 需要先格式化
	echo "上次访问时间是：".date("Y-m-d H:i:s",$_COOKIE['loginTime']);
	// setcookie("userName",$user,time()+3600*24*7);
	// // 登录时间：使用时间戳
	// setcookie("loginTime",time(),time()+3600*24*7);
}
setcookie("userName",$user,time()+3600*24*7,"/",".fs2.com");
// 登录时间：使用时间戳
setcookie("loginTime",time(),time()+3600*24*7,'/',".fs2.com");