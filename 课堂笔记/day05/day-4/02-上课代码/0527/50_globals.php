<?php
echo '<pre>';
// 打印一下 超全局变量
var_dump($GLOBALS);

// 我声明一个变量
$name = 'itcast';

echo '<hr>';
var_dump($GLOBALS);

echo '<hr>';

$GLOBALS['age'] = 11;

var_dump($GLOBALS);
echo '<br>';
echo $age;

// 声明一个函数
function sayHi() {

	echo "hello ,{$GLOBALS['name']}";
	
	// 我们知道 $name 这个全局作用域的变量 和 $GLOBALS['name'] 
	//是同生共死关系
	unset($GLOBALS['name']);
}

// 调用函数
sayHi();

var_dump($name);
?>