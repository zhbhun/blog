---
title: Redux Reducer
date: 2016-09-03
category: Redux
tags: Redux
---


- http://cn.redux.js.org/docs/recipes/ReducingBoilerplate.html#reducers

# 状态结构
设计原则

- 把应用的 state 想像成数据库；
- 尽量将业务数据和 UI 相关的状态分开；
- 尽可能地把 state 范式化，不存在嵌套，即把所有数据放到一个对象里，每个数据以 ID 为主键，不同实体或列表间通过 ID 相互引用数据；

参考示例

- [real-world](https://github.com/reactjs/redux/tree/master/examples/real-world)：将业务数据放在 entities 对象中，以业务名称作为 key 存放业务对象，每个业务对象都以业务数据 id 为 key，存放对应的业务数据。页面相关的数据和状态存放在 pagination 对象中，以页面名称作为 key 存放页面对象，每个页面对象中都使用 id 来引用业务数据。
- ...

# 处理 Action
**只要传入参数相同，返回计算得到的下一个 state 就一定相同。没有特殊情况、没有副作用，没有 API 请求、没有变量修改，单纯执行计算。**

- 禁止修改传入参数；
- 禁止执行有副作用的操作，如 API 请求和路由跳转；
- 禁止调用非纯函数，如 Date.now() 或 Math.random()；
- 遇到未知的 action 时，一定要返回旧的 state；
- 不要修改 state：利用 Object.assgin 或 ES7 对象展开运算符创建 state 副本，也可以使用帮助类

    - [Immutability Helpers](https://facebook.github.io/react/docs/update.html)
    - [updeep](https://github.com/substantial/updeep)
    - [Immutable](http://facebook.github.io/immutable-js/)

备注：处理 Action 的函数之所以称作 reducer 是因为它将被传递给 Array.prototype.reduce(reducer, ?initialValue) 方法。

# 拆分 Reducer
如果将所有状态更新都放在一个模块里，代码会变得非常冗长。而 state 中有的的字段是相互独立的，有的又是相互依赖的，我们可以将相互独立的字段分到单独的模块里更新，例如示例 Todo 的 todos 和 visibilityFilter 是相互独立的。

```
import { combineReducers } from 'redux'
import * as reducers from './reducers'

const todoApp = combineReducers(reducers)
```

# 范式化 Store
前面在设计状态结构时，提到尽可能地把 state 范式化，我们可以借助一些工具帮我们简化范式化的实现。

**统一 key 名称格式**

问题：服务端返回数据的 key 命名规则可能各不一样，有些以下划线来分割命名，有些又是采用驼峰式的命名规则。为了统一命名规则，需要转换返回的数据。

解决方案：[humps](https://github.com/domchristie/humps) 是一个连接符命名和驼峰命名之间的转换工具，具体使用可参考示例 http://codepen.io/zhbhun/pen/wzNbmR。

**扁平化数据**

https://github.com/paularmstrong/normalizr

# 其他
- https://github.com/reactjs/reselect
