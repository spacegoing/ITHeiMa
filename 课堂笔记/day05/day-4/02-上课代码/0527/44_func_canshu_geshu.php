<?php

function getMax($num1,$num2) {

	return $num1>$num2? ($num1) : ($num2);

}

$r =getMax(10,20,30);

var_dump($r);

$r = getMax(10);
var_dump($r);


// 说函数名时候 -- 函数名不能重复
// 系统有一个函数 max
echo '<hr>';
$r1 = max(11,22);
$r2 = max(11,22,33);
$r3 = max(11,22,33,454);
var_dump($r1,$r2,$r3);

echo '<hr>';
// 我们也定义一个不定参数 的函数
function getMin() {

	// 我们如何来获取不确定的参数呢?
	// 我们采用系统的函数
	// arg => argument 参数的意思 
	// func_get_args()系统函数返回一个 数组
	$args = func_get_args();

	var_dump($args);
	

	echo '<hr>';
	// func_get_arg() 可以获取指定索引的参数的值,我们把索引传入进去
	$value = func_get_arg(1);
	echo $value;

}

// 调用
$r4 = getMin(11,22,33);

?>