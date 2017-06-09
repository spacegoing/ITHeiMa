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
/*// 模拟表单提交的数据
$aid =103;
// $sql ="delete from article where aid =105";
$sql ="delete from article where aid =$aid";
$flag =mysql_query($sql);
// 判断结果
if (!$flag) {
	echo "fail!";
}else{
	echo "受影响的行数：".mysql_affected_rows().'<br>';
	echo "success!";
}
*/
$title ="标题1";
$aid =101;
$sql ="update article set title ='$title' where aid =$aid";
$flag =mysql_query($sql);
if (!$flag) {
	die("更新失败！");
}else{
	die("更新成功！");
}
