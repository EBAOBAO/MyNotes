# 基础知识

ST：ST公司
M：微控制器（Microcontroller）

主要有四个系列：

- 高性能
- 主流
- 超低功耗
- 无线

![型号](stm32XingHao.png)  

在嵌入式开发领域，**"外设"** 是一个非常重要的概念，它指的是微控制器内部集成的各种功能模块，这些模块用于与外部世界进行交互。

……好吧，这可能会令大家感到难以理解，在我们的印象中，“外设” 应该是像键盘鼠标之类的连接到计算机上的外部设备才对，但这里的 “外设”  显然有着不同的含义。是这样的，在 STM32 中，“外设” 说的是除 CPU 之外的其他功能模块，也就是说 *“外” 是相对 CPU 而言的，CPU 是核心，负责执行指令和处理数据，而外设是辅助 CPU 完成特定任务的模块。* 虽然这些 “外” 设在物理上是位于 STM32 芯片的内部，但它们的功能是面向外部的，用于控制和管理外部设备或信号。下面是STM32F1系列的外设：

![片上资源/外设](stm32periph.png)

这些其实就是我们主要要学习的内容：主要学习外设，通过程序配置外设，来完成我们想要的功能。

注意这是STM32F1整个系列的外设，但并不是所有型号都拥有全部外设，比如C8T6就没有后四个。

这里深颜色的是 Cortex-M3 内核中的外设。Cortex-M3 是 ARM 公司推出的一款 32 位嵌入式微控制器内核，采用 armv7-M 架构。具有高性能、低功耗和低成本等特点，适用于各种嵌入式应用场景。ARM既指ARM公司，也指ARM处理器内核，ARM公司是全球领先的半导体知识产权（IP）提供商，全世界超过95%的智能手机和平板电脑都采用ARM架构，ARM公司设计ARM内核，半导体厂商完善内核周边电路并生产芯片它。也就是说一个 stm32 芯片就由内核，存储器，外设与总线系统构成。

![结构](stm32JieGou.png)

## 引脚定义

下面是芯片的引脚定义，*一般我们拿到新的芯片时，会着重看一下它的引脚定义，有时这个看完了我们就可以大概知道这个芯片是怎么使用的了*。

![引脚](YinJiao.png)

这里标红色的是电源相关引脚，蓝色的是最小系统相关的引脚，绿色的是IO口、功能口这些引脚。IO口推荐使用加粗的，没有的可能需要配置或是兼具其他功能，使用时需留意。

IO口电平IO口所能容忍的电压（有FT代表能容忍5V的电压，没有的就只能容忍）。

**默认复用功能是IO口上同时连接的外设功能引脚，是外设的端口与 GPIO 的连接关系，在配置IO口时可以选择时通用IO口还是复用功能。如果有两个功能同时复用在了一个IO口上而同时要用到的这两个功能，那就可以把其中一个复用功能重映射到其他端口上（前提是重定义功能的表里有对应的端口）。**  举个例子，如果要用 TIM2 的 CH1 通道输出，就只能在 PA0 上 输出。但如果既要用 USART 的 TX 引脚，又要用 TIM2 的 CH3 通道，TIM2_CH3 就可以从 PA2 换到 PB10 上。配置重映射是用 AFIO 来完成的。

VBAT：备用电池供电，可接一个3V的电池。系统断电时，备用电池可给内部的RTC时钟和备份寄存器提供电源。

TAMPER：侵入检测。

3、4：IO / 32.768Hz的RTC晶振。

OSC：系统主晶振，一般接8MHz的。

NRST：系统复位，N表示低电平复位。

VxxA：模拟部分电源，VSS负极，VDD正极。

WKUP：唤醒处于待机模式的STM32。

BOOT：配置启动模式（即程序开始运行的位置），一般情况下，程序都是在 Flash 程序存储器开始执行。

![启动](QiDonMoShi.png)

01 是用来做串口下载用的，如果没有 STLINK 也没有 JLINK，就可以用串口下载程序。

34、37-40：调试端口，用于调试与下载程序。STM32支持 SWD 与 JTAG 两种调试方式，SWD 需要 SWDIO 与 SWCLK 两根线，而 JTAG 需要 JTMS、JTCK、JTDI、JTDO、NJRST 五根线，STLINK 用的是 SWD 的方式。

最后一句的意思是 BOOT 的值只在上电复位后的一瞬间有效（20脚上电的瞬间是 BOOT1，之后就是 PB2 的功能了）。

STM32内部采用分区供电的方式，故供电口会较多（Vxx_1/2/3）。

## 最小系统电路

一般来说，单片机只有一个芯片是无法工作的，需要为它连接最基本的电路，这就是 **最小系统电路** 。

![最小系统电路](ZuiXiaoXiTongDianLu.png)

电源正负极间的电容可以保证供电电压的稳定，*设计电路时，一般只要遇到供电都会习惯性的加上几个滤波电容*。

## 安装

固件支持包：DFP文件

驱动：ARM -> STLINK -> USBDriver

JLINK：ARM -> Segger -> USBDriver

# cubeMX



# 建立工程

![工程架构](projectStructure.png)

目前STM32的开发方式主要有：

1. 基于寄存器的方式
2. 基于标准库与固件库的方式
3. 基于HAL库的方式（图形化界面）

这说的都是什么东西？标准库说的当然是

在 Keil 中，Group 是其项目管理器中的一个功能，它与 Keil 的构建系统紧密集成。通过添加 Group，开发者可以在 Keil 的项目窗口中清晰地看到项目的组织结构，方便对项目进行浏览和管理。新建一个STM32开发工程时，首先要在 Target 里添加Group并Add New Item。

通过在项目所在的文件夹中整理文件和文件夹结构也可以达到类似于在 Keil 中使用Group 的逻辑归类效果。虽然使用文件夹结构可以模拟 Group 的一些功能，但它们在项目管理和构建过程中扮演的角色不同。**通过添加 Group 还可以根据每个 Group 的特点和需求，定制不同的编译和链接参数，从而更好地控制代码的生成和优化过程，满足特定的开发需求，例如对某些关键模块进行更严格的优化或设置特定的警告级别等。** 如果你的项目主要依赖于Keil进行开发，那么使用Group功能可能会更加方便和高效。如果你的项目需要跨多个工具或平台，或者需要更广泛的文件系统功能，那么使用文件夹结构可能更合适。

在实际开发中，很多项目会结合使用这两种方法，即在文件系统中使用文件夹结构来组织文件，同时在Keil中使用Group来管理编译和链接过程。这样可以兼顾项目的组织性和构建效率。


除此外，在Keil uVision5中新建STM32开发项目时，在工程选项（魔术棒）中添加文件的头文件路径（Include Paths），其主要作用是告诉编译器在哪里可以找到项目中引用的头文件。




下面将会使用基于标准库的方式进行开发。

启动文件：固件库 -> Libraries -> CMSIS -> CM3 -> DeviceSupport -> ST -> STM32F10x -> startup -> arm

外设寄存器描述文件与配置时钟文件：固件库 -> Libraries -> CMSIS -> CM3 -> DeviceSupport -> ST -> STM32F10x

内核寄存器描述文件：固件库 -> Libraries -> CMSIS -> CM3 -> CoreSupport。

添加到工程：Source Group 1。

工程选项中添加文件的头文件路径：工程选项（魔术棒） -> C/C++ -> include Paths。

main函数：新建 User 文件夹 -> Target 添加组 -> add new item...

main函数应该时int类型返回值，void类型的参数。**而且文件的最后一行必须是空行！！**

调字体大小：扳手 -> Colors & Fonts -> C/C++，还有 asm。

文件改为 UTF-8 编码防止中文乱码：扳手 -> Editor -> Encoding，还可以在这里改缩进为4。

……如果想用寄存器开发 STM32 ，工程建到这里就可以了。

## 基于寄存器的方式点灯

配置调试器：工程选项 -> debug -> Use: ST-Link Debugger ->> Settings -> Flash Download -> Reset and Run 勾上

接下来要使用 RCC 寄存器使能 GPIOC 的时钟。GPIO 都是 APB2 的外设，故在 APB2 外设时钟使能寄存器 RCC_APB2ENR 中配置。

见参考手册：RCC -> RCC 寄存器 -> APB2 外设时钟使能寄存器 RCC_APB2ENR

之后需要配置 PC13 口的模式，见参考手册：GPIO  -> GPIO 高寄存器CRH -> 端口配置高寄存器 ->> 端口输出数据寄存器

```c
#include "stm32f10x.h"                  // Device header

int main()
{
	RCC->APB2ENR = 0x00000010;
	GPIOC->CRH = 0x00300000;
	GPIOC->ODR = 0x00002000; // 灯灭，改为全0灯亮
	while (1) {}
}
```

如果要做到只配置 PC13 而不影响其他位，还需要 `&=` 与 `|=` 这样的操作。

## 基于标准库的方式

添加库函数：新建 Library 文件夹（存库函数） -> 固件库 -> Libraries -> STM32标准外设驱动（STM32F10x_StdPeriph_Driver）-> src、inc -> Target 添加组 Library -> 添加已有文件 -> ctrl + A，add

接着配置库函数头文件包含关系（conf = configuration）以及存放中断函数的文件（it = interrupt）：固件库 -> Project -> STM32F10x_StdPeriph_Template -> conf 与 it 复制下来到 User -> 配置 Keil

最后还需要一个宏定义：注意 stm32f10x.h 的最后有

```c
#ifdef USE_STDPERIPH_DRIVER
  #include "stm32f10x_conf.h"
#endif
```

说明定义了 `USE_STDPERIPH_DRIVER` 一字符串后 `#include "stm32f10x_conf.h"` 才有效，

故：魔术棒（工程选项）-> C/C++ -> Define 中粘贴`USE_STDPERIPH_DRIVER` -> include Paths 添加 User 与 Library -> 三箱 -> 只读的放到最上面

库函数其实也就是间接配置寄存器，故其步骤一致：

```c
#include "stm32f10x.h"                  // Device header

int main()
{
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE); // 1. RCC_APB2 外设时钟控制 使能 GPIOC时钟
	GPIO_InitTypeDef GPIO_InitStructure;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_OD;
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_13;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOC, &GPIO_InitStructure); // 2. 配置端口模式
	GPIO_ResetBits(GPIOC, GPIO_Pin_13); // 3. 点灯！
	//GPIO_SetBits(GPIOC, GPIO_Pin_13); // 灭灯
	while (1) {}
}

```

在STM32的固件库中，`GPIO_InitTypeDef` 结构体是不需要动态分配内存的，因为它通常在栈上定义。而且在嵌入式编程中通常不推荐使用动态内存分配，因为它可能会导致内存碎片和其他问题，故在这里你应该新建一个结构体而非一个结构体指针！

```c
/**
  * @brief  Sets the selected data port bits.
  * @param  GPIOx: where x can be (A..G) to select the GPIO peripheral.
  * @param  GPIO_Pin: specifies the port bits to be written.
  *   This parameter can be any combination of GPIO_Pin_x where x can be (0..15).
  * @retval None
  */
void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
{
  /* Check the parameters */
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
  assert_param(IS_GPIO_PIN(GPIO_Pin));
  
  GPIOx->BSRR = GPIO_Pin;
}
```

这是写低电平的函数：

```c
/**
  * @brief  Clears the selected data port bits.
  * @param  GPIOx: where x can be (A..G) to select the GPIO peripheral.
  * @param  GPIO_Pin: specifies the port bits to be written.
  *   This parameter can be any combination of GPIO_Pin_x where x can be (0..15).
  * @retval None
  */
void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
{
  /* Check the parameters */
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
  assert_param(IS_GPIO_PIN(GPIO_Pin));
  
  GPIOx->BRR = GPIO_Pin;
}
```

## 启动文件选择

启动文件有许多类型，要根据芯片型号来选择：

![类型](QiDongWenJian.png)

# GPIO

![[GPIOJiBenJiaGou.png]]

GPIO（General Purpose Input Output）
: 通用输入输出口

GPIO 口的引脚电平是0~3.3V，部分可容忍5V（对输入而言，具体可看上面的表）。

STM32 中，所有的 GPIO 都是挂载在 APB2 外设总线上的，其中 GPIO 外设的名称是按照 GPIOA、GPIOB、GPIOC 等等这样来命名的，每个 GPIO 外设有16个引脚，编号从 0 到 15（PA0、PA1……）。

每个 GPIO 模块内，主要包含了寄存器和驱动器这些东西，内核可以通过 APB2 外设总线对寄存器进行读写，这样就能完成输出电平与读取电平的功能。

![IO](GPIO.png)

读写输出寄存器可以读写STM32中的”位带“区域：STM32 中专门分配的有一段地址区域，这段地址映射了RAM与外设寄存器所有的位，读写这段地址中的数据，就相当于读写所映射位置的某一位（虽然这种方式这里不会用到）。

GPIO 口可被配置为4种输入模式或4种输出模式。

输出模式

- 推挽输出：高低电平均有较强驱动能力，故也叫强推输出模式。此时STM32对IO口有绝对控制权。
- 开漏输出：可作为通信协议的驱动方式，如I2C通信，多机通信时，这个模式可以避免各个设备间的相互干扰。另外还可用于输出5V的电平信号。
- 复用推挽输出：对于普通的开漏/推挽输出，引脚的控制权来自于输出数据寄存器，想用其他外设来控制引脚就得用复用模式。
- 复用开漏输出

输入模式

- 浮空输入：使用浮空输入时，端口一定要接上一个连续的驱动源！
- 上拉输入
- 下拉输入
- 模拟输入

最大输出速度取值：
- `GPIO_Speed_2MHz`
- `GPIO_Speed_10MHz`
- `GPIO_Speed_50MHz`

通用输出推挽：`GPIO_Mode_Out_PP`
通用输出开漏：`GPIO_Mode_Out_OD`
复用输出推挽：`GPIO_Mode_AF_PP`
复用输出开漏：`GPIO_Mode_AF_OD`
输入上拉：`GPIO_Mode_IPU`
输入下拉：`GPIO_Mode_IPD`
输入浮空：`GPIO_Mode_IN_FLOATING`
模拟模式：`GPIO_Mode_AIN`

```
PP = Push Pull
OD = Open Drain
AF = Alternate Function
IPU = Input Pull-up
IPD = Input Pull-down
AIN = Analog Input
```

更多参考参考手册 -> GPIO 与 AFIO

（外设GPIO配置，寄存器描述）

## 操作

```c
#include "stm32f10x.h"                  // Device header

int main()
{
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE); // 1. RCC_APB2 外设时钟控制 使能 GPIOC时钟
	GPIO_InitTypeDef GPIO_InitStructure;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_OD;
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_13;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOC, &GPIO_InitStructure); // 2. 配置端口模式
	GPIO_ResetBits(GPIOC, GPIO_Pin_13); // 3. 点灯！
	//GPIO_SetBits(GPIOC, GPIO_Pin_13); // 灭灯
	while (1) {}
}

```

操作 STM32 的 GPIO 共需3个步骤：

1. 用 RCC 开启 GPIO 的时钟
2. 初始化 GPIO
3. 使用输入输出的函数控制 GPIO

这里总共涉及了 RCC 与 GPIO 两个外设，来看看它们的库函数！

### RCC 常用库函数

> .h 文件的最下面一般都是库函数所有函数的声明。

`void RCC_AHBPeriphClockCmd(uint32_t RCC_AHBPeriph, FunctionalState NewState);`
: RCC AHB 外设时钟控制

`void RCC_APB2PeriphClockCmd(uint32_t RCC_APB2Periph, FunctionalState NewState);`
: RCC APB2 外设时钟控制

`void RCC_APB1PeriphClockCmd(uint32_t RCC_APB1Periph, FunctionalState NewState);`
: RCC APB1 外设时钟控制

### GPIO 常用库函数

1. 初始化

`void GPIO_DeInit(GPIO_TypeDef* GPIOx);`
: 复位指定 GPIO 外设。

`void GPIO_AFIODeInit(void);`
: 复位指定 AFIO 外设。

`void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_InitTypeDef* GPIO_InitStruct)`
: 初始化 GPIO 口。

```c
/**
  * @brief  Initializes the GPIOx peripheral according to the specified
  *         parameters in the GPIO_InitStruct.
  * @param  GPIOx: where x can be (A..G) to select the GPIO peripheral.
  * @param  GPIO_InitStruct: pointer to a GPIO_InitTypeDef structure that
  *         contains the configuration information for the specified GPIO peripheral.
  * @retval None
  */
void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_InitTypeDef* GPIO_InitStruct)
```

参数2中的 `GPIO_InitStruct`：

```c
/** 
  * @brief  GPIO Init structure definition  
  */

typedef struct
{
  uint16_t GPIO_Pin;             /*!< Specifies the GPIO pins to be configured.
                                      This parameter can be any value of @ref GPIO_pins_define */

  GPIOSpeed_TypeDef GPIO_Speed;  /*!< Specifies the speed for the selected pins.
                                      This parameter can be a value of @ref GPIOSpeed_TypeDef */

  GPIOMode_TypeDef GPIO_Mode;    /*!< Specifies the operating mode for the selected pins.
                                      This parameter can be a value of @ref GPIOMode_TypeDef */
}GPIO_InitTypeDef;
```

结构体的三个成员：

```c
/** @defgroup GPIO_pins_define 
  * @{
  */

#define GPIO_Pin_0                 ((uint16_t)0x0001)  /*!< Pin 0 selected */
#define GPIO_Pin_1                 ((uint16_t)0x0002)  /*!< Pin 1 selected */
#define GPIO_Pin_2                 ((uint16_t)0x0004)  /*!< Pin 2 selected */
#define GPIO_Pin_3                 ((uint16_t)0x0008)  /*!< Pin 3 selected */
#define GPIO_Pin_4                 ((uint16_t)0x0010)  /*!< Pin 4 selected */
#define GPIO_Pin_5                 ((uint16_t)0x0020)  /*!< Pin 5 selected */
#define GPIO_Pin_6                 ((uint16_t)0x0040)  /*!< Pin 6 selected */
#define GPIO_Pin_7                 ((uint16_t)0x0080)  /*!< Pin 7 selected */
#define GPIO_Pin_8                 ((uint16_t)0x0100)  /*!< Pin 8 selected */
#define GPIO_Pin_9                 ((uint16_t)0x0200)  /*!< Pin 9 selected */
#define GPIO_Pin_10                ((uint16_t)0x0400)  /*!< Pin 10 selected */
#define GPIO_Pin_11                ((uint16_t)0x0800)  /*!< Pin 11 selected */
#define GPIO_Pin_12                ((uint16_t)0x1000)  /*!< Pin 12 selected */
#define GPIO_Pin_13                ((uint16_t)0x2000)  /*!< Pin 13 selected */
#define GPIO_Pin_14                ((uint16_t)0x4000)  /*!< Pin 14 selected */
#define GPIO_Pin_15                ((uint16_t)0x8000)  /*!< Pin 15 selected */
#define GPIO_Pin_All               ((uint16_t)0xFFFF)  /*!< All pins selected */
```

```c
typedef enum
{ GPIO_Mode_AIN = 0x0,
  GPIO_Mode_IN_FLOATING = 0x04,
  GPIO_Mode_IPD = 0x28,
  GPIO_Mode_IPU = 0x48,
  GPIO_Mode_Out_OD = 0x14,
  GPIO_Mode_Out_PP = 0x10,
  GPIO_Mode_AF_OD = 0x1C,
  GPIO_Mode_AF_PP = 0x18
}GPIOMode_TypeDef;
```

```c
/** 
  * @brief  Output Maximum frequency selection  
  */

typedef enum
{ 
  GPIO_Speed_10MHz = 1,
  GPIO_Speed_2MHz, 
  GPIO_Speed_50MHz
}GPIOSpeed_TypeDef;
```

`void GPIO_StructInit(GPIO_InitTypeDef* GPIO_InitStruct);`
: 为结构体变量赋默认值。

```c
void GPIO_StructInit(GPIO_InitTypeDef* GPIO_InitStruct)
{
  /* Reset GPIO init structure parameters values */
  GPIO_InitStruct->GPIO_Pin  = GPIO_Pin_All;
  GPIO_InitStruct->GPIO_Speed = GPIO_Speed_2MHz;
  GPIO_InitStruct->GPIO_Mode = GPIO_Mode_IN_FLOATING;
}
```

2. 读取

`uint8_t GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);`
: 读取输入数据寄存器某一个端口。

`uint16_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx);`
: 读取输入数据寄存器。

`uint8_t GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);`
: 读取输出数据寄存器某一个端口。

`uint16_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx);`
: 读取输出数据寄存器。

3. 写入

`void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);`
: 指定端口写入高电平

`void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);`
: 指定端口写入低电平

`void GPIO_WriteBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, BitAction BitVal);`
: 根据BitVal设置指定端口

```c
/**
  * @brief  Sets or clears the selected data port bit.
  * @param  GPIOx: where x can be (A..G) to select the GPIO peripheral.
  * @param  GPIO_Pin: specifies the port bit to be written.
  *   This parameter can be one of GPIO_Pin_x where x can be (0..15).
  * @param  BitVal: specifies the value to be written to the selected bit.
  *   This parameter can be one of the BitAction enum values:
  *     @arg Bit_RESET: to clear the port pin
  *     @arg Bit_SET: to set the port pin
  * @retval None
  */
void GPIO_WriteBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, BitAction BitVal)
```

第三个参数也可以用强转这么写：

```c
GPIO_WriteBit(GPIOA, GPIO_Pin_0, (BitAction)0);
```

`void GPIO_Write(GPIO_TypeDef* GPIOx, uint16_t PortVal);`
: 同时对 16 个端口写入。

```c
#include "stm32f10x.h"                  // Device header
#include "Delay.h"

int main()
{
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE); // 1. RCC_APB2 外设时钟控制 使能 GPIOC时钟
	GPIO_InitTypeDef GPIO_InitStructure;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_OD;
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_All;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOA, &GPIO_InitStructure); // 2. 配置端口模式
	uint16_t i = 0x0001;
	
	while (1) {
		GPIO_Write(GPIOA, ~i);
		Delay_ms(100);
		if (i == 0x0001 << 7) {
			i = 0x0001;
		} else {
			i <<= 1;
		}
	}
}
```

```c
#include "stm32f10x.h"                  // Device header
#include "Delay.h"

int main()
{
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE); // 1. RCC_APB2 外设时钟控制 使能 GPIOC时钟
	GPIO_InitTypeDef GPIO_InitStructure;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOA, &GPIO_InitStructure); // 2. 配置端口模式
	
	while (1) {
		GPIO_ResetBits(GPIOA, GPIO_Pin_8);
		Delay_ms(300);
		GPIO_SetBits(GPIOA, GPIO_Pin_8);
		Delay_ms(300);
	}
}
```

```c
#include "stm32f10x.h"
#include "delay.h"

int main(void)
{
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_0;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_2MHz;
	GPIO_Init(GPIOA, &GPIO_InitStruct);
	
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_1;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_IPU;
	GPIO_Init(GPIOA, &GPIO_InitStruct);
	
	while (1) {
		if (GPIO_ReadInputDataBit(GPIOA, GPIO_Pin_1) == Bit_RESET) {
			GPIO_WriteBit(GPIOA, GPIO_Pin_0, Bit_SET);
		} else {
			GPIO_WriteBit(GPIOA, GPIO_Pin_0, Bit_RESET);
		}
	}
}
```

```c
int main()
{
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE); // 1. RCC_APB2 外设时钟控制 使能 GPIOC时钟
	GPIO_InitTypeDef GPIO_InitStructure;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_All;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOA, &GPIO_InitStructure); // 2. 配置端口模式
	uint16_t i = 0x0001, li = 0x0001;
	
	while (1) {
		if (i >> 8 == 0) {
			i |= (1 << 8);
		} else {
			i &= ~(1 << 8);
		}
		GPIO_Write(GPIOA, ~i);
		Delay_ms(100);
		if (li >> 7 == 0x0001) {
			i = i - (0x0001 << 7) + 1;
			li = 0x0001;
		} else {
			i += li;
			li <<= 1;
		}
	}
}
```

# OLED 调试

- OLED（Organic Light Emitting Diode）：有机发光二极管
- OLED显示屏：性能优异的新型显示屏，具有功耗低、相应速度快、宽视角、轻薄柔韧等特点
- 0.96寸OLED模块：小巧玲珑、占用接口少、简单易用，是电子设计中非常常见的显示屏模块
- 供电：3~5.5V，通信协议：I2C（一般是四针脚）/SPI（一般是七针脚），分辨率：128*64

![OLED1](OLED4.png)

![OLED2](OLED7.png)

常用的单片机程序调试方式：

1. 串口调试：通过串口通信，将调试信息发送到电脑端，让电脑显示调试信息（所以一般设计pcb电路板的时候都会在边上留一个串口通信的引脚）。
2. 显示屏调试：直接将显示屏连接到单片机。
3. Keil 调试

还有点灯调试、注释调试等。

这里有已经写好的驱动函数模块，要使用它们也很容易：驱动函数模块找到三个文件 -> 复制到项目 *Hardware* 文件夹中 -> Keil 中 add existing files to group -> include paths 即可。

*OLED.c* 文件中默认 scl 脚接 PB08，sda 脚接 PB09 ，想改的话改这个文件中的 *引脚配置* 与 *引脚初始化* 的相关部分即可。

驱动函数：

（4行，16列）

![输入图片说明](OLEDFunction.png)

## 调试

工程选项 Debug 可以用来对调试选项进行配置，默认 Use ST-Link Debugger 在硬件上在线仿真，这需要将 STLink 与 STM32 都连接好，不想连接硬件的话也可以使用仿真器（Use Simulator）来调试。

调试方法：首先先编译，然后点击放大器带个 d 的图标进入调试模式。

点击菜单栏中的 Peripherals（外设）-> System Viewer（系统资源查看）就能看到所有的外设寄存器。

# 中断

*中断* : 在主程序运行过程中出现了特定的中断触发条件（中断源），使得  cpu 暂停当前正在运行的程序，转而处理中断程序，处理完成后又返回原来被暂停的位置继续运行。

简单的说，中断就是用以给 cpu 有时间执行一些紧急事件的，使用它能极大地提高程序运行效率，主程序不用再不断地查询是否有某些事件发生，而是可以放心地执行其他事情，有中断时再处理。就像你早上定了个闹钟，于是就可以放心地睡觉，时间到了闹钟会自动叫醒你，要是没有闹钟的话，隔段时间就得看下时间，就睡不好觉了。

*中断系统* : 管理和执行中断的逻辑结构。

*中断优先级* : 当有多个中断源同时申请中断时，cpu 根据中断源的轻重缓急进行裁决，优先响应更加紧急的中断源。

*中断嵌套* : 当一个中断程序在运行时，又有新的更高优先级的中断源申请中断，于是 cpu 又去处理新的那个中断程序。

![中断](Zhongduan.png)

## STM32 中断

STM32 中有 68 个可屏蔽中断通道（=中断源，虽然对于一个具体的型号可能没那么多，具体要以对应型号的数据手册为准），几乎所有的模块都能申请中断，像EXTI、TIM、ADC、USART、SPI、I2C、RTC 等外设。

参考手册p132表55列出了 STM32F10xx 的中断，其中灰色的是内核的中断，白色的就是 STM32 外设的中断了。像 WWDG，窗口看门狗，这个中断用以监测程序运行状态，如果你的程序卡死了，没有及时喂狗，窗口看门狗就会申请中断，将程序调到它的中断程序里，这样就能进行一些错误检查。

STM32 使用 NVIC（嵌套中断向量控制器） 统一管理中断，因为不应该将所有中断接到 cpu 上，每个中断通道都有 16 个可编程的优先等级，还可对优先级进行分组，进一步设置抢占优先级与响应优先级。

![NVIC](NVIC.png)

这里斜杠加个 n 的意思是一个外设可能占用多个中断通道。

![分组](NVICYouXianJi.png)

中断号就是那张表55中左数第二列的数字，数值小的优先响应。

## EXTI 外部中断

外部中断（EXTI，Extern Interrupt）是众多能产生中断的外设之一，它可以监测指定GPIO口的电平信号，当其指定的GPIO口产生 **电平变化** 时，EXTI 将立即向 NVIC 发出中断申请，经过 NVIC 裁决后即可中断 CPU 主程序，使 CPU 执行 EXTI 对应的中断程序。

支持的触发方式：上升沿/下降沿/双边沿/软件触发

支持的GPIO口：所有GPIO口，但相同的Pin（比如 PA0 与 PB0）不能同时触发中断。

通道数：16个GPIO_Pin，外加PVD输出、RTC闹钟、USB唤醒、以太网唤醒（**外部中断还可以从低功耗模式的停止模式下唤醒 STM32**），

触发响应方式：中断响应（申请中断，让 CPU 执行中断函数）/事件响应（让外部中断信号不是通往 CPU 而是通向其他外设用以触发其他外设的操作）

EXTI 基本结构：

![结构](EXTI.png)

EXTI 只有 16 个 GPIO_Pin 通道，所以会有 AFIO 来选择某个 GPIO 外设的引脚来连接到 EXTI 的通道里（正因如此但相同的 Pin 不能同时触发中断），且看上图知，外部中断的 9-5 与 15-10 分别被分到一个通道里，即 9-5 会触发同一个中断函数，15-10 也一样，编程时还需要在两个中断函数里再根据标志位区分是哪个中断进来的。

AFIO 主要用于引脚复用功能的选择和重定义（就相当于数据选择器），在 STM32 中， AFIO 主要完成两个任务：复用功能引脚重映射和中断引脚选择。

参考手册 p139 图19 给出了 EXTI 框图，注意到触发中断后首先置一个挂起寄存器，这就相当于是 *中断标志位* ，就可以读取这个寄存器判断是哪个通道触发的中断。

如果想要获取的信号是 **外部驱动的很快的突发信号**，这样就可以考虑使用外部中断，比如要用到旋转编码器的时候。

## 库函数

```c
void GPIO_AFIODeInit(void);		// 复位 AFIO 外设，清除 AFIO 外设的全部配置
void GPIO_PinLockConfig(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);		// 锁定 GPIO 配置
void GPIO_PinRemapConfig(uint32_t GPIO_Remap, FunctionalState NewState);	// 用以进行引脚重映射
void GPIO_EXTILineConfig(uint8_t GPIO_PortSource, uint8_t GPIO_PinSource);	// 配置 AFIO 数据选择器
```

exti 库函数：

```c
void EXTI_DeInit(void);		// 清除 EXTI 的配置
void EXTI_Init(EXTI_InitTypeDef* EXTI_InitStruct);		// 配置 EXTI 外设
void EXTI_StructInit(EXTI_InitTypeDef* EXTI_InitStruct);		// 把参数传递的结构体变量赋一个默认值。
void EXTI_GenerateSWInterrupt(uint32_t EXTI_Line);		// 软件触发外部中断
// 主程序中用以下两个函数
FlagStatus EXTI_GetFlagStatus(uint32_t EXTI_Line);		// 获取指定标志位是否被置1
void EXTI_ClearFlag(uint32_t EXTI_Line);				// 清除置1标志位
// 有的标志位比较紧急，置标志位后就会触发中断
// 如果想在中断函数中查看标志位或清除标志位就得用以下函数：
ITStatus EXTI_GetITStatus(uint32_t EXTI_Line);			// 获取指定中断标志位是否被置1
void EXTI_ClearITPendingBit(uint32_t EXTI_Line);		// 清除中断置1标志位

/**
  * @brief  Checks whether the specified EXTI line is asserted or not.
  * @param  EXTI_Line: specifies the EXTI line to check.
  *   This parameter can be:
  *     @arg EXTI_Linex: External interrupt line x where x(0..19)
  * @retval The new state of EXTI_Line (SET or RESET).
  */
ITStatus EXTI_GetITStatus(uint32_t EXTI_Line)
```

NVIC 库函数：

```c
void NVIC_PriorityGroupConfig(uint32_t NVIC_PriorityGroup); // 给中断分组
void NVIC_Init(NVIC_InitTypeDef* NVIC_InitStruct); // 初始化 NVIC
void NVIC_SetVectorTable(uint32_t NVIC_VectTab, uint32_t Offset); // 设置中断向量表
void NVIC_SystemLPConfig(uint8_t LowPowerMode, FunctionalState NewState); // 系统低功耗配置
void SysTick_CLKSourceConfig(uint32_t SysTick_CLKSource); // 
```

在  stm32 中，中断函数的名字是固定的，每一个中断通道都对应一个中断函数，中断函数的函数名可以参考一下启动文件：*那些以 `IRQHandler` 结尾的字符串就是中断函数的名字。*

## 实例

一. 红外传感器计数

先写个 *CountSensor.h* 头文件，.c 文件内容如下：

```c
#include "stm32f10x.h"                  // Device header
#include "Delay.h"

uint16_t CountSensor_Count;

void CountSensor_Init(void)
{
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE); // 开启 AFIO 时钟
	// NVIC 是内核外设，不需要开启时钟
	
	GPIO_InitTypeDef GPIO_InitStrusture;
	GPIO_InitStrusture.GPIO_Mode = GPIO_Mode_IPU;
	GPIO_InitStrusture.GPIO_Pin = GPIO_Pin_14;
	GPIO_InitStrusture.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOB, &GPIO_InitStrusture);
	
	GPIO_EXTILineConfig(GPIO_PortSourceGPIOB, GPIO_PinSource14);
	
	EXTI_InitTypeDef EXTI_InitStructure;
	EXTI_InitStructure.EXTI_Line = EXTI_Line14;
	EXTI_InitStructure.EXTI_LineCmd = ENABLE;
	EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
	EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;
	EXTI_Init(&EXTI_InitStructure);
	
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2); // 设置中断优先级分组
	NVIC_InitTypeDef NVIC_InitStructure;
	NVIC_InitStructure.NVIC_IRQChannel = EXTI15_10_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 1;
	NVIC_Init(&NVIC_InitStructure);
}

uint16_t CountSensor_Get(void)
{
	return CountSensor_Count;
}

void EXTI15_10_IRQHandler(void)
{
	if (EXTI_GetITStatus(EXTI_Line14) == SET)
	{
		Delay_ms(100);
		CountSensor_Count++;
		Delay_ms(100);
		EXTI_ClearITPendingBit(EXTI_Line14);
	}
}

```

然后主函数中先调用那个init再在死循环中的合适位置使用那个get即可。

一. 旋转编码器计数

AB相正向旋转与逆向旋转输出的波形不一样，[关于旋转编码器(EC11)的使用（判断旋转方向，按键处理）_ec11旋转编码器-CSDN博客](https://blog.csdn.net/Simon13_11/article/details/136049719)，[基于STM32F103C8T6之旋转编码器（EC11） - 知乎](https://zhuanlan.zhihu.com/p/615354701)

```c
#include "stm32f10x.h"                  // Device header

int16_t Encoder_Count;

void Encoder_Init(void)
{
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE); // 开启 AFIO 时钟
	// NVIC 是内核外设，不需要开启时钟
	
	GPIO_InitTypeDef GPIO_InitStrusture;
	GPIO_InitStrusture.GPIO_Mode = GPIO_Mode_IPU;
	GPIO_InitStrusture.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1;
	GPIO_InitStrusture.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOB, &GPIO_InitStrusture);
	
	GPIO_EXTILineConfig(GPIO_PortSourceGPIOB, GPIO_PinSource0);
	GPIO_EXTILineConfig(GPIO_PortSourceGPIOB, GPIO_PinSource1);
	
	EXTI_InitTypeDef EXTI_InitStructure;
	EXTI_InitStructure.EXTI_Line = EXTI_Line0 | EXTI_Line1;
	EXTI_InitStructure.EXTI_LineCmd = ENABLE;
	EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
	EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;
	EXTI_Init(&EXTI_InitStructure);
	
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2); // 设置中断优先级分组
	NVIC_InitTypeDef NVIC_InitStructure;
	NVIC_InitStructure.NVIC_IRQChannel = EXTI0_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 1;
	NVIC_Init(&NVIC_InitStructure);
	
	NVIC_InitStructure.NVIC_IRQChannel = EXTI1_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 2;
	NVIC_Init(&NVIC_InitStructure);
}

int16_t Encoder_Get()
{
	int16_t temp = Encoder_Count;
	//Encoder_Count = 0;
	return temp;
}

void EXTI0_IRQHandler()
{
	if (EXTI_GetITStatus(EXTI_Line0) == SET)
	{
		if (GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_1) == 0)
		{
			Encoder_Count--;
		}
		EXTI_ClearITPendingBit(EXTI_Line0);
	}
}

void EXTI1_IRQHandler()
{
	if (EXTI_GetITStatus(EXTI_Line1) == SET)
	{
		if (GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_0) == 0)
		{
			Encoder_Count++;
		}
		EXTI_ClearITPendingBit(EXTI_Line1);
	}
}

```


# AFIO

## 库函数

`void GPIO_PinRemapConfig(uint32_t GPIO_Remap, FunctionalState NewState)`
: 引脚重映射配置（第一个参数有非常多的选项，都是重映射的方式，每个凡是对应的重映射关系可以参考手册 *8.3 AFIO*）

PA15 引脚上电后默认复用为调试端口 JTDI ，故要重映射引脚后还要要关闭调试端口的复用，这里依旧是用上面那个函数（使用与 `SWJ（即 SWD 与 JTAG 两种调试方式）` 相关的 argument）。

```c
// 将定时器通道 1 从 PA1 重映射至 PA15
RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE);
GPIO_PinRemapConfig(GPIO_PartialRemap1_TIM2, ENABLE)
GPIO_PinRemapConfig(GPIO_Remap_SWJ_JTAGDisable, ENABLE)
```

# TIM 定时器

TIM（timer）定时器是STM32中功能最强大，结构最复杂的外设！！！

基本功能：可以对输入的时钟进行计数，并在数值达到设定值时触发中断。（定时触发中断/计数器）

**有 16 位计数器（执行计数定时的寄存器，来一个时钟加1）、预分频器（对计数器的时钟进行分频，让计数器更加灵活）、自动重装寄存器（计数的目标值，计多少个时钟申请中断）的 *时基单元***，在 72MHz（一般来说stm32的定时器基准时钟都是这个主频） 计数时钟下可事项最大 59.65s 的定时。

![[TIM.png]]

不仅具备基本的定时中断功能，而且还包含内外时钟源选择、输入捕获、输出比较、编码器接口、主从触发模式等多种功能。根据复杂度和应用场景分为高级定时器、通用定时器、基本定时器三种类型。

定时器类型及功能：

![[TIMtype.png]]

*STM32F103C8T6定时器资源只有TIM1~4，在操作外设之前看看这个芯片是不是有这个外设。*

通用定时器框图：

![[GTIMkuang.png]]

内部时钟的来源是 RCC_TIMxCLK ，其频率值一般就是系统主频 72MHz，对基本定时器而言，定时只能选择内部时钟，而其他定时器还能选择外部时钟

实际分频系数 = 预分频器值 + 1，计数器对预分频后的时钟进行计数，计数时钟每来一个上升沿，计数器的值就+1。CK_CNT = CK_PSC / (PSC + 1)，**定时频率CK_CNT_OV = CK_PSC/(PSC + 1)/(ARR  + 1)**

计数值等于自动重装值产生的中断被称为 **更新中断** ，这个中断之后会通往 NVIC ，再配置好 NVIC 的定时器通道就能得到 CPU 的响应了。除此外还会产生一个 **更新事件**，它不会触发中断，但可以触发内部其他电路的工作。

stm32定时器的一大特色就是 **主从触发模式** ，它能让内部硬件在不受程序控制的情况下实现自动运行，在某些情景下会极大减轻cpu的负担（将定时器的更新事件映射到触发输出 TRGO（Trigger Out）的位置，TRGO 直接接到 DAC 的触发转换引脚上，这样就不需要频繁中断主程序来调用中断函数触发 DAC 转换器了，只需要将更新事件通过主模式映射到 TRGO，当然也可以触发别的东西）。

对通用定时器与高级定时器来说，除向上计数模式外还支持向下计数模式与中央对齐模式

外部时钟模式2：TIMx_ETR 信号作为时钟信号。

外部时钟模式1：TRGI （触发输入）当作外部时钟使用（通过这一路的外部时钟：TIMx_ETR 引脚的信号、ITR信号（来自其他定时器，详见 *参考手册表78*）、TI1F_ED （输入捕获单元的 CH1 引脚边沿，时钟上升沿与下降沿均有效）、TI1FP1（CH1引脚时钟） 与 TI2FP2（CH2引脚时钟））

预分频器时序：ppt p58 ，之后几张 ppt 也重要。p62 RCC时钟树

## 输出比较与 PWM

![[OC.png]]

输出比较，OC（Output Compare），这个功能可用于输出 PWM 波形，而 PWM 波形又是驱动电机的必要条件，所以它很重要！

输出比较电路可以通过比较 CNT 计数器与 CCR 寄存器（Capture/Compare Register，捕获/比较寄存器，可查看上面那个定时器框图）值的关系来对输出电平进行置0置1翻转的操作，用于输出一定频率与占空比的 PWM 波形。

每个高级定时器与通用定时器都有 4 个输出比较通道，并且高级定时器的前 3 个通道额外拥有 *死区生成* （在一个管关闭时延迟一小段时间再导通互补的端口，避免短路引起的器件发热导致功率损耗）与 *互补输出* 的功能（用于驱动三相无刷电机）。

高级定时器前三个通道的输出比较部分框图：

![[HTIMout.png]]

通用定时器输出比较部分框图：

![[GTIMout.png]]

输出比较的八种模式：



PWM计算：

词汇：
IC
: Input Capture，输入捕获。

CC
: Capture/Compare，输入捕获与输出比较的单元。

PWM 波形
: Pulse Width Modulation，脉冲宽度调制。
: 在 *具有惯性 *的系统中，  可以通过一系列脉冲的宽度进行调制，来等效地获得所需要的模拟参量（不断通电、断电，通过通断电 “频率” 的不同来模拟连续电压变化带来的效果），常用于电机控速等领域。
: 参数：频率 1 / T，占空比 Ton / T，分辨率 = 占空比变化步距（占空比变化的细腻程度）

ref
: reference，参考信号。

**参数计算：**
- **PWM 频率 = 计数器更新频率 = CK_CNT_OV = CK_PSC/(PSC + 1)/(ARR  + 1)**
- **占空比 Duty = CCR/(ARR + 1)**
- **分辨率 reso = 1/ARR + 1**

手册：14.3.4，14.3.7 ~ 9，手册中常常会引用一大堆寄存器的名字，看的时候要多对照寄存器介绍来理解

使用例1：LED 呼吸灯

```c
void PWM_Init()
{
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
	
	TIM_InternalClockConfig(TIM2);
	// 定时器上电后默认使用内部时钟，所以其实不写这个也行
	
	GPIO_InitTypeDef GPIO_InitStruct;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_AF_PP;
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_0;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOA, &GPIO_InitStruct);
	
	//TIM_ETRClockMode2Config(TIM2, TIM_ExtTRGPSC_OFF, TIM_ExtTRGPolarity_NonInverted, 0x0f);
	// 使用 ETR 通过外部时钟2输入的时钟
	
	TIM_TimeBaseInitTypeDef TIM_TimeBaseInitStruct;
	TIM_TimeBaseInitStruct.TIM_ClockDivision = TIM_CKD_DIV1;
	// 内部时钟分频后给滤波器作为采样频率
	TIM_TimeBaseInitStruct.TIM_CounterMode = TIM_CounterMode_Up;
	TIM_TimeBaseInitStruct.TIM_Period = 100 - 1;
	TIM_TimeBaseInitStruct.TIM_Prescaler = 720 - 1;
	TIM_TimeBaseInitStruct.TIM_RepetitionCounter = 0;
	TIM_TimeBaseInit(TIM2, &TIM_TimeBaseInitStruct);
	
	// 初始化完后会触发更新来使寄存器值生效，但也会因此设置中断
	// 结果就会看到 Num 从1开始计数
	// 所以要在初始化后开启中断前清除标志位
	TIM_ClearFlag(TIM2, TIM_IT_Update);
	TIM_ITConfig(TIM2, TIM_IT_Update, ENABLE);
	
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
	
	NVIC_InitTypeDef NVIC_InitStruct;
	NVIC_InitStruct.NVIC_IRQChannel = TIM2_IRQn;
	NVIC_InitStruct.NVIC_IRQChannelCmd = ENABLE;
	NVIC_InitStruct.NVIC_IRQChannelPreemptionPriority = 2;
	NVIC_InitStruct.NVIC_IRQChannelSubPriority = 1;
	NVIC_Init(&NVIC_InitStruct);
	
	TIM_OCInitTypeDef TIM_OCInitStruct;
	TIM_OCStructInit(&TIM_OCInitStruct);
	TIM_OCInitStruct.TIM_OCMode = TIM_OCMode_PWM1;
	TIM_OCInitStruct.TIM_OCPolarity = TIM_OCPolarity_High;
	TIM_OCInitStruct.TIM_OutputState = TIM_OutputState_Enable;
	TIM_OCInitStruct.TIM_Pulse = 50; // CCR
	TIM_OC1Init(TIM2, &TIM_OCInitStruct);
	
	TIM_Cmd(TIM2, ENABLE);
}

// 用于中途修改 CCR 以改变占空比
void PWM_SetCompare1(uint16_t Compare)
{
	TIM_SetCompare1(TIM2, Compare);
}
```

使用例2：舵机驱动

![[6-4 PWM驱动舵机.jpg]]

```c
/* PWM.c */

#include "stm32f10x.h"                  // Device header

void PWM_Init()
{
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
	
	TIM_InternalClockConfig(TIM2);
	// 定时器上电后默认使用内部时钟，所以其实不写这个也行
	
	GPIO_InitTypeDef GPIO_InitStruct;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_AF_PP;
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_1;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOA, &GPIO_InitStruct);
	
	//TIM_ETRClockMode2Config(TIM2, TIM_ExtTRGPSC_OFF, TIM_ExtTRGPolarity_NonInverted, 0x0f);
	// 使用 ETR 通过外部时钟2输入的时钟
	
	TIM_TimeBaseInitTypeDef TIM_TimeBaseInitStruct;
	TIM_TimeBaseInitStruct.TIM_ClockDivision = TIM_CKD_DIV1;
	// 内部时钟分频后给滤波器作为采样频率
	TIM_TimeBaseInitStruct.TIM_CounterMode = TIM_CounterMode_Up;
	TIM_TimeBaseInitStruct.TIM_Period = 20000 - 1; // ARR
	TIM_TimeBaseInitStruct.TIM_Prescaler = 72 - 1; // PSC
	TIM_TimeBaseInitStruct.TIM_RepetitionCounter = 0;
	TIM_TimeBaseInit(TIM2, &TIM_TimeBaseInitStruct);
	
	// 初始化完后会触发更新来使寄存器值生效，但也会因此设置中断
	// 结果就会看到 Num 从1开始计数
	// 所以要在初始化后开启中断前清除标志位
	TIM_ClearFlag(TIM2, TIM_IT_Update);
	TIM_ITConfig(TIM2, TIM_IT_Update, ENABLE);
	
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
	
	NVIC_InitTypeDef NVIC_InitStruct;
	NVIC_InitStruct.NVIC_IRQChannel = TIM2_IRQn;
	NVIC_InitStruct.NVIC_IRQChannelCmd = ENABLE;
	NVIC_InitStruct.NVIC_IRQChannelPreemptionPriority = 2;
	NVIC_InitStruct.NVIC_IRQChannelSubPriority = 1;
	NVIC_Init(&NVIC_InitStruct);
	
	TIM_OCInitTypeDef TIM_OCInitStruct;
	TIM_OCStructInit(&TIM_OCInitStruct);
	TIM_OCInitStruct.TIM_OCMode = TIM_OCMode_PWM1;
	TIM_OCInitStruct.TIM_OCPolarity = TIM_OCPolarity_High;
	TIM_OCInitStruct.TIM_OutputState = TIM_OutputState_Enable;
	TIM_OCInitStruct.TIM_Pulse = 0; // CCR
	TIM_OC2Init(TIM2, &TIM_OCInitStruct);
	
	TIM_Cmd(TIM2, ENABLE);
}

void PWM_SetCompare2(uint16_t Compare)
{
	TIM_SetCompare2(TIM2, Compare);
}
```

```c
/* Servo.c */

#include "stm32f10x.h"                  // Device header
#include "PWM.h"

void Servo_Init()
{
	PWM_Init();
}

void Servo_SetAngle(float angle)
{
	PWM_SetCompare2(angle / 180 * 2000 + 500);
}
```

使用例3：直流电机驱动（也是与 PWM 模块配合）

![[6-4 PWM驱动舵机.jpg]]

```c
#include "stm32f10x.h"                  // Device header
#include "PWM.h"

void Motor_Init()
{
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
	
	GPIO_InitTypeDef GPIO_InitStruct;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_4 | GPIO_Pin_5;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOA, &GPIO_InitStruct);
	
	PWM_Init();
}

void Motor_SetSpeed(int8_t Speed)
{
	if (Speed >= 0) {
		GPIO_SetBits(GPIOA, GPIO_Pin_4);
		GPIO_ResetBits(GPIOA, GPIO_Pin_5);
		PWM_SetCompare3(Speed);
	} else {
		GPIO_SetBits(GPIOA, GPIO_Pin_5);
		GPIO_ResetBits(GPIOA, GPIO_Pin_4);
		PWM_SetCompare3(-Speed);
	}
}
```

## 库函数

`void TIM_DeInit(TIM_TypeDef* TIMx)`
: 恢复缺省配置

`void TIM_TimeBaseInit(TIM_TypeDef* TIMx, TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct)`
: 时基单元初始化

`void TIM_TimeBaseStructInit(TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct)`
: 给结构体变量赋一个默认值

`void TIM_Cmd(TIM_TypeDef* TIMx, FunctionalState NewState)`
: 使能失能计数器

`void TIM_ITConfig(TIM_TypeDef* TIMx, uint16_t TIM_IT, FunctionalState NewState)`
: 使能失能中断输出信号

`void TIM_InternalClockConfig(TIM_TypeDef* TIMx)`
: 使用内部时钟

`void TIM_ITRxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource)`
: 使用ITRx其他定时器的时钟

`void TIM_TIxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_TIxExternalCLKSource, uint16_t TIM_ICPolarity, uint16_t ICFilter)`
: 使用TIx捕获通道的时钟（Polarity：极性，Filter：滤波器）

`void TIM_ETRClockMode1Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter)`
: 使用 ETR 通过外部时钟1输入的时钟（TIM_ExtTRGPrescaler：外部触发预分频器，对外部时钟提前做分频）

`void TIM_ETRClockMode2Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter)`
: 使用 ETR 通过外部时钟2输入的时钟

`void TIM_ETRConfig(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter)`
: 配置 ETR 引脚的预分频器、极性、 滤波器

`void TIM_PrescalerConfig(TIM_TypeDef* TIMx, uint16_t Prescaler, uint16_t TIM_PSCReloadMode)`
: 修改预分频值

`void TIM_CounterModeConfig(TIM_TypeDef* TIMx, uint16_t TIM_CounterMode)`
: 修改计数器计数模式

`TIM_ARRPreloadConfig(TIM_TypeDef* TIMx, FunctionalState NewState)`
: 自动重装器预装功能配置

`void TIM_SetCounter(TIM_TypeDef* TIMx, uint16_t Counter)`
: 给计数器写入值

`void TIM_SetAutoreload(TIM_TypeDef* TIMx, uint16_t Autoreload)`
: 给自动重装器写入值

`uint16_t TIM_GetCounter(TIM_TypeDef* TIMx)`
: 获取当前计数器的值

`uint16_t TIM_GetPrescaler(TIM_TypeDef* TIMx)`
: 获取当前预分频器的值

`FlagStatus TIM_GetFlagStatus(TIM_TypeDef* TIMx, uint16_t TIM_FLAG)`
: 获取标志位。

`void TIM_ClearFlag(TIM_TypeDef* TIMx, uint16_t TIM_FLAG)`
: 清除标志位。

`ITStatus TIM_GetITStatus(TIM_TypeDef* TIMx, uint16_t TIM_IT)`
: 中断获取标志位。

`void TIM_ClearITPendingBit(TIM_TypeDef* TIMx, uint16_t TIM_IT)`
: 中断清除标志位。

`void TIM_OC1Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)`
: （还有 OC2~4Init 函数）配置输出比较模块。

`void TIM_OCStructInit(TIM_OCInitTypeDef* TIM_OCInitStruct)`
: 给输出比较结构体赋默认值。

`void TIM_ForcedOC1Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)`
: （还有 ForcedOC2 ~ 4Config 函数）配置强制输出模式。

`void TIM_OC1PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)`
: （还有 OC2 ~ 4PreloadConfig 函数）配置 CCR 寄存器预装功能。

`void TIM_OC1FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)`
: （还有 OC2 ~ 4FastConfig 函数）配置快速使能。

`void TIM_ClearOC1Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)`
: （还有 ClearOC2 ~ 4Ref 函数）手册 *外部事件时清除 REF 信号* 一节中有介绍。

`void TIM_OC1PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)`
: （还有 OC2 ~ 4PolarityConfig 以及 OC1 ~ 3NPolarityConfig 函数）单独设置输出比较的极性，带个 N 的就是高级定时器中互补通道的配置（OC4 没有！）（结构体初始化的函数也可以设置极性，但是 **一般来说结构体里的参数都会有一个单独的函数可以进行更改**）。

`void TIM_CCxCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCx)`
: （还有 CCxNCmd 函数）单独修改输出使能参数

`void TIM_SelectOCxM(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_OCMode)`
: 单独更改输出比较模式

`void TIM_SetCompare1(TIM_TypeDef* TIMx, uint16_t Compare1)`
: （还有 TIM_SetCompare2 ~ 4 函数）单独更改 CCR 寄存器的值

`void TIM_CtrlPWMOutputs(TIM_TypeDef* TIMx, FunctionalState NewState)`
: 使用高级定时器时需要调用这个函数使能主输出，否则 PWM 无法正常工作。

``
: 

``
: 

``
: 

``
: 

``
: 

``
: 

``
: 

## 使用例

定时中断

*Timer.h*
```c
#ifndef __TIMER_H
#define __TIMER_H

uint16_t Num = 0;

void Timer_Init(void);

#endif
```

*Timer.c*
```c
#include "stm32f10x.h"                  // Device header

extern uint16_t Num;

void Timer_Init()
{
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);
	
	TIM_InternalClockConfig(TIM2);
	// 定时器上电后默认使用内部时钟，所以其实不写这个也行
	
	TIM_TimeBaseInitTypeDef TIM_TimeBaseInitStruct;
	TIM_TimeBaseInitStruct.TIM_ClockDivision = TIM_CKD_DIV1;
	// 内部时钟分频后给滤波器作为采样频率
	TIM_TimeBaseInitStruct.TIM_CounterMode = TIM_CounterMode_Up;
	TIM_TimeBaseInitStruct.TIM_Period = 10000 - 1;
	TIM_TimeBaseInitStruct.TIM_Prescaler = 7200 - 1;
	TIM_TimeBaseInitStruct.TIM_RepetitionCounter = 0;
	TIM_TimeBaseInit(TIM2, &TIM_TimeBaseInitStruct);
	
	// 初始化完后会触发更新来使寄存器值生效，但也会因此设置中断
	// 结果就会看到 Num 从1开始计数
	// 所以要在初始化后开启中断前清除标志位
	TIM_ClearFlag(TIM2, TIM_IT_Update);
	TIM_ITConfig(TIM2, TIM_IT_Update, ENABLE);
	
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
	
	NVIC_InitTypeDef NVIC_InitStruct;
	NVIC_InitStruct.NVIC_IRQChannel = TIM2_IRQn;
	NVIC_InitStruct.NVIC_IRQChannelCmd = ENABLE;
	NVIC_InitStruct.NVIC_IRQChannelPreemptionPriority = 2;
	NVIC_InitStruct.NVIC_IRQChannelSubPriority = 1;
	NVIC_Init(&NVIC_InitStruct);
	
	TIM_Cmd(TIM2, ENABLE);
}

void TIM2_IRQHandler()
{
	if (TIM_GetITStatus(TIM2, TIM_IT_Update) == SET)
	{
		Num++;
		TIM_ClearITPendingBit(TIM2, TIM_IT_Update);
	}
}

```



# USART 串口通信

stm32 中集成了很多用于通信的模块，usart 就是其中一个，ppt p91 中列出了 stm32 中的所有通信接口，f103c8t6是全部支持的。

串口是一种应用十分广泛的通信接口，成本低、容易使用、通信线路简单，可实现两个设备的互相通信。事实上，在单片机领域中，串口是最简单的通信接口，其协议相较 I2C、SPI 等已经是非常简单的了。单片机的串口可以使单片机与单片机，单片机与电脑（*这是串口的一大优势！*），单片机与各式各样的模块相互通信，扩展了单片机的应用范围，增强了单片机系统的硬件实力。

*USART（Universal Synchronous/Asvnchronous Receiver/Transmitter，通用同步/异步收发器（顺便一提，也有 UART 这种东西））*

事实上，一般来说串口很少使用同步功能，USART 与 UART 使用起来其实也没什么区别，stm32 的 USART 同步模式只是多了一个时钟输出而已，不支持时钟输入，不能让两个 USART 之间进行同步通信，更多是为了兼容别的协议或特殊用途而设计的。

## 通信

通信的目的在于将一个设备的数据传送到另一个设备，扩展硬件系统，实现控制外挂模块和读取外挂模块数据的目的。

要实现通信，就要有 *通信协议* ，及通信双方进行数据收发所要遵守的规则。

USART 的引脚为 `TX（TXD, Transmit exchange 数据发送脚）` 与 `RX（RXD, Receive exchange）数据接收脚` 。

时钟特性分为同步与异步，有的外设有单独的时钟线，使接收方可以在时钟信号的指引下进行采样，这样就是 *同步* 的；像 USART 没有时钟线，就需要双方约定一个采样频率，还要加一些什么帧头帧尾之类的东西进行采样位置的对齐，这样就是 *异步通信* 。

*电平特性* ：引脚的高低电平都是对 GND 的电压差（通信双方共地），这样是 *单端信号* 。而靠两个引脚的电压差来传输信号就是 *差分信号*，这样可以极大地提高抗干扰特性，故差分信号一般传输速度和距离都会非常高。

接线时注意 TX 接 RX ，且 GND 必须接上。若通信双方都有独立供电则 VCC 可不接。当 *电平标准* 不一致时，还要加电平转换芯片。

*电平标准* ：数据 0 与数据 1 的表达方式，人为规定的电压与数据的对应关系，串口常用的电平标准：

1. TTL 电平：3.3V/5V -> 1, 0V -> 0
2. RS232 电平: -3~-15V -> 1, +3~+15V -> 0
3. RS485 电平: 两线压差 +2~+6V 表示 1，-2~-6V  表示 0（差分信号）。

## 串口协议

串口协议规定了串口发送数据的格式：每一个字节的数据都装在在一个 *数据帧* 里面，每个数据帧都由 *起始位* ，*数据位* 与 *停止位* 构成。

![[ShuJuZhen00.png]]

如图所示，左边数据位有 8 个，代表一个字节的八位，右边还在有效载荷后还加了个奇偶校验位，这样一共就是九位。一个数据帧需要有起始位标志它的开始，固定为低电平（故串口的空闲状态是高电平，产生一个下降沿代表传输开始），而后在一个数据发送完成后必须要有一个停止位作为数据帧的间隔，固定为高电平。数据帧 **低位先行** 。

> 这里有两种理解方式：数据位包含校验位，或者数据位说的就只是有效载荷。

串口通信的速率被称为 *波特率*  （单位码元每秒），还有个速率表示叫比特率，单位为 bps ，在二进制调制的情况下，波特率等同于比特率，所以说串口的波特率经常会和比特率混用。

串口使用奇偶校验的数据验证方法，如果检验到数据出错，可以选择丢弃或重传。校验方式有三：无校验（不需校验位）、奇校验（包含校验位的数据会出现奇数个 1）与偶校验（包含校验位的数据会出现偶数个 1）。

> 奇偶校验只能保证一定程度上的数据校验，如果想要更高的检出率，可以了解一下 CRC 校验，stm32 中也有 CRC 的外设。

## 外设

stm32 内部集成的 USART 外设就是串口通信的硬件支持电路，可以根据数据寄存器中的一个字节数据自动生成数据帧时序，从 TX 引脚上发送出去，也可以自动接收 RX 引脚的数据帧时序，拼接为一个字节数据，存在数据寄存器中。

另外，USART 外设自带波特率发生器，最高达 4.5 Mbits/s。可以自行配置数据位长度（8/9），停止位长度（0.5/1/1.5/2），校验位（无/奇/偶）。支持同步模式、硬件流控制（防止某边处理慢导致数据丢失）、DMA（有大量数据收发时使用它来转运数据以减轻 CPU 负担）、智能卡、IrDA、LIN。

f1c8t6 共有 3 个独立的 USART 外设，其中 USART1 时 APB2 总线上的设备，剩下的是 APB1 上的。

![[usartKuangtu.png]]

TDR 与 RDR 在程序上只表现为一个寄存器，即数据寄存器 DR 。移位寄存器与数据寄存器的工作原理：

发送：
1. 硬件检测到你往数据寄存器中写入数据了，就检查当前移位寄存器是不是有数据在移位。
2. 若没有，数据寄存器中的全部数据会移动到移位寄存器准备发送。同时置一标志位 TXE(TX Empty) ，这个标志位若置1就可以在 TDR 中写入数据了。 
3. 移位寄存器就会在发生器的控制的驱动下向右移位将数据输出至 TX 。
4. 若还有数据在移位，TDR 就会进行等待。

接收时也是差不多倒过来的一个过程，先右移读取 RX 电平，接收一个字节后将数据转移至 RDR 并将 RXNE(RX Not Empty) 置1。有了这样的双重缓存机制，就可以保证连续传输数据时数据帧之间不会有空闲，提高了工作效率。

硬件数据流控有两个引脚，一个是 nRTS(Request To Send，请求发送，告诉别人我当前能不能接收) ，一个是 nCTS(Clear To Send，清除发送，用于接收别人的 nRTS 信号)。

SCLK 用于产生同步的时钟信号，不可接收同步时钟信号，发送寄存器每移位一次，同步时钟电平就跳变一个周期。同步模式可以用来兼容别的协议，也可以用来做自适应波特率（接收设备不确定发送设备给的什么波特率，就可以测量一下这个时钟来确定）

唤醒单元可以用来实现串口挂载多设备，多设备一般就是在一条总线上接多个从设备，每个设备分配一个地址，想跟某个设备通信就寻址后再进行数据收发。虽然说串口一般是点对点的通信，但它可以被分配一个地址，然后向串口发送指定地址时相应设备的唤醒单元就唤醒该设备开始工作。

中断输出控制的中断申请位就是状态寄存器 SR 中的各种标志位，这里的 TXE 与 RXNE 两个标志位很重要（正如上文所述），而中断输出控制就是用来配置中断是否能通向 NVIC 。

最后还有波特率发生器部分，波特率发生器实际上就是分频器，对 APB 时钟进行分频，得到发送和接收移位的时钟。USART1 挂载在 APB2 ，就使用时钟 PCLK2 ，频率为72MHz，APB1 的时钟频率一般是 36MHz。之后除以一个分频系数 USARTDIV 来进行分频，还要再除以 16 ，最终得到发送器与接收器的时钟，通向控制部分。

引脚定义表中的复用功能一栏给出了每个 USART 的引脚

## 库函数

```c
void USART_DeInit(USART_TypeDef* USARTx);
void USART_Init(USART_TypeDef* USARTx, USART_InitTypeDef* USART_InitStruct);
void USART_StructInit(USART_InitTypeDef* USART_InitStruct);
```

配置同步时钟输出：

```c
void USART_ClockInit(USART_TypeDef* USARTx, USART_ClockInitTypeDef* USART_ClockInitStruct);
void USART_ClockStructInit(USART_ClockInitTypeDef* USART_ClockInitStruct);
```

```c
void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_ITConfig(USART_TypeDef* USARTx, uint16_t USART_IT, FunctionalState NewState);
```

收发数据：

```c
void USART_SendData(USART_TypeDef* USARTx, uint16_t Data);
uint16_t USART_ReceiveData(USART_TypeDef* USARTx);
```

标志位函数：

```c
FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, uint16_t USART_FLAG);
void USART_ClearFlag(USART_TypeDef* USARTx, uint16_t USART_FLAG);
ITStatus USART_GetITStatus(USART_TypeDef* USARTx, uint16_t USART_IT);
void USART_ClearITPendingBit(USART_TypeDef* USARTx, uint16_t USART_IT);

```

## 使用例

1) 串口发送

![[9-1 串口发送.jpg]]

有时在编译器中直接写汉字的话编译器会报错，在工程选项 -> C/C++ -> Misc Controls 中写上 `--no-multibyte-chars` 即可。

```c
#include "stm32f10x.h"                  // Device header
#include <stdio.h>
#include <stdarg.h>

void Serial_Init()
{
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
	
	GPIO_InitTypeDef GPIO_InitStructure;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOA, &GPIO_InitStructure);
	
	USART_InitTypeDef USART_InitStruct;
	USART_InitStruct.USART_BaudRate = 9600; // 需要什么波特率直接写就行了
	USART_InitStruct.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	USART_InitStruct.USART_Mode = USART_Mode_Tx;
	USART_InitStruct.USART_Parity = USART_Parity_No;
	USART_InitStruct.USART_StopBits = USART_StopBits_1;
	USART_InitStruct.USART_WordLength = USART_WordLength_8b;
	USART_Init(USART1, &USART_InitStruct);
	
	USART_Cmd(USART1, ENABLE);
}

void Serial_SendByte(uint8_t Byte)
{
	USART_SendData(USART1, Byte);
	while (USART_GetFlagStatus(USART1, USART_FLAG_TXE) == RESET);
}

void Serial_SendArray(uint8_t *Array, uint16_t length)
{
	uint16_t i;
	for (i = 0; i < length; i++)
	{
		Serial_SendByte(Array[i]);
	}
}

void Serial_SendString(char *String)
{
	uint16_t i;
	for (i = 0; String[i] != '\0'; i++)
	{
		Serial_SendByte(String[i]);
	}
}

void Serial_SendNumber(uint32_t Number)
{
	uint32_t Bits[32] = {0};
	int16_t top = 0;
	while (Number != 0)
	{
		Bits[top++] = Number % 10 + '0';
		Number /= 10;
	}
	for (--top; top >= 0; top--)
	{
		Serial_SendByte(Bits[top]);
	}
}

int fputc(int ch, FILE *f)
{
	Serial_SendByte(ch);
	return ch;
}

void Serial_Printf(char *format, ...)
{
	char String[100];
	va_list	arg;
	va_start(arg, format);
	vsprintf(String, format, arg);
	va_end(arg);
	Serial_SendString(String);
}

```
# I2C 通信
# SPI 通信

# CAN 通信

# USB 通信
# 其他硬件设备

## 舵机

舵机 = 减速齿轮组 + 直流电机 + 电位器 + 舵机控制板（这里把 PWM 当成了通信协议来使用，不是等效模拟输出，但是这也是一种比较常见的应用）舵机图如下：

![[DuoJi.png]]

（硬件电路 p71）

## 直流电机及驱动

直流电机：ppt p72 硬件电路 p73

直流电机属于大功率器件，GPIO口无法直接驱动，需要配合电机驱动电路来操作。现在市面上有很多驱动电路可以选择，如 TB6612、DRV8833、L9110、L298N 等，这里使用 TB6612 。驱动电压 `VM` 一般与电机额定电压保持一致，逻辑电平输入 `VCC` 要和控制器电源保持一致。

STBY（Stand By）：待机控制脚，接 `GND` 芯片不工作，接 `VCC` 芯片正常工作。
# 寄存器操作

## C语言位操作操作寄存器

**操作位有两种方法，一种是位字段，另一种是使用按位运算符。**下表为几种位操作符及其含义：

不改变其他位的值的状况下，对某几个位进行设值。

在嵌入式编程中，常常需要对一些寄存器进行配置，有的情况下需要改变一个字节中的某一位或者几位，但是又不想改变其它位原有的值，这时就可以使用按位运算符进行操作。下面进行举例说明，假如有一个8位的TEST寄存器：

当我们要设置第0位bit0的值为1时，可能会这样进行设置：

```c
TEST = 0x01;
```

但是，这样设置是不够准确的，因为这时候已经同时操作到了高7位：bit1~bit7，如果这高7位没有用到的话，这么设置没有什么影响；但是，如果这7位正在被使用，结果就不是我们想要的了。

在这种情况下，我们就可以借用 `&` 和 `|` 进行配置。

**对于二进制位操作来说，不管该位原来的值是 0 还是 1，它跟 0 进行 `&` 运算，得到的结果都是 0，而跟 1 进行 `&` 运算，将保持原来的值不变，故我们可以将某一位置 0 而保持其他位不变；不管该位原来的值是 0 还是 1，它跟 1 进行 `|` 运算，得到的结果都是 1，而跟 0 进行 `|` 运算，将保持原来的值不变， 故我们还可以将某一位置 1 而保持其他位不变。**

所以，此时可以设置为：

```c
TEST = TEST | 0x01;
```

其意义为：TEST寄存器的高7位均不变，最低位变成1了。在实际编程中，常改写为：

```c
TEST |= 0x01;
```

这种写法可以一定程度上简化代码，是 C 语言常用的一种编程风格。

同样的，要给TEST的低4位清0，高4位保持不变，可以进行如下配置：

```c
TEST &= 0xF0;
```

这个场景单片机开发中经常使用，方法就是先对需要设置的位用&操作符进行清零操作，然后用|操作符设值。比如我要改变GPIOA的状态,可以先对寄存器的值进行&清零操作：

```c
GPIOA->CRL &= 0XFFFFFF0F; //将第4-7位清0
```

然后再与需要设置的值进行 `|` 或运算：

```c
GPIOA->CRL |= 0X00000040; //设置相应位的值，不改变其他位的值
```

### 移位操作提高代码的可读性

移位操作在单片机开发中也非常重要，下面让我们看看固件库的GPIO初始化的函数里面的一行代码：

```c
GPIOx->BSRR = (((uint32_t)0x01) << pinpos);
```

这个操作就是 **将BSRR寄存器的第pinpos位设置为1** ，为什么要通过左移而不是直接设置一个固定的值呢？其实，这是为了提高代码的可读性以及可重用性。这行代码可以很直观明了的知道，是将第pinpos位设置为1。如果你写成：

```c
GPIOx->BSRR = 0x0030;
```

这样的代码就不好看也不好重用了。
类似这样的代码很多:

```c
GPIOA->ODR |= 1 << 5; //PA.5输出高,不改变其他位
```

这样我们一目了然，5告诉我们是第5位也就是第6个端口，1告诉我们是设置为1了。

## ~取反操作使用技巧

SR寄存器的每一位都代表一个状态，某个时刻我们希望去设置某一位的值为0，同时其他位都保留为1，简单的作法是直接给寄存器设置一个值：

```c
TIMx->SR = 0xFFF7；
```

这样的作法设置第3位为0，但是这样的作法同样不好看，并且可读性很差。看看库函数代码中怎样使用的：

```c
TIMx->SR = (uint16_t)~TIM_FLAG;
```

而TIM_FLAG 是通过宏定义定义的值：

```c
#define TIM_FLAG_Update  ((uint16_t)0x0001)
#define TIM_FLAG_CC1     ((uint16_t)0x0002)
#define TIM_FLAG_CC2     ((uint16_t)0x0004)
#define TIM_FLAG_CC3     ((uint16_t)0x0008)
#define TIM_FLAG_CC4     ((int16_t)0x0010)
#define TIM_FLAG_COM     ((uint16_t)0x0020)
#define TIM_FLAG_Trigger ((uint16_t)0x0040)
#define TIM_FLAG_Break   ((uint16_t)0x0080)
#define TIM_FLAG_CC1OF   ((uint16_t)0x0200)
#define TIM_FLAG_CC2OF   ((uint16_t)0x0400)
#define TIM_FLAG_CC3OF   ((uint16_t)0x0800)
#define TIM_FLAG_CC4OF   ((uint16_t)0x1000)
```

即设置SR第3位为0时可设置为：

```c
TIMx->SR = (uint16_t)~TIM_FLAG_CC3;
```

## C语言位域解析及在操作寄存器方面的应用

### 位域的概念

**位域（或者也能称之为位段，英文表达是 Bit field）**是一种数据结构，可以把数据以位元的形式紧凑的存储，并允许程序员对此结构的位元进行操作。这种数据结构的好处是：

- 可以使数据单元节省存储空间，当程序需要成千上万个数据单元时，这种数据结构的优点也就很明显地突出出来了。
- 位段可以很方便地访问一个整数值的部分内容从而简化程序源代码。

### 位域的定义
总体来说位域的定义可以分为两大类，一个是结构体位域，一个是共用体体位域，由于共用体和结构体两者在定义上的形式都是相同的，因此对于位域的定义从形式上看，两者也都是相同的。

### 结构体位域

结构体位域定义的一般形式如下所示：

```c
struct 位域结构体名
{
    类型说明符 位域名 ： 长度;
}结构体变量名；
```

举个简单的例子进行说明：

```c
struct example0
{
	unsigned char x : 3;
	unsigned char y : 2;
	unsigned char z : 1;
}ex0_t;
```

虽然 x 的类型是 unsigned char ，但是并没有占 8 个位，而是占了 3 个位，其取值范围也变成了 0 ～ 2^3-1。通过上述图片我们也可以猜到这个结构体位域的大小，笔者通过 printf 函数输出结构体位域的大小为：

```
The Value of sizeof(ex0_t) is : 1 byte
```

关于结构体位域的大小遵循这样一个原则：整个结构体位域的总大小为最宽基本类型成员大小的整数倍，这一原则与笔者在上一篇文章《结构体内存对齐解析》中写的结构体的总大小的原则是相同的。

### 共用体位域

共用体位域定义的一般形式跟结构体定义的一般形式是大致相同的，直接举一个简单的例子进行说明：

```c
union example1
{
    unsigned char x : 3;
    unsigned char y : 2;
    unsigned char z : 1;
}ex1_u;
```

同样的，笔者在这里给出共用体位域在内存中的存储位置：

这里笔者也给出共用体位域的大小：

```
The Value of sizeof(ex1_u) is : 1 byte
```

由此也可以得出共用体位域大小遵循的原则是：共用体位域的总大小为最大基本类型成员的大小
结构体位域详解
位域的类型使用无符号型
正如标题所示，在位域的使用过程中使用无符号的数据类型，下面给出一个例子来说明这个例子：
```c
struct BitField_8
{
	char a : 2;
	char b : 3;
}BF8;

BF8.a = 0x3;/* 11 */
BF8.b = 0x5;/* 101 */
printf("%d,%d\n",BF8.a,BF8.b);
```

上述的输出结果为：

```
1.-1,-3
```

输出结果并不是我们想要的，究其原因，实际上是因为 BF.a ，BF.b 都是有符号的，那么自然也就有符号位的存在，而最高位为 1 代表负数，负数又是以补码的形式存储在计算机中的，所以也就有了上述的结果。因此为了避免上述这种问题的出现，应该将 BitField_8 中的 char 转换成 unsigned char ,那输出的结果就是 3,5
位域禁止的操作

由于位域的特殊，同时也有了一些跟普通变量不同的特性：

1. 结构体位域成员不能够使用取址操作

```c
struct BitField_8
{
unsigned char a : 2;
}BF8;
printf("%p\n",&BF8.a); /*错误*/
```

2. 结构体位域成员不能够用 static 修饰

```c
struct BitField_8
{
static unsigned char a : 2;/*错误*/
}BF8;
```

3. 结构体位域成员不能够使用数组

```c
struct BitField_8
{
	unsigned char a[5] : 5;/*错误*/
}BF8;
```

### 不同处理器，不同编译器对位域的影响

位域虽然能够以位的形式操作数据，但是也被人们告知要慎重使用，原因就在于不同的处理器结构，不同的编译器对于位域的一些特性会产生不同的结果，这也就是位域移植性差的原因

处理器影响
: 处理器对位域造成的影响也很容易理解，大端模式和小端模式的处理器会对下面的结构体位域产生不一样的存储方式，这里比较简单，如果对这个问题不清楚的朋友可以看笔者的这篇文章《union 的概念及在嵌入式编程中的应用》。

编译器影响
: 结构体位域成员不同类型、不同的编译器对于位域会有不同的结果，比如下面这段代码：

```c
struct BitField_5
{
unsigned int a : 4;
unsigned char b : 4; 
}BF_8;

int main(void)
{
printf("The Value of sizeof(BF_8) is:%lu bytes\n",sizeof(BF_8));
}
```

上述所定义的结构体位域中，对于结构体位域内成员不同数据类型，不同的编译器有不同的处理，对于 Visual Studio 来说，面对不同的数据类型时，对于上述这个例子，存储完第一个成员 a 后，会重新另起 4 byte 的空间进行存储，因此对于上述代码在 Visual Studio 的运行结果是：

```
The Value of sizeof(BF_8) is 8 bytes
```

可见在 vs 环境下这样使用位域不但没有能够节省内存空间，反而相比于结构体还扩大了。上述是 VS 环境下的测试结果，下面是在 GCC 环境下的测试结果：

```
The Value of sizeof(BF_8) is 4 bytes
```

可见在 GCC 环境下，就算结构体位域成员的数据类型不一致，它其实按照“压缩”数据的方式进行存储的，也就是说结构体位域里的成员都是挨着存放的。
成员大小之和超过一个基本存储空间
除了上述成员不同类型对于不同编译器有不同的处理方式，当成员大小之和超过一个基本存储空间时，不同的编译器也有不同的处理方式，比如下面这段代码：

```c
struct short_flag_t
{
    unsigned short a : 7;
    unsigned short b : 10;  
};
```

对于上面这段代码，同类型成员除了这样定义之外，也可以这样定义：

```c
struct short_flag_t
{
	unsigned short a : 7,/*注意此处是逗号*/
	b : 10;
};
```

上面的代码因为 unsigned short 的大小是 2 个字节，而成员 a,b加起来的大小已经超过了 2 个字节，所以这种情况下也就有了以下两种存储方式：
a , b 紧邻
b 在下一个可存储它的存储单元内分配内存
不同编译器可能面对这种情况会采用不同的存储方式，对于 GCC 来说，采用的是第二种，如果编译器采用的是第一种方式，而程序要求又需要按照第二种方式来进行存储，又该如何办呢？这时就要利用匿名 0 长度位域字段的语法强制位域在下一个存储单元存储，示例代码如下：

```c
struct short_flag_t
{
    unsigned short a : 2;
    unsigned short   : 0;
    unsigned short b : 3;
}
```

上述代码对于 a , b 来讲，b 便不会紧挨着 a 进行存储，而是强制使 b 在下一个存储单元进行存储。

### 位域的应用

上述便是位域涉及的基本概念，那知道了基本概念之后，又能使用位域做些什么呢？最容易另人想到的就是使用结构体位域定义标志位，由于我们在裸机开发的过程中，没有信号量，事件等机制，通常会定义一些范围只存在于 0~1 的开关量，而在没有使用位域之前，最小的变量类型都是 1 个字节，使用结构体位域将能够根据取值范围定义该变量的位数，从而起到节省内存的作用。

**用于访问微控制器的寄存器**

位域受到处理器和编译器的影响，在使用前我们必须清楚当前处理器是大端对齐还是小端对齐，必须清楚当前编译器对所定义的位域有何影响

如果我们现在要使用位域访问一个 8 位的寄存器，这个寄存器大致长这个样子：
那么我们就可以使用结构体位域构造这样一个数据结构：

```c
typedef union
{
	unsigned char Byte;
	struct
	{
		unsigned char bit012 : 3;
		unsigned char bit34  : 2;
		unsigned char bit5   : 1;
		unsigned char bit6   : 1;
		unsigned char bit7   : 1;
	}bits;
}registerType;
```

现在假设我们这个寄存器的地址是 `0x0000 8000`，那么我们就可以定义一个指针并使其指向这个地址，如下：

```c
registerType *pReg = (registerType *)0x0000 8000;
```

在进行了上述定义之后，我们就可以对寄存器进行操作了，首先，我们可以使用位域的方式操作寄存器的位，比如这样：

```c
pReg->bits.bit5 = 1;
pReg->bits.bit012 = 7;
```

当然也可以利用 union 的特性直接操作整个寄存器，如下：

```
pReg->Byte = 0x55;
```

使用位域完成对于寄存器的访问，对于上述例子来讲，我们必须要注意的一点是此例子是基于小端对齐模式的。

### 总结

位域的用法虽然看起来更加灵活了，但是在使用时也要对我们的处理器和编译器有所了解，如果为了写出移植性较高的程序，应该避免使用位域。