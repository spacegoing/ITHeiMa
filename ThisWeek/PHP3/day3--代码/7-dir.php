<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-10 15:55:26
 */
header("content-type:text/html;charset=utf8");
$path ="./article";
// 删除目录
rmdir($path);
 // Warning: rmdir(./article): Directory not empty 
 