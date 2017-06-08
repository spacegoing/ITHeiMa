<?php
/**
 * 封装大量的工具函数
 * @authors julien perfect27pu@126.com
 * @date    2017-06-07 09:38:56
 */
header("content-type:text/html;charset=utf8");
/**
 * [redirect1 立即跳转]
 * @param  string $url [跳转的地址]
 * @return [type]      [description]
 */
function redirect1($url=''){
	header("location:$url");
}
/**
 * [redirect2 带弹框的跳转]
 * @param  string $url     [请求地址]
 * @param  string $message [提示信息]
 * @return [type]          [description]
 */
function redirect2($url='',$message=""){
	echo "<script>alert('$message');location.href='$url';</script>";
}
// 封装数组打印函数
function dump($arr=[]){
	echo "<pre>";
	print_r($arr);
}

$arr =[1,2,3];
// dump($arr);
// Array
// (
//     [0] => 1
//     [1] => 2
//     [2] => 3
// )
$url ="http://www.baidu.com";
// redirect1($url);
$message ="操作成功";
// redirect1($url);
// redirect2($url,$message);
?>
<html>
	<!-- <script>
		alert('some text');
	</script> -->
</html>