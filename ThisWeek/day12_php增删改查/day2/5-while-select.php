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
if ($res) {

	if (!mysql_num_rows($res)) {
		echo "空结果集";
	}else{
		echo "结果集中的行数：".mysql_num_rows($res).'<br>';
		echo "结果集中的列数：".mysql_num_fields($res).'<br>';
		/*$line1 =mysql_fetch_assoc($res);
		$line2 =mysql_fetch_assoc($res);
		echo "<pre>";
		print_r($line1);
		print_r($line2);*/
		// ①获取结果集一行，指针移动
		// ②赋值给$line变量
		// ③使用$line进行条件判断
		while ($line =mysql_fetch_assoc($res)) {
			echo "<pre>";
			print_r($line);
		}

	}
}else{
	echo "查询失败！";
}