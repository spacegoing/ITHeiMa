<?php

// 获取2个数的最大值
function getMax($num1,$num2) {

	if($num1 > $num2) {
		return $num1;
	}else {
		return $num2;
	}
}

// 我们一般用一个变量来接收有返回值的函数
$r = getMax(10,20);
var_dump($r);

?>