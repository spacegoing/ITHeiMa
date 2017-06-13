<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-10 17:37:02
 */
header("content-type:text/html;charset=utf8");
// 告诉浏览器的类型
header("content-type:application/octet-stream");
// 告诉浏览器如何处理文件
$filename ='aa.txt';
header("content-disposition:attachment;filename=$filename");
// 读取内容，输出至浏览器
$path ="./dream.txt";
echo file_get_contents($path);
?>
<html>
	<a href="./dream.txt">点击下载dream.txt</a><br>
	<a href="./ThinkPHP.rar">点击下载ThinkPHP.rar</a><br>
</html>