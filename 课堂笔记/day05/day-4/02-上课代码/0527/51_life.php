<?php

function f1() {
	static $i = 1;
	// static 这个关键字会延长 $i的生命,它的生命
	// 不会随着一次调用结束而消亡
	// 被static修饰的变量只会进行一次的赋值,
	//下一次调用的时候会记录之前的值
	// 被static修饰的变量会分配在 静态变量区
	$i++;
	echo $i,'<br>';
}

f1(); // 2
f1(); //  3
f1(); // 4

f1();
f1();

?>


<?php
f1();
f1();

?>


<?php
// 连接数据库的时候非常消耗资源
function linkDB() {

	static $link;

	if(!$link) { // 第一次连接数据库的时候 $link为null
		$link = mysql_connect("127.0.0.1:3306","root","123456");
		echo 'once';
	}
	echo '<br>';
	return $link;

}

// // 第一次调用的时候, 会连接数据库
$r1 = linkDB();


// // 第二次调用的时候, 
$r2 = linkDB();

var_dump($r1,$r2);

?>