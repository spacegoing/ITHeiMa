<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-10 15:34:58
 */
header("content-type:text/html;charset=utf8");
/**
 * [readAllFile 读取文件夹中的子目录及文件]
 * @param  string $path [目录的路径]
 * @return [type]       [description]
 */
function readAllFile($path=''){
	// 判断是否是有效的目录
	if(!is_dir($path)) die('非法的目录');
	
	$res =opendir($path);
	// 循环读取资源
	// ①读取资源，
	// ②赋值给$file变量，指针移动一次
	// ③使用false 与$file进行不全等判断
	while(false !==($file =readdir($res))){
		// 排除.及..
		if ($file =='.' || $file =='..') {
			// 跳过当前循环，继续下次循环
			continue;
		}
		echo $file.'<br>';
	}
	// 关闭资源
	closedir($res);
}
$path ="./article";
readAllFile($path);