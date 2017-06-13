<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-10 16:50:15
 */
header("content-type:text/html;charset=utf8");
/*$url ="http://www.bilibili.com";
$str =file_get_contents($url);
// echo $str;
// $path ="./1-server-fr.php";
$path ="./dream.txt";
echo file_get_contents($path);*/

$url ="http://www.baidu.com";
$str =file_get_contents($url);
$str =str_replace("百度一下","问飞哥一下",$str);
// echo $str;
// 

// 保存在本地
$save_path ="./baidu.html";
file_put_contents($save_path, $str);
// 非字符串类型，本地化后类型丢失
$arr =[1,2,3];
file_put_contents('./arr.txt',$arr);
// 123