# CSS Basics #

## CSS Basic Properties ##

### Font ###

#### Font Weight ####

`font-weight`（字体的粗细）
 -  可以设置具体的数值
    - 是整百的数100-900
 -  还可以设置一些关键字
    - bold:加粗
    - normal:正常 

有时改变 `font-weight` 字体不变。因为用的`Font Family` 可能设置了
几个档次，例如 `100-300` 为 `细`，`400-600` 为 `中`等，则
`100-300`中任意值粗细一样。

#### Font Family ####

- `value` 可以是中文，但是是中文时，一定要用 `""` wrap

## Labels ##

- `<img>` 如果文字与图片在一行，则 图片 底线 与 文字 基线 对齐









## Selectors ##

- `id与类名命名的规则`: 命名的取值范围只能是：`0-9,a-z,A-Z,_,-`并且不能以数字开头
- `交集选择器`: 选择器的名称组成中如果有标签名那么标签必须写在最前面




## 居中 ##

### 水平居中 ###

#### 容器居中 ####

- `margin: [float]px auto;` 

#### 内容居中 ####

- `text-align: center;`

### 垂直居中 ###

#### 内容居中 ####

- `line-height= element height` 让行高=元素高度




## 继承 ##

作用：子元素可以继承父元素的样式。

### 什么样的属性才可以继承 ###

`color, text-, font-, line-`开头的属性都是可以继承的

### 具体应用 ###

在写页面之前我们会通过给body设置一个字体，来将页面上所有的标签都
能够继承这个属性。

### 特殊性 ###

1. `a`标签不能继承颜色，如果一定要修改a标签的颜色直接作用在a标签上面。
2. `h`标签不能继承大小，如果一定要修改h标签的大小直接作用在h标签上面。
3. `<div>` 高度由内容决定，默认为0；宽度默认占一整行。


### 特殊情况 按属性分类 ###

#### line-height 与 font-size ####

- `line-height` 默认等于 `font-size`
- 如果先设置`line-height`，再用`font: ;` 设置，`font`的**默认值**
  会覆盖`line-height`




#### div 嵌套下 行高的继承 ####

1. 在设置行高的时候，如果父元素单位是`em`或者`%`，那么将来行高会
   先计算父元素结果以后再继承给子元素。`.father[line-height:2em]`
   `son` 的 `line-height=40px`。但如果 `.son` 制定了
   `line-height`，则使用`.son`的。

2. 在设置行高的时候，如果单位是没有，那么将来父元素行高会先继承给
   子元素，然后再结合子元素 `font-size` 计算子元素行
   高。`.father[line-height:2]` `son` 的 `line-height=30px`











## 优先级 ##

`！important>行内样式>id选择器>类选择器>标签选择器>通配符>继承`

同一层级，CSS中后面声明的覆盖前面的。

- 当优先级相同、specificity相同时，后声明的覆盖先声明的。

### !important ###

`!important` 优先级最高。`!important`属性无法`继承`，只能用于修改
`层叠`的`优先级`。

### specificity ###

作用：多个选择器组合以后的优先级。

算法：

MDN CSS Specificity:

The following list of selector types increases by specificity:

1. Type selectors (e.g., h1) and pseudo-elements (e.g., :before).
2. Class selectors (e.g., .example), attributes selectors (e.g.,
   [type="radio"]) and pseudo-classes (e.g., :hover).
3. ID selectors (e.g., #example).

Universal selector (*), combinators (+, >, ~, ' ') and negation
pseudo-class (:not()) have no effect on specificity. (The
selectors declared inside :not() do, however.)

（0，0，0，0）==》

第一个0对应的是important的个数，
第二个0对应的是id选择器的个数，
第三个0对应的类选择器的个数，
第四个0对应的是标签选择器的个数，就是当前选择器的权重。

比较：先从第一个0开始比较，如果第一个0大，那么说明这个选择器的权
重高，如果第一个相同，比较第二个，依次类推。

总结：权重是优先级的算法；优先级是层叠表现。

``` css
		div div { /*(0,0,0,2) */
			color: red;
		}
		div .son {/*(0,0,1,1) */
			color: blue;
		}
		.father div {/*(0,0,1,1) */
			color: yellow;
		}
		.father .son {/*(0,0,2,0) */
			color: green;
		}
		div #son {/*(0,1,0,1) */
			color: pink;
		}
		#father div {/*(0,1,0,1) */
			color: purple;
		}
		.father #son {/*(0,1,1,0) */
			color: gray;
		}
```


1. 判断当前属性是否是`继承`，如果是`继承`，则不计入权重比较范围
2. 比较权重

### 问题 ###

#### Calculating grouping (comma separated) selectors' specificity ####

http://stackoverflow.com/questions/43953235/calculating-specificity-of-multiple-selectors-on-one-rule/43953329?noredirect=1#comment74938050_43953329

`,` separated selectors are **equivalent to** a list of single
selectors. So the specificity of comma separated selectors are
calculated separately.


### １.3 选择器工作的一个原理： ###

选择器在查找元素的时候不是从左往右找，而是从右往左找。





## Element 用法 ##

### Table ###

- `border-collapse:collapse` 去掉单元格之间的间隙



## 问题 ##

### <span> 到底继承不继承 ###




















