---
~
---
前篇：[[从（0）开始学 C ！]]

# qt creator

## 基本使用

新建：编辑 -> 文件 -> 新建项目 ->qt aplication 中 widgets application

运行程序：

1. 右键项目名 -> 运行
2. 右下角图标
3. ctrl + r

.pro 文件正常情况下不用被配置，但需要用到哪些功能后续会修改此文件。

核心文件是一个头文件，两个 c++ 文件，和一个 ui 文件。

| 快捷键                 | 功能           |
| ------------------- | ------------ |
| ctrl + z            | 撤销           |
| ctrl + alt +up/down | 将当前行复制至上/下一行 |
| ctrl + r            | 运行           |
| f5                  | 开始调试         |
| f2                  | 切换声明与定义      |
| f4                  | 切换头文件与源文件    |
| shift + f5          | 停止调试         |
| ctrl + b            | 构建当前项目       |
| ctrl + shift + b    | 构建所有项目       |

# c++ 基础

## 命名空间

命名空间的主要目的是避免命名冲突。命名冲突指的是在同一个作用域中，两个或多个标识符（如变量、函数、类等）具有相同的名字。如果没有命名空间，这种情况会导致编译器无法区分这些标识符，从而引发错误。

举个例子，假设你有两个库，`libA` 和 `libB`，它们都定义了一个函数 `max`。如果没有命名空间，当你同时使用这两个库时，编译器会不知道该调用哪个 `max` 函数。通过命名空间，你可以明确地告诉编译器使用哪个库中的 `max`，比如 `libA::max` 或 `libB::max`。

cpp复制

```cpp
// libA.h
namespace libA {
    int max(int a, int b) { return a > b ? a : b; }
}

// libB.h
namespace libB {
    int max(int a, int b) { return b > a ? b : a; }
}

// main.cpp
#include "libA.h"
#include "libB.h"

int main() {
    int a = libA::max(3, 5); // 使用 libA 的 max
    int b = libB::max(3, 5); // 使用 libB 的 max
    return 0;
}
```

如果没有命名空间，`max` 函数的调用就会产生冲突。也就是说，命名空间提供了一种机制，让你在需要时可以区分同名的标识符。

`std` 是 c++ 标准库的命名空间，它是 一个定义在 c++ 标准库中的所有类、变量和函数的命名空间。

就是说，如果你想使用标准库中的任何类函数或对象，就应该：

1. 使用 `std::` 前缀。
2. 使用 `using namespace std;` 。

### std 包含内容

`std` 命名空间包含了许多类，函数和对象，如：

- 输入输出库（`std::cout`, `std::cin`, `std::endl` 等）
- 容器类（`std::vector`, `std::map`, `std::set` 等）
- 字符串类（`std::string`）
- 异常类（`std::exception` 及其相关子类）
- 算法（`std::sort`, `std::find` 等）
- 使用工具（`std::pair`, `std::tuple` 等）
- 等等……

`std` 命名空间是 c++ 编程的基础部分，理解和正确使用它对于编写见状和搞笑的 c++ 代码至关重要！

**对于小型代码或示例代码，使用标准命名空间通常是安全的。但遂于大型项目或库，建议显式使用 `std::` 前缀，以避免潜在的名称冲突，并提高代码的可读性和可维护性。**

### 自定义命名空间

创建自己的命名空间是 c++ 中组织代码的一种好方法，命名空间可以帮助避免名称冲突，并清晰地组织代码。

```cpp
#ifndef CIR_H
#define CIR_H


namespace cir {
    double PI = 3.141592653;

    double getLenthOfCircle(double radius) {
        return 2 * PI * radius;
    }

    double getAreaOfCircle(double radius) {
        return PI * radius * radius;
    }
}

#endif // CIR_H
```

## 输入输出

c++ 中的输入与输出主要是通过标准库的输入输出流来实现的。最常用的是 iostream 库，它提供了用于输入和输出的基本流类，包括 `cin`、`cout`、`cerr` 与 `clog` 。

```cpp
#include <iostream>

using namespace std;

int main()
{
    int num;
    cout << "Enter a number: ";
    cin >> num;
    cout << "you entered: " << num << endl;
    clog << "Logging: user entered a number." << endl;
    return 0;
}
```

`cout << ""` 这样的语句的语法看起来不像是对象或函数之类的东西，有点奇怪，事实上这样的语句是基于 C++ 的对象和操作符重载机制实现的：

首先，`cout` 是什么东西？它是一个全局对象，属于 `std::ostream` 类型。`std::ostream` 是标准库中定义的一个类，专门用于输出流操作。`cout` 是这个类的一个实例，它与标准输出（通常是终端或屏幕）绑定。然后，`<<` 是一个操作符，但它并不是普通的操作符，而是被 **重载** 了的。对于 `std::ostream` 类，`<<` 操作符被重载为一种特殊的输出操作。

```cpp
std::ostream& operator<<(const char* str){...}
```

但 *重载操作符* 又是什么东西？

重载操作符（Operator Overloading）是 C++ 中一个非常强大的特性，它允许开发者为类定义自定义的操作符行为。简单来说，就是让类的对象可以使用普通的操作符（如 `+`、`-`、`<<` 等）进行操作，就像内置类型（如 `int`、`float`）一样。这种特性在 C 中是没有的，是 C++ 面向对象特性的一部分。

举个例子，假设我们有一个 `Vector` 类，表示二维向量。我们可以通过重载 `+` 操作符，让两个 `Vector` 对象可以直接相加：

```cpp
class Vector {
public:
    int x, y;

    Vector(int x, int y) : x(x), y(y) {}

    // 重载 + 操作符
    Vector operator+(const Vector& other) const {
        return Vector(x + other.x, y + other.y);
    }
};

int main() {
    Vector a(1, 2);
    Vector b(3, 4);
    Vector c = a + b; // 调用重载的 + 操作符
    return 0;
}
```

在这个例子中，`a + b` 看起来像普通的加法运算，但实际上调用了 `Vector` 类中重载的 `operator+` 函数，总之更多具体的东西会在后文中介绍。

## 基本数据类型

跟 C 语言类似，只是 C 语言中没有 bool 类型。C 语言中编译器支持 C99 的情况下引用 `<stdbool.h>` 头文件才有这个类型。

|        数据类型         |        大小        |       用途        |
| :-----------------: | :--------------: | :-------------: |
|         int         | 至少 16 位，通常是 32 位 |      一般的整数      |
|      short int      |     至少 16 位      |      较小的整数      |
|      long int       |     至少 32 位      |      较大的整数      |
|    long long int    |     至少 64 位      |     超级大的整数      |
|    unsigned int     |      同 int       |      非负整数       |
|        float        |     通常 32 位      |  精度约为 6-7 位的小数  |
|       double        |     通常 64 位      | 精度约为 15-16 位的小数 |
|     long double     |     80 位或更多      |    精度超级高的小数     |
|        char         |       8 位        |    单个字符或小整数     |
|    unsigned char    |       8 位        | 存储较大的字符或作为字节使用  |
|     signed char     |       8 位        |  明确作为带符号字符或小整数  |
|        bool         |      通常 8 位      |       真值        |

注意，基本数据类型所占的空间大小是由编译器和运行时环境（如操作系统和硬件平台）决定的（C 语言也是这样），因此它们的大小并不是绝对固定的。C++ 标准只是对基本数据类型的大小做了一些规定，确保它们满足一定的最小范围。

当然，数据类型大小不确定有时可能会导致一些问题。如果需要保证数据类型大小的一致性，可以使用 C++11 提供的固定宽度整数类型，它们在头文件 `<cstdint>` 中定义：

- `int8_t`、`uint8_t`
- `int16_t`、`uint16_t`
- `int32_t`、`uint32_t`
- `int64_t`、`uint64_t`

这些类型保证了固定的字节长度，可以在跨平台开发中避免因数据类型大小不同而产生的问题。

## 字面量

### 数值型

C++ 中引入了一个头文件 `<climits>`（在 C 中是 `<limits.h>`），它提供了关于各种整形数据的极限值：

- `INT_MAX`：int 最大值
- `INT_MIN`：int 最小值
- `UINT_MAX` 、`UINT_MIN` 
- `LONG_MAX` 、`LONG_MIN` 
- `LLONG_MAX` 、`LLONG_MIN` 

### 布尔型

true、false

## 流程控制

跟 C 一样，不过可以在 for 循环中的初始条件中定义变量。

## 函数

一段执行特定任务的代码块，跟 C 语言一样，不过 C++ 中还有……

### 内联函数

内联函数（inline Function）是 C++ 中的一种特殊的函数。普通的函数会在新开辟出的一块栈内存中运行，而内联函数编译后会直接在每个调用点展开，在预处理阶段将函数调用直接替换为函数定义中函数体内的代码，一定程度上避免了诸如参数传递与栈操作之类的函数调用的开销，**适用于优化小型，频繁调用的函数** 。

声明内联函数很简单，只需在通常的函数声明前添加 `inline` 关键字即可。

**注意事项：**

1. **声明函数为内联函数不一定真的会让函数内联！** 像一些复杂的函数或递归函数可能就不会被内联，函数是否被内联最终是由编译器决定的！
2. 由于是对调用处代码的替换，故函数的完整定义（**而非仅仅是声明**）对每个使用它的文件都必须是可见的，故通常会将内联函数定义在头文件中。
3. 内联函数一定程度上提高了程序运行的速度，但像这样多次使用的话（尤其是对于大型函数或递归函数而言）可能会增加程序的大小，反而可能导致性能下降，故 **不应滥用内联函数！**

### 匿名函数