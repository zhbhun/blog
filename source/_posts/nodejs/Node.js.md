---
title: Node.js
date: 2016-05-15
category: Node.js
tags: Node.js
---

Node.js 是一个 Javascript 运行环境。实际上它是对 Google V8 引擎进行了封装。V8 引 擎执行 Javascript 的速度非常快，性能非常好。Node.js 对一些特殊用例进行了优化，提供了替代的 API，使得 V8 在非浏览器环境下运行得更好。

# 安装配置
安装 nvm

1. 安装 nvm：`curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash` —— 克隆 nvm 仓库到 ~/.nvm 目录，并添加配置到 ~/.bash_profile, ~/.zshrc, ~/.profile, 或 ~/.bashrc 中

    ```
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
    ```

2. 验证 nvm：`nvm --version`
3. 升级 nvm

    1. cd "$NVM_DIR"
    2. git fetch origin
    3. git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
    4. $NVM_DIR/nvm.sh

安装 node

- 安装默认版本：`nvm install node`
- 安装最新稳定版本：`nvm install stable`
- 安装指定版本：`nvm install <version>`

切换 node

- 临时切换：`nvm use <version>` —— 只在当前 shell 起作用
- 修改默认 `node：nvm alias default <version>` —— 在所有 shell 中起作用
- 项目配置：项目所需的 node 版本和默认的不同，可配置 .nvmrc 来解决

    1. `cd <项目根目录>`
    2. `echo 4 > .nvmrc` —— 将 .nvmrc 文件提交到版本控制仓库
    3. `nvm use` —— 自动读取 .nvmrc 中配置的版本号，所以不需要再指定版本号，但每次开启新的 shell 时都需要执行该命令
    4. `node -v`

参考文献

- https://github.com/creationix/nvm
- [使用 nvm 管理不同版本的 node 与 npm](http://www.cnblogs.com/kaiye/p/4937191.html)

# 更新历史
- [Node.js 6.0支持93%的ES2015语法](http://www.tuicool.com/articles/hit/aAVbYnI)

# 学习资源
- [如何用 Node.js 编写一个 API 客户端](http://morning.work/page/2016-05/how-to-write-a-nodejs-api-client-package.html)
