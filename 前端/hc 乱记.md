# html宝典


## 元素

  

HTML5 有些元素能够指明不同的内容区域。 这些元素能让你的 HTML 易于阅读，并有助于搜索引擎优化（SEO）和无障碍访问。


### 表单相关



使用例：

```html
<form action="https://freecatphotoapp.com/submit-cat-photo">
	<fieldset>
		<legend>Is your cat an indoor or outdoor cat?</legend>
		
		<!-- 通过有相同的name属性使这些选项为“一组”选项 -->
		<!-- label将input元素与相应的文本关联起来 -->
		<!-- 这里用label直接将它们包裹起来叫 隐式关联 -->
		<!-- 还有一种 显式关联，就是用label只包住相应的文本，设置其for属性使之与有某个id属性的input相关 -->
		
		<label><input id="indoor" type="radio" name="indoor-outdoor" value="indoor" checked> Indoor</label>
		<label><input id="outdoor" type="radio" name="indoor-outdoor" value="outdoor"> Outdoor</label>
	</fieldset>
	
	<fieldset>
		<legend>What's your cat's personality?</legend>
		<input id="loving" type="checkbox" name="personality" value="loving" checked> <label
		for="loving">Loving</label>
		<input id="lazy" type="checkbox" name="personality" value="lazy"> <label for="lazy">Lazy</label>
		<input id="energetic" type="checkbox" name="personality" value="energetic"> <label
		for="energetic">Energetic</label>
	</fieldset>
	
	<input type="text" name="catphotourl" placeholder="cat photo URL" required>
	
	<button type="submit">Submit</button>
</form>
```

```html
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Registration Form</title>
		<link rel="stylesheet" href="stylef.css" />
	</head>
	<body>
		<h1>Registration Form</h1>
		
		<p>Please fill out this form with the required information</p>
		
		<form method="post" action='https://register-demo.freecodecamp.org'>
			<fieldset>
				<label for="first-name">Enter Your First Name: <input id="first-name" name="first-name" type="text" required /></label>
				<label for="last-name">Enter Your Last Name: <input id="last-name" name="last-name" type="text" required /></label>
				<label for="email">Enter Your Email: <input id="email" name="email" type="email" required /></label>
				<label for="new-password">Create a New Password: <input id="new-password" name="new-password" type="password" pattern="[a-z0-5]{8,}" required /></label>
			</fieldset>

			<fieldset>
				<label for="personal-account"><input id="personal-account" type="radio" name="account-type" class="inline" /> Personal Account</label>
				<label for="business-account"><input id="business-account" type="radio" name="account-type" class="inline" /> Business Account</label>
				<label for="terms-and-conditions">
					<input id="terms-and-conditions" type="checkbox" required name="terms-and-conditions" class="inline" /> I accept the <a href="https://www.freecodecamp.org/news/terms-of-service/">terms and conditions</a>
				</label>
			</fieldset>
			
			<fieldset>
				<label for="profile-picture">Upload a profile picture: <input id="profile-picture" type="file" name="file" /></label>
				<label for="age">Input your age (years): <input id="age" type="number" name="age" min="13" max="120" /></label>
				<label for="referrer">How did you hear about us?
					<select id="referrer" name="referrer">
						<option value="">(select one)</option>
						<option value="1">freeCodeCamp News</option>
						<option value="2">freeCodeCamp YouTube Channel</option>
						<option value="3">freeCodeCamp Forum</option>
						<option value="4">Other</option>
					</select>
				</label>
				<label for="bio">Provide a bio:
					<textarea id="bio" name="bio" rows="3" cols="30" placeholder="I like coding on the beach..."></textarea>
				</label>
			</fieldset>
			
			<input type="submit" value="Submit" />
		</form>
	</body>
</html>
```

### 图片

### 表格


 

## 全局属性

  

<table>
	<tr>
		<th>属性</th>
		<th>取值&说明</th>
	</tr>
	<tr>
		<td>id</td>
		<td>用于标识特定的 HTML 元素。 每个 id 属性的值必须不同于整个页面的所有其他 id 值</td>
	</tr>
	<tr>
		<td>name</td>
		<td></td>
	</tr>
	<tr>
		<td>value</td>
		<td></td>
	</tr>
	<tr>
		<td>class</td>
		<td></td>
	</tr>
	<tr>
		<td>hidden</td>
		<td></td>
	</tr>
</table>

  

# CSS宝典

## 盒子模型

## 字体


你可以更改文本的 `font-family`，使其看起来与浏览器的默认字体不同。 每个浏览器都有一些可用的常用字体。

通过添加值为 `sans-serif` 的 `font-family` 属性来更改 body 中的所有文本。 这是一种相当常见的字体，易于阅读。

你可以通过添加另一个用逗号分隔的字体名称来为 font-family 添加一个后备值。 Fallback 是在初始值找不到/无法使用的情况下使用的。

## 元素尺寸

可对一些元素设置`width`, `height`


数值：

1. [n]px: 像素
2. [n]%: 相对父元素内容的比例

添加一个 max-width 的属性以防止它变得太宽。


注意沿线边缘的灰色。 这些边缘叫作 borders。 元素的每一面都可以有不同的颜色，或者它们都可以相同。


注意到线条如何更粗了吗？ 对于 hr 元素的所有边缘，名为 border-width 的属性的默认值为 1px。 通过将边框改为与背景相同的颜色，线条的总高度为 5px（3px 加上上下边框宽度 1px）。


当简写 margin 属性有两个值时，它将 margin-top 和 margin-bottom 设置为第一个值，并将 margin-left 和 margin-right 设置为第二个值。

## 选择器

### 基本

元素选择器

```css
element {
	property: value;
}
```

类选择器（配合class属性）

```css
.class-name {
	styles
}
```

id选择器（配合id属性）

```css
#id {
	styles
}
```

### 复合

  

并集

```css
selector1, selector2 {
	property: value;
}
```

后代

```css
selector1 selector2 {
	property: value;
}
```

### 伪类选择器

  

a元素:

1. a:visited 被访问过
2. a:hover 悬停在链接上
3. a:active 按下鼠标的一瞬间
4. a:link 未被访问时

## 轮廓与阴影

## 行内与块级


display属性：

1. inline-block
2. block

## 颜色

目前，有两种主要的颜色模型：用于电子设备的 叠加 RGB（红、绿、蓝）模型，以及用于打印的 消减 CMYK（青色、品红色、黄色，黑色）模型。

函数是一个可以输入并执行特定动作的代码。 CSS 的 rgb 函数接收红色、绿色和蓝色的数值或 arguments（参数），并生成一个颜色。

```css
rgb(red, green, blue);
```

每个红色、绿色和蓝色值都是一个从 0 到 255 的数字。 0 表示该颜色的 0%，并且是黑色。 255 意味着该颜色的 100%。

### 间色

  

间色: 组合主色得到的颜色。

  

黄色: 纯红色 + 纯绿色

青色: 纯绿色 + 纯蓝色

品红色: 纯蓝色 + 纯红色

  

### 复色

  

复色: 组合一种原色和一种邻近的间色

  

<font style="color: rgb(255, 127, 0);">橙色</font>: 纯红色 + 绿色 127
玫瑰色: 纯红色 + 蓝色 127

亮绿色: 蓝色 127 + 纯绿色
黄绿色: 红色 127 + 纯绿色

蓝紫色: 红色 127 + 纯蓝色
天蓝色: 绿色 127 + 纯蓝色

### 理论

色轮是一个圆圈，其中相似的颜色或色调彼此靠近，而不同的颜色相距较远。 例如，纯红色介于玫瑰色和橙色之间。

色轮上相互对立的两种颜色称为**补色**。 如果将两种互补色组合在一起，它们会产生灰色。 但当它们并排放置时，这些颜色会产生强烈的视觉对比，显得更亮。

注意红色和品红色是邻近的颜色，非常明亮。 如果在网站上使用不当，这样的颜色对比会使人分心，比如将文字背景色和文字颜色设置为互补色，这样文字会很难看清。

选择一种颜色作为主要颜色， 并使用其补充颜色作为强调来提醒访问者注意页面上的某些内容，是一种更好的方式。



# 个人web前端学习笔记

标签（空格分隔）： html css javascript 菜死了

---

[TOC]

# html

# (0) 基本概念

从今天起我们就要学习html了！！

## 元素

### 块级元素和内联元素

在 HTML 中有两种你需要知道的重要元素类别，块级元素和内联元素。

- 块级元素在页面中以块的形式展现。 **一个块级元素出现在它前面的内容之后的新行上。任何跟在块级元素后面的内容也会出现在新的行上。** 块级元素通常是页面上的结构元素。例如，一个块级元素可能代表标题、段落、列表、导航菜单或页脚。一个块级元素不会嵌套在一个内联元素里面，但它可能嵌套在另一个块级元素里面。
- 内联元素通常出现在块级元素中并环绕文档内容的一小部分，而不是一整个段落或者一组内容。 **内联元素不会导致文本换行。** 它通常与文本一起使用

常见的：

    块级元素：

    <p>

    内联元素：

    <em>
    <input>


### 引号……？

#### 省略

如果你看了很多其他网站的代码，你可能会遇到一些奇怪的标记风格，包括没有引号的属性值。在某些情况下它是被允许的，但是其他情况下会破坏你的标记。 **我们建议始终添加引号——这样可以避免很多问题，并且使代码更易读。** 

# (1) hello world!!

```
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8" />
    <title>my first site</title>
  </head>
  <body>
    <h1>hello world!!</h1>
  </body>
</html>
```


# 随便记

## html基础

在添加任何新内容之前，你应该使用 section 元素将猫咪照片内容与未来的内容分开。



figure 元素代表独立的内容，并允许你将图像与标题相关联。

图像标题（figcaption）元素用于添加标题以描述 figure 元素中包含的图像。 例如，`<figcaption>A cute cat</figcaption>` 添加标题 A cute cat。

为了通过 action 属性中指定的位置访问表单的数据，你必须给文本字段一个 name 属性，并为其分配一个值来表示数据正在提交。 例如，你可以对电子邮件地址文本字段使用以下语法：`<input type="text" name="email">`。

占位符文本用于提示人们在输入框中输入什么样的信息。 例如，`<input type="text" placeholder="Email address">`。



如果你选择 Indoor 单选按钮并提交表单，则该按钮的表单数据基于其 name 和 value 属性。 由于你的单选按钮没有 value 属性，因此表单数据将包含 indoor-outdoor=on，这在你有多个按钮时没有用处。



## css基础

div 元素主要用于设计布局，这与你迄今为止使用的其他内容元素不同。

现在的目标是使这个 div 不占用整个页面的宽度。 CSS 的 width 属性在这方面是完美的。 在样式表中创建一个新的类型选择器，使你的 div 元素的宽度为 300px。

CSS 中的注释看起来像这样：

/* comment here */

接下来，你要在水平方向上将 div 居中。 你可以通过把它的 margin-left 和 margin-right 属性设置为 auto 来做到这一点。 可以把页边距看作是元素周围不可见的空间。 使用这两个 margin 属性，将 div 元素置于 body 元素的中心。

p 元素嵌套在具有 item 类属性的 article 元素中。 你可以使用名为 item 的 class 为嵌套在元素中任何位置的所有 p 元素设置样式，如下所示：

.item p { }

## yanse

使用 CSS 将颜色应用于元素的一种非常常见的方法是使用十六进制或 hex 值。 虽然十六进制值听起来很复杂，但它们实际上只是 RGB 值的另一种形式。

十六进制颜色值以 # 字符开头，从 0-9 和 A-F 取六个字符。 第一对字符代表红色，第二对代表绿色，第三对代表蓝色。 例如，#4B5320。

在 .green 类选择器中，将 background-color 属性设置为十六进制颜色代码，其值 00 表示红色，FF 表示绿色，00 表示蓝色。

HSL 颜色模型或色调、饱和度和亮度是表示颜色的另一种方式。

CSS hsl 函数接受 3 个值：0 到 360 的数字表示色调，0 到 100 的百分比表示饱和度，0 到 100 的百分比表示亮度。

如果你想象一个色轮，色调红色是 0 度，绿色是 120 度，蓝色是 240 度。

饱和度指纯色的颜色强度从 0% 或灰色到 100%。 你必须给饱和度和亮度值添加百分比标志 %。

亮度是颜色出现的亮度，从 0% 或全黑到 100% 或全白，其中 50% 为中性。

渐变是一种颜色过渡到另一种颜色。 CSS linear-gradient 函数可让你控制沿线的过渡方向以及使用的颜色。

要记住的一件事是 linear-gradient 函数实际上创建了一个 image 元素，并且通常与可以接受图像作为一个值的 background 属性配对。

在 .red CSS 规则中，将 background-color 属性更改为 background。

linear-gradient 函数非常灵活——这是你将在本教程中使用的基本语法：

linear-gradient(gradientDirection, color1, color2, ...);

gradientDirection 是表明过渡的线的方向。 color1 和 color2 是颜色参数，它们是将在过渡本身中使用的颜色。 这些可以是任何类型的颜色，包括颜色关键字、十六进制、rgb 或 hsl。

现在，你将沿 90 度线将红到绿渐变应用到第一支笔。

首先，在 .red CSS 规则中，将 background 属性设置为 linear-gradient()，并将它的值设置为 90deg，作为 gradientDirection。

颜色中间点（color-stop）允许你微调颜色沿渐变线的位置。 它们是像 px 这样的长度单位，或者是在 linear-gradient 函数中定位颜色的百分比。

例如，在这个红-黑渐变中，从红色到黑色的过渡发生在渐变线的 90% 处，因此红色占据了大部分可用空间：

linear-gradient(90deg, red 90%, black);

在 linear-gradient 函数中，在第一个红色参数之后添加 75% 颜色中间点。 不要将颜色中间点添加到其他颜色参数。

如果没有为 linear-gradient 函数提供 gradientDirection 参数，则默认情况下，它会从上到下或沿 180 度线排列颜色。

通过从两个 linear-gradient 函数中删除 gradientDirection 参数来进一步清理你的代码。

透明度描述事物的不透明性或不透明性。 例如，一堵实心墙是不透明的，没有光线可以通过。 但是水杯要透明得多，你可以透过玻璃看到另一边。

使用 CSS opacity 属性，你可以控制元素的不透明或透明程度。 使用值 0 或 0%，元素将完全透明，而在 1.0 或 100% 时，元素将像默认情况下一样完全不透明。

另一种设置元素不透明度的方法是使用 alpha 通道。 与 opacity 属性类似，alpha 通道控制颜色的透明或不透明程度。

你已经用命名的颜色和 opacity 属性设置了笔筒的不透明度，但你可以给其他 CSS 颜色属性添加一个 alpha 通道。

你已经熟悉使用 rgb 函数来设置颜色。 要将 alpha 通道添加到 rgb 颜色，请改用 rgba 函数。

rgba 函数的工作方式与 rgb 函数类似，但在 0 到 1.0 之间多取一个数字作为 alpha 通道：

rgba(redValue, greenValue, blueValue, alphaValue);

在上一个项目中，你了解了一些关于边框和 border-color 属性的知识。

所有 HTML 元素都有边框，尽管它们通常默认设置为 none。 使用 CSS，你可以控制元素边框的所有方面，并在所有边上设置边框，或者一次只设置一侧。 要使边框可见，你需要设置其宽度和样式。

边框有多种样式可供选择。 你可以将边框设为实线，但如果你愿意，也可以使用虚线。 实线边框可能是最常见的。

border-left 简写属性允许你同时设置左边框的宽度、样式和颜色。

语法如下：

border-left: width style color;

你要做的最后一件事是为每支笔添加轻微的阴影，使它们看起来更加真实。

box-shadow 属性允许你在元素周围应用一个或多个阴影。 这是基本语法：

box-shadow: offsetX offsetY color;
下面是 offsetX 和 offsetY 值的作用：

offsetX 和 offsetY 都接受数字值，单位是 px 和其他 CSS 单位
正 offsetX 值将阴影向右移动，负值将它向左移动
正 offsetY 值将阴影向下移动，负值将它向上移动
如果你想要 offsetX 和 offsetY 其中一个值为零，或两个都为零（0），那么你不需要添加单位。 每种浏览器都知道零意味着没有变化。
阴影的高度和宽度由应用阴影的元素的高度和宽度决定。 你也可以使用可选的 spreadRadius 值来扩大阴影的范围。 之后会介绍更多。

请注意，阴影的边缘是尖锐的。 这是因为 box-shadow 属性有一个可选的 blurRadius 值：

box-shadow: offsetX offsetY blurRadius color;
如果不设置 blurRadius 的值，则默认为 0，并产生锐利的边缘。 blurRadius 的值越大，模糊效果就越大。

但是，如果你想把阴影进一步扩大呢？ 你可以使用可选的 spreadRadius 值来做到这一点：

box-shadow: offsetX offsetY blurRadius spreadRadius color;
与 blurRadius 一样，spreadRadius 的值如果没有设置，则默认为 0。

通过直接在蓝色笔周围添加 5px 阴影来练习。

## 表单
vh 单位代表视口高度（viewport height），相当于视口 height 高度的 1%。

现在，通过设置 body 的默认 margin 为 0 来重置一些浏览器的默认设置，从而去掉水平滚动条。

看起来好多了。 现在，把 body 的 background-color 设置为 #1b1b32，使背景更护眼。 然后相应的把 color 设置为 #f5f6f7，让文字显示出来。

method 属性指定了如何将表单数据发送到 action 属性中指定的 URL。 表单数据可以通过 GET 请求作为 URL 参数发送（method="get"）或通过 POST 请求作为请求正文中的数据发送（method="post"）。

设置 method 属性通过 POST 请求发送你的表单数据。

rem 单位代表根 em，与 html 元素的字体大小有关。

由于 label 元素默认是行内元素，它们出现在其标签文本的同一行，使得文本难以阅读。 给 label 元素添加 display: block，并设置其 margin 为 0.5rem 0，来使其显示在不同的行，并且行之间有一定的距离。

按照无障碍最佳实践，将 input 元素和 label 元素使用 for 属性联系起来。

使用 first-name、last-name、email 和 new-password作为相应的 id 属性的值。

指定表单元素的 type 属性对浏览器预期表单的数据类型至关重要。 如果未指定 type，浏览器会使用默认值 text。

给前两个 input 元素设置其 type 属性值为 text，第三个 type 属性值为 email，第四个 type 属性值为 password。

email 类型只允许包含 @ 以及域名中包含 . 的电子邮件。 password 类型会屏蔽输入，如果网站没有启用 HTTPS 会警告。

距离父级 form 元素最近的第一个 type 为 submit 的 input 元素会被当作提交按钮。

给密码 input 元素添加自定义验证，新增 minlength 属性设置其值为 8。 这样密码少于 8 个字符的时候会阻止提交。

在 type="password" 内可以使用 pattern 属性来使用正则表达式来校验密码。

给密码 input 元素添加 pattern 属性，要求输入匹配 [a-z0-5]{8,}。

上面是一个正则表达式，匹配 8 个以上的小写字母或数字 0 到 5。

由于我们不希望 13 岁以下的用户注册，给 input 添加一个 min 属性并设置其值为 13。 此外，我们假设年龄超过 120 岁的用户不会来注册，添加一个 max 属性，并设置其值为 120。

现在，如果提交的表单里面的年龄超过了这个范围，会出现一个警告，并阻止提交。 试一下吧。

使用 select 元素给表单添加一个下拉列表很方便。 select 元素是包含一组 option 元素的容器，option 元素就是下拉列表的内容。 每一个元素都需要一个结束标签。

首先，在两个 label 元素下面添加一个 select 元素。 然后，在 select 元素内添加 5 个 option 元素。

提交带有选择菜单的表单向服务端发送的信息 value 并不是预期的。 因此，每一个 option 需要指定一个 value 属性。 如果没有指定，向服务器默认提交的是 option 内的文本。

给第一个 option 指定 value ""，同级的 option 元素的 value 属性依次指定 1 到 4。

textarea 元素和 text 类型的 input 类似，区别是 textarea 有一些额外的好处，比如可以方便地添加更多的文本以及设置默认显示的行数和列宽。

用户将能够注册个人简历。 在 fieldset 的末尾添加带有 Provide a bio: 文本的 label。 在 label 元素内添加一个 textarea 元素。 请注意，textarea 需要一个结束标签。

textarea 看起来有点小。 添加 rows 和 cols 属性，来指定它的初始大小。

如果仔细观察，会发现 .inline 元素在同行里过于高了。

设置其 vertical-align 属性为 middle 来修复这一点。

要设置提交按钮的样式，你可以使用_属性_选择器，它根据给定的属性值选择元素。 下面是一个例子：

input[name="password"]
上面选择了 name 属性值为 password 的 input 元素。

## hezi

在 CSS 盒子模型中，每个 HTML 元素都被视为一个有四个区域的盒子。

想象一下，你从最喜欢的在线零售商那里收到一个盒子——内容是盒子里的物品，或者在我们的例子中，是标题、段落或图像元素。

内容被称为填充的空间包围，类似于气泡包装将项目与其周围的盒子分开的方式。

将边框想象成运送物品的纸板箱。

即使你的 `<div>` 没有文本，它仍然被视为包含内容的框。 编写一个使用 `.canvas` 类选择器的 CSS 规则，并将其 `width` 设置为 500 像素。 这是一个 CSS 规则，将类 `card` 的宽度设置为 300 像素：

```css
.card {
  width: 300px;
}
```


```css
.frame {
	border: 50px solid black;
}
```

现在 `.one` 水平居中，但它的上边距推过画布并进入框架的边框，将整个画布向下移动 20 像素。

将 `1px` 的 `padding` 添加到 `.canvas` 元素中，以使 `.one` 元素具有坚实的可推力。

在调整元素大小时，不必总是使用像素。

创建一个新规则 `.three`，并将其 `width` 设置为 `91%`。

在 `.two` 选择器中，使用 `margin` 简写属性将上边距设置为 `0`，水平边距设置为 `auto`，和 `20px` 的下边距。 这将删除其上边距，将其水平居中，并将其下边距设置为 20 像素。

```css
p {
  filter: blur(3px);
}
```

矩形太小，它们的边缘没有绘画的柔和品质。

通过将 `box-shadow` 设置为 `0 0 3px 3px #efb762` 来增加区域并柔化 `.one` 的边缘。

使用 `.two` 选择器的 `border-radius` 属性，将其左上角和右下角半径设置为 `8px`，然后将右上角和左下角半径设置为 `10px`。

`border-radius` 属性最多接受四个值来使左上角、右上角、右下角和左下角变为圆角。

将 `.three` 的左上角圆角设为 30 像素，右上角圆角设为 25 像素，右下角圆角设为 60 像素，左下角圆角设为 12 像素。