<?php

define('PI',3.14);

/**
*	@param $score 分数
*	@param $levle 及格分数
*/


function exam($score,$level = PI) {

	if($score >= $level) {
		echo '及格';
	} else {
		echo '不及格';
	}
	echo '<br>';
}

// 三大主科 120		96
// 生物		100		60
$a = 96;
// 数学
exam(100,96);
exam(88,96);
exam(44,96);
exam(55,1);

// 因为给了 $level 一个值,所以当我们省略这个参数但是时候
// 函数会取 $level的默认值
echo '<hr>';
exam(115);
exam(120);


// 生物老师
echo '<hr>';
exam(80,60);
exam(60,60);

echo '<hr>';
// 默认值会经常用
// 一般测试的时候都是用自己的电脑 127.0.0.1 3306 root 123456
function func_db_connection($add="127.0.0.1",$port = "3306",$user = "root",$pwd = "123456") {

	$link = mysql_connect("$add:$port",$user,$pwd);
}

// 自己电脑连接是时候
func_db_connection();
// 调用别人的电脑的时候
func_db_connection("192.168.133.200","3306","xijie")

?>