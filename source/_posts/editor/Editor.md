---
title: Editor
date: 2016-06-23
category: Editor
tags: Editor
---

- [SitePoint Smackdown: Atom vs Brackets vs Light Table vs Sublime Text](https://www.sitepoint.com/sitepoint-smackdown-atom-vs-brackets-vs-light-table-vs-sublime-text/?utm_source=tuicool&utm_medium=referral)

1. 代码导航
    - 前进
    - 后退
    - 跳转行
    - 代码结构
    - 查看定义
    - 查看引用
    - 文件查找
    - 文件内容查找
2. 语法高亮
3. 语法检查
4. 代码片段
5. 扩展插件
6. 主体样式



# Sublime VS Atom VS VSC
- Sublime 支持 Markdown 标题树形结构，而 Atom 不支持

代码结构

- sublime：支持，且 markdown 标题层级有缩进
- atom：支持，但 markdown 标题层级没有缩进
- vsc：部分支持（不支持 markdown 标题）

查看定义

- sublime：支持，但只能识别当前文件中的定义，而且存在多个重名的定义时，无法准确定位
- atom：不支持
- vsc：支持

代码提示

- sublime：只能根据当前的输入来提示，且不支持 JavaScript API 自动完成提示，需要自行配置代码片段
- atom：同上
- vsc：可以根据上下文来自动提示，例如：输入 `this.` 可以迅速的显示可调用的方法，而且支持 JavaScript API 自动完成提示。

语法高亮

- sublime：良好
- atom：良好
- vsc：一般，部分变量和方法识别不出来
