<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-10 15:34:58
 */
header("content-type:text/html;charset=utf8");
$path ="./article";
$res =opendir($path);
// var_dump($res);
// resource(3) of type (stream)
/*echo readdir($res).'<br>'; 
echo readdir($res).'<br>'; 
echo readdir($res).'<br>'; 
echo readdir($res).'<br>'; 
// .  表示当前目录
// .. 表示上一级目录
// add.php
// article.sql*/

// 循环读取资源
// ①读取资源，
// ②赋值给$file变量，指针移动一次
// ③使用false 与$file进行不全等判断
while(false !==($file =readdir($res))){
	// 排除.及..
	if ($file =='.' || $file =='..') {
		// 跳过当前循环，继续下次循环
		continue;
	}
	echo $file.'<br>';
}