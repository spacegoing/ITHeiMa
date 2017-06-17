# HTML JS #


## Best Practices ##

### 避免缓存问题 ###

#### <img> ####

为了避免浏览器缓存不刷新图片（如验证码），可以给url后面加一段随机
数，让浏览器以为每次请求的地址不一样，从而强制刷新

- `<img ... onclick='this.src="./someurl?aaa=Math.random()"'>`


