<?php  

// echo '今天学的怎么样啊?';

// // die;

// echo '今天学了include';

sleep(5);

@$link = mysql_connect("127.0.0.1:3306","root","123456");

if(!$link) {
	// die
	exit('服务器约会去了,你还是单身狗吗?哈哈哈');
	// echo '服务器跑火星去了';
}

// 如果数据库连接没问题,会执行后续的代码
echo '数据库的增删改查';

?>