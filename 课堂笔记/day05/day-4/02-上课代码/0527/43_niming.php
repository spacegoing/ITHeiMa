<?php
$a = 10;
// 匿名函数 -- 就是没有函数名的函数
// 把一个匿名函数赋值给了一个 变量
$closure = function ($name) {

	echo "$name, hello";
};

// 函数最主要的就是需要调用. 
// 函数调用采用 函数名() 的形式
// 也可以采用 变量名() 的形式来调用
// 匿名函数调用的时候 就采用 变量名() 的形式
$closure('itheima');
echo '<br>';
var_dump($closure);
?>