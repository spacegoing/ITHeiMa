<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-07 10:15:21
 */
header("content-type:text/html;charset=utf8");
/*echo "<pre>";
print_r($_POST);
print_r($_SERVER);*/
// echo $_SERVER;

// Notice:  Array to string conversion in D:\WWW\fs2\day1\3-post.php on line 11

// Array
// 加载公共函数文件functions.php
require_once "./functions.php";
dump($_POST);
dump($_SERVER);
