---
title: Immutable JS
date: 2016-05-28
categories: JavaScript
tags: JavaScript
---

# 是什么
- 简要介绍: Immutable persistent data collections for Javascript which increase efficiency and simplicity.
- 官方网站: http://facebook.github.io/immutable-js/
- 官方文档: http://facebook.github.io/immutable-js/docs/#/
- GitHub网站: https://github.com/facebook/immutable-js
- WIKI: https://github.com/facebook/immutable-js/wiki
- ISSUE: https://github.com/facebook/immutable-js/issues
- 特性
    - *no defensive copying*
    - *advanced memoization*
    - *change detection techniques*
    - 与 [ES6 Array]( https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array ), [Map]( https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map ) 和 [Set]( https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set ) 相近的语法

# 为什么
解决问题

弥补了Javascript没有不可变数据结构的问题,  不可变数据结构是函数式编程中必备的.  Javascript中对象都是参考类型,  可变的好处是节省内存或是利用可变性做一些事情，但是，在复杂的开发中它的副作用远比好处大的多.

问题案例
1. React 组件状态更新的性能优化

    调用 setState 方法总是会触发 render 方法从而进行 vdom re-render 相关逻辑, 哪怕实际上你没有更改到 Component.state. 虽然 React 提供了  shouldComponentUpdate 方法来 控制触发 vdom re-render 逻辑的条件, 但面对复杂数据结构类型的属性时,   shouldComponentUpdate  的判读逻辑在现有条件下只能够通过 deep-diff 来实现, 其性能还不够好 --- React 提高了一个插件 [ PureRenderMixin ]( http://facebook.github.io/react/docs/pure-render-mixin.html ) 来解决, 但  PureRenderMixin 只是浅比较对象.
    **TODO**: 编写一个测试例子
2. 监控数据变化
    > 一般来说监测数据变化时可以用 Object.observe，或者自己去遍历数据结构进行对比。这样计算差异时可能做很多不必要的检查。Immutable 把事情提前做了，在修改数据的时候就检查差异，不变返回原引用，有变化则直接返回一个新的引用。这样检查任何数据都只要简单地用 `===` 对比就行了。这东西应该也是配合 Facebook 自家的 React 框架和 Flux 架构来用的。
    *http://www.zhihu.com/question/28016223/answer/39891844*

传统解决方案

没有不可变数据结构, 代替的解决方案就是浅复制和深复制. 常见的实现方法, 如下:
- jQuery extend
- ES5.1 freeze
- ES6 assign

虽然浅复制和深复制可以解决问题, 但是存在性能问题. 每次深复制都要把整个对象递归的复制一份, 而immutable-js 的实现有些像链表，添加一个新结点把旧结点的父子关系转移到新结点上，性能提升很多, 具体原理可参考[Persistent data structure](https://en.wikipedia.org/wiki/Persistent_data_structure).

参考文献
- [Immutable-as-React-state](https://github.com/facebook/immutable-js/wiki/Immutable-as-React-state)
- [facebook immutable.js 意义何在，使用场景？](http://www.zhihu.com/question/28016223)

---

# 怎么样
## Getting Started
http://facebook.github.io/immutable-js/#getting-started

## JS优先的 API

## 原生对象转换

## ES6 语法

## 嵌套数据结构
http://facebook.github.io/immutable-js/#nested-structures

## 懒操作
http://facebook.github.io/immutable-js/#lazy-seq

## 批量修改
http://facebook.github.io/immutable-js/#batching-mutations

## 其他
- Immutable.is: 根据数据判断集合是否相等 , 可参考 [equality-treats-collections-as-data](http://facebook.github.io/immutable-js/#equality-treats-collections-as-data)

---

# 实际应用
## React
- [Immutable-as-React-state](https://github.com/facebook/immutable-js/wiki/Immutable-as-React-state)

---

# 参考文献
## 专业术语
- [Immutable object](https://en.wikipedia.org/wiki/Immutable_object)
- [Persistent](http://en.wikipedia.org/wiki/Persistent_data_structure)



- [immutable-js](https://github.com/facebook/immutable-js) - [redux与immutable实例](http://react-china.org/t/redux-immutable/2431)
- [大家对 immutable-js 的接受程度如何?](http://react.nodejs-china.org/t/immutable-js/257)
- [笔记 immutable-js 基本操作(基本操作)](http://segmentfault.com/a/1190000002909224)
- [PureRenderMixin](http://facebook.github.io/react/docs/pure-render-mixin.html)
- [Why FluxComponent > fluxMixin](http://acdlite.github.io/flummox/docs/guides/why-flux-component-is-better-than-flux-mixin)
- [Use Simple Data Structures](https://medium.com/@chenglou/use-simple-data-structures-b081e5689f9?source=tw-701b0000d771-1445488850416)
