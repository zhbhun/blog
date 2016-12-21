---
title: NPM
date: 2016-06-29
category: Node.js
tags: Node.js
---

- [npm-global-without-sudo](https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md)

# 简介

NPM 是 Node.js 的一个包管理器，以命令行的形式运行，并管理程序的依赖关系，可以从 npm 注册库里下载安装程序。NPM 是完全由 Javascript 实现的，它的开发者是 Isaac Z. Schlueter（有丰富的 CommonJS 开发经验），其中借鉴了 PEAR 和 CPAN  的实现。

- [NPM in Wikipedia](https://en.wikipedia.org/wiki/Npm_(software)) 维基百科解释，简单了解什么是 NPM
- [NPM Search](https://www.npmjs.com/)  NPM 首页，可搜索包
- [NPM Docs](https://docs.npmjs.com/) NPM 文档
- [NPM Blog](http://blog.npmjs.org) NPM 博客
- [NPM Weekly](https://www.npmjs.com/npm-weekly) 可提交自己的邮箱来订阅 NPM 周报
- [NPM About](https://www.npmjs.com/about) 关于 NPM
- [NPM in Github](https://github.com/npm/npm) NPM Github 地址
- [NPM Issue in Gtithub](https://github.com/npm/npm/issues)  NPM Github 讨论区
- [NPM in Twitter](https://twitter.com/npmjs) NPM Twitter 帐号
- [most depended-upon packages](https://www.npmjs.com/browse/depended) 被依赖最多的包
- [packages people 'npm install' a lot](https://www.npmjs.com/#explicit) 安装最多的包

# 安装

## 安装
NPM 是 Node.js 默认的包管理器，从 Node.js 0.6.3 开始，NPM 会跟随 Node.js 一块安装，运行下面的命令可检测当前安装的 NPM 版本。

`npm -v`

## 升级
虽然 NPM 跟随着 Node.js 安装，但是 NPM 的更新频率更高，可以执行下面的命令来检查和更新 NPM 安装版本。

`sudo npm install npm -g`

## 问题
### 权限问题
按照模块的安装位置 NPM 模块安装方式分为两种：本地和全局。在以全局方式模块的时候，可能会遇到错误 `EACCES`，这表示没有全局安装路径的写权限。解决该问题有两种方案：

1. 修改默认全局安装路径的读写权限

    1. 查看默认全局安装路径：`npm config get prefix`；
    2. 如果上面的路径是 `/usr`，请使用方案二；
    3. 修改默认全局安装路径的权限：`sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}`；

2. 修改全局安装路径

    1. 创建一个文件夹作为全局安装路径：`mkdir ~/.npm-global；`
    2. 配置 NPM 全局安装路径：`npm config set prefix '~/.npm-global'`；
    3. 打开 `~/.profile` 并添加行：`export PATH=~/.npm-global/bin:$PATH`
    4. 更新环境变量：source ~/.profile
    5. 测试：`npm install -g jshint`
    6. 备注

        - 3 - 4 步骤用于设置全局安装命令的环境变量 PATH，如果是 window 系统，请参考 Window 设置环境变量的方式
        - 如果不想修改 `~/.profile`，可以在每次运行命令的时候加上：`NPM_CONFIG_PREFIX=~/.npm-global npm install -g jshint`



## 参考文献

- [Installing Node.js and updating npm](https://docs.npmjs.com/getting-started/installing-node) 安装与升级 NPM
- [NodeSource's binary distributions](https://github.com/nodesource/distributions) Linux NodeJS 二进制发布脚本仓库
- [Fixing npm permissions](https://docs.npmjs.com/getting-started/fixing-npm-permissions) 解决权限问题

# 使用
## 本地安装
- [Installing npm packages locally](https://docs.npmjs.com/getting-started/installing-npm-packages-locally) 本地安装 NPM 模块
- [Using a package.json](https://docs.npmjs.com/getting-started/using-a-package.json) 使用 package.json 安装模块
- [Updating local packages](https://docs.npmjs.com/getting-started/updating-local-packages) 更新本地模块

## 全局安装
- [Installing npm packages globally](https://docs.npmjs.com/getting-started/installing-npm-packages-globally)
- [Updating global packages](https://docs.npmjs.com/getting-started/updating-global-packages)
- [Uninstalling global packages](https://docs.npmjs.com/getting-started/uninstalling-global-packages)


## 语义化版本
- [语义化版本 2.0.0](http://semver.org/lang/zh-CN/)
- [Semantic versioning and npm](https://docs.npmjs.com/getting-started/semantic-versioning) NPM 模块版本规范
- [semver](https://docs.npmjs.com/misc/semver) 语义化版本解析器

## 模块范围
- [Working with scoped packages](https://docs.npmjs.com/getting-started/scoped-packages)

## 模块标签
- [Using dist-tags](https://docs.npmjs.com/getting-started/using-tags)

## 发布模块
- [Creating Node.js modules](https://docs.npmjs.com/getting-started/creating-node-modules)
- [Publishing npm packages](https://docs.npmjs.com/getting-started/publishing-npm-packages)

# 配置
- https://docs.npmjs.com/files/npmrc

# 原理
- [Packages and Modules](https://docs.npmjs.com/how-npm-works/packages)
- [npm v2 Dependency Resolution](https://docs.npmjs.com/how-npm-works/npm2)
- [npm v3 Dependency Resolution](https://docs.npmjs.com/how-npm-works/npm3#npm-v3-dependency-resolution)
- [npm3 Duplication and Deduplication](https://docs.npmjs.com/how-npm-works/npm3-dupe)
- [npm3 Non-determinism](https://docs.npmjs.com/how-npm-works/npm3-nondet)

# npm命令
- [nodejs npm常用命令](http://www.cnblogs.com/linjiqin/p/3765772.html)

# 常见问题
## 全局VS本地
- [nodejs npm install全局安装和本地安装的区别](http://www.jb51.net/article/50669.htm)
- [Windows 系统下设置Nodejs NPM全局路径](http://www.cnblogs.com/picaso/p/3848209.html)

## npm安装github上的模块失败
- [git: fatal: Could not read from remote repository](http://stackoverflow.com/questions/13509293/git-fatal-could-not-read-from-remote-repository)
- [GitHub : fatal: Could not read from remote repository.](http://www.serveridol.com/2013/07/24/github-fatal-could-not-read-from-remote-repository/)
- [git pull 出错 fatal: Could not read from remote repository.Please make sure you have the correct access rights.and the repository exists.](http://www.forwhat.cn/post-144.html)
 
## 仓库管理
- [Does the Javascript community have a dependency retrieval (like maven or gem)?](http://stackoverflow.com/questions/6849440/does-the-javascript-community-have-a-dependency-retrieval-like-maven-or-gem)
- [npm i每次都下载,有没更快的方法?](https://cnodejs.org/topic/538b6a20a087f45620df40a2)
- [npm 三点疑问?](http://www.zhihu.com/question/27046814)
- [JavaScript 中字符串变量使用单引号和双引号的利弊](http://www.zhihu.com/question/21168673)

# 镜像
[淘宝 NPM 镜像](http://npm.taobao.org/)

- 使用 cnpm：`npm install -g cnpm --registry=https://registry.npm.taobao.org`
- 修改 npm 镜像：`npm config set registry https://registry.npm.taobao.org npm config set disturl https://npm.taobao.org/dist`

# 附录
## 命令行
https://docs.npmjs.com/cli/access

# NPMCDN
- 官网：https://npmcdn.com/#/
- 是什么：NPMCDN 是一个基于 npm 建立的 CDN。
- 怎么用：`https://npmcdn.com/package@version/file`
    - 默认版本（latest）：https://npmcdn.com/react/dist/react.min.js
    - 指定版本：`https://npmcdn.com/react@15.0.1/dist/react.min.js`
    - 版本范围：https://npmcdn.com/react@^0.14/dist/react.min.js
    - 标签：`https://npmcdn.com/react@latest/dist/react.min.js`
    - 文件列表：`https://npmcdn.com/react/`
- ...

# TODO
- [sinopia](https://github.com/rlidwka/sinopia)
