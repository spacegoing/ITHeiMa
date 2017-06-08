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

	// 创建finfo资源
	$finfo =finfo_open(FILEINFO_MIME_TYPE);
	// var_dump($finfo);die;
	// resource(2) of type (file_info)
	// 读取MIME信息
	$mime =finfo_file($finfo,$file['tmp_name']);
	// die($mime);
	$arr_mime =['image/png','image/jpeg'];
	if (!in_array($mime,$arr_mime)) {
		die("类型不支持");
	}

	
	$max_size =1.1;//单位M
	if ($max_size*1024*1024 < $file['size']) {
		die('文件超过'.$max_size.'M');
	}
	// 获取文件的后缀
	// a.html.php
	$ext =strrchr($file['name'],'.');
	// aa0.jpeg
	// .jpeg
	// die($ext);
	// echo date('Y-m-d H:i:s');
	// 2017-06-07 16:54:23
	// echo date('Ymd-His');
	// 20170607-165457
	// die;
	// 生成唯一的文件名
	// mt_rand的效率远高于rand
	// $save_path ='./upload/'.date('Ymd-His-').mt_rand(1000,9999).$ext;
	$save_path ='./upload/'.uniqid().$ext;
	// 移动临时文件至永久目录
	if (move_uploaded_file($file['tmp_name'],$save_path)) {
		echo $file['name'].'上传成功！';
	}else{
		die('移动文件失败！');
	}
}else{
	die("文件上传出错！");
}