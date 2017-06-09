<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-09 15:16:00
 */
header("content-type:text/html;charset=utf8");
// echo "index";
require_once "./connect.php";
// 加载工具函数
require_once "./functions.php";

// 构建SQL语句
$sql="select aid,title,author,type,descp,add_time from article order by aid desc limit 10;";
// 执行SQL
$res =mysql_query($sql);
if (!$res) die('暂无数据');
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
	<table width="80%" border="1" rules="all" align="center">
		<tr>
			<th>编号</th>
			<th>标题</th>
			<th>作者</th>
			<th>类型</th>
			<th>摘要</th>
			<th>发布时间</th>
			<th>操作</th>
		</tr>
<?php 
while ( $line =mysql_fetch_assoc($res)) :
?>
		<tr>
			<td><?php echo $line['aid'] ?></td>
			<td><a href="./detail.php?aid=<?php echo $line['aid'] ?>"><?php echo $line['title'] ?></a></td>
			<td><?php echo $line['author'] ?></td>
			<td><?php echo $line['type'] ?></td>
			<td><?php echo $line['descp'] ?></td>
			<td><?php echo $line['add_time'] ?></td>
			<td><a href="./edit.php?aid=<?php echo $line['aid'] ?>">修改</a> || <a href="./delete.php?aid=<?php echo $line['aid'] ?>">删除</a></td>
		</tr>
<?php 
endwhile;
 ?>
	</table>
</body>
</html>