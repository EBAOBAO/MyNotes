
# Hello World!

Vue 工程有两种创建方式：*基于 vue-cli 创建* 或 *基于 vite 创建* 。

vue-cli 相当于是脚手架，基于 webpack（构建工具领域的老大哥）实现，目前已处于维护模式，故官方推荐基于 Vite 创建项目。

vite 是新一代 *前端构建工具*，构建速度快于 webpack ，写TS之类的东西还不用自己配置，还能做到真正的按需编译，官网：[Home | Vite中文网](https://vitejs.cn/)。

要创建工程还需要具备 node.js 环境，直接上网搜索官网并下载稳定版即可，要知道自己的电脑是否有 node.js，cmd 中输入 `node` 指令就可以观察到了。

新建项目后先来观察：

首先是 .vscode 文件夹，可以看到这里有个 extensions.json，说明会给你推荐官方插件来安装。

再看 public 文件夹，这就是脚手架的根目录，现在只放了页签图标。还有 src 文件夹，这里就是工作所在的地方了，存放源代码。

最后就是文件夹外面的那些零零散散的文件了，env.d.ts 引入了一个东西，说明这个项目需要依赖，执行 `npm i` 可以安装所有的依赖（安装好就会出现文件夹 node_modules），这个文件的作用就是让 TS 能认识  .jpg、.txt 这样的文件。index.html 就是入口文件了，一般来说拿到一个前端项目后你需要查看 package.json 来寻找短命令，像这里就是"dev"，所以你应该运行 `npm run dev` 来启动程序。package.json 就是 *依赖声明文件* ，用于管理包。还有几个 json 文件都是 TS 的配置文件。那个 vite.config.js 就是整个工程的配置文件，能去安装插件、配置代理等等。

对了，还有关于那两个推荐下载的官方插件，一个是

总之我们最得关心的就是 src 里面的东西，入口文件就是引入了 src 中的 main.ts，其中有这么些代码：

```ts
import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'

createApp(App).mount('#app')
```

首先，它引入了一个样式，然后又引入了一个 `{ createApp }` ，它就像你要种花时的花盆，是“基础”，就是在创建应用。再之后又引用了 App ，这就是一个 *组件* ，像是 “花的根”，以后写出的各种 .vue 文件，也都是一个个组件，像花的枝杈各种器官之类的，都要安装在 App 这个最基础的组件上。最后就是将你的花插在花盆里（`createApp(App)`），并将这盆花摆在某个位置（`mount('#app')`：挂载到 *#app* 这个容器，即 index.html 的那个 id 为 app 的 div，之中）。

自己写的组件要放在 components 中，一个 .vue 文件中要写三种标签：

1. template : 写 html 结构
2. script : 写脚本的，JS 或 TS（可以 `<template lang="ts">`）
3. style : 写样式的

## 补充：配置代码片段

