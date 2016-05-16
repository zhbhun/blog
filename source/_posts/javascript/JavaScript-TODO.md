---
layout: post
title: JavaScript TODO
date: 2016-03-15
categories: JavaScript
tags: JavaScript
---

- 安全的类型检测：JavaScript 内置的类型检测机制并非完全可靠。
    - Safari4- 在对正则表达式应用 typeof 操作符时会返回 function；
    - instanceof 操作符必须在同一全局作用域下；
    - 检测某个对象到底是原生对象还是开发人员自定义的对象；
- 作用域安全的构造函数：开发过程中可能会不小心直接调用构造函数（没有使用 new），以致修改了全局作用域的属性，导致页面出现错误。

    类型检测 + 原型链继承

- 惰性载入函数：惰性载入表示函数执行的分支仅发发生一次
    - 两种方式
        1. 在函数调用时再处理函数；
        2. 声明函数时就指定适当的函数；
    - 应用场景：需要进行浏览器环境检测的函数
    - 应用案例：创建 XMLHttpRequest
- 函数绑定
    - 实现原理：闭包
    - 应用场景：回调函数和事件处理程序绑定代码执行环境
- 函数柯里化: 用于创建已经设置好了一个或多个参数的函数，函数柯里化作为函数绑定的一部分包含在其中
- 防篡改对象：不可扩展，密封，冻结
- 重复的定时器
- Yielding Processes: 一旦某个函数需要花 50ms 以上的时间完成，那么最好看看能否将任务分割为一系列可以使用定时器的小任务
- 函数节流：onsizechange, onvaluechange
- 自定义事件
- 托放
- HTML 5
    - 离线检测：navigator.onLine，online 事件，offline 事件
    - 应用缓存
    - 数据存储
        - Cookie：限制，构成，增删查改，子 Cookie
        - Web 存储机制
- JavaScript 代码可维护性
    - 代码格式化：缩进，引号，注释（函数，大段代码，复杂算法，Hack），
    - 命名规范：变量用名词，函数用动词开头
    - 变量类型透明：初始化，匈牙利标记法，类型注释
    - 松散耦合：解耦 HTML 和 JavaScript，接偶应用逻辑和事件处理程序
    - 尊重对象所有权
    - 避免全局变量
    - 使用常量
- JavaScript 性能
    - 作用域：避免全局查找，避免 with 语句
    - 选择正确方法：避免不必要的属性查找，优化循环，展开循环，避免双重解释，使用原生方法，使用 swtch 语句，使用位运算符
    - 最小化语句数：多个变量声明，插入迭代值，使用数组和对象字面量
    - 优化 DOM 交互：最小化现场更新，使用 innerHTML，使用事件代理，注意 HTMLCollection
- JavaScript 部署：构建 -> 校验 -> 压缩


# 博文
- [Web Bluetooth API 初探](http://qianduan.guru/2016/03/18/An-introduction-to-the-Web-Bluetooth-API)
- [WebSocket的简单介绍及应用](http://acgtofe.com/posts/2016/03/websocket-how-to)
- [造轮子和用轮子：快速入门JavaScript模块化](https://segmentfault.com/a/1190000004619857)
- [JavaScript中的各种模块化规范](https://reeoo.me/archives/amd-cmd-umd-commonjs.html)
- [H5单页面手势滑屏切换原理](http://www.cnblogs.com/onepixel/p/5300445.html)
- [【译】JavaScript 中的“纯函数”](https://www.h5jun.com/post/pure-function.html)
