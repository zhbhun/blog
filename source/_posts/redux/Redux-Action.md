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

- [redux-thunk](https://github.com/gaearon/redux-thunk)
- [redux-promise](https://github.com/acdlite/redux-promise)
- [redux-promise-middleware](https://github.com/pburtchaell/redux-promise-middleware)
