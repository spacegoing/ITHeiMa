<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-07 15:57:05
 */
header("content-type:text/html;charset=utf8");
echo "<pre>";
// 休眠代码执行
// sleep(5);
print_r($_FILES);
// Array
// (
//     [myFile] => Array
//         (
//             [name] => 404.png
//             [type] => image/png
//             [tmp_name] => C:\Windows\Temp\phpC45E.tmp
//             [error] => 0
//             [size] => 11504
//         )

// )
// 判断$_FILES是否为空
if (!empty($_FILES)) {
	$file =$_FILES['myFile'];
	// print_r($file);
	// 是否发生错误
	$error_msg ="";
	if ($file['error'] != 0) {
		switch ($file['error']) {
			case 1:
				$error_msg ="文件超过2M";
				break;
			case 4:
				$error_msg ="未选择文件";
				break;
			case 6:
				$error_msg ="临时路径错误";
				break;
		}
		die($error_msg);
	}
	// 判断是否是POST上传文件
	if (!is_uploaded_file($file['tmp_name'])) {
		die('非法文件');
	}
	$save_path ='./upload/'.$file['name'];
	// 移动临时文件至永久目录
	if (move_uploaded_file($file['tmp_name'],$save_path)) {
		echo $file['name'].'上传成功！';
	}else{
		die('移动文件失败！');
	}
}else{
	die("文件上传出错！");
}