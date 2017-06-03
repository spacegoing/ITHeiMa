<?php

$a = 100;

$b = & $a;

echo $a,$b;

$b = 200;

echo '<br>';
echo $a,$b;

echo '<hr>';
unset($a);
echo $b;

?>