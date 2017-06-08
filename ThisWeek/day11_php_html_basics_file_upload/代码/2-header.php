<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-07 09:28:52
 */
// 通知浏览器数据类型
// 使用HTML解析器解析
// 字符集为utf8
header("content-type:text/html;charset=utf8");
echo "传智播客<br>";
// 通知浏览器跳转至B站
$url ="http://www.bilibili.com";
// header("location:$url");
header("refresh:3;url=$url");
echo "全栈二期<br>";