<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-07 15:31:54
 */
header("content-type:text/html;charset=utf8");
echo "<pre>";
print_r($_POST);
/*Array
(
    [title] => qqq
    [author] => 123
    [type] => 新闻
    [is_show] => yes
    [descp] => aaw
    [content] => 
)*/
foreach ($_POST as $key => $value) {
	// $Key 表示元素的下标 title
	//$value表示元素值 qqq
	$$key =$value;
	// 第一次循环
	// $title ='qqq';
}
var_dump($title,$author,$content);
/*// 将数据保存到变量中
// 创建多个变量，非常不方便
$title =$_POST['title'];

// 可变变量
$itcast ='fs';
$fs ="111";
echo $$itcast;
// 将$itcast的值作为变量的名称
// $fs*/