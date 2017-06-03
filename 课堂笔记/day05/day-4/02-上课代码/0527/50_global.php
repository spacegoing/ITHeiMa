<?php

// 全局作用域
$name = 'itcast';


function sayHi() {

	echo "hello ,{$GLOBALS['name']}";
	// 想使用全局作用域的变量只能通过$GLOBALS
	 // $GLOBALS['name'] = 'hahaha';
	// 我们可以使用 global这个关键字 来代替 $GLOBALS['name']

	// ① 局部变量的名字必须和全局作用域的名字一样
	// ② 必须使用 global
	global  $name; // 相当于 $GLOBALS['name'];
	echo '<br>';
	$name = 'hehehe';
}

sayHi();

echo $name;

?>