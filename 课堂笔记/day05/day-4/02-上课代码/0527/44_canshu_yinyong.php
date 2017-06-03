<?php

function sayHi(& $name) {

	echo "{$name}, 约吗?";
	// 在函数内部 我改变 $name 的值
	$name = '鹿晗';
}

$a = '王正时';

sayHi($a);
// 把一个变量传递到函数里
// 变量的传值
// 2种 值传递 和 引用传递
// 函数调用的时候默认是 值传递
// 什么是引用传递 -- 把一个变量的地址赋值给另外一个变量
echo '<br>',$a;

sayHi('itcast');

?>