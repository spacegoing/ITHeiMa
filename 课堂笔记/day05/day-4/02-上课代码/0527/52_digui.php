<?php

// 求第n的值
function getResult($n) {

	// 最好先写终结点
	if($n == 1 || $n == 2) {
		return 1;
	}

	// 进行递归调用
	$result = getResult($n-1) + getResult($n-2);
	return $result;
}

$r = getResult(50);
var_dump($r);

?>