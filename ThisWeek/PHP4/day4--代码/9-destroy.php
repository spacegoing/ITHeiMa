<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-12 15:40:07
 */
header("content-type:text/html;charset=utf8");
echo "<pre>";
session_start();
print_r($_SESSION);
// // 删除单个session
// unset($_SESSION['star3']);
// 删除所有session
// $_SESSION =[];
// 销毁session
session_destroy();