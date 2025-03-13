# EBAOBAO 的 jekyll 笔记

## 配置开发环境

## 新建

新建静态网站：`jekyll new <路径>`

“运行”：进入相关路径，然后 `bundle exec jekyll serve`

这是第一次，之后只要 `jekyll serve` 就可以运营起你的网站。

Ruby 3.4.0 版本中 `csv` 库不再是默认的 gems，而是变成了一个捆绑的 gem，这意味着您需要显式地在您的 Gemfile 或 gemspec 中添加 `csv` 作为依赖来解决这个问题。以下是具体的步骤：

1.  **打开您的 Gemfile**： 如果您使用的是 Bundler 来管理项目依赖，您需要在项目的 Gemfile 中添加 `csv` 这个 gem。使用文本编辑器打开您的 Gemfile 文件。
    
2.  **添加 `csv` gem**： 在 Gemfile 中添加以下行：
    
    ruby
    
    ```ruby
    gem 'csv'
    ```
    
    这告诉 Bundler 您的项目依赖于 `csv` gem。
    
3.  **保存并关闭 Gemfile**： 保存您对 Gemfile 所做的更改，并关闭文本编辑器。
    
4.  **运行 Bundler**： 在终端中运行以下命令来安装新的依赖：
    
    shell
    
    ```shell
    bundle install
    ```
    
    这将安装 `csv` gem 并更新您的项目依赖。
    
5.  **测试您的更改**： 在更改之后，您应该测试您的应用程序以确保一切正常工作。
    
6.  **提交更改到版本控制系统**： 如果您的项目是在版本控制系统（如 Git）下，您可能还需要提交 Gemfile 的更改：
    
    shell
    
    ```shell
    git add Gemfile
    git commit -m "Add csv gem to Gemfile"
    git push
    ```
    
    这将您的更改推送到远程仓库。
    

通过以上步骤，您应该能够解决由于 Ruby 3.4.0 中 `csv` 库变化引起的警告和错误。

Ruby 3.5.0 版本将不再将 `logger` 作为默认 gems 包含在内。为了避免将来出现兼容性问题，您需要在项目的 Gemfile 或 gemspec 文件中显式添加 `logger` 依赖。以下是具体步骤：

1.  **打开 Gemfile**： 如果您的项目使用 Bundler 管理依赖，您需要在项目的 Gemfile 中添加 `logger` gem。使用文本编辑器打开您的 Gemfile 文件。
    
2.  **添加 `logger` gem**： 在 Gemfile 中添加以下行：
    
    ruby
    
    ```ruby
    gem 'logger'
    ```
    
    这告诉 Bundler 您的项目依赖于 `logger` gem。
    
3.  **保存并关闭 Gemfile**： 保存您对 Gemfile 所做的更改，并关闭文本编辑器。
    
4.  **运行 Bundler**： 在终端中运行以下命令来安装新的依赖：
    
    shell
    
    ```shell
    bundle install
    ```
    
    这将安装 `logger` gem 并更新您的项目依赖。
    
5.  **测试您的更改**： 在更改之后，您应该测试您的应用程序以确保一切正常工作。
    
6.  **提交更改到版本控制系统**： 如果您的项目是在版本控制系统（如 Git）下，您可能还需要提交 Gemfile 的更改：
    
    shell
    
    ```shell
    git add Gemfile
    git commit -m "Add logger gem to Gemfile"
    git push
    ```
    
    这将您的更改推送到远程仓库。
    

通过以上步骤，您可以确保即使在 Ruby 3.5.0 及更高版本中，您的项目仍然可以正常使用 `logger` 库。

### Gem（宝石）

想象一下，你正在玩一款建造房子的游戏。在这个游戏里，你需要各种材料来建造房子，比如砖块、窗户、门等。在Ruby的世界里，`gem` 就像是这些材料。它们是小块的代码，你可以用它们来增加你的程序的功能，比如发送邮件、处理图片或者连接数据库。

每个 `gem` 都是独立的，有自己的功能。你可以从Ruby的“材料库”（也就是RubyGems.org）中找到成千上万的 `gem`。当你需要某个 `gem` 时，你只需要告诉Ruby：“嘿，我需要这块砖（gem）”，然后它就会被添加到你的游戏中，供你使用。

### Bundle（捆绑）

现在，想象一下你的房子需要很多种不同的材料，而且每种材料都需要特定的尺寸和颜色。如果你每次建造房子时都自己去挑选这些材料，那会非常麻烦，而且很容易出错。

`bundle` 就是你的“材料清单”。它帮你管理所有的 `gem`，确保你使用的是正确的版本，而且不会和其他 `gem` 发生冲突。当你开始一个新的项目时，你可以创建一个新的 `bundle`，列出所有需要的 `gem` 和版本。这样，不管你在哪里，只要拿出你的材料清单，就可以确保每次都能拿到正确的材料。

具体来说，`bundle` 通过一个叫做 `Gemfile` 的文件来工作。你可以在这个文件里列出你的项目需要的所有 `gem`，以及它们的版本。当你告诉 `bundle` 按照这个文件来安装 `gem` 时，`bundle` 就会去帮你找到这些 `gem`，并且确保它们能够和谐地一起工作。

总结一下：

-   **Gem** 是Ruby世界中的小工具或功能模块，你可以用它们来增强你的程序。
-   **Bundle** 是一个工具，用来确保你的项目中所有的 `gem` 都能正确安装，并且版本之间不会冲突。

希望这个比喻能帮助你理解 `bundle` 和 `gem` 的作用！

# 头信息

**头信息（frontmatter）** 用来存储有关我们网站的页面的信息，我们 jekyll 网站的每一个页面都需要头信息。

头信息通常包含 title、date、author 等，它可以用 yaml 或 json 写成，内容被包含在两行 `---` 中。

```
---
layout: post
title: "Welcome to Jekyll!"
date: 2024-12-31 19:29:03 +0800
categories: jekyll update
---
```

头信息也在实际的 URL 上起作用，事实上实际的 URL 会包含一个页面的 `categories` 和 `date`，这就能让你改变不同类别博客的显示方式之类的。

你可以自定义头信息变量，然后在 jekyll layout 中访问这些变量，但这对目前而言有点超纲了。

# 创建博客

创建一个博客页面首先得遵循 jekyll 的页面命名约定，它得像是 `YYYY-MM-DD-title` 这样，如果标题由多个单词组成那么每个单词间由 `-` 分隔。

通过将建 `layout` 设置值来更改博客样式，这里只使用值 `"post"`，以后会来探讨更多。

你可以在 *_posts* 文件夹中新建子目录并将博客放到子目录中，这并不影响访问。故我们推荐你按类别整理你的博客！

