<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-07 10:51:47
 */
header("content-type:text/html;charset=utf8");
require_once "./functions.php";
echo "GET <br>";
dump($_GET);
echo "POST <br>";
dump($_POST);
echo "REQUEST <br>";
dump($_REQUEST);
dump($_REQUEST['hobby']);
// 如何拼接数组的元素
echo implode(",",$_REQUEST['hobby']);
// 吃饭,玩农药

