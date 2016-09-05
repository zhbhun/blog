---
title: React Redux
date: 2016-08-30
category: Redux
tags: Redux
---

# connect
## Connect
- 成员
    - 标志位属性
        - haveOwnPropsChanged：组件属性是否发生变化
        - ---
        - doDispatchPropsDependOnOwnProps：dispatch 属性是否依赖组件属性
        - ---
        - hasStoreStateChanged：Store 状态是否发生变化
        - doStatePropsDependOnOwnProps：状态属性是否依赖依赖组件属性
        - ---
        - haveStatePropsBeenPrecalculated：状态属性是否预计算
        - statePropsPrecalculationError：状态属性预计算错误
        - ---
    - version：版本
    - store：Store
    - state：上一次的 Store State
    - renderedElement：需要渲染的元素
- 方法
    - 订阅 Store 状态
        - unsubscribe：取消 Store 订阅
        - handleChange：处理 Store 状态变化
        - isSubscribed：是否订阅 Store 变化
        - trySubscribe：尝试订阅 Store 变化
        - tryUnsubscribe：尝试取消订阅 Store 变化
    - clearCache
        - dispatchProps = null
        - stateProps = null
        - mergedProps = null
        - haveOwnPropsChanged = true
        - hasStoreStateChanged = true
        - haveStatePropsBeenPrecalculated = false
        - statePropsPrecalculationError = null
        - renderedElement = null
        - finalMapDispatchToProps = null
        - finalMapStateToProps = null
    - render
        1. 计算 haveMergedPropsChanged，为 false 返回 this.renderedElement，否则继续
        2. 给 this.renderedElement 设置新的 WrappedComponent，并返回
- 生命周期
    - 挂载
        - constructor：
            - 设置 version
            - 设置 store
            - 初始化 state
            - clearCache()
        - render：创建 WrappedComponent 实例，并返回
        - componentDidMount：尝试订阅 Store 变化
    - Store 变化：调用 handleChange
        1. 判断是否订阅，没有的话退出，否则继续执行
        2. 判断前后两次状态是否一致，一致的话退出，否则继续执行
        3. render：...
    - 上层组件重渲染
        - componentWillReceiveProps：
        - shoulComponentUpdate
        - componentWillUpdate
        - render
        - componentDidUpdate
    - 取消挂载
        - componentWillUnmount：尝试取消订阅 Store 变化
