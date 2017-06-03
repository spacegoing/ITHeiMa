<?php

// 声明了2个变量
$str1 = '你若安好';
$str2 = '便是晴天';

echo $str1,$str2;
echo '<br>';
// 双引号里的变量可以被解析
echo "$str1";
// 单引号里的变量不能被解析
echo '<br>';
echo '$str1';

// 声明一个数组, php中初始化数组采用 array() 这个函数
// () 里填对应的元素

$array = array(1,2,3,4,5);
echo $array;

?>