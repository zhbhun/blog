---
title: Redux 学习资源
date: 2016-04-19
category: Redux
tags: Redux
---

![Redux](../../images/Redux/Redux.png)

- [官方地址](https://github.com/reactjs/redux)
- [redux 英文文档](http://redux.js.org/docs/introduction/)
- [Redux 中文文档](http://cn.redux.js.org/)
- [awesome-redux](https://github.com/xgrommx/awesome-redux)
- [react-redux-links](https://github.com/markerikson/react-redux-links)
- [redux-ecosystem-links](http://cn.redux.js.org/docs/introduction/Ecosystem.html)

# 快速上手
...

# 核心概念
- Action：Action 是把数据从应用传到 store 的有效载荷
    - 用法：Action 是个普通对象，必须使用一个字符串类型的 type 字段来表示将要执行的动作。除了 type 字段外，action 对象的结构完全由你自己决定；
    - 实践：
        - 多数情况下，type 会被定义成字符串常量；
        - 当应用规模越来越大时，建议使用单独的模块或文件来存放 action；
        - 尽量减少在 action 中传递的数据；
- Action 创建函数：生成 action 的方法；
    - 用法：
        1. 把 action 创建函数的结果传给 dispatch() 方法即可发起一次 dispatch 过程；
        2. 创建一个被绑定的 action 创建函数来自动 dispatch；
        3. 使用 react-redux 提供的 connect() 帮助器来调用，bindActionCreators() 可以自动把多个 action 创建函数 绑定到 dispatch() 方法上；
    - 误区：Action 创建函数只会返回一个 action，这和传统的 Flux 实现有所区别；
    - 高级：Action 创建函数也可以是异步非纯函数；
- Reducer：指明应用如何更新 state
    - 用法：reducer 就是一个纯函数，接收旧的 state 和 action，返回新的 state
    - 要点
        - 不要修改 reducer 的传入参数；
        - 不要执行有副作用的操作，如 API 请求和路由跳转；
        - 调用非纯函数，如 Date.now() 或 Math.random()；
    - 实践
        - 拆分 Reducer；
        - ...
- Store：用来维持应用所有的 state 树的一个对象
    - getState()
    - dispatch(action)
    - subscribe(listener)
    - replaceReducer(nextReducer)

# 实践
- Redux + React
    - 容器组件 VS 展示组件
        - 容器组件放在顶层，展示组件放在中间和子组件
        - 容器组件需要监听 Store，展示组件不需要
        - 容器组件从 Store 中读取数据，展示组件从 props 读取
        - 容器组件向 Store 派发 Action 来修改数据，展示组件调用 props 的回调函数
    - 设计组件层次结构
    - 连接 Store：尽量只做一个顶层组件，避免多个组件连接到 Store（遵循单向数据流，否则难以跟踪数据流）；

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

# 常见问题?
- active 结构

    ```
    {
        type: String,
        ...
    }
    ```

- action type 命名规则？

- 创建 action 方法的命名规则？

- 创建 store 时，reduce 自动调用，默认值？

- 入口的职责？

    - 创建 store
    - 挂载组件

- 区分 component 和 container

    - component：无状态组件
    - container：监听 store 变化 -> 转化状态转为属性，封装 action 转发器为属性 -> 无状态组件渲染 -> 用户交互 -> ...

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
