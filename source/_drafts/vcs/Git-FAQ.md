---
title: Git 常见问题
date: 2016-08-09
category: VCS
tags: VCS
---


# AutoCRLF
- Window 换行符是 CR + LF，OS X 和 Linux 换行符使用 LF；
- Git 换行符转换功能 autocrlf
    - false：提交检出均不转换；
    - true：提交时转换为LF，检出时转换为CRLF；
    - input：提交时转换为LF，检出时不转换
- 建议配置：Window 下将 core.autocrlf 设为 true，在 OS X 和 Linux 下设为 input
- 参考文献
    - [Git自动转换换行符(autocrlf)带来的问题](http://www.luckyonecn.com/blog/git-auto-crlf-problem/)

# SafeCRLF
- true：拒绝提交包含混合换行符的文件
- false：允许提交包含混合换行符的文件
- warn：提交包含混合换行符的文件时给出警告

- [Oh shit, git!](http://ohshitgit.com/)

# 子模块
- 分割代码到不同的库
- 添加子模块到多个库

**用法**

- 初始化：克隆仓库后使用
    - `git submodule update --init`：更新子模块，没有初始化的会先初始化；
    - `git submodule update --init --recursive`：子模块内有子模块时，可使用该命令递归初始化和更新子模块
- 添加子模块
    1. `git submodule add git@github.com:url_to/awesome_submodule.git path_to_awesome_submodule`：添加子模块时，并没有将子模块代码添加到主仓库，只是添加了子模块的信息 —— 子模块信息在 `.gitmodules` 文件中；
    2. `git submodule init`：获取子模块代码；
    3. `git add .gitmodules`，`git mommit -m "add submodule xxx"` 和 `git push`：提交子模块至远程仓库；
- 修改子模块
    1. 修改并提交子模块代码：子模块是一个单独的库，可以像正常的库一样修改子模块库 —— 在子模块目录执行仓库操作命令；
    2. 执行第一步后，在主仓库执行 `git status` 可以发现子模块在列表 `Changes not staged for commit` 中 —— 主模块指向的提交记录和子模块已经不一致了；
    3. `git add`, `git commit -m "..."` 和 `git push`：使主仓库指向新的子模块提交记录；
- 更新子模块
    1. `git pull`：只会更新当前主仓库指向的子模块提交记录，而不会去更新子模块的代码；
    2. `git submodule update`：更新子模块代码 —— 如果不执行的化，会发现 `git status` 显示子模块是处于修改状态（指向了不一致的提交记录）；

**误区**

- 主仓库通过 `.gitmodules` 来维护包含的子模块，并且主仓库只是包含了子模块提交记录的指针（主仓库引用的是子模块哪一个版本）。
- 在维护子模块的时候，要将子模块当做一个单独的仓库来处理。
- 在维护主仓库的时候，要将子模块当成一个包含子模块指针的文件来处理。
    
**参考文献**
[Git Submodules basic explanation](https://gist.github.com/gitaarik/8735255)
