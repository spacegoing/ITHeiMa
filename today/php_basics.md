# PHP #

## 问题 ##

### 未解决 ###

- `数组格式 []` php 专用？
- `die;`?
- unique key?
- 如何在一个form中多个 `evtype`?

### 已解决 ###

- `8M`: 上传文件不可超过 `php.ini`定义的 `post_max_size = 8M` 否
  则php `$_FILES` 得到的为空 `array()` 没有错误信息

## Keng ##

### 文件上传 ###


#### 当文件大于8M时没有报错 ####

超出 `upload_max_filesize` 时，

- 如果没有超过 `$8M`，则有报错信息。
- 如果超过，则没有报错信息。

##### 解决 #####

1. 设计表单
2. 接受数据：判断 `$_FILES` 是否为空 （超出`8M`)
3. 判断错误：$_FILES['myFIle']['error']. 出错提示错误信息
4. 判断是否是HTTP POST 上传的文件
   `is_uploaded_file(temp_file_path)`
5. 将临时路径移动到永久路径 `move_uploaded_file(临时路径, 永久路
   径)`



## Best Practices##

### 获取文件扩展名 ###

#### Forget **`PATHINFO`**, safer is: **`PARSE_URL`** ####

for example, url is **`http://example.com/myfolder/sympony.mp3?a=1&b=2`**

    
#### [PATHINFO][2] gives: ####

    $x = pathinfo($url);
    $x['dirname']   => 'http://example.com/myfolder'
    $x['basename']  => 'sympony.mp3?a=1&b=2'         // <------- BAD !!
    $x['extension'] => 'mp3?a=1&b=2'                 // <------- BAD !!
    $x['filename']  => 'sympony'

<br/>

#### [PARSE_URL][1] gives: ####

    $x = parse_url($url);
    $x['scheme']  => 'http'
    $x['host']    => 'example.com'
    $x['path']    => '/myfolder/sympony.mp3'
    $x['query']   => 'aa=1&bb=2'
    $x['fragment']=> 'gggg'             //<----- here could be #hashtag, if manually provided link (However, hashtags are not detectable itself by REQUEST_URI)


#### **Addition**: ####

    dirname(parse_url($url)['path'])                      ----> /myfolder
    basename(parse_url($url))                             ----> sympony.mp3
    pathinfo(parse_url($url)['path'], PATHINFO_EXTENSION) ----> mp3

p.s. note, Hashtag part of url (i.e. `#smth`) not available in
PHP request, but only with javascript.
[1]: http://php.net/manual/en/function.parse-url.php#refsect1-function.parse-url-examples
[2]: http://php.net/manual/en/function.pathinfo.php#example-2610


### 从 dict key 直接生成变量 ###

``` php
// // 可变变量
// $itcast = 'fs';
// $fs="111";
// echo $$itcast;
// 根据 dict key 直接生成更多个变量
foreach ($_POST as $key => $value) {
    $$key = $value;
}
var_dump($title, $author);
```

### 随机数 ###

- `mt_rand` 效率是 `rand` 4倍



































