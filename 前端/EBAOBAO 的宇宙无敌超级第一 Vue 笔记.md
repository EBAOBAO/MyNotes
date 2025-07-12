
# Hello World!

Vue 工程有两种创建方式：*基于 vue-cli 创建* 或 *基于 vite 创建* 。

vue-cli 相当于是脚手架，基于 webpack（构建工具领域的老大哥）实现，目前已处于维护模式，故官方推荐基于 Vite 创建项目。

vite 是新一代 *前端构建工具*，构建速度快于 webpack ，写TS之类的东西还不用自己配置，还能做到真正的按需编译，官网：[Home | Vite中文网](https://vitejs.cn/)。

要创建工程还需要具备 node.js 环境，直接上网搜索官网并下载稳定版即可，要知道自己的电脑是否有 node.js，cmd 中输入 `node` 指令就可以观察到了。

使用 `npm create vite@latest` 来搭建。

新建项目后先来观察：

首先是 .vscode 文件夹，可以看到这里有个 extensions.json，说明会给你推荐官方插件来安装。

再看 public 文件夹，这就是脚手架的根目录，现在只放了页签图标。还有 src 文件夹，这里就是工作所在的地方了，存放源代码。

最后就是文件夹外面的那些零零散散的文件了，env.d.ts 引入了一个东西，说明这个项目需要依赖，执行 `npm i` 可以安装项目运行所需的所有的依赖（安装好就会出现文件夹 node_modules），这个文件的作用就是让 TS 能认识  .jpg、.txt 这样的文件。index.html 就是入口文件了，一般来说拿到一个前端项目后你需要查看 package.json 来寻找短命令，像这里就是"dev"，所以你应该运行 `npm run dev` 来启动程序。package.json 就是 *信息描述文件* 。还有几个 json 文件都是 TS 的配置文件。那个 vite.config.js 就是整个工程的配置文件，能去安装插件、配置代理等等。

```json title:package.json
{
  "name": "my_vue3", // 项目名
  "version": "0.0.0", // 项目版本
  "private": true,
  "type": "module",
  "scripts": { // 项目如何运行
    "dev": "vite",
    "build": "run-p type-check \"build-only {@}\" --",
    "preview": "vite preview",
    "build-only": "vite build",
    "type-check": "vue-tsc --build",
    "format": "prettier --write src/"
  },
  "dependencies": { // 项目依赖
    "vue": "^3.5.13"
  },
  "devDependencies": { // 更详细的项目依赖
    "@tsconfig/node22": "^22.0.1",
    "@types/node": "^22.14.0",
    "@vitejs/plugin-vue": "^5.2.3",
    "@vue/tsconfig": "^0.7.0",
    "npm-run-all2": "^7.0.2",
    "prettier": "3.5.3",
    "typescript": "~5.8.0",
    "vite": "^6.2.4",
    "vite-plugin-vue-devtools": "^7.7.2",
    "vue-tsc": "^2.2.8"
  }
}
```

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

# 模板语法

> Vue 使用一种基于 html 的模板语法，使我们能够声明式地将其组件实例的数据绑定到呈现的 DOM 上。所有的 Vue 模板都是语法层面合法的 html，可以被符合规范的浏览器和 html 解析器解析。
> —— vue 官网

首先，这里有 *文本插值* ，使用了双大括号语法：

```xml
<template>
  <p>{{ msg }}</p>
</template>

<script lang="ts">
export default {
  data() {
    return {
      msg: 'Hello World',
    }
  },
}
</script>
```

这样，只要在 js 的一个函数返回一个键值对对应关系就能直接在页面中显示内容了，而且这些键当然还能在日后动态地赋值！是不是很神奇？

这个双花括号中是可以放很多东西的，比如一个单一的 js 表达式（**一段能被求值的 js 代码，可以合法地写在 `return` 后面的**）

```xml
<template>
  <p>{{ num + 5 }}</p>
</template>

<script lang="ts">
export default {
  data() {
    return {
      num: 123,
    }
  },
}
</script>
```

如果你在这里用 `data()` 返回的文本是个 html 标签，情况又会怎么样呢？答案是：这时的文本不会被当成是一个 html 标签，而只是一段 *预格式化文本* 而已。要想像这样插入 html 元素的话，应该在元素中添加 `v-html` 属性：

```xml
<template>
  <p>{{ rawHtml }}</p>
  <span v-html="rawHtml"></span>
</template>

<script lang="ts">
export default {
  data() {
    return {
      rawHtml: '<a href="https://cn.bing.com">bing</a>',
    }
  },
}
</script>
```

这里它的渲染方式就是 `<span>` 中嵌套了一个 `<a>` 标签，我们将类似于 `v-html` 这样的东西称为 *指令* 。

## 属性绑定

一个标签当中会有属性，这里很可惜双大括号的语法不能在标签的属性中使用。不过要想响应式地绑定一个 attribute 也是可以做得到的，只要使用 `v-bind` 指令就可以了：

```xml
<template>
  <div v-bind:class="msg">Test</div>
</template>

<script lang="ts">
export default {
  data() {
    return {
      msg: 'myClass',
    }
  },
}
</script>
```