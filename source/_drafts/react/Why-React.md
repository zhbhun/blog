---
title: 为什么使用 React
date: 2016-05-27
category: React
tags: React
---

TODO 思考传统编程有哪些方式，存在哪些缺点。
1. 后端模板
2. 前端模板
3. ...

# 组件式编程
传统的 Web 应用界面使用模板或者 HTML 指令构建，这些模板命令使得构建应用界面的时候非常抽象（？）。而，React 将应用界面拆分成一个个组件。得益于组件良好的的封装性，使得代码非常容易重用和测试，更容易降低代码耦合度。还有，React 真正完全地使用编程语言去渲染界面，充分利用 JavaScript 灵活和强大的编程特性。

此外，React 还创建了可选的扩展语法 —— JSX，相比原生的 JavaScript 可以提升代码的可阅读性。

# 响应式更新
在传统的 JavaScript 应用中，你需要观察数据的变化，并且命令式的修改 DOM。而 React 采取不一样的方法，在数据变化时，React 会自动管理所有界面的更新，而你只需要给出不同状态下渲染方法。

备注：DOM-Diff

# 单向数据流
In React, data flows one way: from owner to child. This is because data only flows one direction in the Von Neumann model of computing. You can think of it as "one-way data binding."


# 不仅仅是 HTML
- canvas: https://github.com/Flipboard/react-canvas
- native: https://facebook.github.io/react-native
- server: https://github.com/petehunt/react-server-rendering-example

# 参考文献
- [Why React?](http://facebook.github.io/react/docs/why-react.html)
- [Why did we build React?](http://facebook.github.io/react/blog/2013/06/05/why-react.html)
