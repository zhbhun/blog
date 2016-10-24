---
title: Redux Middleware
date: 2016-10-21
category: Redux
tags: Redux
---


# 原理分析
http://cn.redux.js.org/docs/advanced/Middleware.html

1. 手动记录日志：需要针对每一次 dispatch 记录
2. 封装 dispatch 函数来记录日志：需要针对每一个 action 创建封装函数
3. 覆盖 store.dispatch 来记录日志
4. 增加奔溃报告
5. 隐藏 Monkeypatching
6. 移除 Monkeypatching

# 常见问题
- 中间件的执行顺序按照调用 applyMiddleware 时所传参数的顺序执行 —— 根据中间件实现原理可知；
- ...
