<?php
// display -- 显示
// ini_set("display_errors",0);


// $a = 100;
// echo $a;

// 系统错误,用户错误,其他错误都是常量
// PHP_OS  __DIR__
// 系统错误
echo E_ERROR,'<br>'; // 1				二进制	0001
// 系统警告
echo E_WARNING,'<br>'; // 2				二进制  0010
// 系统提示
echo E_NOTICE,'<br>'; // 8				二进制	1000


// 用户错误
echo E_USER_ERROR,'<br>'; // 256		二进制	1 0000 0000
// 用户警告
echo E_USER_WARNING,'<br>'; // 512		二进制	10 0000 0000
// 用户提示	
echo E_USER_NOTICE,'<br>'; // 1024 		二进制 100 0000 0000

echo E_ALL;					// 32767	二进制 111 1111 1111 1111

// E_ALL = E_ERROR | E_WARNING | E_NOTICE | E_USER_ERROR | E_USER_WARNING | E_USER_NOTICE |

// 我们通过 系统函数 trigger_error 

$age = 61;
if($age > 60) {
	trigger_error('老大爷,您在家歇着吧',E_USER_ERROR);
}


?>