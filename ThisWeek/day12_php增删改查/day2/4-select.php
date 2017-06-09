<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-09 11:32:37
 */
header("content-type:text/html;charset=utf8");
// 建立连接
require_once "./connect.php";
// 字段别名作为数组的字符串下标
$sql ="select title,author,content as cont from article  where aid <105";
// 查询结果集
$res =mysql_query($sql);
// var_dump($res);
// resource(6) of type (mysql result) 
if ($res) {
	// echo "结果集中的行数：".mysql_num_rows($res).'<br>';
	// echo "结果集中的列数：".mysql_num_fields($res).'<br>';
	// 结果集中的行数：0
	// 结果集中的列数：10
	if (!mysql_num_rows($res)) {
		echo "空结果集";
	}else{
		echo "结果集中的行数：".mysql_num_rows($res).'<br>';
		echo "结果集中的列数：".mysql_num_fields($res).'<br>';
		// $line1 =mysql_fetch_array($res);
		// $line1 =mysql_fetch_row($res);
		$line1 =mysql_fetch_assoc($res);
		// $line2 =mysql_fetch_array($res);
		// $line3 =mysql_fetch_array($res);
		echo "<pre>";
		print_r($line1);
		// print_r($line2);
		// print_r($line3);
	}
}else{
	echo "查询失败！";
}