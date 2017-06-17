<?php 
echo "<pre>";
header('Content-Type: text/html; charset=utf-8');

// 打开资源
$curl_res = curl_init();
// var_dump($curl_res);

// 配置选项
$url = "http://www.baidu.com";
curl_setopt($curl_res, CURLOPT_URL, $url);
curl_setopt($curl_res, CURLOPT_RETURNTRANSFER, true);

// 获取数据
$data = curl_exec($curl_res);

// 处理数据
$data = str_replace("百度一下",'问飞哥一下',$data);
echo $data;

// 关闭连接
curl_close($curl_res);

 ?>