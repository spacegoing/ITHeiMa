<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-10 16:24:02
 */
header("content-type:text/html;charset=utf8");
/*$path ='./dream.txt';
$res =fopen($path,'r');
// 读取指定大小
// $str =fread($res, 2048);
// 读取全部
// $str =fread($res,filesize($path));
// 按照原先的格式输出
$str =fread($res,filesize($path));
// str_replace('\r\n','<br>',$str);
// 回车换行符必须使用双引号才能解析
$str =str_replace("\r\n",'<br>',$str);
echo $str;
fclose($res);*/
/*$path ="./dream2.txt";
// 同一目录下
// rename($path,'./dream1.txt');
// 移动重命名
rename($path,'../dream3.txt');*/

// 删除文件
unlink('../dream3.txt');
