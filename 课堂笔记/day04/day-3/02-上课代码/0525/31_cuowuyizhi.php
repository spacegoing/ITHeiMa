<?php

@var_dump($a);

// 连接一下mysql
@$link = mysql_connect("127.0.0.1:3306","root","123456");
// 登录没有成功会返回一个false
// 登录成功会返回一个资源类型,转换为bool是true
// var_dump($link);
if(!$link) {
	// 没有登录成功就是真
	echo '服务器跑到火星去了,听说嫦娥也去了,信息量好大呀,你去吗?';
}

?>