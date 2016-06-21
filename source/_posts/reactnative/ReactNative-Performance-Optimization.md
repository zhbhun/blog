---
title: ReactNative 性能优化
date: 2016-06-14
category: ReactNative
tags: ReactNative
---

- UI 线程与 JavaScript 线程
- 帧

# React 优化
- shouldComponentUpdate 与 immutable.js
- 异步处理与组件挂载
- 状态批量更新

# 特殊组件优化
## Navigator
- NavigatorIOS VS Navigator —— 推荐使用 NavigatorIOS
- 新页面延迟至切换动画结束后再渲染

## ListView
- 避免丢帧：initiateSize，pageSize
- 优化内存占用：

# 性能检测工具
- XCode
- Android Studio
- React Native
