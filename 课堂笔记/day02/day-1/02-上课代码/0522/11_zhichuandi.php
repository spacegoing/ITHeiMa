<?php

$a = 100;

$b = $a;

echo $a,$b;

echo '<br>';
$a = 200;
echo $a,$b;

echo '<hr>';

unset($a);

echo $b;
echo $a;
?>