<?php

// 有一个系统的函数 max

$r = max(10,20);

echo $r;

// 我们不能重新定义系统的函数(函数名不能重复)
// function max() {

// }

$name = '如花';
$Name = '志玲姐姐';

echo $name,$Name;

function sayHi($name) {
	echo 'hello',$name;
}
// 函数名就成为了一个变量值
$functionName = 'sayHi';

// 函数调用是 函数名() 
$functionName('itcast');


// -------- 一下代码是一个伪代码 --- 
// 可变函数在哪里用呢?
// gif,png,jpeg
$type = 'png';

// imagecreatefromgif();
// imagecreatefromjpeg();
// imagecreatefrompng();
switch($type) {

	case 'png' : $func_name = 'imagecreatefrompng';break;
	case 'gif' : $func_name = 'imagecreatefromgif'; break;
	case 'jpeg' : $func_name = 'imagecreatefromjpeg'; break;

}

//调用这个函数/方法
$func_name('图片');



?>