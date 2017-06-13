<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-12 09:45:23
 */
header("content-type:text/html;charset=utf8");
echo "<pre>";
// ①使用$_COOKIE读取全部该网站的全部COOKIE数据
// ②同一网站的COOKIE数据，在不同页面，可以共享
print_r($_COOKIE);