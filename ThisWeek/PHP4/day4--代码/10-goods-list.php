<?php 
$sid =isset($_GET['sid']) ? $_GET['sid'] :"";
if (!empty($sid)) {
	// 设置本次会话的编号
	session_id($sid);
}
// 没有时，自行创建session文件。产生会话编号
session_start();
// 获取已经打开的会话的编号
$sid =session_id();
// die($sid);
 ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>全栈商城</title>
<meta name="description" content="">
<meta name="keywords" content="">
<link href="" rel="stylesheet">
</head>
<body>
    <div style="text-align: left">
    	<h2>欢迎来到全栈商城</h2>
    </div>
    <a href="11-goods-cart.php?gid=1000&gname=iphone7 plus&sid=<?php echo $sid ?>">iphone7 plus</a><br>
    <a href="11-goods-cart.php?gid=1001&gname=BMW 7系&sid=<?php echo $sid ?>">BMW 7系</a><br>
</body>
</html>