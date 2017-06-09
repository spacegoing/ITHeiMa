<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-09 10:51:03
 */
header("content-type:text/html;charset=utf8");
// 建立连接,设置字符集及选择数据库全部完成
require_once "./connect.php";
// 构建SQL语句
// $sql ="insert into article (title,author,content) values ('高考结束，来传智吧！','julien','高薪就业')";
// 模拟表单提交的数据
$title   ="论颈椎病的预防及治疗2";
$author  ="julien";
$content ="良方：运动";
// $sql ="insert into article (title,author,content) values ($title,$author,$content)";
// insert into article (title,author,content) values (论颈椎病的预防及治疗,julien,良方：运动)
$sql ="insert into article (title,author,content) values ('$title','$author','$content')";
// insert into article (title,author,content) values ('论颈椎病的预防及治疗','julien','良方：运动')
// echo $sql;die;
$flag =mysql_query($sql);
// 判断结果
if (!$flag) {
	echo "fail!";
}else{
	echo "新插入文章的编号".mysql_insert_id().'<br>';
	echo "success!";
}
