---
title: Redux Reducer
date: 2016-09-03
category: Redux
tags: Redux
---


- http://cn.redux.js.org/docs/recipes/ReducingBoilerplate.html#reducers

# 状态结构
- 把应用的 state 想像成数据库；
- 尽量将业务数据和 UI 相关的状态分开；
- 尽可能地把 state 范式化，不存在嵌套，即把所有数据放到一个对象里，每个数据以 ID 为主键，不同实体或列表间通过 ID 相互引用数据；

辅助工具
- [humps](https://github.com/domchristie/humps)
- [normalizr](https://github.com/paularmstrong/normalizr)

参考示例

- [real-world](https://github.com/reactjs/redux/tree/master/examples/real-world)：将业务数据放在 entities 对象中，以业务名称作为 key 存放业务对象，每个业务对象都以业务数据 id 为 key，存放对应的业务数据。页面相关的数据和状态存放在 pagination 对象中，以页面名称作为 key 存放页面对象，每个页面对象中都使用 id 来引用业务数据。
- ...

# 处理 Action
**只要传入参数相同，返回计算得到的下一个 state 就一定相同。没有特殊情况、没有副作用，没有 API 请求、没有变量修改，单纯执行计算。**

- 禁止修改传入参数；
- 禁止执行有副作用的操作，如 API 请求和路由跳转；
- 禁止调用非纯函数，如 Date.now() 或 Math.random()；

# 拆分 Reducer
...
