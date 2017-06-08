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
    <form action="./1-get-form2.php" method="GET">
    <!-- 登录表单： -->
    	用户名：<input type="text" name="user" id=""><br>
    	密码：<input type="password" name="pass" id=""><br>
    	<input type="submit" value="登录">
    </form>
    <h4>商品列表</h4>
    <a href="./1-get-form2.php?gid=1000&gname=小米Max2">小米Max2</a><br>
    <a href="./1-get-form2.php?gid=1001&gname=华为mate9">华为mate9</a><br>
</body>
<script>
	var url="./1-get-form2.php?a=100&b=200";
	// var url="http://www.itcast.cn";
	// location.href=url;
	// assign方法
	location.assign(url);
</script>
</html>