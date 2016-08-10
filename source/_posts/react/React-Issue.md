---
title: React 常见问题
date: 2016-06-24
category: React
tags: JavaScript React
---

# 无状态组件 VS 有状态组件
- [Stateless or stateful component ?](http://react-china.org/t/stateless-or-stateful-component/6021)

# JWT
- [大家有没有使用redux-saga,jwt做登录的示例代码？](http://react-china.org/t/redux-saga-jwt/6187)

# Flux
- [Flux的架构到底是要解决什么问题](http://react-china.org/t/flux/6188)

# State 缺陷
1. 遇到批量更新同一状态时，后续的操作不能立刻获取到前面更新状态后的值，从而肯能会覆盖前面的更新操作
    - 例如：表单校验状态以一个对象的形式存储，修改密码后，校验密码会更新校验状态，同时有校验确认密码，又会更新校验状态，连续操作中，后一次更行无法获取最新的状态 —— 解决方案:1,延迟后面的操作；2，拆分状态更新
2. 组件通信

# HRM 不支持继承自定义组件
- [Doesn't work with react Component class wrapper](https://github.com/gaearon/react-transform-boilerplate/issues/123)

# TODO
- [What does 'Only a ReactOwner can have refs.' mean?](http://stackoverflow.com/questions/28519287/what-does-only-a-reactowner-can-have-refs-mean)
