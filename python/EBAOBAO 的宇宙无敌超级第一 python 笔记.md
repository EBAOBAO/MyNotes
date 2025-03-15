# 写在前面……

我想，像 python 这种语言大概是不必大费周章做一篇详尽的笔记的，可惜事实远非如此：网上的资料所涉及的东西好像零零散散，而且众说纷纭，就比如用三个引号裹起来的字符串，我们的那个课本上说它可以用作多行注释，我又看到其他地方说它是多行字符串……故我尝试去找到最为正确的说法，将零零散散分布于网络中的资源整合起来，结合我自己的理解，形成一篇宇宙无敌超级第一 python 笔记。

注意，你将在本笔记中看到：

1. 对各种资料的（不标明出处的）复制粘贴（如有雷同，纯属抄袭）
2. humou王对旺仔人民共和国人民残酷的压榨与剥削
3. 原神，启动！！！
4. 表达了作者的思乡之情（1分）
5. （↑学python学的）

# 代码规范

[Python代码规范](https://www.cnblogs.com/ltb6w/p/10847612.html)
[PEP8规范 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/110405756)
# 变量与数据类型

## 变量

**变量常被描述为可用于存储值的盒子，但这并没有准确描述python内部表示变量的方式。一种好得多的定义是：变量是赋给值的标签，也可以说变量指向特定的值。**

可在一行代码中给多个变量赋值，这有助于缩短程序并提高其可读性。这种做法最常用于将一系列数赋给 一组变量。

```python
x, y, z = 0, 1, 2
```

## 常量

**常量**类似于变量，但其值在程序的整个生命周期内保持不变。python没有内置的常量类型，但python程序员会使用全大写来指出某个变量为常量，其值应该始终不变

```python
HUMOU_SALARY = 0
```

### 数

> "Hell SU meal?" ——宇宙混沌大帝Humou

## 数据类型转换

Python 数据类型转换可以分为两种：

- 隐式类型转换 - 自动完成
- 显式类型转换 - 需要使用类型函数来转换

### 隐式类型转换

在隐式类型转换中，Python 会自动将一种数据类型转换为另一种数据类型，不需要我们去干预。

不同类型的数在参与运算时会自动转换成较大的类型：

```python
num_int = 123
num_flo = 1.23

num_new = num_int + num_flo

print("num_int 数据类型为:",type(num_int)) 
# num_int 数据类型为: <class 'int'>

print("num_flo 数据类型为:",type(num_flo))
# num_flo 数据类型为: <class 'float'>

print("num_new 值为:",num_new)
# num_new: 值为: 124.23
print("num_new 数据类型为:",type(num_new))
# num_new 数据类型为: <class 'float'>
```

顺便一提，python 中 **数不能直接与字符串一起运算** ！

### 显式类型转换

以下几个内置的函数可以执行数据类型之间的转换。这些函数返回一个新的对象，表示转换的值。

| 函数                                                                               | 描述                               |
| -------------------------------------------------------------------------------- | -------------------------------- |
| [int(x [,base])](https://www.runoob.com/python3/python-func-int.html)            | 将x转换为一个整数                        |
| [float(x)](https://www.runoob.com/python3/python-func-float.html)                | 将x转换到一个浮点数                       |
| [complex(real [,imag])](https://www.runoob.com/python3/python-func-complex.html) | 创建一个复数                           |
| [str(x)](https://www.runoob.com/python3/python-func-str.html)                    | 将对象 x 转换为字符串                     |
| [repr(x)](https://www.runoob.com/python3/python-func-repr.html)                  | 将对象 x 转换为表达式字符串                  |
| [eval(str)](https://www.runoob.com/python3/python-func-eval.html)                | 用来计算在字符串中的有效Python表达式,并返回一个对象    |
| [tuple(s)](https://www.runoob.com/python3/python3-func-tuple.html)               | 将序列 s 转换为一个元组                    |
| [list(s)](https://www.runoob.com/python3/python3-att-list-list.html)             | 将序列 s 转换为一个列表                    |
| [set(s)](https://www.runoob.com/python3/python-func-set.html)                    | 转换为可变集合                          |
| [dict(d)](https://www.runoob.com/python3/python-func-dict.html)                  | 创建一个字典。d 必须是一个 (key, value)元组序列。 |
| [frozenset(s)](https://www.runoob.com/python3/python-func-frozenset.html)        | 转换为不可变集合                         |
| [chr(x)](https://www.runoob.com/python3/python-func-chr.html)                    | 将一个整数转换为一个字符                     |
| [ord(x)](https://www.runoob.com/python3/python-func-ord.html)                    | 将一个字符转换为它的整数值                    |
| [hex(x)](https://www.runoob.com/python3/python-func-hex.html)                    | 将一个整数转换为一个十六进制字符串                |
| [oct(x)](https://www.runoob.com/python3/python-func-oct.html)                    | 将一个整数转换为一个八进制字符串                 |
# 字面量

## 数

python中有整数与浮点数

```python
a1 = -8080 # Python可以处理任意大小的整数
a2 = 0xff00 # 十六进制
a3 = 0b1100 # 二进制
```

书写很大的数的时候，可使用下划线将其中的数字分组

```python
humou_age = 114_514_191_981
```

除此外，python 甚至还有复数：

```python
>>>complex(1, 2)
(1 + 2j) 

>>> complex(1)    # 数字 
(1 + 0j) 

>>> complex("1")  # 当做字符串处理
(1 + 0j) 

# 注意：这个地方在"+"号两边不能有空格，也就是不能写成"1 + 2j"，应该是"1+2j"，否则会报错 
>>> complex("1+2j") 
(1 + 2j)
```

## 字符串

python 中的字符串字面量可以是以单引号`'`或双引号`"`括起来的任意文本。

有一些特殊字符要用转义字符才能标识得出来（像`\'`、`\"`），要忽略转义，可以使用 **r字符串**：

```python
str = r"I'm a fuckin asshole"
```

……**只要外面的引号与里面的引号都不一样即可。**

当使用三个双引号定义字符串时（`"""xxx""" 或 '''xxx'''`），它允许字符串内容跨越多行：

```python
multi_line_string = """
这是一个多行字符串。
它可以包含多行文本，
并且会保留换行符。
"""
```

如果三个双引号没有被赋值给任何变量或对象，它也可以被用作多行注释，但这种用法并不常见，**而且我们也不推荐这么用**，因为它会作为一个字符串对象被加载到内存中。如果注释内容较多，可能会占用不必要的内存资源。

不过事实上，将多行字符串直接写在类、模块、函数或方法体的开头，就可以将其用作 *文档字符串* ，它看起来像注释，但它实际上是一个字符串，被存储在对象的 `__doc__` 属性中。

```python
def add(a, b):
    """
    这是一个加法函数。
    它接受两个参数 a 和 b，并返回它们的和。
    """
    return a + b

print(add.__doc__)
```
### 格式化字符串

我们经常会输出类似`'亲爱的xxx你好！你xx月的话费是xx，余额是xx'`（不是谁会经常输出这玩意啊）之类的字符串，而xxx的内容都是根据变量变化的，所以，需要一种简便的格式化字符串的方式。

可以用 **f字符串** 来在字符串中加入变量：

```python
first_name = "e"
last_name = "baobao"
fullname = f"{first_name} {last_name}"
message = f"FUCKU, {fullname.title()}"
print(message)

# 输出：FUCKU, E Baobao
```

```python
>>> r = 2.5
>>> s = 3.14 * r ** 2
>>> print(f'The area of a circle with radius {r} is {s:.2f}')
The area of a circle with radius 2.5 is 19.62
```

在Python中，采用的格式化方式和C语言是一致的，用`%`实现：

```python
>>> 'Hello, %s' % 'world'
'Hello, world'
>>> 'Hi, %s, you have $%d.' % ('Michael', 1000000)
'Hi, Michael, you have $1000000.'
```

常见的占位符

| 占位符 | 替换内容 |
|--|--|
| %d | 整数 |
| %f | 浮点数 |
| %s | 字符串 |
| %x | 十六进制整数 |

有些时候，字符串里面的`%`是一个普通字符怎么办？这个时候就需要转义，用`%%`来表示一个`%`
## 布尔值

`True` 与 `False`。（注意大小写）

还有列表，字典等常用的数据类型的字面量，这些我们会在之后

# 运算符

[Python 运算符 | 菜鸟教程 (runoob.com)](https://www.runoob.com/python/python-operators.html)

以下表格列出了从最高到最低优先级的所有运算符：

| 运算符 | 描述 |
|--|--|
| ** | 指数 (最高优先级) |
| ~ + - | 按位翻转, 一元加号和减号 (最后两个的方法名为 +@ 和 -@) |
| * / % // | 乘，除，取模和取整除 |
| + - | 加法减法 |
| >> << | 右移，左移运算符 |
| & | 位 'AND' |
| ^ \| | 位运算符 |
| <= < > >= | 比较运算符 |
| <> == != | 等于运算符 |
| = %= /= //= -= += *= **= | 赋值运算符 |
| is is not | 身份运算符 |
| in not in | 成员运算符 |
| not and or | 逻辑运算符 |

# 操作字符串

## 切片

Python没有针对字符串的截取函数，只需要切片一个操作就可以完成，非常简单。

### 练习

## 方法

`upper()` : 全部字母改为大写
`lower()` : 全部字母改为小写
`title()` : 所有单词首字母大写，其他字母小写
`replace(<o>, <n>)`：替换内容并返回（原字符串不变）
    
```python
str = "yOu aRe soo hUMOu"

print(str.title()) # 输出：You Are Soo Humou
print(str.lower()) # 输出：you are soo humou
print(str.upper()) # 输出：YOU ARE SOO HUMOU
```

删除空白的方法：

`rstrip()` : 删除字符串末尾的空白
`lstrip()`: 删除字符串开头的空白
`strip()` : 删除字符串开头与末尾的空白

注：

1. 这些方法只返回修改后字符串，并不对原来变量所指向的字符串有所改动，若想改动应重新对其赋值。上面的也是！
2. `\n` 也算空白！！

如果字符串内部有很多换行，用`\n`写在一行里不好阅读，为了简化，Python允许用`'''...'''`的格式表示多行内容：

```python
print('''床前明月光，
疑是地上霜。''')
```

#### 编码与解码

单个字符的编码相关 *函数*：

`ord()`：获取字符的整数表示。
`chr()`：把编码转换为对应的字符。

```python
>>> ord('A')
65
>>> ord('中')
20013
>>> chr(66)
'B'
>>> chr(25991)
'文'
```

如果知道字符的整数编码，可以用十六进制写`str`：

```python
>>> '\u4e2d\u6587'
'中文'
```

由于Python的字符串类型是`str`，在内存中以Unicode表示，一个字符对应若干个字节。如果要在网络上传输，或者保存到磁盘上，就需要把`str`变为以字节为单位的`bytes`。

Python对`bytes`类型的数据用带`b`前缀的单引号或双引号表示：

```python
x = b'ABC'
```

**`bytes`的每个字符都只占用一个字节。**

以Unicode表示的`str`通过`encode()`方法可以编码为指定的`bytes`：

```python
>>> 'ABC'.encode('ascii')
b'ABC'
>>> '中文'.encode('utf-8')
b'\xe4\xb8\xad\xe6\x96\x87' 
# 在bytes中，无法显示为ASCII字符的字节，用`\x##`显示
>>> '中文'.encode('ascii')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
UnicodeEncodeError: 'ascii' codec can't encode characters in position 0-1: ordinal not in range(128)

## 中文编码的范围超过了ASCII编码的范围，Python会报错。
```

反过来，如果我们从网络或磁盘上读取了字节流，那么读到的数据就是`bytes`。要把`bytes`变为`str`，就需要用`decode()`方法：

```python
>>> b'ABC'.decode('ascii')
'ABC'
>>> b'\xe4\xb8\xad\xe6\x96\x87'.decode('utf-8')
'中文'
```

如果`bytes`中包含无法解码的字节，`decode()`方法会报错：

```python
>>> b'\xe4\xb8\xad\xff'.decode('utf-8')
Traceback (most recent call last):
  ...
UnicodeDecodeError: 'utf-8' codec can't decode byte 0xff in position 3: invalid start byte
```

如果`bytes`中只有一小部分无效的字节，可以传入`errors='ignore'`忽略错误的字节：

```python
>>> b'\xe4\xb8\xad\xff'.decode('utf-8', errors='ignore')
'中'
```

要计算`str`包含多少个字符或`bytes`包含多少字节，可以用`len()`函数：

```python
>>> len(b'ABC')
3
>>> len(b'\xe4\xb8\xad\xe6\x96\x87')
6
>>> len('中文'.encode('utf-8'))
6
```

由于Python源代码也是一个文本文件，所以，当你的源代码中包含中文的时候，在保存源代码时，就需要务必指定保存为UTF-8编码。当Python解释器读取源代码时，为了让它按UTF-8编码读取，我们通常在文件开头写上这两行：

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
```

第一行注释是为了告诉Linux/OS X系统，这是一个Python可执行程序，Windows系统会忽略这个注释；

第二行注释是为了告诉Python解释器，按照UTF-8编码读取源代码，否则，你在源代码中写的中文输出可能会有乱码。
# 列表

**列表** 由一系列按特定顺序排列的元素组成。你可以创建包含字母表中所有字母、数字0～9或所有家庭成 员姓名的列表；也可以将任何东西加入列表中，其中的元素之间可以没有任何关系。

```python
[1, 2, "huhu"]
```

用索引来访问list中每一个位置的元素，索引是从`0`开始。当索引超出了范围时，Python会报一个`IndexError`错误，所以，要确保索引不要越界，记得最后一个元素的索引是`len(classmates) - 1`。

添加或删除元素的方法：

`append(<value>)` : 在结尾处添加元素
`insert(<index>, <value>) `: 在相应位置插入元素
`pop(<index>)` : 删除并返回列表中相应位置元素，参数缺省则为最后一个元素
`remove(<value>)` : 删除列表中第一个相应值的元素，列表中没有就报错

也可以这样删除元素：

```python
del list[i]
```

排序相关的方法：

`sort(reverse)` : 替换原来的列表的排序，参数reverse默认为False，即升序排序
`reverse()` : 倒序（替换原列表）

```python
list1 = ['wuLingHongGuang', 'guangLun3000', 'UFO', 'bean','ufo']
print(sorted(list1)) 
# 输出：['UFO', 'bean', 'guangLun3000', 'ufo', 'wuLingHongGuang']
print(sorted(list1, reverse = True)) 
# 输出：['wuLingHongGuang', 'ufo', 'guangLun3000', 'bean', 'UFO']

print(list1) 
# 输出：['wuLingHongGuang', 'guangLun3000', 'UFO', 'bean','ufo']

list1.sort()
print(list1) 
# 输出：['UFO', 'bean', 'guangLun3000', 'ufo', 'wuLingHongGuang']
list1.sort(reverse = True) 
print(list1) 
# 输出：['wuLingHongGuang', 'ufo', 'guangLun3000', 'bean', 'UFO']
```

## 函数

`len()`：取列表长度
`sorted(list, reverse)` : 返回排序后列表，不改变原列表
`list()`：将可迭代对象（iterable，如字符串、元组、集合、字典、生成器等）转换为列表

```python
list(range())
```

专门用于处理数字列表的Python函数：

`min()`
`max()`
`sum()`

## 复制列表

```python
list2 = list1
list3 = list1[:]
```

这两者是不一样的！！

```python
list1 = [1, 2, 3, 4]
list2 = list1
list3 = list1[:] 

list1[1] = 'a'

print(list2) # [1, 'a', 3, 4]
print(list3) # [1, 2, 3, 4]
```

## 列表生成式

```python
squares = [value**2 for value in range(1, 11)] 
print(squares)
```

for循环后面还可以加上if判断来进行筛选：

```python
>>> [x * x for x in range(1, 11) if x % 2 == 0]
[4, 16, 36, 64, 100]
```

但是，我们不能在最后的`if`加上`else`，解决方法是像：

```python
>>> [x if x % 2 == 0 else -x for x in range(1, 11)]
[-1, 2, -3, 4, -5, 6, -7, 8, -9, 10]
```

这样的话就必须有`else`。

还可以使用两层循环，可以生成全排列：

```python
>>> [m + n for m in 'ABC' for n in 'XYZ']
['AX', 'AY', 'AZ', 'BX', 'BY', 'BZ', 'CX', 'CY', 'CZ']
```

# 元组

另一种有序列表叫元组：tuple。tuple和list非常类似，但是tuple一旦初始化就不能修改。

```python
classmates = ('Michael', 'Bob', 'Tracy')
```

现在，classmates这个tuple不能变了，它也没有 `append()`，`insert()` 这样的方法。其他获取元素的方法和list是一样的，你可以正常地使用`classmates[0]`，`classmates[-1]`，但不能赋值成另外的元素。

如果要定义一个空的tuple，可以写成`()`。

不可变的tuple有什么意义？因为tuple不可变，所以代码更安全。**如果可能，能用tuple代替list就尽量用tuple。**

**只有1个元素的tuple定义时必须加一个`,`，来消除歧义。**

**tuple所谓的“不变”是说，tuple的每个元素，指向（地址）永远不变。**

# 字典

```python
d = {'Michael': 95, 'Bob': 75, 'Tracy': 85}
```

字典是一种动态结构，可随时在其中添加键值对。要添加键值对，可依次指定字典名、用方括号括起 的键和相关联的值。

对于字典中不再需要的信息，可使用`del` 语句将相应的键值对彻底删除。

#### 方法

`get(<key>, <value>)`：（下方详解）
`items()`：返回一个键值对列表
`keys()`：返回键的列表
`values()`：返回值的列表
`pop(<key>)`：删除`<key>`对应的键值对

使用例：

```python
user_0 = { 
	'username': 'efermi', 
	'first': 'enrico', 
	'last': 'fermi', 
}

for key, value in user_0.items(): 
	print(f"\nKey: {key}") 
	print(f"Value: {value}")
```

通过dict提供的`get()`方法，如果key不存在，可以返回`None`，或者自己指定的value

```python
>>> d.get('Thomas')
>>> d.get('Thomas', -1)
-1
```

（注意：返回`None`的时候Python的交互环境不显示结果。）

### 函数

`sorted()`：对dict（根据键）进行排序

### 注意

1. 键不能重复
2. 键是**不可变对象**，因为dict根据key来计算value的存储位置，如果每次计算相同的key得出的结果不同，那dict内部就完全混乱了。这个通过key计算位置的算法称为哈希算法（Hash）。

# 集合

**集合（set）** 即没有重复元素的列表，通过对包含重复元素的列表调用set() ，可让Python找出列表中独一无二的元素，并使用这些元素 来创建一个集合。

```python
>>> s = set([1, 2, 3])
```

方法：

`add(<element>)`：添加元素


set可以看成数学意义上的无序和无重复元素的集合，因此，两个set可以做数学意义上的交集、并集等操作：

```python
>>> s1 = set([1, 2, 3])
>>> s2 = set([2, 3, 4])
>>> s1 & s2
{2, 3}
>>> s1 | s2
{1, 2, 3, 4}
```
# 流程控制

## 分支

### if-else

```python
if <条件判断1>:
    <执行1>
elif <条件判断2>:
    <执行2>
elif <条件判断3>:
    <执行3>
else:
    <执行4>
```

只要判断条件是非零数值、非空字符串、非空list等，就判断为`True`，否则为`False`。

### match（python 3.10以上）

`match`语句可以匹配简单的单个值，还可以匹配多个值、匹配一定范围，并且把匹配后的值绑定到变量

```python
match age:
    case x if x < 10:
        print(f'< 10 years old: {x}')
    case 10:
        print('10 years old.')
    case 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18:
        print('11~18 years old.')
    case 19:
        print('19 years old.')
    case _:
        print('not sure.')
```

……还可以匹配列表，功能非常强大。

```python
args = ['gcc', 'hello.c', 'world.c']
# args = ['clean']
# args = ['gcc']

match args:
    # 如果仅出现gcc，报错:
    case ['gcc']:
        print('gcc: missing source file(s).')
    # 出现gcc，且至少指定了一个文件:
    case ['gcc', file1, *files]:
        print('gcc compile: ' + file1 + ', ' + ', '.join(files))
    # 仅出现clean:
    case ['clean']:
        print('clean')
    case _:
        print('invalid command.')
```

第二个`case ['gcc', file1, *files]`表示列表第一个字符串是`'gcc'`，第二个字符串绑定到变量`file1`，后面的任意个字符串绑定到`*files`（符号`*`的作用将在函数的参数中讲解），它实际上表示至少指定一个文件。

## 循环

### for

```python
magicians = ['alice', 'david', 'carolina'] 
for magician in magicians: 
	print(f"{magician.title()}, that was a great trick!")
```

```python
for value in range(1, 5): 
	print(value)
```

### while


# 函数

## 定义

用`def`来定义函数

```python
"""
这是文档字符串，python用它来生成有关程序中函数的文档
"""
def greet_user(username):
	print(f"buzenmoyangda, {username}!")

greet_user("humou") #输出：buzenmoyangda, humou!
```


## 传递实参

向函数传递实参的方法有很多，可使用**位置实参**，这要求实参的顺序与形参的顺序相同：

```python
def describe_person(person_name, person_age):
	print(f"{person_name.title()} is {person_age} years old, buzenmoyangda")# 嗯，整数型也可以直接传入f字符串里

describe_person("humou", 114514)
```

除此外，还可以使用 **关键词实参** 。它是传递给函数的名称值对，它让你无需考虑函数调用中的实参顺序。

```python
def describe_person(person_name, person_age):
	print(f"{person_name.title()} is {person_age} years old, buzenmoyangda")

describe_person(person_age = 114514, person_name = "humou") #这样也是可以的
```

定义函数`greet_user()`时，要求给变量`username`一个值。这个变量`username`是一个 **形参（parameter）**，而给它的值"humou"则是 **实参（argument）** .

## 默认值

可以为形参指定**默认值**，没有给次形参赋值的话就会取默认值
**注意，有默认值的参数不能放在没有默认值的参数的前面，否则会报错**

```python
def move(person_name, destination="SU"):
	print(f"{person_name.title()} is going to {destination}")

move("humou") # 输出：Humou is going to SU
```

有时候，需要让实参变为可选的，这样使用函数的人就只能在必要时使用额外的信息。

```python
def formatted_name(first_name, last_name, middle_name=''):
	if middle_name:
		full_name = f"{first_name.title()} {middle_name.title()} {last_name.title()}"
	else:
		full_name = f"{first_name.title()} {last_name.title()}"
	return full_name

humou = formatted_name("humou", "jibalao")
horse = formatted_name("J", "Horsen", "AK")

print(humou) # Humou Jibalao
print(horse) # J Ak Horsen
```

## 实参错误

调用函数的时候，如果传入的参数数量不对或参数类型不能被函数所接受，会报`TypeError`的错误：

```python
>>> abs(1, 2)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: abs() takes exactly one argument (2 given)
```

## 传递列表

将列表传递给函数后，函数就可对其进行修改。

```python
"""
模拟打印每个设计，直到没有未打印的设计为止
打印每个设计后,都将其移到列表completed_models中
"""
def print_models(unprinted_designs, completed_models):
    while unprinted_designs:
        current_design = unprinted_designs.pop()
        print(f"Printing model: {current_design}")
        completed_models.append(current_design)


def show_completed_models(completed_models):
    print("\nThe following models hane been printed: ")
    for completed_model in completed_models:
        print(completed_model)

# 首先创建一个列表，其中包含一些要打印的设计
unprinted_designs = ['phone case', 'robot pendant', 'dodecahedron']
completed_models = []

# 输出：
# Printing model: dodecahedron
# Printing model: robot pendant
# Printing model: phone case
#
# The following models hane been printed:
# dodecahedron
# robot pendant
# phone case


print_models(unprinted_designs, completed_models)
show_completed_models(completed_models)

print(unprinted_designs) # 输出: []
print(completed_models) # 输出：['dodecahedron', 'robot pendant', 'phone case']
```

如果要以列表为实参而不想改变列表原值的话，可以传入列表的副本.不过尽量还是将原列表传给函数，这样能减少创建副本的时间与内存

```python
def print_models(unprinted_designs, completed_models):
    while unprinted_designs:
        """
        模拟打印每个设计，直到没有未打印的设计为止
        打印每个设计后,都将其移到列表completed_models中
        """
        current_design = unprinted_designs.pop()
        print(f"Printing model: {current_design}")
        completed_models.append(current_design)


def show_completed_models(completed_models):
    print("\nThe following models hane been printed: ")
    for completed_model in completed_models:
        print(completed_model)

unprinted_designs = ['phone case', 'robot pendant', 'dodecahedron']
completed_models = []

print_models(unprinted_designs[:], completed_models) # 像这样传入列表副本!
show_completed_models(completed_models)

print(unprinted_designs) # 输出: ['phone case', 'robot pendant', 'dodecahedron']
print(completed_models) # 输出：['dodecahedron', 'robot pendant', 'phone case']

# unprinted_designs没有被改动！
```

## 可变参数

**可以将任意数量的参数传入参数名前带`*`的形参名，python会创建一个这个名字的空元组，并将所有值都封装到这个元组中。（它应该是最后一个形参）**

```python
def make_pizza(*toppings):
    """打印顾客点的所有配料"""
    print(toppings)


make_pizza('pepperoni')
make_pizza('mushrooms', 'green peppers', 'extra cheese')

# 输出：
# ('pepperoni',)
# ('mushrooms', 'green peppers', 'extra cheese')
```

注意，`toppings`与`*toppings`是不同的！

```python
def make_pizza(*toppings):
    """打印顾客点的所有配料"""
    print(*toppings)
    


make_pizza('pepperoni')
make_pizza('mushrooms', 'green peppers', 'extra cheese')

# 输出：
# pepperoni
# mushrooms green peppers extra cheese
```

（基本上不用在乎`*toppings`是什么东西，一般用不到）

如果已经有一个list或者tuple，要调用一个可变参数怎么办？可以这样做：

```python
>>> nums = [1, 2, 3]
>>> calc(*nums)
14
```

`*nums`表示把`nums`这个list的所有元素作为可变参数传进去。这种写法相当有用，而且很常见。

### 关键字参数

**类似地，前面带`**`的则能接受任意数量的关键字形参, `XX`返回字典，而`**XX`是非法的**

```python
def build_profile(first, last, **user_info):
    user_info['first_name'] = first
    user_info['last_name'] = last
    return user_info

user_profile = build_profile(
    'non-famous', 
    'physicist', 
    location = 'YiWuSanZhong', 
    field ='phisics'
)

print(user_profile) 
# {'location': 'YiWuSanZhong', 'field': 'phisics', 'first_name': 'non-famous', 'last_name': 'physicist'}

user_profile = build_profile(
    'E', 
    'BAOBAO', 
    age = 114514, job = 'student', 
    hobbies = ["python", "java"]
)

print(user_profile) 
# {'age': 114514, 'job': 'student', 'hobbies': ['python', 'java'], 'first_name': 'E', 'last_name': 'BAOBAO'}
```

当然，有dict又要调用时也有类似于可变参数的简便写法。

```python
def person(name, age, **kw):
	print(name, age, kw)

dic1 = {'name': "humou", 'age': 114514, 'city': "SU", 'job': "shit"}

person(**dic1)

# 啊，是的，就连普通的参数都能像这样传参
```

```python
def person(name, age, **kw):
	print({'name': name, 'age': age, **kw}) # 这是合并dict的简便写法
	print([name, age, *(kw.values())]) # 类似地，合并tuple或list时就可以这样
	# 哦，我们之前见到过它！

list1 = ["humou", 114514]
dic1 = {'city': "SU", 'job': "shit"}

# 甚至这样传参都可以……
person(*list1, **dic1)
```

嗯，这里有很多种方法来传参，虽然可以组合多达5种参数，**但不要同时使用太多的组合，否则函数接口的可理解性很差。**

如果要限制关键字参数的名字，就可以用命名关键字参数，例如，只接收`city`和`job`作为关键字参数。这种方式定义的函数如下：

```python
def person(name, age, *, city, job):
    print(name, age, city, job)
```

和关键字参数`**kw`不同，命名关键字参数需要一个特殊分隔符`*`，`*`后面的参数被视为命名关键字参数。

调用方式如下：

```python
>>> person('Jack', 24, city='Beijing', job='Engineer')
Jack 24 Beijing Engineer
```

但是这样的话`*`后面的关键字参数就是不可忽略的了。

如果函数定义中已经有了一个可变参数，后面跟着的命名关键字参数就不再需要一个特殊分隔符`*`了：

```python
def person(name, age, *args, city, job):
    print(name, age, args, city, job)
```

命名关键字参数必须传入参数名，这和位置参数不同。如果没有传入参数名，调用将报错：

```python
>>> person('Jack', 24, 'Beijing', 'Engineer')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: person() missing 2 required keyword-only arguments: 'city' and 'job'
```

（呃，这不就完全相当于把普通形参写到可变参数后面了吗？）

# 高阶函数

## 装饰器

装饰器本质上是一个 Python 函数或类，它可以让其他函数或类在不需要做任何代码修改的前提下增加额外功能，装饰器的返回值也是一个函数/类对象。

本质上，decorator就是一个返回函数的高阶函数。所以，我们要定义一个能打印日志的decorator，可以定义如下：

```python
def log(func):
    def wrapper(*args, **kw):
        print('call %s():' % func.__name__)
        return func(*args, **kw)
    return wrapper
```

然后像这样：

```python
def now():
	print('2015-3-25')

now = log(now)
now()
"""
call now():
2015-3-25
"""
```

或者**借助Python的@语法，把decorator置于函数的定义处**：

```python
@log
def now():
    print('2015-3-25')
```

如果decorator本身需要传入参数，那就需要编写一个返回decorator的高阶函数，写出来会更复杂。比如，要自定义log的文本：

```python
def log(text):
    def decorator(func):
        def wrapper(*args, **kw):
            print('%s %s():' % (text, func.__name__))
            return func(*args, **kw)
        return wrapper
    return decorator
```

这个3层嵌套的decorator用法如下：

```py
@log('execute')
def now():
    print('2015-3-25')
```

执行结果如下：

```py
>>> now()
execute now():
2015-3-25
```

和两层嵌套的decorator相比，3层嵌套的效果是这样的：

```py
>>> now = log('execute')(now)
```

我们来剖析上面的语句，首先执行`log('execute')`，返回的是`decorator`函数，再调用返回的函数，参数是`now`函数，返回值最终是`wrapper`函数。

以上两种decorator的定义都没有问题，但还差最后一步。因为我们讲了函数也是对象，它有`__name__`等属性，但你去看经过decorator装饰之后的函数，它们的`__name__`已经从原来的`'now'`变成了`'wrapper'`：

```py
>>> now.__name__
'wrapper'
```

因为返回的那个`wrapper()`函数名字就是`'wrapper'`，所以，需要把原始函数的`__name__`等属性复制到`wrapper()`函数中，否则，有些依赖函数签名的代码执行就会出错。

不需要编写`wrapper.__name__ = func.__name__`这样的代码，Python内置的`functools.wraps`就是干这个事的，所以，一个完整的decorator的写法如下：

```py
import functools

def log(func):
    @functools.wraps(func)
    def wrapper(*args, **kw):
        print('call %s():' % func.__name__)
        return func(*args, **kw)
    return wrapper
```

或者针对带参数的decorator：

```py
import functools

def log(text):
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kw):
            print('%s %s():' % (text, func.__name__))
            return func(*args, **kw)
        return wrapper
    return decorator
```

`import functools`是导入`functools`模块。模块的概念稍候讲解。现在，只需记住在定义`wrapper()`的前面加上`@functools.wraps(func)`即可。

### 类装饰器

**另外，装饰器不仅可以是函数，还可以是类。** 相比函数装饰器，类装饰器具有灵活度大、高内聚、封装性等优点。使用类装饰器主要依靠类的`__call__`方法，当使用 @ 形式将装饰器附加到函数上时，就会调用此方法。

```python
class Foo(object):
    def __init__(self, func):
        self._func = func

    def __call__(self):
        print ('class decorator runing')
        self._func()
        print ('class decorator ending')

@Foo
def bar():
    print ('bar')

bar()
```

类装饰器也可带参数，带参数和不带参数的类装饰器有很大的不同。

`__init__` ：不再接收被装饰函数，而是接收传入参数。 `__call__` ：接收被装饰函数，实现装饰逻辑。

```py
class logger(object):
    def __init__(self, level='INFO'):
        self.level = level

    def __call__(self, func): # 接受函数
        def wrapper(*args, **kwargs):
            print("[{level}]: the function {func}() is running..."\
                .format(level=self.level, func=func.__name__))
            func(*args, **kwargs)
        return wrapper  #返回函数

@logger(level='WARNING')
def say(something):
    print("say {}!".format(something))

say("hello")
```

我们指定`WARNING`级别，运行一下，来看看输出。

```py
[WARNING]: the function say() is running...
say hello!
```

# 模块化编程
## 模块

**模块**是一个扩展名为`.py`的文件，可以将函数放在模块里然后在别的地方`import`或`from ... inport <函数名>` 来调用。

```python
# forImport.py
def say(name):
	print(f"my name is {name}")
```

```python
import forImport

forImport.say("Humou") # my name is Humou
```

为了避免模块名冲突，Python又引入了按目录来组织模块的方法，称为包（Package）。

请注意，每一个包目录下面都会有一个`__init__.py`的文件，这个文件是必须存在的，否则，Python就把这个目录当成普通目录，而不是一个包。`__init__.py`可以是空文件，也可以有Python代码，因为`__init__.py`本身就是一个模块。而且包中还可以套包（当然包里面的包也得有一个 `__init__.py`）。

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

' a test module '

__author__ = 'Michael Liao'

import sys

def test():
    args = sys.argv
    if len(args)==1:
        print('Hello, world!')
    elif len(args)==2:
        print('Hello, %s!' % args[1])
    else:
        print('Too many arguments!')

if __name__=='__main__':
    test()
```

任何模块代码的第一个字符串都被视为模块的文档注释。

使用`__author__`变量把作者写进去，这样当你公开源代码后别人就可以瞻仰你的大名。

注意到这两行代码：

```python
if __name__=='__main__':
    test()
```

当我们在命令行运行模块文件时，Python解释器把一个特殊变量`__name__`置为`__main__`，而如果在其他地方导入该模块时，`if`判断将失败，因此，这种`if`测试可以让一个模块通过命令行运行时执行一些额外的代码，最常见的就是运行测试。

## 访问限制

在一个模块中，我们可能会定义很多函数和变量，但有的函数和变量我们希望给别人使用，有的函数和变量我们希望仅仅在模块内部使用。在Python中，是通过`_`前缀来实现的。

事实上，之所以我们说，private函数和变量“不应该”被直接引用，而不是“不能”被直接引用，是因为**Python并没有一种方法可以完全限制访问private函数或变量，但是，从编程习惯上不应该引用private函数或变量。**

类似`__xxx__`这样的变量是特殊变量，可以被直接引用，但是有特殊用途，比如上面的`__author__`，`__name__`就是特殊变量，模块定义的文档注释也可以用特殊变量`__doc__`访问，我们自己的变量一般不要用这种变量名。

类似`_xxx`和`__xxx`这样的函数或变量就是非公开的（private），不应该被直接引用，比如`_abc`，`__abc`等；

## 模块搜索路径

默认情况下，Python解释器会搜索当前目录、所有已安装的内置模块和第三方模块，搜索路径存放在`sys`模块的`path`变量中。当我们试图加载一个模块时，Python会在指定的路径下搜索对应的.py文件，如果找不到，就会报错。

如果我们要添加自己的搜索目录，有两种方法：

一是直接修改`sys.path`，添加要搜索的目录：

```plain
>>> import sys
>>> sys.path.append('/Users/michael/my_py_scripts')
```

这种方法是在运行时修改，运行结束后失效。

第二种方法是设置环境变量`PYTHONPATH`，该环境变量的内容会被自动添加到模块搜索路径中。设置方式与设置Path环境变量类似。注意只需要添加我们自己的搜索路径，Python本身的搜索路径不受影响。
### 模块相关规范

1. 记得给函数写注释 
2. 给形参指定默认值是最好两边不要带空格
3. 给函数指定关键值实参时也是
4. 如果参数太多就这么写：

```python
def blabla(
    bla, 
    blah,
    huhu):
    function_body
```


# python特性

## 解包

## 迭代

[迭代器 - 廖雪峰的官方网站 (liaoxuefeng.com)](https://www.liaoxuefeng.com/wiki/1016959663602400/1017323698112640)

[python之迭代器和生成器全解--包含实现原理及应用场景_迭代器和生成器组合-CSDN博客](https://blog.csdn.net/yifengchaoran/article/details/113854853)

迭代属性是Python一大特性，也才允许我们通过for in 循环体遍历比如列表、字典等集合类型数据类型内的数据，或者用in成员函数判断某元素是否在某数据内存在、使用列表解析式等，让代码变得简洁明晰，如果想深入理解Python这一大特性，其实还需要深入了解 **迭代器和生成器** 的概念。

1. 可迭代
2. 迭代器
3. 生成器

三个概念的包含关系：可迭代＞迭代器＞生成器

### 可迭代

指实现了Python迭代协议，可以通过for in 循环体遍历的对象（如list、dict等内置数据类型、迭代器、生成器）。

判断是否可迭代的方法：

```python
>>> from typing import Iterable
>>> list1=[1,2,3]
>>> isinstance(list1,Iterable)
True
```

在Python中，迭代环境到处可见，主要有：

1. for in 循环
2. in成员判断运算 ( x in y)
3. 列表推导式[x for x in range(10]
4. map和reduce函数(map(func,a))
5. 列表及元组赋值语句（比如a,b=[1,2]）
6. next()

以上迭代环境，都依赖于迭代协议，对应调用的魔法函数也会有不同，以下罗列下不同的迭代环境，对应的魔法函数，后续自定义类时，如果需要这个类实例对象支持相应的迭代环境，则需要实现对应的魔法函数（详见 ==定制类==）

可迭代的对象（包括生成器），均可以通过`iter(obj)`，转化为迭代器

### 生成器

要创建一个generator，有很多种方法。第一种方法很简单，只要把一个列表生成式的`[]`改成`()`，就创建了一个generator：

```python
>>> L = [x * x for x in range(10)]
>>> L
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
>>> g = (x * x for x in range(10))
>>> g
<generator object <genexpr> at 0x1022ef630>
```

迭代器和生成器，均可以通过 `next(obj)` 的方式不断返回下一个值，遍历只能往前，不能往后，当遍历完毕后，`next(iteror)` 会抛出一个 `StopIteration` 异常

*关于迭代器和生成器的比较……*

1.  迭代器是个类，且需要实现__iter__和__next__魔法函数，语法相对来说较为冗余
2.  生成器是个使用yield的函数，相较而言，代码会更加少
3.  在同一代码内，生成器只能遍历一次

```python
>>> next(g)
0
>>> next(g)
1
>>> next(g)
4
>>> next(g)
9
>>> next(g)
16
>>> next(g)
25
>>> next(g)
36
>>> next(g)
49
>>> next(g)
64
>>> next(g)
81
>>> next(g)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
StopIteration
```

当然，上面这种不断调用`next(g)`实在是太变态了，正确的方法是使用`for`循环，因为generator也是可迭代对象：

```python
>>> g = (x * x for x in range(10))
>>> for n in g:
...     print(n)
... 
0
1
4
9
16
25
36
49
64
81
```

所以，我们创建了一个generator后，基本上永远不会调用`next()`，而是通过`for`循环来迭代它，并且不需要关心`StopIteration`的错误。

generator也可使用函数创建，比如，著名的斐波拉契数列（Fibonacci）：

```python
def fib(max):
    n, a, b = 0, 0, 1
    while n < max:
        yield b
        a, b = b, a + b
        n = n + 1
    return 'done'
```

如果一个函数定义中包含`yield`关键字，那么这个函数就不再是一个普通函数，而是一个generator函数，调用一个generator函数将返回一个generator：

```python
>>> f = fib(6)
>>> f
<generator object fib at 0x104feaaa0>
```

要写出这样的函数，要点在于：

1. 函数内部需要实现一个循环体，并实现返回值推导算法，并由yield返回每次推导出来的值
2. yield关键词，核心作用类似 `return`，将指定值或多个值返回给调用方（`next()`）。它可以记录此次返回或遍历的位置，返回数值之后，挂起，知道下一次执行 `next()`，再重新从挂起点接着运行（**类似断点的作用！**）

比如……

```python
def triangles():
	ans1 = [0, 1]
	while True:
		ans2 = []
		for i in range(1, len(ans1)):
			ans2.append(ans1[i] + ans1[i-1])
		yield ans2
		ans1 = [0, *ans2, 0]
```

这用以生成一个杨辉三角。

```python
>>> row = triangles()
>>> row
<generator object triangles at 0x0000000002BA1190>
>>> for i in range(10):
...     print(next(row))
...
[1]
[1, 1]
[1, 2, 1]
[1, 3, 3, 1]
[1, 4, 6, 4, 1]
[1, 5, 10, 10, 5, 1]
[1, 6, 15, 20, 15, 6, 1]
[1, 7, 21, 35, 35, 21, 7, 1]
[1, 8, 28, 56, 70, 56, 28, 8, 1]
[1, 9, 36, 84, 126, 126, 84, 36, 9, 1]
```

### 迭代器

# 面向对象

面向对象的程序设计把计算机程序视为一组对象的集合，而每个对象都可以接收其他对象发过来的消息，并处理这些消息，计算机程序的执行就是一系列消息在各个对象之间传递。

模拟较复杂的物件（如电动汽车）时，需要解决一些有趣的问题。续航里程是电瓶的属性还是汽车的 属性呢？如果只描述一辆汽车，将方法get_range() 放在Battery 类中也许是合适的，但如果要 描述一家汽车制造商的整个产品线，也许应该将方法get_range() 移到ElectricCar 类中。在 这种情况下，get_range() 依然根据电瓶容量来确定续航里程，但报告的是一款汽车的续航里程。 也可以这样做：仍将方法get_range() 留在Battery 类中，但向它传递一个参数，如 car_model 。在这种情况下，方法get_range() 将根据电瓶容量和汽车型号报告续航里程。 这让你进入了程序员的另一个境界：解决上述问题时，从较高的逻辑层面（而不是语法层面）考虑； 考虑的不是Python，而是如何使用代码来表示实物。达到这种境界后，你会经常发现，对现实世界的 建模方法没有对错之分。有些方法的效率更高，但要找出效率最高的表示法，需要经过一定的实践。 只要代码像你希望的那样运行，就说明你做得很好！即便发现自己不得不多次尝试使用不同的方法来重写类，也不必气馁。要编写出高效、准确的代码，都得经过这样的过程。

## 类

类是创建实例的模板，而实例则是一个一个具体的对象，各个实例拥有的数据都互相独立，互不影响。

语法：

```python
class Person: #创建类
	def __init__(self, name, age): #构造器
		self.name = name
		self.age = age
	def say(self):
		print(f"I'm {self.name} and I'm {self.age} years old, buzenmoyangda!!")

if __name__ == '__main__':
	humou = Person('humou', 114514)
	humou.say()
```

类中的函数称为方法。`self`应当是所有方法的第一个参数。

创建实例时，有些属性无须通过形参来定义，可在方法`__init__()` 中为其指定默认值。

```python
class Person:
	def __init__(self, name, age, job="student"):
		self.name = name
		self.age = age
		self.job = job
```

和静态语言不同，Python允许对实例变量绑定任何数据，也就是说，**几乎可以随便在外部增加对象的属性**。

有些时候，你会看到以一个下划线开头的实例变量名，比如`_name`，这样的实例变量外部是可以访问的，但是，按照约定俗成的规定，当你看到这样的变量时，意思就是，“虽然我可以被访问，但是，请把我视为私有变量，不要随意访问”。

双下划线开头的实例变量是不是一定不能从外部访问呢？其实也不是。不能直接访问`__name`是因为Python解释器对外把`__name`变量改成了`_Student__name`，所以，仍然可以通过`_Student__name`来访问`__name`变量：

```python
>>> bart._Student__name
'Bart Simpson'
```

但是强烈建议你不要这么干，因为不同版本的Python解释器可能会把`__name`改成不同的变量名。

## 继承与多态

继承可以把父类的所有功能都直接拿过来，这样就不必重零做起，子类只需要新增自己特有的方法，也可以把父类不适合的方法覆盖重写。

继承语法：

```python
class Person: # 创建类
	def __init__(self, name, age): # 构造器
		self.name = name
		self.age = age

	def say(self):
		print(f"I'm {self.name} and I'm {self.age} years old, buzenmoyangda!!")


class King(Person):
	def __init__(self, name, age, power):
		super().__init__(name, age) # super() 访问父类
		self.power = power  
		
	def say(self):
		super().say()
		print(f"*{self.power}*")


if __name__ == "__main__":
	humou = Person('humou', 114514)
	humou.say()
	ebaobao = King("EBAOBAO", 31234234, "shit")
	ebaobao.say()
```

多态：在继承关系中，如果一个实例的数据类型是某个子类，那它的数据类型也可以被看做是父类。

动态语言的“鸭子类型”：并不要求严格的继承体系，一个对象只要“看起来像鸭子，走起路来像鸭子”（有某个方法），那它就可以被看做是鸭子。

如：Python的“file-like object“就是一种鸭子类型。对真正的文件对象，它有一个`read()`方法，返回其内容。但是，许多对象，只要有`read()`方法，都被视为“file-like object“。许多函数接收的参数就是“file-like object“，你不一定要传入真正的文件对象，完全可以传入任何实现了`read()`方法的对象。

## 获取对象信息

当我们拿到一个对象的引用时，如何知道这个对象是什么类型、有哪些方法呢？

函数：

1. `type()`：判断对象类型。
2. `isinstance(<obj>, <class>)`：判断一个对象是否是某种类型。
3. `dir()`：获得一个对象的所有属性和方法，返回一个包含字符串的list。
4. `hasattr(<obj>, <属性名（str）>)`：判断一个对象是否有某个属性
5. `getattr(<obj>, <attr>, (<default>))`：获取对象属性，若没有这个属性就报错或（如果有的话）返回默认值
6. `setattr(<obj>, <attr>, <value>)`：为属性赋值

## （静态？）类属性

给实例绑定属性的方法是通过实例变量，或者通过`self`变量：

```python
class Student(object):
    def __init__(self, name):
        self.name = name

s = Student('Bob')
s.score = 90
```

但是，如果`Student`类本身需要绑定一个属性呢？可以直接在class中定义属性，这种属性是类属性，归`Student`类所有：

```python
class Student(object):
    name = 'Student'
```

千万不要对实例属性和类属性使用相同的名字，因为相同名称的实例属性将屏蔽掉类属性，但是当你删除实例属性后，再使用相同的名称，访问到的将是类属性。

## 类编码风格

你必须熟悉有些与类相关的编码风格问题，在编写的程序较复杂时尤其如此。 

类名应采用驼峰命名法 ，即将类名中的每个单词的首字母都大写，而不使用下划线。实例名和模块 名都采用小写格式，并在单词之间加上下划线。

 对于每个类，都应紧跟在类定义后面包含一个文档字符串。这种文档字符串简要地描述类的功能，并 遵循编写函数的文档字符串时采用的格式约定。

每个模块也都应包含一个文档字符串，对其中的类可 用于做什么进行描述。 

可使用空行来组织代码，但不要滥用。在类中，可使用一个空行来分隔方法；而在模块中，可使用两个空行来分隔类。

需要同时导入标准库中的模块和你编写的模块时，先编写导入标准库模块的import 语句，再添加一个空行，然后编写导入你自己编写的模块的import 语句。在包含多条import 语句的程序中，这 种做法让人更容易明白程序使用的各个模块都来自何处

## 定制类

# 异常

# IO流



