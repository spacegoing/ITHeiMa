<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-10 15:34:58
 */
header("content-type:text/html;charset=utf8");
/**
 * [readAllFile 读取文件夹中的所有的子目录及文件]
 * @param  string $path [目录的路径]
 * @return [type]       [description]
 */
function readAllFile($path='',$level=0){
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
		// 计算缩进单位
		$offset =str_repeat("&nbsp;", $level*5);
		// 从磁盘读取的字符集为GBK，输出需要转换为UTF-8
		$file =iconv("gbk",'utf-8',$file);
		echo $offset.$file.'<br>';

		// 判断是目录，继续读取子目录
		// 子目录的完整路径
		// thinkphp/common
		// thinkphpf/conf
		// 继续读取时，需要转换回来
		$file =iconv("utf-8",'gbk',$file);
		$full_path =$path.'/'.$file;
		if (is_dir($full_path)) {
			// echo $full_path.'****<br>';
			// 是目录，读取目录
			readAllFile($full_path,$level+1);
		}
		
	}
	// 关闭资源
	closedir($res);
}
$path ="./ThinkPHP";
readAllFile($path);