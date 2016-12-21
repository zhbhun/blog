---
title: Redux Action
date: 2016-09-03
category: Redux
tags: Redux
---

Action 是把数据从应用传到 store 的有效载荷 —— store 数据的唯一来源。

Action 本质上是 JavaScript 普通对象，Redux 约定 action 内必须使用一个字符串类型的 type 字段来表示将要执行的动作。

- [Action](http://cn.redux.js.org/docs/basics/Actions.html)
- [Reducing Boilerplate](http://cn.redux.js.org/docs/recipes/ReducingBoilerplate.html)
- [flux-standard-action](https://github.com/acdlite/flux-standard-action)

# Usage
Action 一般是通过 store.dispatch() 来传给 store。下面以 Todo 示例的 ADD_TODO 为例，演示如何写好 Action。

`store.dispatch({ type: 'ADD_TODO', text: 'xxx' })`

但像上面这样内联创建 action，是无法重用 action type 的，而且需要重复编写同一类型 action 的生成代码。

## Action creators
考虑代码的重用性，我们使用 action 创建函数来创建 action，并输出 action Type。

```
// app/actions/index.js
export const ADD_TODO = 'ADD_TODO';
export const addTodo = (text) => ({
    type: ADD_TODO,
    text,   
});

// app/containers/xxx.js
import { addTodo } from '../action';
store.dispatch(addTodo('xxx'))
```

##  Action type in separate module
当应用规模越来越大时，建议使用单独的模块或文件来存放 action。

- 便于维护命名一致性；
- 便于维护代码：查询所有现存的 actions，查看 action 的添加，删除和修改记录；
- 便于发现拼写错误；

```javascript
// app/constants/ActionTypes.js
export const ADD_TODO = 'ADD_TODO';

// app/actions/index.js
import { ADD_TODO } from '../constants/ActionTypes';
export const action = (text) => ({
    type: ADD_TODO,
    text,   
});

// app/containers/xxx.js
// ...
```

## Generating Action Creators
写简单的 action creator 很容易让人厌烦，且往往最终生成多余的样板代码。

我们可以写一个用于生成 action creator 的函数：

```javascript
function makeActionCreator(type, ...argNames) {
  return function(...args) {
    let action = { type };
    argNames.forEach((arg, index) => {
      action[argNames[index]] = args[index]
    });
    return action;
  };
}

const ADD_TODO = 'ADD_TODO';
const EDIT_TODO = 'EDIT_TODO';
const REMOVE_TODO = 'REMOVE_TODO';

export const addTodo = makeActionCreator(ADD_TODO, 'text');
export const editTodo = makeActionCreator(EDIT_TODO, 'id', 'text');
export const removeTodo = makeActionCreator(REMOVE_TODO, 'id');
```

一些工具库也可以帮助生成 action creator

- [redux-act](https://github.com/pauldijou/redux-act)
- [redux-actions](https://github.com/acdlite/redux-actions)

## Async Action Creators
实现原理

- [Async Actions](http://cn.redux.js.org/docs/advanced/AsyncActions.html)
- [异步数据流](http://cn.redux.js.org/docs/advanced/AsyncFlow.html)
- [Middleware](http://cn.redux.js.org/docs/advanced/Middleware.html)

[循序渐进对比异步动作的写法](http://cn.redux.js.org/docs/recipes/ReducingBoilerplate.html#异步-action-creators)

1. 没有中间件：必须通过组件提供 dispatch 和 state 来实现判断是否有数据，开始加载（设置 loading 状态），加载成功和加载失败这些逻辑；
2. 使用中间件 redux-thunk：直接在 action creator 返回函数的参数里获取 dispatch 和 state，便于代码重用，写出表达更清晰的、潜在的异步 action creators；
3. 定制中间件：统一约定服务器端接口返回数据格式，将异步 action creator 模式泛化，大大减少重复代码；

Action Creator 命名技巧

- `loadData/loadDataIfNeeded: function`
- `loadDataRequest: { type: 'LOAD_DATA_REQUEST' }`
- `loadDataSuccess: { type: 'LOAD_DATA_SUCCESS', response }`
- `loadDataFailure: { type: 'LOAD_DATA_FAILURE', error }`

相关实现

- [redux-thunk](https://github.com/gaearon/redux-thunk) - Thunk middleware for Redux. 3737 ★

    - 优点：略
    - 缺点：模板代码过多

- [redux-promise](https://github.com/acdlite/redux-promise) - FSA-compliant promise middleware for Redux. 1216 ★

    - 优点：减少了模板代码
    - 缺点：不能实现乐观更新，用同一 type 下的不同 status 区分 action 额外增加了一套隐形的约定

- [redux-promise-middleware](https://github.com/pburtchaell/redux-promise-middleware) - Redux middleware for resolving and rejecting promises with conditional optimistic updates. 659 ★

    - 优点：解决了 redux-promise 不能实现乐观更新的问题
    - 缺点：相比 redux-thunk 多出了一个 `_PENDING` 的字符串模板代码(三个 action 却需要四个 type)，另外，只在 action 层实现了简化，对 reducer 层则束手无策

- [redux-actions](https://github.com/acdlite/redux-actions) - Flux Standard Action utilities for Redux. 2370 ★

    [redux-actions源码解读](http://www.cnblogs.com/ZSG-DoBestMe/p/5375647.html)

- [redux-action-tools](https://github.com/kpaxqin/redux-action-tools) - Light-weight action tools with async and optimistic update support. 20 ★

    在 redux-promise-middleware 的基础上简化了 reducer 层，并且针对 Action 当前所属的异步阶段设置了不同的 meta，可用于处理通用处理逻辑（例如：错误处理，加载中，登录会话检测层）。

    对比其他的通常逻辑处理实现：

    1. 处理底层（即修改 fetch）：扩展性不足（无法实现少数场景需要绕过通用处理逻辑），不易组合（有些场景一个 Action 需要多个异步请求，通用处理逻辑会重复执行）；
    2. 在 Action 层里重复编写：侵入业务代码，重复的处理代码使得业务代码变得冗余
    3. 在 Reducer 层里处理，但需要指定要执行通用处理逻辑的 Action，维护成本过高

- [redux-loop](https://github.com/redux-loop/redux-loop) - A library that ports Elm's effect system to Redux. 910 ★

    redux-loop 更彻底的模仿了 Elm 的模式，引入 Effects 的概念并将其置入 reducer，但修改 reducer 的返回类型的做法过于暴力，很难得到社区的认同。

    [redux-architecture](https://github.com/jarvisaoieong/redux-architecture)

- [redux-saga](https://github.com/yelouafi/redux-saga) - An alternative side effect model for Redux apps. 5411 ★
- [redux-observable](https://github.com/redux-observable/redux-observable) - RxJS middleware for action side effects in Redux using "Epics". 1721 ★

问题

- 模板代码
- 乐观更新
- 错误处理
- 竞态

    [Redux 如何优雅地处理异步冲突？](https://www.zhihu.com/question/51944726)

# 参考文献
- [Redux 异步方案选型](https://zhuanlan.zhihu.com/p/24337401)
- [Optimistic updates](https://github.com/acdlite/flux-standard-action/issues/7)
- https://github.com/acdlite/redux-rx
