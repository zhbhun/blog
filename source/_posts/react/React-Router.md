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
