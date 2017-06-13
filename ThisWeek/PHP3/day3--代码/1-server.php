<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-10 10:35:22
 */
header("content-type:text/html;charset=utf8");
// echo 123
// echo "<pre>";
// print_r($_SERVER);
$accept_lang =$_SERVER['HTTP_ACCEPT_LANGUAGE'];
// echo $accept_lang;
// fr,zh-CN;q=0.8,en-US;q=0.6,zh;q=0.4,en;q=0.2
// 分割函数为explode,使用分割符将字符串分割为数组。
$lang_arr =explode(',',$accept_lang);
// print_r($lang_arr);
// Array
// (
//     [0] => fr
//     [1] => zh-CN;q=0.8
//     [2] => en-US;q=0.6
//     [3] => zh;q=0.4
//     [4] => en;q=0.2
// )
if ('fr' ==$lang_arr[0]) {
	include "./1-server-fr.php";
}else{
	include "./1-server-zh.php";
}
?>
<html>
	<p>123</p>
</html>