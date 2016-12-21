---
title: ESLint
date: 2016-04-29
category: JavaScript
tags: JavaScript
---

ESLint 是一个开源的 JavaScript 代码检查工具，常用于寻找有问题的模式或者代码，**保证代码的一致性和避免错误**。

- [官方网站](http://eslint.org/)
- [中文官网](http://cn.eslint.org/)
- [资源集合](https://github.com/dustinspecker/awesome-eslint)
- [ESLint 论坛](https://groups.google.com/forum/#!forum/eslint) 
- [ESLint 聊天室](https://gitter.im/eslint/eslint)
- [ESLint Twitter](https://twitter.com/geteslint)
- [ESLint Github](https://github.com/eslint/eslint)


# 为什么需要 ESLint
对大多数编程语言来说都会有代码检查，一般来说编译程序会内置检查工具。但 JavaScript 是一个动态的弱类型语言，在开发中比较容易出错。因为没有编译程序，为了寻找 JavaScript 代码错误通常需要在执行过程中不断调适。像 ESLint 这样的**可以让程序员在编码的过程中发现问题而不是在执行的过程中**。

TODO：不同 JavaScript 代码检查工具对比，例如：JSLint、JSHint 

> ESLint 的初衷是为了让程序员可以创建自己的检测规则。ESLint 的所有规则都被设计成可插入的。ESLint 的默认规则与其他的插件并没有什么区别，规则本身和测试可以依赖于同样的模式。为了便于人们使用，ESLint 内置了一些规则，当然，你可以在使用过程中自定义规则。
>
> ESLint 使用 Node.js 编写，这样既可以有一个快速的运行环境的同时也便于安装。

- 所有都是可拔插的
- 每条规则各自独立，可以开启或关闭，可以将结果设置成警告或者错误
- ESLint 并不推荐任何编码风格，规则是自由的，所有内置规则都是泛化的


- ESLint 使用 Espree 解析 JavaScript。
- ESLint 使用 AST 去分析代码中的模式
- ESLint 是完全插件化的。每一个规则都是一个插件并且你可以在运行时添加更多的规则。

# 安装使用
ESLint 有两种安装方式，各自安装命令如下：

- 本地安装：`npm install eslint --save-dev`
- 全局安装：`npm install eslint -g`

安装好 ESLint 之后就可以在命令行里使用 `eslint`，本地安装使用命令 `./node_modules/.bin/eslint`，全局安装可以直接使用命令 `eslint`。

1. `./node_modules/.bin/eslint --init`：初始化配置向导，会根据你的回答或选择来自动完成配置；
2. `./node_modules/.bin/eslint yourfile.js`：检查某个文件的代码

备注：**在使用本地安装的 ESLint 时，你使用的任何插件或可分享的配置也都必须在本地安装。相反，使用全局安装的 ESLint 时，你使用的任何插件或可分享的配置也都必须在全局安装。虽然全局安装使用上看起来比较方便，插件或配置只安装一次就可以了，但在实际项目中我们更需要让 ESLint 成为项目构建系统的一部分，以便于团队协作。**

TODO 列出一些常用的用法

更多 `eslint` 命令的使用参考 `eslint --help` 或 [ESLint 命令行](http://eslint.cn/docs/user-guide/command-line-interface)

# 配置详解

TODO ESLint 被设计为是完全可配置的，默认是没有任何检查规则的，

- [Rules](http://eslint.cn/docs/rules/)：
- https://www.npmjs.com/search?q=eslint-config

## 两种配置方式

1. 配置注释：使用 JavaScript 注释把配置信息直接嵌入到一个文件；
2. 配置文件：可以用 `.eslintrc.*` 文件或者在 `package.json` 文件里的 `eslintConfig` 字段这两种方式进行配置，ESLint 会查找和自动读取它们，另外，也可以在命令行指定一个配置文件。

备注：

- ESLint 支持多种格式的配置文件：JavaScript，JSON，YAML，package.json 。
- ESLint 默认会在要检测的文件目录里寻找配置文件 `.eslintrc.*` 或 `package.json` 的 `eslintConfig`，紧接着是父级目录，一直到文件系统的根目录。 —— 可以在一个项目的不同部分的使用不同配置。
- ESLint 配置文件层叠和优先级规则

    1. 与要检测的文件在同一目录下的 `.eslintrc.*` 或 `package.json` 文件 —— `.eslintrc` 和 `package.json` 同时存在，`.eslintrc` 优先级高会被使用，`package.json` 文件将不会被使用
    2. 继续在父级目录寻找 `.eslintrc` 或 `package.json` 文件，直到根目录（包括根目录）或直到发现一个有 `"root": true` 的配置 —— 子目录文件使用的配置是子目录配置文件覆盖合并上级目录配置文件后的规则
    3. ...

- 规则的优先级

    1. 行内配置

        1. `/*eslint-disable*/` 和 `/*eslint-enable*/`
        2. `/*global*/`
        3. `/*eslint*/`
        4. `/*eslint-env*/`

    2. 命令行选项

        1. `--global`
        2. `--rule`
        3. `--env`
        4. `-c、--config`

    3. 配置文件

## 配置要点

- 解析器 `parser`

    ESLint 默认使用 [Espree](https://github.com/eslint/espree) 作为其解析器，目前与 ESLint 兼容的解析器有：[Espree](https://github.com/eslint/espree)，[Esprima](https://npmjs.com/package/esprima)，[Babel-ESLint](https://npmjs.com/package/babel-eslint)。

    **疑问：不同的解析器有什么区别？**

- 解析器选项 `parserOptions`

    ESLint 允许指定你想要支持的 JavaScript 语言选项，代码类型，以及一些语言特性。

    - 默认设置的 JavaScript 语言是 ECMAScript 5
    - 默认设置的代码类型是 `script`

    **疑问：解析器选项对检查规则有什么影响？**

- 运行环境 `env`

    当 ESLint 检查到访问未定义的变量时，`no-undef` 规则将发出警告。而一般的运行环境都定义了预定义的全局变量，例如浏览器提供了 `document`等，我们可以根据项目类型来配置运行环境。

    备注：

    - 运行环境并不是相互排斥的，可以一次定义多个运行环境
    - 需要注意有些插件也提供了不同的运行环境

- 全局变量 `globals`

    除了运行环境提供的全局变量，你的项目里也可能有自定义的全局变量，为了避免 ESLint 发出警告，我们需要告诉 ESLint 这些全局变量。

- 插件 `plugins`

    疑问：有哪些可用的插件？

- 规则 `rules`

    ESLint 附带有大量的规则，要懂得 ESLint 提供了那些规则，以及这些规则的配置方式。

    备注：插件可以提供一些额外的规则，当指定从插件来的规则时，必须使用 `插件名/规则ID` 的形式配置，其中插件名要确保删除 `eslint-plugin-` 前缀。

备注：具体的配置方式参考 [Configuring ESLint](http://eslint.cn/docs/user-guide/configuring)

## 通过注释配置来临时禁止规则出现警告

- 如果要在某个文件中禁用 ESLint 或 ESLint 的某些规则，可以在文件顶部编写注释 `/* eslint-disable */` 或 `/* eslint-disable 规则ID */`
- 如果要在某个文件内的一些代码行禁用 ESLint 或 ESLint 的某些规则，可以在代码前使用注释 `/* eslint-disable */` 或 `/* eslint-disable 规则ID */`，并在代码后使用注释  `/* eslint-enable */` 或 `/* eslint-enable 规则ID */
- 如果禁用某一行代码的 ESLint 或 ESLint 的某些规则，可以在行尾或行上方添加注释 `// eslint-disable-line` 或 `// eslint-disable-next-line`

## 共享设置
TODO

## 配置继承
- ESLint 提供的配置

    - `eslint:recommended`：ESLint 提供的推荐配置，启用了一系列核心规则，参考[规则页面](http://eslint.cn/docs/rules/) 中打钩的规则
    - `eslint:all`：启用 ESLint 中所有的核心规则

- 第三方的配置

    - [自定义配置](http://eslint.cn/docs/developer-guide/shareable-configs)
    - [eslint-config-airbnb](https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb)
    - [library-boilerplate](https://github.com/gaearon/library-boilerplate)
    - [eslint-config-google](https://github.com/google/eslint-config-google)
    - [eslint-config-standard](https://github.com/feross/eslint-config-standard)
    - [eslint-config-defaults](https://github.com/walmartlabs/eslint-config-defaults)
    - [eslint-config-standard-react](https://github.com/feross/eslint-config-standard-react)
    - [eslint-config-cleanjs](https://github.com/bodil/eslint-config-cleanjs)

- 插件中的配置

    http://eslint.cn/docs/developer-guide/working-with-plugins

- 本地文件

## 忽略文件
除了上文提到的文件内注释来禁用 ESLint 外，可以通过在项目根目录创建一个 `.eslintignore` 文件告诉 ESLint 去忽略特定的文件和目录。`.eslintignore` 文件是一个纯文本文件，其中的每一行都是一个 `glob` 模式表明哪些路径应该忽略检测。

备注：

- **当 ESLint 运行时，在确定哪些文件要检测之前，它会在当前工作目录中查找一个 `.eslintignore` 文件。如果发现了这个文件，当遍历目录时，将会应用这些偏好设置。一次只有一个 .eslintignore 文件会被使用，所以，不是当前工作目录下的 `.eslintignore` 文件将不会被用到**
- ESLint 默认忽略 `/node_modules/*` 和 `/bower_components/*` 中的文件

# 工具集成
- 编辑器
- 构建工具、
- 命令行工具
- 代码管理
- 测试工具

参考 http://eslint.cn/docs/user-guide/integrations

# 常见问题
- [Support ES7 async/await proposal](https://github.com/eslint/eslint/issues/1657)
- [Use of `babel-eslint`](https://github.com/AtomLinter/linter-eslint/issues/35)

# 参考文献
- [Get Started with ESLint v1.0](http://devnull.guru/get-started-with-eslint/)
- [LT - ESLint Best Practices By Ian VanSchooten](https://youtu.be/L6vMey4FtQ0)
