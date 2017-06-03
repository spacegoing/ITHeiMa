<?php

// 变量的声明
$a = 10;

$a = 'itcast';

// 变量必须先声明,再使用

echo $b;

var_dump($c);

// c语言 int a;

echo '<hr>';
// 删除之前,先打印一下$a
var_dump($a);
// 我们通过系统函数unset 把$a删除
unset($a);
// 删除之后,再打印一下$a
var_dump($a);



?>