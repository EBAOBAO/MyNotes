---
~
---
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

比如说，你可以定义一个类 `MyClass`，然后让它的对象支持 `+`、`<<` 或 `==` 等操作符。这样，当你对 `MyClass` 的对象使用这些操作符时，C++ 会调用你定义的函数来执行相应的操作。

如果你熟悉 C 语言，可以把它看作是 C++ 对 C 的一种扩展，让代码更直观、更易读，同时保持灵活性。