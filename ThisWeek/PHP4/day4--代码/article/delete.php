<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-05-21 16:28:41
 */
header("content-type:text/html;charset=utf8");
require_once "./functions.php";
// ①接收文章编号
$aid =isset($_GET['aid']) ? $_GET['aid']:"";

// ②拦截非法请求
if (empty($aid)) {
	redirect2("./index.php","参数非法",1);
}

// ③连接数据库
require_once "./connect.php";

// ④构建SQL语句
$sql ="delete from article where aid =$aid";
$res =mysql_query($sql);

if ($res) {
	redirect2("./index.php","删除成功");
}else{
	redirect2("./index.php","删除失败");
}