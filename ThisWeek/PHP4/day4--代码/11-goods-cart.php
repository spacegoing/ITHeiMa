<?php
/**
 * 购物车页面
 * @authors julien perfect27pu@126.com
 * @date    2017-06-12 16:45:21
 */
header("content-type:text/html;charset=utf8");
$gid   =isset($_GET['gid']) ? $_GET['gid']:"";
$gname =isset($_GET['gname']) ? $_GET['gname']:"";
if (empty($gid) || empty($gname)) {
	die("添加出错！");
}


// session会话的编号
$sid =isset($_GET['sid']) ? $_GET['sid'] :"";
// 会话编号不为空，则使用该会话编号。不创建新的session文件
if (!empty($sid)) {
	session_id($sid);
}
// 添加购物车
// 为了避免相互覆盖，考虑第一次及其他。
session_start();



// 第一次添加
if (empty($_SESSION['cart'])) {
	
	// 与购物车有关的数据，全部全在一个下标。
	$_SESSION['cart'][$gid] =[
		'gname'=>$gname,
		'gnum'=>1
	];
	print_r($_SESSION);
}else{
	// 判断是否有该商品。
	if (array_key_exists($gid, $_SESSION['cart'])) {
		// 有，数量加1
		$_SESSION['cart'][$gid]['gnum'] += 1;
		
	}else{
		// 没有，直接添加(第一次添加该商品)
		$_SESSION['cart'][$gid] =[
			'gname'=>$gname,
			'gnum'=>1
		];
	}
}
echo "<pre>";
print_r($_SESSION['cart']);
echo "<a href='./10-goods-list.php?sid=$sid'>点击继续购买</a>";