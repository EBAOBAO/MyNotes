# 我的web前端笔记

# Hello World!

**`html`** 是用来描述网页的一种语言（Hyper Text Markup Language，超文本标记语言）

html 的历史：[时间轴](https://ilovefishc.com/html5/html5/lesson1/timeline/web/index.html)

```html
<!DOCTYPE html>
<!-- 声明按照html5的语法去解析 -->
<html>
	<head>
		<title>第一个程序</title>
	</head>
	<body>
		<h1>hello world!</h1>
	</body>
</html>
```

## 说明

`<html>` 像这样的我们称之为 **元素**

元素有 **开始标签(Opening tag)** 、 **内容(Content)** 与 **结束标签(Closing tag)** 三个主要部分：

```
<em> hello world </em>
```

使用标签 `<em>` 和 `</em>` 来包裹它。在前面放置 `<em>` 以打开元素，在后面放置 `</em>` 以关闭元素。

也可以把元素放到其它元素之中——这被称作 *嵌套*

这里我们有：

1. `<!DOCTYPE html>`: 声明文档类型。早期的 HTML（大约 1991-1992 年）文档类型声明类似于链接，规定了 HTML 页面必须遵从的良好规则，能自动检测错误和其他有用的东西。

2. `<html></html>`: `<html>` 元素。这个元素包裹了页面中所有的内容，有时被称为根元素

3. `<head></head>`: `<head>` 元素。这个元素是一个容器，它包含了所有你想包含在 HTML 页面中但不在 HTML 页面中显示的内容。这些内容包括你想在搜索结果中出现的 *关键字和页面描述、CSS 样式、字符集声明* 等等

4. `<title></title>`:` <title>` 元素。这设置了页面的标题

5. `<body></body>`: `<body>` 元素。包含了你访问页面时所有显示在页面上的内容，包含文本、图片、视频、游戏、可播放音频轨道等等。

6. 你可以说：**head标签是html标签的子标签（子节点）** 。

元素会有 **属性** ，属性包含元素的额外信息，这些信息不会出现在实际的内容中。

属性必须包含：

- 一个空格，它在属性和元素名称之间。如果一个元素具有多个属性，则每个属性之间必须由空格分隔。
- 属性名称，后面跟着一个等于号。
- 一个属性值，由一对引号（""）引起来。


有时你会看到没有值的属性，这也是完全可以接受的。这些属性被称为 **布尔属性** 。布尔属性只能有一个值，这个值一般与属性名称相同。

例：

```html
<input type="text" disabled="disabled">

<!-- 使用 disabled 属性来防止终端用户输入文本到输入框中 -->
```

方便起见，我们完全可以将其写成以下形式：

```html
<input type="text" disabled>
```

## 注释

html: `<!-- 呼呼！ -->`
CSS: `/* 呼呼！ */`
JavaScript:

```js
// 单行
/* 
	多行
*/
```

> 课堂案例：[（HTML5&CSS3）配套学习资源](https://ilovefishc.com/html5/)


## 浏览器兼容

[Can I use... Support tables for HTML5, CSS3, etc](https://caniuse.com/)

### w3c万维网联盟

[W3C](https://www.w3.org/)

他们提供的 **web标准** 使得网页在不同浏览器中显示出来的效果是一个样。

### web的组成部分

结构：html
表现：css
行为：js

## VS code 使用

### 插件

- auto rename tag
- view-in-browser
- live server

# 基础元素们

`<html>`属性 `lang`:

- en：英语
- zh-CN：中文

`<h1>` ~ `<h6>`：块级元素，标题

*当你向页面添加较低级别的标题元素时，这意味着你正在开始一个新的小节。*

`<p>`：块级元素，段落

`<hr />`：水平线

## img

`<img />` 标签有两个必需的属性：src 属性 和 alt 属性。

<table>
	<tr><th>属性</th><th>值</th></tr>
	<tr><td>src</td><td>URL (图像的路径)</td></tr>
	<tr><td>alt</td><td>text (图片显示不出来时的替代文本)</td></tr>
	<tr><td>width</td><td>px、% (宽度，像素或百分比)</td></tr>
	<tr><td>height</td><td>px、% (高度，像素或百分比)</td></tr>
</table>

`<img />`是html中少数没有结束标签的标签，事实上它也并没有内容，像这样的标签我们称其为 **空标签**。

我将空标签记录于此：

### 空标签，集合！

```html
<img />
<input />
<meta />
<link />
<base />
<br />
<hr />
<col />
```

## a : 超链接

<table>
    <tr><th>属性</th><th>功能</th><th>取值</th></tr>
	<tr><td>href</td><td>声明超链接的 web 地址</td><td>URL</td></tr>
    <tr>
	    <td>title</td>
	    <td>超链接声明额外的信息，当鼠标悬停在超链接上面时，这部分信息将以工具提示的形式显示</td>
        <td>text</td>
    </tr>
    <tr>
        <td rowspan="5">target</td>
        <td rowspan="5">用于指定链接如何呈现出来</td>
        <td>_blank：在新标签页中打开</td>
    </tr>
    <tr><td>_parent：在当前的父窗口中打开，如果不存在父窗口，此选项的行为方式与 _self 等同</td></tr>
    <tr><td>_self：当前窗口打开（默认）</td></tr>
    <tr><td>_top：在整个窗口中打开</td></tr>
    <tr><td>framename：在指定的框架中打开</td></tr>
</table>

在早期的网页设计中，框架（frames）被用来将浏览器窗口分割成多个部分，每个部分可以独立地显示不同的HTML文档。例如，一个网页可能由顶部的导航栏框架、左侧的菜单框架和右侧的内容框架组成。当在一个框架中的页面包含一个`<a>`标签，并且这个标签的`target`属性被设置为`_parent`时，意味着点击这个链接后，链接所指向的资源（如另一个HTML页面）将在当前框架的父框架中打开。例如，假设有一个网页使用了两层框架结构。外层框架包含两个内层框架：框架A和框架B。在框架A中的一个页面里有一个`<a href="example.html" target="_parent">Example</a>`链接。当用户点击这个链接时，`example.html`页面将会在框架A的父框架（也就是外层框架）中加载，从而替换掉外层框架当前显示的所有内容（包括框架A和框架B中原有的页面）。这种设置在一些需要从子框架导航到一个全新的页面布局时非常有用。比如在一个复杂的在线教程网站中，左侧框架（子框架）列出各个课程章节的链接。当用户点击某个章节链接，并且这个链接的`target`属性是`_parent`，那么整个浏览器窗口（父框架）的内容都会被替换成该章节的详细内容页面，为用户提供了一个全新的、专注于该章节内容的浏览环境。


## meta

`<meta />` 标签用于描述页面内容，关键词，作者，最新修订时间以及其它元信息。

它是个相当有用的标签！其功能有：

- 解决编码问题
- 实现网页尺寸自适应
- 实现页面自动跳转
- 指定样式表

等等

```html
<!-- 解决编码问题 -->
<meta charset="UTF-8">

<!-- 网页尺寸自适应 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="EBAOBAO">
    <meta name="keywords" content="笔记,web前端,菜">
    <meta name="description" content="">
    <title>mmeettaa</title>
</head>
<body>
    <h1>没有内容捏~</h1>
</body>
</html>
```

更多：[meta](https://man.ilovefishc.com/pageHTML5/meta.html)

## 列表元素

`<ul>`：无序列表
`<ol>`：有序列表
`<li>`：列表项

```html
<ul>
	<li>coffee</li>
	<li>tea</li>
	<li>me
		<ul>
			<li>humou</li>
			<!-- 对的列表还能嵌套 -->
		</ul>
	</li>
</ul>
```

`<ol>`的属性

| 属性 | 值 | 描述 |
|--|--|--|
| reversed | reversed | 改为降序 |
| start | [num] | 起始值 |
| type | 1/A/a/I/i | 标记类型 |

相关css属性：`list-style-type`（square、disc、circle、none）、`list-style-image`（url("路径")）

`<dl>`：定义列表
`<dt>`：列表项
`<dd>`：描述

## 表格元素

`<table>`：表格
`<tr>`：行
`<th>`：表头单元
`<tr>`：数据单元
`<caption>`：标题

```html
<table>
    <caption>常用字符实体</caption>
    <tr>
        <th>原义字符</th>
        <th>字符实体</th>
    </tr>
    <tr>
        <td><</td>
        <td>&amp;lt;</td>
    </tr>
    <tr>
        <td>></td>
        <td>&amp;gt;</td>
    </tr>
    <tr>
        <td>"</td>
        <td>&amp;quot;</td>
    </tr>
    <tr>
        <td>'</td>
        <td>&amp;apos;</td>
    </tr>
    <tr>
        <td>&</td>
        <td>&amp;amp;</td>
    </tr>
</table>
```

`<table>`相关css属性：

- `border`：边框
- `border-collapse`：（在table里）合并边框，取值collapse或separate。

### 更加细致的规划！

使用`<thead>`、`<tbody>`、`<tfoot>`！

另外，`<th>`与`<td>`内部有`colspan`与`rowspan`属性来规划布局

还有`<colgroup>`与`<col />`元素来为列添加样式提供便利

```html
<!-- 在table里加上类似这些东西： -->
<colgroup>
	<col style="background: gray" />
	<col span="2" style="background: red" />
</colgroup>
```

# 块级与行内

**块级元素** 总是在新的行上开始，并尽可能地占据本行全部可用的宽度。而相反的，**行内元素** 不会另起一行，只占用必要的宽度。

可用`<div>`将元素包裹起来使其获得块级元素的特性，用`<span>`将元素包裹起来使其获得行内元素的特性（常用于文本独立修饰）。

## 细节

一般情况下，行内元素只能包含数据和其他行内元素，而块级元素可以包含行内与其他块级元素。

这就意味着，块级元素可以有“更大”的结构。

html要求浏览器将连续的空白字符合并为一个空格，这使得 **html文档的布局与文档内容自身的布局给区分开来**，这也便是行内与块级的区别存在的意义。

# 所见即所得！

> html要求浏览器将连续的空白字符合并为一个空格……

但这样未免也有些太麻烦了吧？还好，有些元素恰恰反其道而行之：

## \<pre\>：预格式化文本

*预格式化* 即保留文本在源代码中的格式，使得页面中显示的与源代码中的效果完全一致。

`<pre>`元素尽可能保留文本在源代码中的格式，但并不能对诸如`<`、`>`之类的字符起作用。

html字符实体（character entities）
:	有些字符在html文档中是预留的，具有特殊含义（`<`、`>`之类的）。为了正确显示它们，就需要用字符实体。每个字符实体以符号 & 开始，以分号（;）结束。


<table>
    <caption>常用字符实体</caption>
    <tr>
        <th>原义字符</th>
        <th>字符实体</th>
    </tr>
    <tr>
        <td><</td>
        <td>&amp;lt;</td>
    </tr>
    <tr>
        <td>></td>
        <td>&amp;gt;</td>
    </tr>
    <tr>
        <td>"</td>
        <td>&amp;quot;</td>
    </tr>
    <tr>
        <td>'</td>
        <td>&amp;apos;</td>
    </tr>
    <tr>
        <td>&</td>
        <td>&amp;amp;</td>
    </tr>
</table>

更多：

[Html 的实体字符大全](https://www.cnblogs.com/linjinzhuang/p/4845770.html)

[HTML 符号实体参考手册](https://www.runoob.com/tags/html-symbols.html)

[HTML Standard (whatwg.org)官方文档](https://html.spec.whatwg.org/multipage/named-characters.html#named-character-references)

[HTML中& nbsp; & ensp; & emsp;& thinsp;& zwnj;‍& zwj;六种空格标记的区别 - 简书 (jianshu.com)](https://www.jianshu.com/p/f9896b9d0b33)

[HTML空格符号 nbsp; ensp; emsp; 介绍以及实现中文对齐的方法 - 风雨后见彩虹 - 博客园 (cnblogs.com)](https://www.cnblogs.com/moqiutao/p/6828263.html)

## 等宽字体

就是代码的那种字体，与此相对的叫 **比例字体**。

`<code>`元素用以专门显示源代码。如果有一大堆代码，建议用`<pre>`包住`<code>`

另外还有一些元素用以描述与代码相关的东西：

`<var>`：<var>程序的变量</var>
`<kbd>`：<kbd>用户输入</kbd>
`<samp>`：<samp>程序输出</samp>

## 语义化

> 使用正确的元素做正确的事！

我们会发现一些元素在浏览器上的显示效果是一样的，但*语义化*就要求你使用恰当语义的html元素，让页面具有良好的结构与含义，从而让人与机器都能快速理解网页内容。（比如上文提及的`strong`之类的）

应当追求语义与呈现的分离，就像html用以编写结构，然后用css来美化一样。

### 引用

`<q>`（行内）：<q>较短的引用</q>
`<blockquote>`：

> 大段的引用，有 <code>cite</code> 属性标明其来源

`<cite>`（行内）：<cite>作品的标题（为什么这里也是斜体）</cite>
`<abbr>`（行内）：<abbr title="结合全局属性title可指定该缩写代表的完整含义">简称/缩写</abbr>
`<dfn>`：<dfn>术语</dfn>
`<address>`：<address>文档或文案的作者/拥有者的联系信息</address>

### 文本修饰

`<b>`（行内）：**加粗**
`<strong>`（行内）：<strong>（语义化，推荐使用）表强调</strong>

`<i>`（行内）：*斜体*
`<em>`（行内）：*（语义化，推荐使用）表强调*

`<s>`（行内）：<s>（删除线）不正确的/不再正确的内容</s>
`<del>`：~~（删除线）删除掉的~~

`<u>`（行内）：<u>（下划线）拼写错误的单词/中文专有名词</u>
`<ins>`：<ins>（下划线）新插入的</ins>

```html
<p>
	今天起，<del>百度</del> 将正式更名为 <ins>急霸矛</ins>
</p>
```

文本<sup>`<sup>上标（行内）`</sup><sub>`<sub>下标（行内）`</sub>

`<ruby>`、`<rt>`、`<rp>`：<ruby>注音<rt>zhu yin</rt></ruby>
`<rt>`用以标记注音符号，`<rp>`是在浏览器不支持`<ruby>`时显示的内容。

使用例：

```html
<ruby>
  注 <rp>(</rp><rt>zhu</rt><rp>)</rp>
  音 <rp>(</rp><rt>yin</rt><rp>)</rp>
</ruby>
```

`<bdo>`：通过全局属性`dir`控制文本 从左往右（ltr）或 从右往左（rtl）覆盖默认的文本方向。

<bdo dir="ltr">这是从左往右显示的文本</bdo>
<bdo dir="rtl">这是从右往左显示的文本</bdo> 

`<mark>`：<mark>标记，像荧光笔一样将文本标记起来。</mark>

`<small>`（行内）：<small>变小</small>

`<big>`（行内）：<big>变大</big>


# 表单元素：与用户交互！

`<form>`：表单

属性：

- `action`：指定由谁来处理提交后的表单，取值路径。
- `method`：指定发送给服务器的http方法，取值 get/post。
- `target`：指定目标显示位置，取值 _blank、_self、_parent、_top、framename。
- `entype`：规定应如何对表单数据进行编码。


GET 和 POST 是两种最常用的 HTTP 方法。

## 什么是 HTTP ？

超文本传输协议（HTTP）的设计目的是保证客户端与服务器之间的通信。

HTTP 的工作方式是客户端与服务器之间的请求-应答协议。

web 浏览器可能是客户端，而计算机上的网络应用程序也可能作为服务器端。

举例：客户端（浏览器）向服务器提交 HTTP 请求；服务器向客户端返回响应。响应包含关于请求的状态信息以及可能被请求的内容。

-   **GET** - 从指定的资源请求数据。
-   **POST** - 向指定的资源提交要被处理的数据。

GET 提交参数一般显示在 URL 上，POST 通过表单提交不会显示在 URL 上，POST 更具隐蔽性：

![](https://www.runoob.com/wp-content/uploads/2013/07/get-post.png)

## GET 方法

**请注意，查询字符串（名称/值对）是在 GET 请求的 URL 中发送的：**

```
/test/demo_form.php?name1=value1&name2=value2
```

**有关 GET 请求的其他一些注释：**

-   GET 请求可被缓存
-   GET 请求保留在浏览器历史记录中
-   GET 请求可被收藏为书签
-   GET 请求不应在处理敏感数据时使用
-   GET 请求有长度限制
-   GET 请求只应当用于取回数据

当我们在浏览器地址栏输入一个包含特殊字符的URL，或者在HTTP请求中通过GET方法传递参数时，就会看见 **百分号编码**。例如，假设有一个搜索功能的URL是 `http://example.com/search?q=hello world`。由于URL中不能直接包含空格，所以需要将空格编码为 `%20`，变成`http://example.com/search?q=hello%20world`。 再比如，如果要搜索的内容包含中文，如“你好”，那么在URL中就需要将“你好”编码为`%E4%BD%A0%E5%A5%BD`，URL就变成了`http://example.com/search?q=%E4%BD%A0%E5%A5%BD`。这样，服务器端就可以正确解析这些参数，而不会因为特殊字符或非ASCII字符导致解析错误。

百分号编码是一种将URI中的字符表示为US - ASCII字符集（美国信息交换标准代码）的编码方式。在URI中，有些字符是保留字符，如`/`、`?`、`#`等，它们在URI中有特殊的语法意义。还有一些字符是非ASCII字符，如中文字符、特殊符号等。百分号编码就是用来对这些特殊字符和非ASCII字符进行编码，以便它们能够在URI中安全传输。
    
编码的格式是`%`后跟两位十六进制数。这两位十六进制数表示字符在UTF - 8编码下的字节值。例如，空格字符在百分号编码中表示为`%20`，因为空格字符在UTF - 8编码下的字节值是32（十进制），转换为十六进制就是20；对于中文字符“中”，其UTF - 8编码是`E4 B8 AD`。在百分号编码中，就表示为`%E4%B8%AD`。可以看到，每个字节用`%`和两位十六进制数来表示。

## POST 方法

**请注意，查询字符串（名称/值对）是在 POST 请求的 HTTP 消息主体中发送的：**

```
POST /test/demo_form.php HTTP/1.1  
Host: runoob.com  
name1=value1&name2=value2
```

**有关 POST 请求的其他一些注释：**

-   POST 请求不会被缓存
-   POST 请求不会保留在浏览器历史记录中
-   POST 不能被收藏为书签
-   POST 请求对数据长度没有要求

下面的表格比较了两种 HTTP 方法：GET 和 POST。

|  | GET | POST |
|--|--|--|
| 后退按钮/刷新 | 无害 | 数据会被重新提交（浏览器应该告知用户数据会被重新提交）。 |
| 书签 | 可收藏为书签 | 不可收藏为书签 |
| 缓存 | 能被缓存 | 不能缓存 |
| 编码类型 | application/x-www-form-urlencoded | application/x-www-form-urlencoded or multipart/form-data。为二进制数据使用多重编码。 |
| 历史 | 参数保留在浏览器历史中。 | 参数不会保存在浏览器历史中。 |
| 对数据长度的限制 | 有限制。当发送数据时，GET 方法向 URL 添加数据；URL 的长度是受限制的（URL 的最大长度是 2048 个字符）。
 | 无限制。 |
| 对数据类型的限制 | 只允许 ASCII 字符。 | 没有限制。也允许二进制数据。 |
| 安全性 | 与 POST 相比，GET 的安全性较差，因为所发送的数据是 URL 的一部分。在发送密码或其他敏感信息时绝不要使用 GET ！|  POST 比 GET 更安全，因为参数不会被保存在浏览器历史或 web 服务器日志中。|
| 可见性 | 数据在 URL 中对所有人都是可见的。 | 数据不会显示在 URL 中。 |

下面的表格列出了其他一些 HTTP 请求方法：

| 方法 | 描述 |
|--|--|
| HEAD | 与 GET 相同，但只返回 HTTP 报头，不返回文档主体。 |
| PUT | 上传指定的 URI 表示。 |
| DELETE | 删除指定资源。 |
| OPTIONS | 返回服务器支持的 HTTP 方法。 |
| CONNECT | 把请求连接转换到透明的 TCP/IP 通道。 |

## 输入标签

`<input />`：表单输入

<table>
	<tr>
		<th colspan="3">input / (行内块级)</th>
	</tr>
	<tr>
		<th >属性</th>
		<th colspan="2">取值 & 说明</th>
	</tr>
	<tr>
		<th rowspan="27">type</th>
		<th colspan="2">基础</th>
	</tr>
	<tr>
		<td>text</td>
		<td>文本</td>
	</tr>
	<tr>
		<td>radio</td>
		<td>单选框</td>
	</tr>
	<tr>
		<td>checkbox</td>
		<td>多选框</td>
	</tr>
	<tr>
		<td>url</td>
		<td>网址</td>
	</tr>
	<tr>
		<td>search</td>
		<td>搜索框</td>
	</tr>
	<tr>
		<td>hidden</td>
		<td>隐藏</td>
	</tr>
	<tr>
		<th colspan="2">时间</th>
	</tr>
	<tr>
		<td>time</td>
		<td></td>
	</tr>
	<tr>
		<td>date</td>
		<td></td>
	</tr>
	<tr>
		<td>month</td>
		<td></td>
	</tr>
	<tr>
		<td>week</td>
		<td></td>
	</tr>
	<tr>
		<td>datetime-local</td>
		<td>带日期的时间</td>
	</tr>
	<tr>
		<th colspan="2">个人信息</th>
	</tr>
	<tr>
		<td>email</td>
		<td>邮箱</td>
	</tr>
	<tr>
		<td>tel</td>
		<td>电话</td>
	</tr>
	<tr>
		<td>password</td>
		<td>密码</td>
	</tr>
	<tr>
		<th colspan="2">需配合</th>
	</tr>
	<tr>
		<td>file</td>
		<td>文件（需要将提交的表单设置为 post ，还要指定 form 的 entype 属性为 "multipart/form-data"）</td>
	</tr>
	<tr>
		<td>color</td>
		<td>颜色</td>
	</tr>
	<tr>
		<td>image</td>
		<td>图像“按钮”，返回鼠标点击处的相对位置（原点为左上角）。</td>
	</tr>
	<tr>
		<td>number</td>
		<td>数字</td>
	</tr>
	<tr>
		<td>range</td>
		<td>数值滚动条</td>
	</tr>
	<tr>
		<th colspan="2">实现button功能（设置属性value以更改显示）</th>
	</tr>
	<tr>
		<td>button</td>
		<td>按钮</td>
	</tr>
	<tr>
		<td>reset</td>
		<td>重置</td>
	</tr>
	<tr>
		<td>submit</td>
		<td>提交</td>
	</tr>
	<tr>
		<th>src</th>
		<td></td>
		<td rowspan="2">（配合type="image"使用）</td>
	</tr>
	<tr>
		<th>alt</th>
		<td></td>
	</tr>
	<tr>
		<th>min</th>
		<td></td>
		<td rowspan="3">（配合type="number"或"range"使用）</td>
	</tr>
	<tr>
		<th>max</th>
		<td></td>
	</tr>
	<tr>
		<th>step</th>
		<td></td>
	</tr>
	<tr>
		<th rowspan="5">accept</th>
		<td colspan="2">（配合type="file"使用，指定可选择的文件类型, 前面写&lt;input type="hidden" name="MAX_FILE_SIZE value="[x字节]"&gt;来限制最大尺寸）</td>
	</tr>
	<tr>
		<td>audio/*</td>
		<td>音频文件</td>
	</tr>
	<tr>
		<td>video/*</td>
		<td>视频文件</td>
	</tr>
	<tr>
		<td>image/*</td>
		<td>图像文件</td>
	</tr>
	<tr>
		<td colspan="2">还可以使用<a href="https://www.runoob.com/http/mime-types.html"> MIME 类型</a>进行描述！</td>
	</tr>
	<tr>
		<th>placeholder</th>
		<td>[text]</td>
		<td>占位提示信息符</td>
	</tr>
	<tr>
		<th>required</th>
		<td>---</td>
		<td>必填需</td>
	</tr>
	<tr>
		<th>checked</th>
		<td>---</td>
		<td>(默认选项</td>
	</tr>
	<tr>
		<th>disabled</th>
		<td>---</td>
		<td>禁用元素（不会提交内容）</td>
	</tr>
	<tr>
		<th>readonly</th>
		<td>---</td>
		<td>只读，禁止修改（会提交内容）</td>
	</tr>
	<tr>
		<th>size</th>
		<td>[num]</td>
		<td>指定输入框外观长度</td>
	</tr>
	<tr>
		<th>maxlength</th>
		<td>[num]</td>
		<td>指定最大输入字符数</td>
	</tr>
	<tr>
		<th>list</th>
		<td>[id]</td>
		<td>指定所关联的数据列表的 id（配合 <code>&lt;datalist&gt;</code> 与 <code>&lt;option&gt;</code> 使用）</td>
	</tr>
</table>

与单选按钮一样，选中复选框的表单数据是 name / value 属性对。 虽然 value 属性是可选的，但最好将它包含在页面上的任何复选框或单选按钮中。`input` 元素还可修改 value 属性来指定其输入的默认值。

选项通过有相同的 name 属性使它们是“一组”选项。要使选择一个单选按钮自动取消选择另一个，两个按钮必须有具有相同值的 name 属性。

指定 `input` 元素的 type 基本上会触发数据检查机制，但是由于这是 html5 新增加的特性，所以各个浏览器目前并没有支持的很到位，可以设置 pattern 属性（取值正则表达式）来让我们自己来指定匹配模式。

自动填充：当我们在浏览器中成功录入一次信息后，浏览器就会记住表单的数据，通常这是浏览器通过匹配 `input` 的 name 属性得知的，**管这个的是 autocomplete 属性（`form` 元素与 `input` 元素都有），可取值 on/off，默认取值 on。**

自动聚焦：表单加载出来时就自动聚焦到某个 `input` 元素上面，在对应 `input` 中使用布尔属性 autofocus 即可（有多个元素有 autofocus 的话就聚焦到第一个自动聚焦的元素上）。
 
`<select>`：下拉选项列表。
`<option>`：每个具体选项，被选中的那个的 value 值会赋给 `select` 中的 name。
`<optgroup>`：对选项进行分组（可设置其 label 属性对一个分组进行说明）。

`<button>`（行内块级）：按钮。

 单击没有任何属性的表单按钮的默认行为会将表单提交到表单的 action 属性中指定的位置。然而，依赖默认行为可能造成混乱。 应该将值为 submit 的 type 属性添加到 button 以明确它是一个提交按钮。

| 属性 | 值 | 描述 |
|--|--|--|
| autofocus | autofocus | 指定当页面加载的时候，按钮将获得焦点。 |
| disabled | disabled | 禁用按钮。 |
| form | form_id | 指定按钮所关联的表单 ID。 |
| formaction | url | 覆盖 form 元素的 action 属性。注释：该属性与 type="submit" 配合使用。 |
| formenctype | application/x-www-form-urlencoded、multipart/form-data、text/plain | 覆盖 form 元素的 enctype 属性。注释：该属性与 type="submit" 配合使用。 |
| formmethod | get、post | 覆盖 form 元素的 method 属性。注释：该属性与 type="submit" 配合使用。 |
| formnovalidate | formnovalidate | 覆盖 form 元素的 novalidate 属性。注释：该属性与 type="submit" 配合使用。 |
| formtarget | _blank、_self、_parent、_top、framename | 覆盖 form 元素的 target 属性。注释：该属性与 type="submit" 配合使用。 |
| name | button_name | 指定按钮的名称。 |
| type | button（无效果）、reset（清空表单内容）、submit（提交给服务器） | 指定按钮的类型。 |
| value | text | 指定按钮的初始值。注释：可由脚本进行修改。 |

`<output>`（行内）：输出计算结果。
`<textarea>`（块级）：多行文本输入（默认字体为等宽字体）。

<table>
	<caption>&lt;textarea&gt; 属性</caption>
	<tr>
		<th>属性</th>
		<th>取值</th>
		<th>说明</th>
	</tr>
	<tr>
		<td>rows</td>
		<td>[num]</td>
		<td>指定可显示的行数</td>
	</tr>
	<tr>
		<td>cols</td>
		<td>[num]</td>
		<td>指定可显示的列数</td>
	</tr>
	<tr>
		<td rowspan="4">wrap</td>
		<td colspan="2">指定表单在提交时如何处理文本区域的自动换行</td>
	</tr>
	<tr>
		<td>hard</td>
		<td>页面渲染中对文本进行自动换行，换行符（CR+LF）也会提交（需要指定 cols）</td>
	</tr>
	<tr>
		<td>soft（默认）</td>
		<td>页面渲染中对文本进行自动换行，但换行符不提交</td>
	</tr>
	<tr>
		<td>off</td>
		<td>不对文本进行自动换行</td>
	</tr>
</table>

> CR = Carriage Return，回车
> LF  = Line Feed，换行
>
> 不同操作系统用不同换行符来表示换行：
> - win: CR + LF
> - linux/unix/mac os x: LF
> - mac os（10.0 之前）: CR

##  表单格式

`<label>`：关联 `input` 、`textarea` 与 `select` 元素，提高与用户的交互体验。

隐式关联：

```html
<label>你是智障吗：<input type="text" name="idiot" /></label>
```

显示关联：使用 for 属性指定所关联的元素的 id（不同标签不能使用同一个 id ！）

```html
<label for="q1">你是智障吗：</label><input type="text" name="idiot" id="q1" />
```

`<fieldset>`（块级）：将表单元素分组。
`<legend>`（行内块级）：对一个 `fieldset` 的说明（**必须作为 `<fieldset>` 的第一个子元素！**）。

# 网页架构

**每个 html 元素实际上都是以一个方框的形式呈现的！！** 这些方框其实就构成了整个网页。

在过去，人们大多数习惯于只使用 `<div>` 元素来布局整个网页。不过这样当然不太好，因为这样我们就不清楚每个 `<div>` 都是干嘛用的了。所以 html5 提供了一些新语义元素来定义网页的不同部分：

- `<header>`：定义简介形式的内容。
- `<nav>`：定义主页导航功能。
- `<main>`：定义主内容。
- `<article>`：定义独立文章内容，与页面其他部分无关（帖子、回复等）。
- `<section>`：定义文档中的节。
- `<aside>`：定义侧边栏（术语条目、作者简介、相关链接等）。
- `<footer>`：定义页脚部分内容。
- `<details>`：定义额外细节，加上布尔属性 open 默认打开。
- `<summary>`：定义 `details` 的标题。

```html
<details>
	<summary>一些细节</summary>
	<p>skdhfksjdhfk</p>
	<p>skdhfksjdhfk</p>
	<p>skdhfksjdhfk</p>
</details>
```)</td>
	</tr>
</table>

# 样式 - CSS

## style

对页面进行美化！！

`<style>` 元素：

<table>
  <tr><th>属性</th><th>值</th></tr>
  <tr><td rowspan="9">media：指定样式适用的媒体</td><td>all：将样式用于所有设备（默认）</td></tr>
  <tr><td>screen：将样式用于计算机屏幕</td></tr>
  <tr><td>aural：将样式用于语音合成器</td></tr>
  <tr><td>braille：将样式用于盲文设备</td></tr>
  <tr><td>handheld：将样式用于手持设备（小屏幕、有限的带宽）</td></tr>
  <tr><td>projection：将样式用于投影机</td></tr>
  <tr><td>print：将样式用于打印页面</td></tr>
  <tr><td>tty：将样式用于电传打字机之类的等宽设备</td></tr>
  <tr><td>tv：将样式用于电视机（低分辨率、有限的屏幕翻滚能力）</td></tr>
  <tr><td>type：指定样式类型</td><td>text/css</td></tr>
</table>

除了可以为指定设备定制样式，media 还支持通过一些特性来设计更具体的条件

```html
<style media="screen and (min-width:512px;) and (max-width: 1024px;)">
	/* 只有上面的条件同时满足时，才执行这个样式 */
</style>
```

具体参考：[media](https://man.ilovefishc.com/pageHTML5/media.html)

```html
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /* 整个网页的可见内容都放在body里面 */
        /* 故修改背景要改body元素 */
        body {
            background-image: url("sources/pythonlogo.jpg");
        }
        h1 {
            text-align: center;
            color: lightsalmon;
        }
        h2 {
            margin-left: 60%;
            color: white;
        }
        p {
            text-indent: 32px; /*缩进*/
            font-size: 16px; /*字体大小*/
            line-height: 32px; /*行高*/
            color: white;
        }
        img {
            position: absolute;
            left: 50%;
            margin-left: -181px;
        }
    </style>
    <style media="screen and (min-width:512px) and (max-width:1024px)">
	    body {
	        background-image: url("sources/cover-2.png");
	    }
	    h2 {
	      margin-left: 60%;
	      color: black;
	    }
	    p {
	      text-indent: 32px; /*缩进*/
	      font-size: 16px; /*字体大小*/
	      line-height: 32px; /*行高*/
	      color: black;
	    }
	</style>
</head>
<body>
    <h1>header1</h1>
    <h2>EBAOBAO</h2>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio error sit, earum nostrum quae iusto porro eius recusandae placeat modi? Tempora, dignissimos? Nam, non vitae. Aperiam, sunt laborum! Provident, ipsam?</p>
    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Neque officiis dolores voluptate illum officia velit harum architecto tempore eligendi delectus quidem inventore, numquam quod accusantium magnam repellat, molestiae eveniet doloremque!</p>
    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quaerat quisquam sequi natus et corrupti. Voluptas quo enim quasi tempora provident non officiis veritatis amet perferendis, dicta doloribus asperiores id dignissimos?</p>
    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sed ab reprehenderit earum eius, ea quidem unde suscipit non nam explicabo possimus consequuntur? Asperiores maxime, praesentium quae consectetur fugit facilis quidem.</p>
    <img src="sources/test.jpg" width="200px" height="200px"/>
</body>
</html>
```

除此外，也能将css写在行内来对特定元素进行修饰，使用`style`属性即可。

## 把CSS写在外部？

除了在style里添加css样式表，我们还能将它保存为外部文件，用 **`<link>`** 将它链接进来！

```html
<link rel="stylesheet" href="css/forlink.css" />
```

它还可链接网站图标（*favicon， 多为 `.ico` 文件*）！

```html
<link rel="icon" type="image/x-icon" href="sources/test.jpg" />
```

了解：
[link](https://man.ilovefishc.com/pageHTML5/link.html)

[`<link>`：外部资源链接元素 - HTML（超文本标记语言） | MDN (mozilla.org)](https://developer.mozilla.org/zh-CN/docs/Web/HTML/Element/link)

### 相对路径……

通常来说，当前文件所在位置即 *相对路径* 的基准（比如上文的 `sources/test.jpg`， 其 *绝对路径* 为 `D:/Workspace/weblearning/html/sources/test.jpg`，但该文件位于 `D:/Workspace/weblearning/html/`中，故前面可省略），但这个基准也是可以改的。

**用 `<base>` 来指定相对url的解析基准！**

```html
<base href="sources/">
```

了解：[base](https://man.ilovefishc.com/pageHTML5/base.html)

## 样式表的优先级

**外部样式 低于 内部样式 低于 行内样式**

> 亦即，**就近原则**！！

默认来说是这样的，不过凡事都有例外：只要在样式表某一属性的值后加上`!important`就能使这一样式的优先级最高！不过若有多种样式有`!important`的话，那也是会按默认顺序选择它们的其中一个。

换句话说， **外部样式 < 内部样式 < 行内样式 < 外部样式!important < 内部样式!important < 行内样式!important**

# JavaScript 初体验！

JavaScript 是一个网页的灵魂！！

**用 `<script>` 来为网页加入脚本！！**

内嵌：

```html
<!-- 如果是javascript脚本的话 type 可省略 -->
<script type="text/javascript">
    document.write("I love Javascript!!");
</script>
```

外部：

```html
<!-- 注意，链接外部后元素内部不能有内容！ -->
<script type="text/javascript" src="../js/hi.js"></script>
```

可用 `defer` 来延迟执行脚本（只能用于引用外部脚本文件）

而又有 `<noscript>` 来为不支持 JavaScript 的浏览器显示替代内容

```html
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javascript" src="../js/hi.js"></script>
</head>

<body>
    <script type="text/javascript">
        document.write("I love Javascript!!");
    </script>
    <noscript>
        <p>都什么年代了，还不支持JavaScript？</p>
    </noscript>
</body>

</html>
```

了解：[script](https://man.ilovefishc.com/pageHTML5/script.html)
