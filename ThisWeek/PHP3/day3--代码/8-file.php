<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-10 16:01:15
 */
header("content-type:text/html;charset=utf8");
$path="./article/connect1.php";
var_dump(is_file($path));
// bool(true) 
/*// 可以用来判断扩展库是否加载成功
var_dump(function_exists("mysql_connect"));
 // bool(true) */
$path="./article";
var_dump(file_exists($path));
// bool(true) 
/*$path ="./1-server-fr.php";
// 只读的打开方式
$res =fopen($path,'r');
// var_dump($res);
 // resource(3) of type (stream) */

/**
 * 不同的打开方式对写入的影响
 */
$path ="./dream.txt";
$path ="./dream1.txt";
// 只读的打开方式
// $res=fopen($path, 'r');
// 读写
// $res=fopen($path, 'r+');
//写入方式
// $res=fopen($path, 'w+');
// a 追加方式
$res=fopen($path, 'a+');
 fwrite($res,'Hello');