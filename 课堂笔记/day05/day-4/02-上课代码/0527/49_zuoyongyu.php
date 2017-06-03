<?php

$n = 'itheima';


// $_GET
$_GET['a'] = 'abc';


function f1() {

	$name = 'itcast';

	echo $_GET['a'];
}

function f2() {
	$name = '唐伯虎';
}

f1();
f2();


/*
// 给数组添加一个数据
$array = array(
		'name' => 'itcast',
		'age' => 11
	);
echo '<pre>';
var_dump($array);
// 给array添加数据
$array['address'] = '顺义马坡南';
var_dump($array);
*/

?>