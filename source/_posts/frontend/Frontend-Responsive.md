---
title: 前端响应式开发
date: 2016-06-28
category: Frontend
tags: Frontend
---

# 目标设备
- 手机
    - 触摸屏
    - ~~非触摸屏~~
- 平板
- 笔记本
    - 非触摸屏
    - 触摸屏

# 响应式方案
- media query：不同设备的 css 写在一个文件中，并按模块管理。
    - 优点：模块分开，易于管理和编码实现，也便于维护，是中小型网站实现响应式的不二选择。
    - 缺点：对于样式复杂的网站没有拆分，不能根据对应屏幕加载对应样式，造成带宽浪费；不利于优化和 cdn。
- userAgent：不同设备的 css 写在不同文件中。
    - 优点：不同浏览器环境下的样式分离管理，实现了平台样式分离，易于 CDN 管理。
    - 缺点：需要维护多套样式表，即使公共部分抽离，一旦修改，影响多个平台环境；需要判断UA；架构实现稍微复杂。
- server userAgent：在服务端判断 userAgent，直接返回对应设备需要的资源。
    - 优点：避免前端对 userAgent 影响响应速度
    - 缺点：同 userAgent，并且需要前端和后端工程师的配合，增加开发成本

# userAgent
[mobile-detect.js](https://github.com/hgoebl/mobile-detect.js)

- iPhone：Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1
- Nexus 5X：Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.23 Mobile Safari/537.36
- iPad：Mozilla/5.0 (iPad; CPU OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1
- Nexus 7：Mozilla/5.0 (Linux; Android 4.3; Nexus 10 Build/JSS15Q) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.23 Safari/537.36
- PC：Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36

# Media Queries
- https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Media_queries

## 响应式布局
响应式布局是用来兼容浏览器分辨率，横屏和竖屏的页面元素布局方式。实现思路如下：

1. 使用 viewport 控制移动端浏览器不缩放；
2. 基于 media query 的栅格布局；

## 响应式 HTML
移动端的 HTML 页面相对 PC 比较简单，PC 通常会显示些额外的内容。响应式 HTML 的实现方案如下：

1. 使用相同的 HTML 结构，通过 media query 来隐藏移动端要不需要的 DOM 元素
2. 使用 JavaScript 动态渲染不同的内容。

## 响应式 CSS
优先设定移动端的样式，PC 端需要引入额外 CSS 来覆盖移动端的原有样式。

## 响应式 JavaScript/CSS
根据浏览器环境来异步加载不同的 JavaScript 文件。

## 响应式媒体
目标
- 媒体尺寸自适应：解决屏幕大小不同的问题
- 屏幕分辨率自适应：解决高清屏的问题

媒体尺寸自适应方案
1. CSS 背景图片 + media query
2. picture element + midea query
3. picturefill + media query
4. [adaptive-images](http://adaptive-images.com/)
5. [responsive-images.js](https://github.com/kvendrik/responsive-images.js)

屏幕分辨率自适应方案
- min-device-pixel-ratio

# Server userAgent
- [WURFL](http://www.scientiamobile.com/)
- [Device Atlas](https://deviceatlas.com/)
- [响应式设计+服务器端组件 (RESS)](http://www.lukew.com/ff/entry.asp?1392)：自适应设计

# 调试工具
- [Responsive Web Design Tester](http://responsivewebdesigntester.com/)
- [如何免费进行响应式设计测试](http://www.csdn.net/article/2013-08-02/2816444)

# 参考文献
- [web前端响应式设计总结](http://jixianqianduan.com/frontend-css/2016/01/15/responsive-css.html)
- [响应式设计争议：留住用户与失去用户](http://www.shejidaren.com/responsive-web-design-controversy.html)
    - 根据 Guy Podjarny 的调查 ，72%的响应式网站统一传送相同数量的字节，而不依据屏幕尺寸区分处理，甚至在使用速度较慢的移动网络连接也是如此；
    - 移动网络速度受限于带宽，3G 可以达到 5Mbps，4G可以达到 50Mbps；
    - 家庭 DSL 连接延迟为 20~45ms，3G 网络却可能达到 150~450ms，4G 网络则为 100~180ms；
    - 当手机进入休眠状态后打开收音机频率需要获取更多数据而导致滞时；
    - 设备平均可用内存越低也就意味着电池和 CPU 消耗越多；
    - 在移动设备中，我们把在1秒或是更少时间完成首屏内容（即不需滚动直接显示的内容）渲染的网站视作是快的；
    - 由于 TCP 被称为“慢启动”，首次响应不能超过 14KB 以避免二次打包，这意味着首屏内容的 HTML 和 CSS 至少必须符合 14KB 的单次HTTP响应；
- [聊聊响应式网站，什么情况下更适合采用响应式](http://www.admin5.com/article/20150114/580816.shtml)

# TODO
- https://developers.google.com/web/fundamentals/getting-started/your-first-multi-screen-site/?hl=zh-cn
- [What is the best way to detect a mobile device in jQuery?](http://stackoverflow.com/questions/3514784/what-is-the-best-way-to-detect-a-mobile-device-in-jquery)
- [Detect Mobile Browsers](http://detectmobilebrowsers.com/)
- [5个常见响应式设计陷阱及解决方案](http://info.9iphp.com/5-responsive-design-pitfalls-and-how-to-avoid-them)
- [Responsive Design常用的媒体查询](http://segmentfault.com/a/1190000002713857)
- [超级干货！深聊Material Design复杂响应式设计](http://www.uisdc.com/material-design-responsive-design)
- [Time to Give Up on Controlling Our Designs](http://zurb.com/article/710/time-to-give-up-on-controlling-our-design)
- [Responsive Web Design](http://alistapart.com/article/responsive-web-design)
