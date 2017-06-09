<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-09 11:32:37
 */
header("content-type:text/html;charset=utf8");
// 建立连接
require_once "./connect.php";
// 字段别名作为数组的字符串下标
$sql ="select aid,title,author,descp from article  where aid <105";
// 查询结果集
$res =mysql_query($sql);
if (!$res) die("查询失败");

if (!mysql_num_rows($res)) die("空结果集");
echo "结果集中的行数：".mysql_num_rows($res).'<br>';
echo "结果集中的列数：".mysql_num_fields($res).'<br>';
// ①获取结果集一行，指针移动
// ②赋值给$line变量
// ③使用$line进行条件判断
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
    <table width='50%' align="center" border="1" rules="all">
    	<tr bgcolor="#6D6A6A">
    		<th>文章编号</th>
    		<th>标题</th>
    		<th>作者</th>
    		<th>摘要</th>
    	</tr>
<?php 
// 循环获取结果集的全部行
while ($line =mysql_fetch_assoc($res)) {
	// 将数据填充在行中
	echo "<tr>
    		<td>".$line['aid']."</td>
    		<td>".$line['title']."</td>
    		<td>".$line['author']."</td>
    		<td>".$line['descp']."</td>
    	</tr>";
}
 ?>
    	
    </table>
</body>
</html>