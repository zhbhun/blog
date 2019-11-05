---
title: Vim
date: 2016-10-18
category: Editor
tags: Editor
---

- [简明 Vim 练级攻略](http://coolshell.cn/articles/5426.html)
- [Vim Commands Cheat Sheet](http://bullium.com/support/vim.html)

# 安装
- [Vim 8.0 Released! How to install it in Ubuntu 16.04](http://tipsonubuntu.com/2016/09/13/vim-8-0-released-install-ubuntu-16-04/)

# 起步
三种模式

- Insert 模式
- Normal 模式
- Command 模式

入门操作

- 模式切换

    - `i`：进入 Insert 模式；
    - `esc`：返回到 Normal 模式；
    - `:`：进入 Command 模式

- Normal

    - `x`：删当前光标所在的一个字符；
    - `dd`：删除当前行，并把删除的行存到剪贴板里
    - `hjkl`：光标移动

- 命令模式

    - `:wq`：存盘 + 退出 (:w 存盘, :q 退出)   （陈皓注：:w 后可以跟文件名）
    - `:help <command>`：显示相关命令的帮助

- 其他
    
    - p：粘贴剪贴板

# 进阶
**各种插入模式**

a → 在光标后插入
o → 在当前行后插入一个新行
O → 在当前行前插入一个新行
cw → 替换从光标所在位置后到一个单词结尾的字符



- [Vim配置、插件和使用技巧](http://www.jianshu.com/p/a0b452f8f720)
- [你最常用的 VIM 插件有哪些？](https://www.zhihu.com/question/19634223)
- [那些离了就活不了的 VIM 插件](http://www.zlovezl.cn/articles/vim-plugins-cannot-live-without/)
- [use_vim_as_ide](https://github.com/yangyangwithgnu/use_vim_as_ide)
