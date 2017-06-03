<?php
echo '<pre>';
// 预定义变量 $_SERVER
var_dump($_SERVER);
// 获取 预定义变量的元素的值
$host = $_SERVER["HTTP_HOST"]; // 获取我们的host 主机域名
$fileName = $_SERVER["SCRIPT_FILENAME"]; // 获取文件的路径
$documentRoot = $_SERVER["DOCUMENT_ROOT"]; // 获取网站的根目录
$ip = $_SERVER["SERVER_ADDR"]; // 获取ip地址

echo $host,$fileName,$documentRoot,$ip;
echo '<hr>';

// 数组分为2中,一种是索引数组
$index = array(1,2,34,5);
// 另外一种是 关联数组 名 => 值
$guanlian = array(
		'name' => '鹿晗',
		'sex' => '女',
		'age' => 58
	);

// 获取数组的值
// 索引数组
$zhi = $index[2];
echo $zhi;

// 关联数组
$zhi = $guanlian["sex"]; // 一定要注意: 引号不能省略
echo $zhi;

echo '<hr>';

var_dump($_GET);


?>