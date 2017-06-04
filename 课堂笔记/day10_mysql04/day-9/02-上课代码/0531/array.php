<?php

$array = array(
	'name' => 'itcast',
	'age' => 11,
	'year' => array('2017','2016','2015')
	);


// 想要对数组进行遍历,就需要一个函数
function bianliArray($array) {

	// 为了确保你遍历的是数组,我们先得判断一下
	if(!is_array($array))  {
		return ;
	}

	// 前边已经判断了是否是数组,只有是数组才会执行下边的代码
	foreach($array as $key => $value) {
		// $value针对于一维数组而言,肯定就是最终的值
		// 但是针对于多维数组而言,就不一定了

		if(is_array($value)) {
			bianliArray($value);
		} else {

			echo "$value",'<br>';
			
		}

	}
}

bianliArray($array);


?>