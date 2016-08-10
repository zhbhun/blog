---
title: Alt.js
date: 2016-07-19
category: Flux
tags: Flux
---

- http://alt.js.org/
- https://github.com/goatslacker/alt
- [React + Alt TodoMVC Example](https://github.com/tastejs/todomvc/tree/gh-pages/examples/react-alt)

# 常见问题
- Action 内部不能通过 this 调用
- Store 状态变化机制
- 加载数据和操作数据实现模式如何统一（加载数据有多个方法对应，而操作数据没有）？
- 异步数据加载放在哪里调用（Action VS Store VS Util）？
- 多个根视图可能遇到同时触发加载数据动作，改怎么解决冲突问题？——提供加载状态判断，那怎么降低代码重复性
- Store 依赖
    - NewsStore 依赖 NewsAction，是否要用 waitFor 实现？
    - NewsPraiseStore 依赖 UserSessionStore —— 如何确保登陆会话变化时，能够正确地维护 store 状态
        - 在 View 里面监听会话变化，无法确定放在哪个 View 里监听，放在所有用到 NewsPraiseStore 的 View 去做又不大好
        - 在 Action 里处理
        - 在 Store 里处理
- ...

- [In Flux architecture, how do you manage Store lifecycle?](http://stackoverflow.com/questions/23591325/in-flux-architecture-how-do-you-manage-store-lifecycle)

# 案例
## 用户信息
- [In Flux architecture, how do you manage Store lifecycle?](http://stackoverflow.com/questions/23591325/in-flux-architecture-how-do-you-manage-store-lifecycle)

## 新闻资讯
- NewService
  - loadNews
  - addNews
  - deleteNews
- NewsPraiseService
  - loadPraisedNews
  - praiseNews
  - canclePraiseNews

- NewsAction
  - loadNews
  - loadNewsSuccess
  - loadNewsFail
  - addNews
  - deleteNews
- PraiseNewsAction
  - loadPraiseNews
  - praiseNews
  - cancelPraiseNews
- NewsStore
  - newsList
  - newsListLoading
  - newsListLoadFail
  - praisedNewsList
  - praisedNewsListLoading
  - praisedNewsListLoadFail
- PraiseNewsStore
- UserSessionStore
