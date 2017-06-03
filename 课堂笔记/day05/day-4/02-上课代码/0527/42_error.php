<?php
// 自定义错误写在脚本的最前边
// 填写函数名
set_error_handler('myError');

// 实现函数
function myError($errorNo,$errorMsg,$errorFile,$errorLine) {

	// echo 'this is my error';
	echo $errorNo,'<br>';
	echo $errorMsg,'<br>';
	echo $errorFile,'<br>';
	echo $errorLine,'<br>';
}

var_dump($a);

?>