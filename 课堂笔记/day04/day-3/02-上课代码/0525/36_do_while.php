<?php

$i = 10;

do{
	echo  '我很帅,但是我很穷';
	$i--;
}while($i);

echo '<hr>';
// while循环
$x = 0;
while($x <= 10) {
	echo $x,'<br>';
	$x++;
}

echo '<hr>';
// do-while循环
$y = 0;
do{
	echo $y,'<br>';
	$y++;
}while($y<=10);

echo '<hr>';

while(false) {
	echo 'while 走了吗?';
}

do{
	echo 'just do it';
}while(false);




?>