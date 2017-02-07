---
title: IOS 设计规范
date: 2016-08-08
category: Design
tags: Design
---

# iOS Human Interface Guidelines
- [iOS Human Interface Guidelines](https://developer.apple.com/ios/human-interface-guidelines/)
- [UI Design Do’s and Don’ts](https://developer.apple.com/design/tips/)
- [iOS-Human-Interface-Guidelines 译文](https://github.com/Cloudox/iOS-Human-Interface-Guidelines)
- [iOS 9人机界面指南](https://isux.tencent.com/ios9-guideline-ch1.html)
- [iOS 9 人机交互指南](http://wiki.jikexueyuan.com/project/ios-9-human-computer-interface-guidelines/)
- [iOS 8 人机交互指南](http://wiki.jikexueyuan.com/project/ios-human-interface-guidelines/)
- [iOS 7 人机界面指南](https://isux.tencent.com/ios-human-interface-guidelines-ui-design-basics-ios7.html)

# 设备信息
| 设备 | 尺寸 | 像素密度 | 物理像素 | 渲染像素 | 逻辑像素 | 切图 |
| --- | --- | --- | --- | --- | --- | --- |
| iPhone 6 Plus | 5.5" | 401 | 1080*1920 | 1242*2208 | 414*736 | @3x |
| iPhone 6 Plus Display Zoom | 5.5" | 401 | 1080*1920 | 1125*2001 | 375*667 | @3X |
| iPhone 6 | 4.7" | 326 | 750*1334 | 750*1334 | 375*667 | @2X |
| iPhone 6 Display Zoom | 4.7" | 326 | 750*1334 | 640*1136 | 320*568 | @2X |
| iPhone 5, 5S | 4" | 326 | 640*1136 | 640*1136 | 320*568 | @2X |
| iPhone 4, 4S | 3.5" | 326 | 640*960 | 640*960 | 320*480 | @2X |
| iPhone 2G, 3G, 3GS | 3.5" | 163 | 320*480 | 320*480 | 320*480 | @1X |

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

参考文献：[IOS 8 iPhone6 Plus 尺寸规范及适配尺寸](http://huaban.com/pins/279581524/)

# 设计原则
- 唯一主色调：采用简单的色阶，配套灰阶来展现信息层次，但是绝不采用更多的颜色；
- 最小点击热区不小于 44*44
- 不超过 4 个次级关系的页面层级
- 明确的操作反馈和提示

# 设计规范
- [App界面设计风格](http://www.woshipm.com/ucd/193763.html)
- [交互干货必收 | App界面交互设计规范](http://www.woshipm.com/ucd/193776.html)
- [IOS与Android APP界面设计规范要点](http://www.xwbetter.com/app-development-rules/)
- [iOS设备上的App设计规范](http://www.yixieshi.com/13759.html)
- [APP规范实例(详细的UI设计方法）](http://www.ui001.com/article/109.html)
- [iOS设计指南](http://www.ui001.com/article/66.html)

## 视觉设计规范
### 布局
- [iOS APP设计规范大全](http://www.ui.cn/detail/40260.html)

| 设备 | 状态栏高度 | 导航栏高度 | 标签栏高度 |
| --- | --- | --- | --- |
| iPhone 6 Plus | 60px | 132px | 146px |
| iPhone 6, 5S, 5, 4S, 4 | 40px | 88px | 98px |
| iPhone 3GS, 3G, 2G | 20px | 44px | 49px |

- 状态栏高度：20pt
- 导航栏高度：44pt
- 标签栏高度：49pt
- 内容
    1. 通栏
    2. 左右留白 10pt
    3. 2 列等宽
    4. 3 列等宽
    5. 4 列等宽

### 排版
间距

- 超小间距：5pt
- 小间距：10pt，导航栏左右内边距
- 默认间距：15pt，卡片左右内边距
- 大间距：20pt，上下块间距

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
- 重要
    - 18pt，用于少数重要标题，如：上导航标题
    - 16pt，用在一些较为重要的文字标题或操作按钮，如：搜索页模块名称、首页 Tab 标签、上导航文字按钮
- 正文
    - 15pt，用在大多数文字，如：正文内容
    - 14pt，用在大多数文字，如：昵称、评论内容
- 弱
    - 12pt，用在辅助性文字，如：次要的来自、次要的文案说明
    - 10pt，用在辅助性文字，如：时间信息

- [界面设计必备，常用字体规范](http://www.ui.cn/detail/39903.html)

### 图标
| 设备 | @3x | @2x | @1x |
| --- | --- | --- | --- |
| 商店应用图标(必要) | N/A | 1024*1024 | 512*512 |
| 桌面图标(必要) | 180*180 | 120*120 | 60*60 |
| 启动图片(必要) | | |
| 搜索图标(推荐) | 120*120 | 80*80 | 40*40 |
| 设置图标(推荐) | 87*87 | 58*58 | 29*29 |
| 文档图标（可选） | | | |
| 报刊杂志（可选） | 最少 1024 | 最少 1024 | |
| 网页剪辑图标（可选） | 180 * 180 | 120 * 120 | |
| 标签栏图标(可选) | 75*75(最大 144*96) | 50*50(最大 96*64) | |
| 工具栏/导航栏图标(可选) | 66*66 | 44*44 | |
| 模板图标 | | | |

参考文献

- [iOS 9 人机界面指南(五)：图标与图形设计](https://isux.tencent.com/ios9-guideline-ch5.html)
- [ios icons 尺寸/命名规范](http://www.ui.cn/detail/31352.html)

### 按钮
状态

- 普通
- 按下
- 选中
- 禁用

大小：高度不小于 44pt

### 弹层
- +/更多：元素下方/上方弹出
- 选择弹层：屏幕底部弹出
- 飘字弱提示
- 确认框
- 分享弹层
- 引导功能弹层

### 加载
- 页面切换加载
- 上下拉加载
- 功能型加载
- 进度条加载

### 警告信息
- 网络不给力
- 数据为空
- 其他错误

### 命名规范
- 图标：模块_类别_功能_状态.png

## 案例
网秦 UEC

- [网秦UEC IOS客户端界面视觉设计规范-1](http://www.ui.cn/project.php?id=11368)
- [NQ UEC IOS客户端界面视觉设计规范-2](http://www.ui.cn/project.php?id=11380)
- [NQ UEC IOS客户端界面视觉设计规范-3](http://www.ui.cn/project.php?id=11381)
- [NQ UEC IOS客户端界面视觉设计规范-4](http://www.ui.cn/project.php?id=11382)

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
- [iOS APP设计稿选择](http://www.ui.cn/detail/86725.html)
