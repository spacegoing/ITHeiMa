<?php
/**
 * 
 * @authors julien perfect27pu@126.com
 * @date    2017-06-10 14:43:07
 */
header("content-type:text/html;charset=utf8");

// ①初始化CURL资源
$curl =curl_init();
// var_dump($curl);
// resource(2) of type (curl) 
$url ="http://www.baidu.com";
// ②设置选项
curl_setopt($curl, CURLOPT_URL, $url);
// 设置以文件流形式放回
curl_setopt($curl,CURLOPT_RETURNTRANSFER, true);
// ③执行CURL会话
$data =curl_exec($curl);
// 进行字符串的替换
$data =str_replace("百度一下",'问飞哥一下',$data);
echo $data;
// ④释放资源
curl_close($curl);