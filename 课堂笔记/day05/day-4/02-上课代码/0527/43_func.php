<?php



//调用
sayHi('itcast');

//定义一个函数
function sayHi($name) {
	// 实现功能
	echo "{$name} hello";
}



// 我想在这个脚本中使用 43_getMax.php
include '43_getMax.php';

$result = getMax(10,20);

echo "你比较的最大值是 $result";


?>