<?php

switch(2*5) {
	case 2+2: echo '我是开关,我的结果是4','<br>';break;
	case 8: echo '我是008','<br>'; break;
	case 5+5 : echo '我是谁?我不知道我是谁','<br>';break;
	case 20-4: echo '我少了个4','<br>';break;
	default: echo '统统到我碗里来','<br>';break;
}

// if 和switch 都是分支结构,
// 我们可不可以把 if的语句转换成 switch

/*
$score = 91;
// 90 80 70 60
if($score >= 90) {
	echo '给你一百块';
} elseif ($score >= 80) {
	echo '哥哥给你一块糖吃';
} elseif ($score >= 70) {
	echo '给你一个奖状';
}elseif ($score >= 60) {
	echo '你静静的看着他们拿奖吧';
}else {
	echo '等着恩恩的炮决';
}
*/
// 需求是我想知道 90,80,70,60
$score = 91;
// 第一步: 对分数进行取整
$s = (int)($score/10);
// var_dump($s);
// 第二步: 进行switch判断
switch($s) {
	case 10:
	case 9: echo '给你一百块'; break;
	case 8:echo '哥哥给你一块糖吃';break;
	case 7:echo '给你一个奖状';break;
	case 6:echo '你静静的看着他们拿奖吧';break;
	default: echo '等着恩恩的炮决';break;
}

die;

?>