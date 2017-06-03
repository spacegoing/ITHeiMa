<?php

function sayHi($name) {

	echo "{$name}, 约吗?";
	// 在函数内部 我改变 $name 的值
	$name = '鹿晗';
}

// sayHi('李正午');
$a = '王正时';

sayHi($a);
// 把一个变量传递到函数里
// 变量的传值
// 2种 值传递 和 引用传递
// 函数调用的时候默认是 值传递

echo '<br>',$a;
?>