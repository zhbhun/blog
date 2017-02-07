---
title: IDEA
date: 2016-06-15
category: IDE
tags: IDE
---

https://www.jetbrains.com/help/idea/2016.3/discover-intellij-idea.html

# 技巧
## 快速查找
- 简介：快速查找可以在工具窗口里快速定位文件或文件夹
- 用法：

    1. 选中某个工具窗口，例如 "Project Structure"
    2. 输入要查找的名称，IDEA 自动定位到第一个匹配的文件
    3. 按方向键上和下，在匹配的文件之间跳转
    4. 按下 Esc 退出快速查找

- 备注：快速查找只支持展开的节点
- 参考： [Speed Search in the Tool Windows](https://www.jetbrains.com/help/idea/2016.3/speed-search-in-the-tool-windows.html)

## 自动完成

# 问题
1. 怎么自动完成依赖引入？

# 快捷键
- https://resources.jetbrains.com/assets/products/intellij-idea/IntelliJIDEA_ReferenceCard.pdf
- [Eclipse Keymap vs. IntelliJ IDEA Keymap](https://confluence.jetbrains.com/display/IntelliJIDEA/Configure+Keymap)
- [IntelliJ IDEA and Eclipse Shortcuts](https://www.catalysts.cc/wissenswertes/intellij-idea-and-eclipse-shortcuts/)

## 界面
- ctrl + alt + s：打开设置界面
- ctrl + alt + shift + s：打开项目设置
- alt + 1：开闭项目视图
- alt + 9：开闭版本控制视图
- alt + f12：开闭控制台视图
- esc：光标定位到编辑器
- ctrl + Shift + f12：隐藏所有工具窗口
- `View | Enter Distraction Free Mode`：Distraction Free Mode，只显示编辑器的模式

## 查找
- alt + home：定位导航条
- ctrl + shift + r：查找文件
- ctrl + shift + t：查找类
- ctrl + alt + shift + n：查找符号？
- ctrl + e：最近打开文件
- shift-shift：查找所有（最近，类，文件，符号）
- ctrl + h：查找文本（指定路径或项目，大小写，单词匹配等）
- ctrl + o：显示当前类型的成员
- f4：显示类型结构
- ctrl + f：文件内查找
- ctrl + g：查找引用
- ctrl + shift + g：查找文件内引用
- ctrl + shift + h：方法调用层级？
- ctrl + alt + h：调用层级？

## 导航
- ctrl + t：？
- f3：跳转到源代码
- alt + left / right：前进后后退
- ctrl + q：跳转到最后一次编辑位置
- ctrl + l / shift + ctrl + k：查找前一个或后一个
- ctrl + shift + up / down：跳转到前一个或后一个成员
- ctrl + [ / ]：跳转到代码块开始或结束位置？
- ctrl + shift + p：跳转到匹配的括号？
- ctrl + left / right：跳转到下一个或上一个单词
- ctrl + m：滚动到中间？
- tab：下一个参数？
- shift + tab：上一个参数？
- ctrl + l：跳转行

## 编辑
- ctrl + d：删除行
- ctrl + shift + d：删除到行尾？
- ctrl + delete / backspace：删除到最后或最开始一个单词？
- ctrl + alt + down：复制行
- ctrl + shift + o：整理引入类
- alt + shift + r：重命名
- ctrl + shift + f：格式化
- ctrl + shift + [ / ]：跳转到代码块开始或结束位置，并选中代码块？
- alt + shift + up / down：扩展或收缩选中
- ctrl + enter：拆分行？
- shift + enter：开始新行
- ctrl + alt + enter：在当前代码之前开始新行
- ctrl + z：恢复
- ctrl + y：重做
- ctrl + shift + enter：自动完成？
- ctrl + shift + j：加入行？
- ctrl + shift + u / ctrl + shift + x / ctrl + shift + y：大小写转换
- alt + insert：生成代码
- alt + up / down：移动行

## 调试
- alt + shift + x：运行
- alt + shift + d：调试
- f5：跳进去
- f6：跳过去
- f7：跳出来
- f8：继续

## 其他
- ctrl + n：右键
- alt + shift + insert：列选中模式？
- ctrl + shift + c：赋值路径？
- ctrl + shift + v：从历史复制？
- ctrl + alt + f7：显示引用界面
- ctrl + d：比较文件
