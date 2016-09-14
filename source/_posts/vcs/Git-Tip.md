---
title: Git Tip
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
