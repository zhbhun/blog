---
title: React Router
date: 2016-04-29
category: React
tags: React
---

# 常见问题
- react-router 2.x.x 使用了 history 2.x.x，利用 history 的 basename 可以简化 react-router 的路径配置
    - HTML5 history：basename 与当前路由根路径匹配，Link.to 属性不再需要配置 basename
    - hash history：basename 设置为 “/” 即可，除非需要定制
- 不能在同一 DOM 节点渲染不同的路由器实例
    - 错误日志
        - `ReactRouter.js:374 Warning: [react-router] You cannot change <Router history>; it will be ignored`
        - `ReactRouter.js:374 Warning: [react-router] You cannot change <Router routes>; it will be ignored`
    - 该用法存在问题
- [React+react-router如何做loading效果](http://react-china.org/t/react-react-router-loading/5815)
- [使用react-router控制路由webpack怎么进行代码分割、按需加载](http://react-china.org/t/react-router-webpack/2524)

# 学习资源
- [React Router & Webpack in Production](https://reactjsnews.com/webpack-in-production)
- [react-router-cn](https://github.com/react-guide/react-router-cn)
- [深入理解 react-router 路由系统](https://zhuanlan.zhihu.com/p/20381597?refer=purerender)
