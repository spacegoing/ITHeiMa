<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-10 15:06:50
 */
header("content-type:text/html;charset=utf8");
$path ='./dir1';
// 递归创建
$path ="./dir2/dir3";
// Warning: mkdir(): No such file or directory 
// mkdir($path);
// mkdir($path,0777,true);
$path ="./1-server-fr.php";
var_dump(is_dir($path));
// bool(false) 
$path ="../day1/3-form-post.php";
// echo dirname($path);
// .表示当前目录
// /day1
// 相对路径
$path ="./1-server-fr.php";
echo realpath($path);
// 绝对路径
// D:\WWW\fs2\day3\1-server-fr.php