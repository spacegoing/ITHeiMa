<?php

echo 'this is header';

// 用include 导入不存在的文件
// include 'aaa.aaa';

require 'aaa.aaa';

echo 'this is footer';
?>