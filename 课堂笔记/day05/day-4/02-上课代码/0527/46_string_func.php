<?php

$str = '齐瑞华';
// 中文 以utf-8编码 一个中文占3个字节
echo strlen($str);

$str2 = 'ITCAST';
echo '<br>';
echo strlen($str2);

echo '<hr>';

$sub = substr($str2,2);
echo $sub;

$subChinese = substr($str,3);
echo '<br>',$subChinese;

// 中国字 一个字节 128中情况 就能记录128个汉字
// 
// strtolower小写
$lower = strtolower($str2);
echo '<br>',$lower;

// strtoupper 大写
echo '<br>',strtoupper($lower);

// ucfirst -- 首字母大写
echo '<br>',ucfirst($lower);

echo '<hr>';
// 将字符串反转过来
$rev = strrev($str2);
echo $rev,'<br>';

// strpos 查找字符首次出现的位置(查找是从左到右的顺序)
$res = strpos($str2,"T");

var_dump($res);
echo '<br>';

// strstr 或者是 strchr
// 查找的字符串第一次出现的位置开始截取,一致截取到字符串的结尾
$res2 = strstr($str2,"T");
var_dump($res2);


// 需求 , 用户在上传图片的时候,有可能上传png,gif,jpeg
// 获取对应的图片的后缀名
echo '<hr>';
$image = 'photo_private.png';
// substr 虽然可以截取,
// 但是只是针对于固定的/已知的字符串
$photoType = substr($image,6);
echo $photoType,'<br>';

$strstr = strstr($image,".");
echo $strstr;

$lastStr = substr($strstr,1);
echo '<br>',$lastStr;

echo '<hr>';

// trim -- 去掉字符串两边的空格/制表符
$tr = ' itcast ';
$result = trim($tr);
var_dump($result);


// str_replace 替换函数
echo '<hr>';
echo __DIR__;
// E:\amp\apache\htdocs\0527 
// 把 __DIR__ 中的 \ 替换成 / 
// \ 这个是一个转义字符,所以需要在转义字符前边再加一个转义字符\
$result2 = str_replace('\\','/',__DIR__);
echo '<br>',$result2;
?>