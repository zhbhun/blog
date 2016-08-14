---
title: IOS 设计规范
date: 2016-06-08
category: Design
tags: Design
---

# iOS Human Interface Guidelines
- [iOS Human Interface Guidelines](https://developer.apple.com/ios/human-interface-guidelines/)
- [iOS-Human-Interface-Guidelines 译文](https://github.com/Cloudox/iOS-Human-Interface-Guidelines)
- [iOS 9人机交互指南](http://wiki.jikexueyuan.com/project/ios-9-human-computer-interface-guidelines/)
- [iOS 8 人机交互指南](http://wiki.jikexueyuan.com/project/ios-human-interface-guidelines/)

# 设备信息
| 设备 | 尺寸 | 像素密度 | 物理像素 | 渲染像素 | 逻辑像素 | 切图 |
| --- | --- | --- | --- | --- | --- | --- |
| iPhone 6 Plus | 5.5" | 401 | 1080*1920 | 1242*2208 | 414*736 | @3x |
| iPhone 6 Plus Display Zoom | 5.5" | 401 | 1080*1920 | 1125*2001 | 375*667 | @3X |
| iPhone 6 | 4.7" | 326 | 750*1334 | 750*1334 | 375*667 | @2X |
| iPhone 6 Display Zoom | 4.7" | 326 | 750*1334 | 640*1136 | 320*568 | @2X |
| iPhone 5, 5S | 4" | 326 | 640*1136 | 640*1136 | 320*568 | @2X |
| iPhone 4, 4S | 3.5" | 326 | 640*960 | 640*960 | 320*480 | @2X |
| iPhone 2G, 3G, 3GS | 3.5" | 163 | 320*480 | 320*480 | 320*480 | @2X |

设备历史变化

- iPhone 3 -> iPhone 4：Retina，即像素密度提升到 326 PPI；
- iPhone 4 -> iPhone 5：屏幕尺寸从 3.5" 增加到 4"；
- iPhone 5 -> iPhone 6: 屏幕尺寸从 4” 增加到 4.7“；
- iPhone 6 -> iPhone 6 Plus：Retian HD，即像素密度提升到到 401 PPI；

疑问

- 什么是渲染像素？

  [「像素」「渲染像素」以及「物理像素」是什么东西？它们有什么联系？](http://www.zhihu.com/question/27261444/answer/35898885)

- 什么是 Display Zoom ?

  Dispaly Zoom 是 iOS 8 新增的放大模式，开启了放大模式后，画布大小会按一定比例缩小，而物理像素不变的化，会将画面拉大显示。

- ...

参考文献

- [IOS 8 iPhone6 Plus 尺寸规范及适配尺寸](http://huaban.com/pins/279581524/)

# 设计原则
- 唯一主色调：采用简单的色阶，配套灰阶来展现信息层次，但是绝不采用更多的颜色；
- 最小点击热区不小于 44*44
- 不超过 4 个次级关系的页面层级
- 明确的操作反馈和提示

# 设计规范
- [ios&安卓设计标准规范](http://www.ui.cn/detail/33707.html)
- [App界面设计风格](http://www.woshipm.com/ucd/193763.html)
- [交互干货必收 | App界面交互设计规范](http://www.woshipm.com/ucd/193776.html)
- [IOS与Android APP界面设计规范要点](http://www.xwbetter.com/app-development-rules/)
- [iOS设备上的App设计规范](http://www.yixieshi.com/13759.html)
- [APP规范实例(详细的UI设计方法）](http://www.ui001.com/article/109.html)
- [iPhone6 & 6 Plus 视觉设计适配说明](http://www.ui001.com/article/116.html)
- [iOS设计指南](http://www.ui001.com/article/66.html)

## 视觉设计规范
### 界面尺寸
- [iOS APP设计规范大全](http://www.ui.cn/detail/40260.html)

| 设备 | 状态栏高度 | 导航栏高度 | 标签栏高度 |
| --- | --- | --- | --- |
| iPhone 6 Plus | 60px | 132px | 146px |
| iPhone 6, 5S, 5, 4S, 4 | 40px | 88px | 98px |
| iPhone 3GS, 3G, 2G | 20px | 44px | 49px |


### 图标尺寸
TODO

### 颜色
- 重要：
    - 主体色，小面积使用，用于特别需要强调和突出的文字、按钮和图标：如上导航栏，圈子名称、tab 标题（选中），注册按钮之类
    - #333333，用于重要级别文字信息，如：帖子正文，类目名称
- 一般
    - 普通：#8e8e8e，用于普通级信息、引导词，如：昵称、弹层文案、查看更多之类
    - 辅助：#bbbbbb，用于辅助、次要的文字信息、普通按钮描边，如：时间，来自等补充信息文案
    - 分割线：#dedfe0
- 弱
    - 背景色：#f3f3f3
    - 地址信息：#adc0cd

### 字体

- 标题
- 正文
- 辅助

### 排版

- 标题：20px
- 正文：10px

### 弹层

- +/更多
- 选择弹层
- 飘字弱提示
- 确认框
- 分享弹层
- 引导功能弹层

### 加载

- 页面切换加载
- 上下拉加载
- 功能型加载
- 进度条加载

### 图标

- 底部导航栏：60*60px
- 顶部标题栏：30px

### 按钮
- 普通
- 按压
- 选中
- 禁用

### 警告信息
- 网络不给力
- 数据为空
- 其他错误

### 命名规范
- 图标：模块_类别_功能_状态.png

# 参考文献
- [设计中会用到 UI 设计规范吗？](https://www.zhihu.com/question/19791196)
- [iOS设备上的App设计规范，包括尺寸，颜色，字体，图标等](http://www.fondcool.com/article/detail/17.html)
- [iPhone 人机界面设计规范（中英对照）](http://www.uxguide.net/wiki/iphone:Home)

---

- [iOS app 图标的圆角半径是多少？](https://www.zhihu.com/question/19917304)
- [【总结】移动应用界面设计的尺寸设置及规范](http://jinjuan.me/appdesign-sizesetting/)
- [iOS和安卓手机的APP图标尺寸规范和图标命名规范](http://www.25xt.com/iconweb/5916.html)
- [全面的移动端尺寸知识与应用](http://www.mobileui.cn/topic?topicid=11)
- [交互设计：iOS原型尺寸规范](http://blog.jobbole.com/94445/)
- [IOS APP的所有图标尺寸规范](http://www.cnblogs.com/apem/p/4142149.html)
- [iOS 图标、图形尺寸？](https://www.zhihu.com/question/20248971)
- [①iPhone的设计尺寸](http://www.ui001.com/chicun/)
- [iOS和安卓手机的APP图标尺寸规范和图标命名规范](http://www.25xt.com/iconweb/5916.html)
- http://huaban.com/boards/14367898/


- [不容错过！IOS7 UI设计的十大准则](不容错过！IOS7 UI设计的十大准则)

- [经验分享：IOS平台设计规范](http://www.uisdc.com/code-for-design-ios-platform)

---


# TODO
- http://huaban.com/pins/185657587/
