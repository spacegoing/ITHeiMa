<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-07 18:34:01
 */
header("content-type:text/html;charset=utf8");
echo "<pre>";
// print_r($_FILES);
// print_r($_FILES['myFile']);
// 遍历二维数组，获取关于每个文件的完整信息
foreach($_FILES['myFile']['error'] as $k =>$v){
	// $k表示文件错误信息的下标
	// $v 表示文件的错误代码
	// 没有出错，获取文件的完整信息
	if ($v == 0) {
		$oneFile['name']     =$_FILES['myFile']['name'][$k];
		$oneFile['tmp_name'] =$_FILES['myFile']['tmp_name'][$k];
		$oneFile['size']     =$_FILES['myFile']['size'][$k];
		$oneFile['error']    =$_FILES['myFile']['error'][$k];
		$oneFile['type']     =$_FILES['myFile']['type'][$k];

		// 判断是否是POST上传文件
		if (is_uploaded_file($oneFile['tmp_name'])) {
			$ext =strrchr($oneFile['name'], '.');
			$save_path ="./upload/".uniqid().$ext;
			// 移动至永久目录
			if (move_uploaded_file($oneFile['tmp_name'], $save_path)) {
				echo "文件：".$oneFile['name'].'上传成功！<br>保存的路径'.$save_path.'<br>';
			}
		}
	}
}