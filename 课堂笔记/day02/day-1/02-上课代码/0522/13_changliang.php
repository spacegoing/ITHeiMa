<?php

// 定义常量
// define('名',值); 
// 注意: 名必须用 引号包裹起来

define('PI',3.1415926);

echo PI;

// 定义一个host常量
define('HOST',$_SERVER["HTTP_HOST"]);


// 用const定义常量
// const PI = 3.14;

// unset(PI);

echo '<hr>';
echo HOST;

echo '<br>';
var_dump(defined("HOST"));

?>