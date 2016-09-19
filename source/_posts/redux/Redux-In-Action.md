---
title: Redux 实战演练
date: 2016-09-05
category: Redux
tags: Redux
---

- [A Guide For Building A React Redux CRUD App](https://medium.com/@rajaraodv/a-guide-for-building-a-react-redux-crud-app-7fe0b8943d0f#.s2k92oimx)
- ...


# 移动端新闻
功能

- 帖子列表
- 帖子明细
- 新增帖子
- 修改帖子
- 删除帖子
- 点赞帖子
- 收藏帖子
- 评论列表
- 增加评论
- 修改评论
- 删除评论
- 点赞评论

Store

```
{
    selectedTopic: String,
    postAdding: false,
    postsByTopic: {
       [topic]: {
            isFetching: Boolean,
            lastUpdated: Date,
            items: [Object]
       },
    },
    commentsByPost: {
        [post]: {
            isFetching: Boolean,
            lastUpdated: Date,
            items: [Object],
        }
    },
}
```

Reducer

- selectedTop(state: String, action: { type: 'SELECT_TOPIC', topic: String })
- postsByTopic(state: Object, action: { type: 'REQUEST_POSTS'|'RECEIVE_POSTS', ...})

Action

- selectTopic(topic: String): SELECT_TOPIC
- requestPosts(topic: Sting): 
- receivePosts(topic: String, response)
- ....

Aync Action

- fetchPosts(topic: String): 请求指定主题的帖子，根据响应不同调用转发不同 action
- shouldFetchPosts(state: Object, topc: String)：判断是否可以请求指定主题的帖子
- fetchPostsIfNeeded(topic: String)：

Component

...

Container


---

- Redux + React
    - 容器组件 VS 展示组件
        - 容器组件放在顶层，展示组件放在中间和子组件
        - 容器组件需要监听 Store，展示组件不需要
        - 容器组件从 Store 中读取数据，展示组件从 props 读取
        - 容器组件向 Store 派发 Action 来修改数据，展示组件调用 props 的回调函数
    - 设计组件层次结构
    - 连接 Store：尽量只做一个顶层组件，避免多个组件连接到 Store（遵循单向数据流，否则难以跟踪数据流）；