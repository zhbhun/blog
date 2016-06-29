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
