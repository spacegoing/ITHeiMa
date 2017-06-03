<?php

// 外循环用于控制 行
for($x=1;$x<=9;$x++) :

	// 内循环用于控制 列
	for($y=1;$y<=$x;$y++) :
		// 点(.)用于字符串的拼接
		// 逗号 用于 变量的分割
		// {} 主要用于 告诉变量的边界
		echo "{$x}x{$y} = " . $x*$y ,"&nbsp";
	endfor;

	echo '<br>';
endfor;

echo '<hr>';

$score = 91;
// 90 80 70 60
if($score >= 90) :
	echo '给你一百块';
elseif ($score >= 80) :
	echo '哥哥给你一块糖吃';
elseif ($score >= 70) :
	echo '给你一个奖状';
elseif ($score >= 60):
	echo '你静静的看着他们拿奖吧';
else :
	echo '等着恩恩的炮决';
endif;





?>