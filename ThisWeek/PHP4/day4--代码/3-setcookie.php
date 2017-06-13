<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-12 10:03:14
 */
header("content-type:text/html;charset=utf8");
// 默认会话周期
// setcookie("user1","Dean",0);
// 删除数据
setcookie("user2","",time()-1);
// setcookie("user1","juliette",time()+3600*24*7);
setcookie("user1","juliette",PHP_INT_MAX);
// setcookie("user1","");