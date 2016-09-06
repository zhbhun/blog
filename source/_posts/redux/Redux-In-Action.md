---
title: Redux 实战演练
date: 2016-09-05
category: Redux
tags: Redux
---

prototype + use case -> store -> reducer + action -> component + container

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
- postsByTopic(state: Object, action: { type: 'REQUEST_POSTS'|'RECEIVE_POSTS_SUCCESS'|'RECEIVE_POSTS_FAIL', ...})

Action

- selectTopic(topic: String)
- requestPosts(topic: Sting)
- receivePostsSuccess(topic: String, response)
- receivePostsFail(topic: String, response)

Aync Action

- fetchPosts(topic: String): 请求指定主题的帖子，根据响应不同调用转发不同 action
- shouldFetchPosts(state: Object, topc: String)：判断是否可以请求指定主题的帖子
- fetchPostsIfNeeded(topic: String)：

Component

...

Container
