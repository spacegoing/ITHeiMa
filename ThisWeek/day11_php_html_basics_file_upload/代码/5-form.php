<?php
// 假设该数据为从数据库中读取出来的数据
$cat ="财经";
$book ="论语";
// 展示时，对应的类型需要默认选中
$b =10;
$c =9;
// 三元表达式的原理
// echo $b >$c ?"yes" :"no";die; 
// yes
?>	
<html>
	<head>
		<meta charset="utf8">
	</head>
	<body>
		<form action="./4-get2.php" method="POST">
			类型：<select name="cat" id="">
				<option value="财经" <?php echo $cat=='财经'? 'selected':'';?>>财经</option>
				<option value="军事" <?php echo $cat=='军事'? 'selected':'';?>>军事</option>
				<option value="科技" <?php echo $cat=='科技'? 'selected':'';?>>科技</option>
				<option value="八卦" <?php echo $cat=='八卦'? 'selected':'';?>>八卦</option>
			</select><br>
			最喜欢的书：
			<input type="radio" name="book" value="论语" <?php echo $book=='论语'?'checked' :''; ?>>论语
			<input type="radio" name="book" value="三国" <?php echo $book=='三国'?'checked' :''; ?>>三国
			<input type="radio" name="book" value="梦里花落知多少" <?php echo $book=='梦里花落知多少'?'checked' :''; ?>>梦里花落知多少<br>
			爱好：
			<input type="checkbox" name="hobby[]" value="吃饭">吃饭
			<input type="checkbox" name="hobby[]" value="睡觉">睡觉
			<input type="checkbox" name="hobby[]" value="玩农药">玩农药<br>
			<input type="submit" value="提交"><br>
		</form>
	</body>
</html>