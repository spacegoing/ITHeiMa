<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-09 09:12:11
 */
header("content-type:text/html;charset=utf8");
if (!empty($_FILES)) {
	// 是否发生错误
	$file =$_FILES['myFile'];
	if ($file['error'] !=0 ) {
		$err_msg ="";
		switch($file['error']){
			case 1:
				$err_msg ="文件超过2M";
				break;
			case 4:
				$err_msg ="请选择文件";
				break;
			case 6:
				$err_msg ="临时路径错误！";
				break;
		}
		die($err_msg);
	}
	// 判断是否是http post上传的文件
	if (is_uploaded_file($file['tmp_name'])) {
		$ext =strrchr($file['name'], '.');
		$save_path ="./upload/".uniqid().$ext;
		if (move_uploaded_file($file['tmp_name'], $save_path)) {
			echo "success";
		}else{

		}
	}

}