<?php

// 获取php的版本
echo PHP_VERSION,'<br>';
// 获取操作系统内核 operation 操作 system
echo PHP_OS,'<br>'; // windows 的路径 C:\Users\Ricky\Desktop\全栈2期\day-1
					// linux 的路径 E:/amp/apache/logs/foo.log

// int 
// 获取php中int的最大值
// 1MKB = 1024KB
// 1KB = 1024B  B 表示字节
// 1B = 8 bit  bit 表示 位 位是最小的单位

// int 占 4个字节 32个bit位
// 获取php给int分配了多少个字节
echo PHP_INT_SIZE,'<br>';
// 获取int的最大值
echo PHP_INT_MAX,'<br>';

echo '<hr>';
// 是魔术常量: 会根据环境的变化而改变
// 获取当前代码的行数
echo __LINE__,'<br>';
// 获取当前脚本的路径
echo __FILE__,'<br>';
echo $_SERVER["SCRIPT_FILENAME"],'<br>';

// 获取当前脚本目录的路径
echo __DIR__,'<br>'; // dir 表示 directory

?>