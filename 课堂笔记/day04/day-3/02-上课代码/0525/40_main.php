<?php

// 文件载入
// 语法: include '文件名';
$a = 10000;
// 文件载入是需要文件载入的地方载入
include '40_header.html';
// include 可以载入任意文件的代码
include "40.txt";

echo 'this is main ';

//include '40_footer.html';
?>

<h1>this is footer </h1>
<?php

	echo $a,'<br>';

?>

<?php

// 导入一个php的源文件
include '37_for.php'; // 相当于 include './37_for.php';
// 上一级目录
include "../../README.txt"  ; // ../ 相当于上一级目录.在当前的环境 相当于 apache
?>

<h1>this is html mode</h1>

<?php

echo 'this is php mode';
echo $a;
?>