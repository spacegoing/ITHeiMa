<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-07 15:57:05
 */
header("content-type:text/html;charset=utf8");
/**
 * [upload_one 上传单文件]
 * @param  array  $file     [官员关于单文件的完整信息，一维数组]
 * @param  string $dir      [永久目录]
 * @param  float  $max_size [上传的最大值，单位为M]
 * @param  array  $arr_mime [支持的文件类型，索引]
 * @return [string]   $save_name        [永久路径]
 */
function upload_one($file=[],$dir='./upload/',$max_size=1.1,$arr_mime=[]){
	// 判断$_FILES是否为空
	if (!empty($file)) {
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
		// 读取MIME信息
		$mime =finfo_file($finfo,$file['tmp_name']);
		// 如果调用没有传递类型限制参数，不限制类型
		// 
		if (!empty($arr_mime)) {
			if (!in_array($mime,$arr_mime)) {
				die("类型不支持");
			}
		}

		// 大小判断
		if ($max_size*1024*1024 < $file['size']) {
			die('文件超过'.$max_size.'M');
		}
		// 获取文件的后缀
		$ext =strrchr($file['name'],'.');
		$save_path =$dir.uniqid().$ext;
		// 移动临时文件至永久目录
		if (move_uploaded_file($file['tmp_name'],$save_path)) {
			echo $file['name'].'上传成功！<br>';
		}else{
			die('移动文件失败！');
		}
		return $save_path;
	}else{
		die("文件上传出错！");
	}
}

$file =$_FILES['myFile'];
$dir ="./upload/";
$max_size =1.8;
echo upload_one($file,$dir,$max_size);