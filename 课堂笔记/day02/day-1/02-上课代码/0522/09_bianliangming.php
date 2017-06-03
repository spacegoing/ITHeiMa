<?php

$name = '如花';
$Name = '志玲姐姐';

echo $name,$Name;

echo '<hr>';

// 可变变量
$school = 'itcast';

$itcast = 'php';

echo $$school; // $$school ==> $itcast

$php = '全栈2期';

echo $$$school; // $itcast => php


echo '<br>';

// 可变变量在哪里使用呢?

$num1 = 10;
$num2 = 20;
$num3 = 30;
$num4 = 40;
$num5 = 50;

// 求这5个数的和
$sum = $num1 + $num2 + $num3 + $num4 + $num5;
echo $sum;

$result = 0;
// 一下代码大家知道可变变量如何使用就可以
for($i = 1;$i<=5;$i++) {

	// 第一步: 先拼接变量名
	// 我们通过点(.) 来进行字符串的拼接
	$new_name = 'num'.$i; // $new_name = num2
	// echo $new_name,'<br>';
	
	// js 
	$result = $result + $$new_name; // 相当于 $result += $$new_name;

}
echo '<hr>';
echo $result;

?>