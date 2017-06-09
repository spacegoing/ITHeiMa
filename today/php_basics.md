# PHP #

## 问题 ##

### 未解决 ###

- `数组格式 []` php 专用？
- `die;`?
- unique key?
- 如何在一个form中多个 `evtype`?
- `extension_dir`
- `mysqli([])` 没有错误信息? 何时有错误信息？
- 如何选择重复标签
- templating engine
- 16\17 非法的参数
- 多个 `header()` 多个 文件 发送多次?

### 已解决 ###

- `8M`: 上传文件不可超过 `php.ini`定义的 `post_max_size = 8M` 否
  则php `$_FILES` 得到的为空 `array()` 没有错误信息
- `require_once` 会执行导入文件中所有代码，污染当前命名空间
- `-> > .` php 不报错: `php.ini` 中 `display_error=On`

## Keng ##

### 文件上传 ###

#### HTML form 设计 ####

- `<form action="./test.php" method="POST"
  enctype="multipart/form-data">`
- `<input type="file" name="up_file">`


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


### 类型转换 ###

- `0 0.0 ‘0’ null ‘’ array()` 会被转化为 `FALSE`，其余都是`True`

  ``` php
      $mime_info = finfo_open(FILEINFO_MIME_TYPE);
      var_dump($mime_info);
      var_dump('1'.TRUE);
  ```
- 可以组合 `is_*()` 判断函数进行类型判断


#### 检查字符串是否为整数 ####

##### 用正则表达式最靠谱 #####

##### 只能用于 string, 用于 int 则判断为 false #####
How about using [`ctype_digit`](http://php.net/ctype_digit)?

From the manual:

    <?php
    $strings = array('1820.20', '10002', 'wsl!12');
    foreach ($strings as $testcase) {
        if (ctype_digit($testcase)) {
            echo "The string $testcase consists of all digits.\n";
        } else {
            echo "The string $testcase does not consist of all digits.\n";
        }
    }
    ?>

The above example will output:

<pre>
The string 1820.20 does not consist of all digits.
The string 10002 consists of all digits.
The string wsl!12 does not consist of all digits.
</pre>

This will only work if your input is always a string:

    $numeric_string = '42';
    $integer        = 42;
    
    ctype_digit($numeric_string);  // true
    ctype_digit($integer);         // false

If your input might be of type `int`, then combine `ctype_digit` with [`is_int`](http://php.net/manual/en/function.is-int.php).

If you care about negative numbers, then you'll need to check the input for a preceding `-`, and if so, call `ctype_digit` on a [`substr`](http://php.net/substr) of the input string. Something like this would do it:

    function my_is_int($input) {
      if ($input[0] == '-') {
        return ctype_digit(substr($input, 1));
      }
      return ctype_digit($input);
    }


##### 当输入为 int / float 但小数位0 时，仍输出整数部分 #####

[`filter_var`][1] should do it:

    var_dump(filter_var('2', FILTER_VALIDATE_INT));   // 2
    var_dump(filter_var('2.0', FILTER_VALIDATE_INT)); // false
    var_dump(filter_var('2.1', FILTER_VALIDATE_INT)); // false

but

    // !!! Exception !!!
    var_dump(filter_var(2, FILTER_VALIDATE_INT));     // 2
    // !!! Exception !!!
    var_dump(filter_var(2.0, FILTER_VALIDATE_INT));   // 2
    var_dump(filter_var(2.1, FILTER_VALIDATE_INT));   // false

If you just want Booleans as return values, wrap it into a function, e.g.

    function validatesAsInt($number)
    {
        $number = filter_var($number, FILTER_VALIDATE_INT);
        return ($number !== FALSE);
    }

  [1]: http://de.php.net/manual/en/ref.filter.php




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






## is * ? ##

### isset v.s. empty ###

- `isset` 判断是否设置
- `empty` 判断是否为空
























