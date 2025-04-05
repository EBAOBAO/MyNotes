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

创建自己的命名空间是 c++ 中组织代码的一种好方法，命名空间可以帮助避免名称冲突，并清晰地组织代码。

```c
using namespace std;
```

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

```c
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

c++ 中的输入与输出主要是通过标准库的输入输出流来实现的。最常用的是 iostream 库，它提供了用于输入和输出的基本流类
