<?php

$result = 5>10 ? $a = 10 : $b = 20;

var_dump($b,$result);
var_dump($a);


$score = 58;

if($score >= 60) {
	echo '及格万岁';
} else {
	echo '你没有及格,等着炮轰吧~~~';
}

$score >= 60 ? ('及格万岁'):('你没有及格,等着炮轰吧~~~');

?>