# Web 技术基础

ava EE 企业级开发框架：SpringBoot + MyBatisPlus
Web前端核心框架：Vue + ElementUI
公共云部署（对前后端项目进行集成、打包和部署）

目前市面上的软件的主流的架构分为两种：
- BS (Browser/Server, 浏览器/服务器架构模式)
- CS (Client/Server, 客户端/服务器架构模式)

这两种架构中，C/S 交互性强，有安全访问模式，网络流量低，响应速度快（因为客户端负责大多数的业务逻辑和 UI 演示，也被称为胖客户端），起软件要针对不同的操作系统开发不同版本的软件。而随着互联网的兴起，Web应用程序的修改和升级非常迅速，CS架构不适合，所以 BS 架构开始流行，它分散性高、维护方便、开发简单、共享性高，总拥有成本低。

BS 架构下，应用程序的逻辑和数据都存在服务器端，客户端只需要一个浏览器来请求服务器，获取Web页面，并把Web页面展示给用户即可。

# 环境配置

java: >jdk1.8

Maven：项目构建工具，可以对Java项目进行自动化的构建（编译、运行和打包之类的）和依赖管理（核心的配置文件是 *pom.xml* ），还给我们提供了一个统一的项目开发结构。版本 >3.6

官方下载地址：[Download Apache Maven – Maven](https://maven.apache.org/download.cgi)

## Maven 仓库

Maven 本身解压后就能用，并不需要作配置。如果要做配置的话一般会配置两部分，也就是 *本地仓库* 和 *远程仓库* 。

你可能会开发很多 java 项目，每个项目都或多或少会涉及到依赖，运行 maven 的时候会在本地仓库中提取这些项目的依赖，如果本地仓库没有的话就会从远程仓库去下载到本地仓库。配置基本上也就是配置本地仓库的位置和远程仓库的服务器。

指定本地仓库位置：

```xml title=conf/settings.xml
<localRepository>D:\MavenRepository</localRepository>
```

指定远程仓库服务器：

```xml title=conf/settings.xml
<mirrors>
	<!-- mirror
	 | Specifies a repository mirror site to use instead of a given repository. The repository that
	 | this mirror serves has an ID that matches the mirrorOf element of this mirror. IDs are used
	 | for inheritance and direct lookup purposes, and must be unique across the set of mirrors.
	 |
	<mirror>
	  <id>mirrorId</id>
	  <mirrorOf>repositoryId</mirrorOf>
	  <name>Human Readable Name for this Mirror.</name>
	  <url>http://my.repository.com/repo/path</url>
	</mirror>
	 -->
	<mirror>
      <id>aliyun</id>
      <mirrorOf>*</mirrorOf>
      <name>阿里云公共仓库</name>
      <url>https://maven.aliyun.com/repository/public</url>
    </mirror>
</mirrors>
```

接下来就是把配置好的 maven 放到 idea 里面：

[IDEA2024新建maven项目_idea2024创建maven项目-CSDN博客](https://blog.csdn.net/m0_74283019/article/details/143334394)

# 快速上手

## 什么是 SpringBoot

SpringBoot 是一个基于 Spring 的全新框架，旨在简化 Spring 应用的搭建与开发。

现在的 javaEE 的开发通常涉及到三个框架：Spring、SpringMVC 与 mybatis（[SSM框架讲解_ssm架构-CSDN博客](https://blog.csdn.net/weixin_45650003/article/details/121623824)），但它们的配置相当繁琐，而 SpringBoot 就可以大大简化这个流程。

## Hello SpringBoot

可以使用 idea 提供的 Spring Inittializr 来创建 SpringBoot 应用。

## 部署开发环境

## 系统配置