<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-12 09:39:53
 */
header("content-type:text/html;charset=utf8");
// 服务器通知浏览器设置数据。
// 通过响应实现
// 数据保存在浏览器端。
setcookie("user1","julien");
setcookie("user2","taylor");
// setcookie("a[1]","gaoyuanyuan");
$_COOKIE['user2']='taylor';