<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Examples</title>
<meta name="description" content="">
<meta name="keywords" content="">
<link href="" rel="stylesheet">
</head>
<body>
    <form action="6-validate.php" method="POST">
    	用户名：<input type="text" name="user" id="" value="<?php echo isset($_COOKIE['fs2_user']) ?$_COOKIE['fs2_user'] :"" ?>"><br>
    	密&nbsp;&nbsp;&nbsp;码： <input type="password" name="password" id=""><br>
    	<input type="checkbox" name="remember" id="" value="9999">记住我
    		&nbsp;&nbsp;&nbsp; <input type="submit" value="登录">
    </form>
</body>
</html>