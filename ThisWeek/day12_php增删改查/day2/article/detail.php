<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-09 16:15:07
 */
header("content-type:text/html;charset=utf8");
// echo "detail";
// 加载工具函数
require_once "./functions.php";
$aid =isset($_GET['aid']) ?$_GET['aid'] :"";
if (empty($aid)) redirect2("./index.php",'非法的请求');

// 连接数据库
require_once "./connect.php";
$sql ="select * from article where aid=$aid";
$res =mysql_query($sql);
if (!$res) redirect2("./index.php",'非法的参数1');
if(mysql_num_rows($res) == 0)  redirect2("./index.php",'非法的参数2');
// 获取结果集的数据
$line =mysql_fetch_assoc($res);
?>
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
	<div style="text-align: center;margin-top: 10px">
		<h4>首页</h4>
		<a href="./add.php">添加文章</a><br><br>
	</div>
	<!-- 编号。标题，作者，类型，摘要，发布时间，操作 -->
	<table width="80%" align="center">
		<tr>
			<td><h1><?php echo $line['title']  ?></h1></td>
		</tr>
		<tr>
			<td>
			<?php 
			$str =$line['add_time']."&nbsp;&nbsp;&nbsp;";
			$str .=$line['type']."&nbsp;&nbsp;&nbsp;";
			$str .=$line['author']."&nbsp;&nbsp;&nbsp;";
			$str .='已经有<b>'.$line['views']."</b>人访问<br><br><br>";
			echo $str;
			 ?>
			</td>
		</tr>
		<tr>
			<td><img src="<?php echo $line['pic_path']?>" alt="暂无图片" width="200"><br><br><br><?php echo $line['content']  ?></td>
		</tr>
	</table>
</body>
</html>

