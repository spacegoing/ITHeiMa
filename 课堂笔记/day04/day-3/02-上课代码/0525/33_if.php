<?php


$score = 58;

if($score >= 60) {
	echo '及格万岁';
} else {
	echo '你没有及格,等着炮轰吧~~~';
}

echo '<hr>';
// 转换成三元运算符
$result = $score >= 60 ?  "及格万岁" :  "你没有及格";
echo $result;


echo '<hr>';
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

?>