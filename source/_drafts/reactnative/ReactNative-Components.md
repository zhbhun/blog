---
title: React Native 资源合集
date: 2016-04-23
category: ReactNative
tags: ReactNative
---

# WebView
- onLoadStart, onLoad, onError, onLoadEnd 只有初始化 source 内容变化才会触发
- injectedJavaScript 只有初始化和 source 内容变化才会传递给 WebView
- WebView 与 ReactNative 共享缓存
- WebView 上显示的输入框会在键盘弹出时自动调整位置
- 加载本地文件
  - [react native webview load from device local file system](http://stackoverflow.com/questions/33506908/react-native-webview-load-from-device-local-file-system)
  -

# Image
- 缓存策略：目前 Image 组件根据 url 来缓存图片（是个 bug 暂时没有被处理掉），参考文献如下：
    - [Cache never expires for the same uri](https://github.com/facebook/react-native/issues/1397)
    - [Image in ListView is not updated when re-rendering](https://github.com/facebook/react-native/issues/1417)
    - [Initial PoC implementation of cache policy for images](https://github.com/facebook/react-native/pull/1491)

# Modal
- onShow：在 Modal 显示动画结束的回调函数，如果 Modal 中有输入框需要或许焦点，不要放在 componentDidMount里，要放在在 onShow 里面处理，避免影响动画

# ActivityIndicatorIOS
- 简介：加载指示器
- 用法
    - 自定义指示器颜色
    - 自定义指示器大小：small，large
    - 控制加载器动画开启和关闭
    - 自定义指示器容器样式（同 View）
- ...

# TextInput
- 简介：输入框
- 常见问题
    - [[TextInput] Added support for textAlign to TextInput](https://github.com/facebook/react-native/pull/772)
    - [text Align :'right' doesn't work for placeholder when multiline is true](https://github.com/facebook/react-native/issues/7378)

TODO
怎么实现键盘弹出时将输入款放在键盘上方？

1. 方案一：[react-native-keyboard-spacer](https://github.com/Andr3wHur5t/react-native-keyboard-spacer)

    存在缺点，会压缩上方的内容，并且输入框不是精准的定位再键盘上方，适用于被压缩内容为可伸缩的图片

2. 方案二？
    - [How to auto-slide the window out from behind keyboard when TextInput has focus?](http://stackoverflow.com/questions/29313244/how-to-auto-slide-the-window-out-from-behind-keyboard-when-textinput-has-focus)
    - [react-native-keyboard-aware-scroll-view](https://github.com/APSL/react-native-keyboard-aware-scroll-view)
    - [TextInput被键盘遮挡 怎么解决这个问题](http://bbs.reactnative.cn/topic/606/textinput%E8%A2%AB%E9%94%AE%E7%9B%98%E9%81%AE%E6%8C%A1-%E6%80%8E%E4%B9%88%E8%A7%A3%E5%86%B3%E8%BF%99%E4%B8%AA%E9%97%AE%E9%A2%98/2)
    - http://kpetrovi.ch/2015/09/30/react-native-ios-keyboard-events.html

- [react-native里TextInput遇到的一些问题及解决方案](https://segmentfault.com/a/1190000003876625)
