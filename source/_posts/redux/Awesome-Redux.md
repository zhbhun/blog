---
title: Redux 学习资源
date: 2016-04-19
category: javascript
tags: javascript
---

![Redux](../../images/Redux/Redux.png)

- [官方地址](https://github.com/reactjs/redux)
- [redux 英文文档](http://redux.js.org/docs/introduction/)
- [Redux 中文文档](http://cn.redux.js.org/)
- [awesome-redux](https://github.com/xgrommx/awesome-redux)
- [react-redux-links](https://github.com/markerikson/react-redux-links)
- [redux-ecosystem-links](http://cn.redux.js.org/docs/introduction/Ecosystem.html)

# 生态系统
- [react-redux](https://github.com/reactjs/react-redux)
- [redux-devtools](http://github.com/gaearon/redux-devtools)

# API
- redux
    - `combineReducers({refuce, ...})`
    - `createStore(reduces, initState)`
    - `storeInstatnce.subscribe(callbak: Function)`
    - `storeInstatnce.dispatch(action: Object)`
    - `connect(mapStateToProps, mapDispatchToProps)` ?
    - `mapStateToProps(state, ownProps)`
    - `mapDispatchToProps(dispatch, ownProps)`
- react-redux
    - Provider[store] ?

# 教程示例
- [counter-vanilla](https://github.com/reactjs/redux/blob/master/examples/counter-vanilla)：该示例不需搭建系统或视图框架，展示了基于 ES5 的原生 Redux API。

    stores.subscribe(render) -> view -> 用户交互 -> stores.dispatch(action) -> reduce(state, action) -> 重新渲染

- [Counter](https://github.com/reactjs/redux/tree/master/examples/counter)：Redux 结合 React 使用的最基本示例。出于简化，当 store 发生变化，React 组件会手动重新渲染。在实际的项目中，可以使用 React 和 Redux 已绑定、且更高效的 React Redux。

    同上

- [todos](https://github.com/reactjs/redux/tree/master/examples/todos)：深入理解在 Redux 中 state 的更新与组件是如何共同运作的例子。展示了 reducer 如何委派 action 给其它 reducer，也展示了如何使用 React Redux 从展示组件中生成容器组件。
    - actions：动作创建
    - components：通用组件
    - containers：绑定状态或动作的容器组件
    - reduces：拆分 reduce
    - index.js
- [Todos with Undo](https://github.com/reactjs/redux/tree/master/examples/todos-with-undo)：前一个示例的衍生。基本相同但额外展示了如何使用 Redux Undo 打包 reducer，仅增加几行代码实现撤销/重做功能。
- [TodoMVC](https://github.com/reactjs/redux/tree/master/examples/todomvc)：经典的 TodoMVC 示例。与 Todos 示例的目的相同，为了两者间比较罗列在此。
    - constants：声明动作名称
    - actions：创建动作
    - reduces
    - store：配置 store
    - components
    - containers

TODO
- [Shopping Cart](https://github.com/reactjs/redux/tree/master/examples/shopping-cart)：该示例展示了随着应用升级变得愈发重要的常用的 Redux 模式。尤其展示了，如何使用 ID 来标准化存储数据实体，如何在不同层级将多个 reducer 组合使用，如何利用 reducer 定义选择器以封装 state 的相关内容。该示例也展示了使用 Redux Logger 生成日志，以及使用 Redux Thunk 中间件进行 action 的条件性分发。
- Tree View
- Async
- Universal
- Real World
- [simplest-redux-example](https://github.com/jackielii/simplest-redux-example)
- [redux-tutorial-cn](https://github.com/react-guide/redux-tutorial-cn)

# 博文精选
- [redux-tutorial-cn](https://github.com/react-guide/redux-tutorial-cn)：这是一个很简短的教程，可以让你领略 Flux 和 Redux 思想的精髓
- [redux-simple-tutorial](https://github.com/kenberkeley/redux-simple-tutorial)

# 实例应用
- [React Redux Example](http://react-redux.herokuapp.com/)
- [SoundRedux](https://github.com/andrewngu/sound-redux)：用 Redux 构建的 SoundCloud 客户端
- [Shopping Cart (Flux Comparison)](https://github.com/voronianski/flux-comparison/tree/master/redux)：用于和 Flux 框架做对比的购物车示例

# 开源项目
- [redux-framework](https://github.com/reduxframework/redux-framework): Redux is a simple, truly extensible options framework for WordPress themes and plugins.
- [redux-demo](https://github.com/survivejs/redux-demo)

# 参考文献
- [Redux 介绍](http://segmentfault.com/a/1190000003503338)
- [Redux 核心概念](http://www.jianshu.com/p/3334467e4b32)
- [0 to 1 : Getting started with Redux](http://www.jchapron.com/2015/08/14/getting-started-with-redux/)
- [Redux 中文文档](http://camsong.github.io/redux-in-chinese/)
- [xgrommx/awesome-redux](https://github.com/xgrommx/awesome-redux)
- [还在纠结 Flux 或 Relay，或许 Redux 更适合你](https://github.com/camsong/blog/issues/1)
- [深入到源码：解读 redux 的设计思路与用法](https://github.com/Lucifier129/Lucifier129.github.io/issues/9)
- [React redux 最小counter样例](http://react-china.org/t/react-redux-counter/2306)
- [使用Redux管理你的React应用](http://www.cnblogs.com/matthewsun/p/4773646.html)
- [Redux学习之一：何为middleware？](http://segmentfault.com/a/1190000003746223)
- [FriendlistRedux](https://github.com/szhclaye/FriendlistRedux)
- [这段时间研究了下Redux，写写自己对它的感觉。](https://github.com/lawrencebla/redux-review)

# API
- redux
    - createStore
- react-redux
    - Provider
    - connect
