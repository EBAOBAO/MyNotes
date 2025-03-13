# manim学习笔记

标签（空格分隔）： manim 菜 菜 菜

---

## 1. manim配置

目前，windows配置最新的manimgl的方法：

https://docs.manim.org.cn/getting_started/installation.html

这是最新版本的manim，我的电脑运行不了，老是报错，所以咱用的是比较旧版本的manim（去[github的源项目上的cairo-backend分支](https://github.com/3b1b/manim/tree/cairo-backend)下载源码）。咱下面用的代码也是基于这个的，这个新旧版本差别应该也不算很大，但至少配置起来比较麻烦：

https://docs.manim.org.cn/cairo-backend/installation/windows.html

这个文档中比较有意思的东西还有教你怎么用VScode调试manim，下面我来为像我这样的编程菜鸟做一个补充：不知道launch.json在哪里的话，只要看一下上面工具栏里的`运行(R)` -> `添加配置`，再随便点一个（先安装好python的官方扩展！）就有launch.json跳出来了，然后按这个文档里编辑它即可

## 2. Hello World! —— 第一个manim程序

用VScode打开manim.py所在目录（即manim的官方库clone下来的根目录），新建一个Python文件（这个文件最好就建在那里，我是在那里建了个文件夹叫manim-learning的，今后创建的文件就都在那里写）叫`HelloWorld`，然后写入以下内容：

```python
from manimlib.imports import *

class Hello_World(Scene):
    def construct(self):
        
        helloworld = TextMobject("Hello Word", color = BLUE)
        
        self.play(Write(helloworld))
        self.wait(1)
```

在cmd中测试：

```
python -m manim 文件路径\文件.py Hello_World -pl
```

或直接在vscode里按`f5`运行，如果你已经配置好vscode的话

## 3. 笔记（一）
（一）
```python
from manimlib.imports import *

class Hello_World(Scene): ## 创建继承自Scene的一个类
    ## manim调用construct方法来创建动画，这个方法可以说是必不可少
    def construct(self):
        helloworld = TextMobject("Hello World", color = RED) # 创建一TextMobject对象名为helloworld,颜色是RED
        ## 也可直接输入十六进制的颜色代码或其他颜色名称（可在manimlib.constants的COLOR_MAP里查到） 

        rectangle = Rectangle(color=BLUE) # 创建一矩形对象
        rectangle.surround(helloworld) ## 该矩形刚好包裹住helloworld

        group1 = VGroup(helloworld, rectangle) ## 将helloworld与rectangle合并到一个VGroup里，这样对一堆Mobject操作起来比较方便

        hellomanim = TextMobject("Hello Manim", color = BLUE)
        hellomanim.scale(2.5) ## 设置hellomanim大小

        
        rec2 = Rectangle(color=BLUE)
        rec2.surround(hellomanim)

        group2 = VGroup(hellomanim, rec2)


        self.play(Write(helloworld)) ## 写下helloworld对象对应文本
        self.wait(1) ## 等待一秒
        self.play(FadeIn(rectangle)) ## 渐入显示rectangle

        ## self.play()里可以播放各种动画方式
        ## 常见的有Write, FadeIn, FadeOut, Transform等

        self.wait(1)
        self.play(ApplyMethod(group1.scale, 2.5)) ## 将group1整体放大2.5倍
        self.wait(1)
        self.play(Transform(group1, group2))
        self.wait(2)
```
（二）
```python
class Basic_Shapes(Scene):
    def construct(self):
        ## 代码比较多的时候最好自己有一个逻辑组织

        ## Making object

        ## 建立各种图形，常用图形及其对应名称如下：
        ## 圆：Circle
        ## 圆环：Annulus
        ## 椭圆：Elipse
        ## 方形：Square
        ## 矩形：Rectangle
        ## 三角形：Triangle
        ## 多边形：Polygon

        ## 颜色（color），内部填充色（fill_color），不透明度（fill_opacity），高度（height），宽度（width）等属性自己试一下就明确了
        ## 这些都是小写，可缺省
        ## 也可用set_XXX来赋予属性。例：square.set_color(RED)

        ring = Annulus(inner_radius=.4, outer_radius=1, color=BLUE)
        square = Square(color=ORANGE, fill_color=ORANGE, fill_opacity=0.5)
        rect = Rectangle(height=3.2, width=1.2, color=PINK, fill_color=PINK, fill_opacity=0.5)

        line01 = Line(np.array([0, 3.6, 0]), np.array([0, 2, 0]), color=BLUE)
        line02 = Line(np.array([-1, 2, 0]), np.array([-1, -1, 0]), color=BLUE)
        line03 = Line(np.array([1, 2, 0]), np.array([1, 0.5, 0]), color=BLUE)

        ## position

        ## 这里用shift方法移动了图形的位置，下面再详细讲解
        ring.shift(UP * 2)
        square.shift(LEFT + DOWN * 2)
        rect.shift(RIGHT + DOWN * (3.2/2 - 0.5))

        ## Showing object
        self.add(line01)
        self.play(GrowFromCenter(ring))
        self.wait(0.5)
        self.play(FadeIn(line02), FadeIn(line03))
        self.wait(0.5)
        self.play(FadeInFromDown(square))
        self.play(FadeInFromDown(rect))
        self.wait()
```

### 关于图形位移的详解

- shift方法本身接收一个向量作为输入变量，我们在其中用了DOWN,LEFT,RIGHT,UP等常量，它们在manimlib.constants中，其效果等同于将图形往对应方向移动一个单位，也就是说

> np.array([1, 2, 0])  <=>   UP * 2 + RIGHT

- 一个默认的圆（Circle）半径为一个单位，默认动画场景高度为8个单位

- 除shift方法外，改变元素位置的方法还有如：

```python
B.next_to(A, vector) ## 让B在vector的方向上紧挨着A
B.rotate(degree) ## 让B旋转degree(弧度，如np.pi/2)
```

- 直接使用shift等方式改变的位置是没有动画的，要动画的话可以用`self.play(ApplyMethod(A.shift, vecter))`来实现A以向量vector进行移动的动画

打靶练习：

```python
class Shoot(Scene):
    def construct(self):


        circle01 = Circle(color=BLUE)
        circle02 = Circle(color=RED, fill_color=RED, fill_opacity=1)
        circle02.scale(0.1)
        line01 = Line(np.array([-1, 0, 0]), np.array([1, 0, 0]), color=RED)
        line02 = Line(np.array([0, 1, 0]), np.array([0, -1, 0]), color=RED)
        aim_scope = VGroup(circle01, circle02, line01, line02)

        target_list = []
        for i in range(3):
            for j in range(5):
                target_ij = Circle(color=YELLOW, fill_color=YELLOW, fill_opacity=0.4)
                target_ij.scale(0.4)
                target_ij.shift(np.array([-4 + j * 2, -2 + i * 2, 0]))
                self.play(FadeIn(target_ij))
                target_list.append(target_ij)

        self.wait(1)

        def shoot_ij(i, j):
            target_ij = target_list[j + i * 5]
            self.play(ApplyMethod(aim_scope.next_to, target_ij, 0))
            self.play(ApplyMethod(target_ij.set_fill, GREY), ApplyMethod(target_ij.set_color, GREY))
            self.wait(0.5)
            ij = TexMobject("(%d, %d)" % (i, j), color=GREY)
            ij.next_to(target_ij, DOWN)
            self.play(Write(ij))
            self.wait(1)
            return 0

        self.add(aim_scope)
        self.play(ApplyMethod(aim_scope.shift, DOWN*3 + LEFT*6.1))
        shoot_ij(0, 1)
        shoot_ij(2, 0)
        shoot_ij(1, 3)
        shoot_ij(0, 0)
        shoot_ij(2, 4) 
        self.wait()
```

练习：LOVE DEATH & ROBOTS
```python
from manimlib.imports import *

class Love_Death_And_Robots(Scene):
    def construct(self):
        # love
        s1 = Square(color=RED, fill_color=RED, fill_opacity=0.5)
        s1.scale(2**0.5/2)
        s1.rotate(np.pi/4)
        c1 = Circle(radius=2**0.5/2, color=RED, fill_color=RED, fill_opacity=0.5)
        c1.shift(np.array([-0.5, 0.5, 0]))
        c2 = Circle(radius=2**0.5/2, color=RED, fill_color=RED, fill_opacity=0.5)
        c2.shift(np.array([0.5, 0.5, 0]))
        love = VGroup(s1, c1, c2)

        # death
        rec1 = Rectangle(height=0.5, width=np.sqrt(2)*2, color=RED, fill_color=RED, fill_opacity=0.5)
        rec2 = Rectangle(height=0.5, width=np.sqrt(2)*2, color=RED, fill_color=RED, fill_opacity=0.5)
        rec1.rotate(np.pi/4)
        rec2.rotate(-np.pi/4)
        death = VGroup(rec1, rec2)

        # robots
        s2 = Square(color=RED, fill_color=RED, fill_opacity=0.4)
        c3 = Circle(radius=0.3, color=RED, fill_color=BLACK, fill_opacity=0.5)
        c4 = Circle(radius=0.3, color=RED, fill_color=BLACK, fill_opacity=0.5)
        c3.shift(UP * 0.4 + LEFT * 0.5)
        c4.shift(UP * 0.4 + RIGHT * 0.5)
        robots = VGroup(s2, c3, c4)

        robots.shift(RIGHT * 3)

        group1 = VGroup(love, death, robots)
        
        line = Line(np.array([-4.2, -1.5, 0]), np.array([4.2, -1.5, 0]), color=RED, height=0.2)

        text = TextMobject("LOVE DEATH \& ROBOTS", color=RED)
        text.scale(1.4)
        text.shift(DOWN * 1.6)

        group_all = VGroup(group1, line, text)

        self.play(ShowCreation(love))
        self.wait()
        self.play(ApplyMethod(love.shift, LEFT * 3))
        self.wait()
        self.play(ShowCreation(death))
        self.play(ShowCreation(robots))
        self.wait()
        self.play(ApplyMethod(group1.set_opacity, 1))
        self.play(ShowCreation(line))
        self.wait()
        self.play(Transform(line, text))
        self.wait()
        self.play(ApplyMethod(group_all.shift, UP * (3.3/2-1)))
        self.wait(3)
```



## 物体变换方法

在manim中，使用三维ndarray表示一个点的坐标

```
np.array([x, y, z])

np.array([x, y, 0]) # 在2d场景中，第三维度的坐标常设为0
```

一个单位的长度取决于`contents.py`中的`FRAME_HEIGHT`，它默认为8，即整个画面的总高度为8个单位，而画面的宽度有它和长宽比同时决定（14?）。

画面的中心为坐标原点，向右为x轴正方向，向上为y轴正方向。在`contents.py`中定义了一些常用的方向向量：

    RIGHT : 向右一个单位
    UP : 向上一个单位
    LEFT : 向左一个单位
    DOWN : 向下一个单位
    (3d)
    OUT : 向外一个单位
    IN : 向里一个单位
    
    沿对角线： UR,UL,DR,DL
    
    四边：
        TOP
        LEFT_SIDE
        RIGHT_SIDE
        BOTTOM

**同时，坐标之间可以根据向量的计算法则进行计算**

```
2*UP+3*RIGHT <=> np.array([3, 2, 0])
```

使用`shift(*vector)`方法可以根据传入的`vector`移动物体


