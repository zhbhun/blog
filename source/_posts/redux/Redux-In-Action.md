---
title: Redux 项目实践
date: 2016-09-05
category: Redux
tags: Redux
---

# 开发思路
1. 需求：功能，原型
2. 设计：组件拆分，列出组件的状态和动作

    只要理清楚组件拆分和对应的动作和状态即可，不用详细设计，注意以下几个要点

    - 动作对应功能，而非详细设计 Redux Action
    - ...

3. 实现：action，reducer，展示组件，容器组件

    - action

        - 异步功能：请求，成功，失败
        - 条件判断：是否需要处理，是否可以执行...

    - reducer

        - 实体数据单独存储（类似数据库），分页数据只存对应 key
        - 提供额外的数据查询接口，如查询分页数据
        - 树型嵌套数据优化

    - ...


- [Presentational and Container Components](https://medium.com/@dan_abramov/smart-and-dumb-components-7ca2f9a7c7d0#.a6w9fmxpf)

# 案例

## 购物车
https://github.com/zhbhun/program-demo/blob/master/redux/shopping-cart/README.md

## Todo
https://github.com/zhbhun/program-demo/blob/master/redux/todo/README.md

# 参考文献
- [A Guide For Building A React Redux CRUD App (3-page app)](https://medium.com/@rajaraodv/a-guide-for-building-a-react-redux-crud-app-7fe0b8943d0f#.g99gruhdz)
