---
title: JavaScript XMLHttpRequest
date: 2016-03-08
categories: JavaScript
tags: JavaScript
---

XMLHttpRequest 是 Ajax（Asynchronous Javascript And XML，是指一种创建交互式网页应用的网页开发技术） 技术的核心，最先由微软（Internet Explorer 5 ）引入的一个特性，其他浏览器提供商都提供了相同的实现。在 XMLHttpRequest 之前，Ajax 式通信必须借助一些 Hack 手段来实现。

Ajax 不是一种新的编程语言，而是一种用于创建更好更快以及交互性更强的Web应用程序的技术。通过了解 Ajax 的发展历史，我们可以更清楚地认识 XMLHttpRequest 的背景。
- 上个世纪90年代：几乎所有的网站都由HTML页面实现，服务器处理每一个用户请求都需要重新加载网页；
- 1995年：JAVA语言的第一版发布，随之发布的的 Java applets 首次实现了异步加载；
- 1996年：Internet Explorer 将 iframe 元素加入到 HTML，支持局部刷新网页；
- 1998年前后：Outlook Web Access小组写成了允许客户端脚本发送 HTTP 请求（XMLHTTP）的第一个组件，该组件原属于微软Exchange Server，并且迅速地成为了Internet Explorer 4.0 的一部分；
- 2005年初：Jesse James Garrett 发表了一篇文章 ——[《Ajax: A New Approach to Web Applications》](http://adaptivepath.org/ideas/ajax-new-approach-web-applications/)，在这篇文章里介绍了一种叫 Ajax 的技术（此前，人们通常将这种技术叫做远程脚本），基于该技术可以使用浏览器原生的通信能力实现异步方式从服务器获取信息，简化了实现同样操作的任务，此后该技术被广泛使用；
- 目前：*todo*

# 快速上手
*TODO*

## 用法详解
## XMLHttpRequest 1
- HTTP 头部信息
- GET 请求
- POST 请求
-

## XMLHttpRequest 2
- FormData
- 超时设定
- overrideMimeType

## 进度事件

# 最佳实战
## 兼容性
现在大部分浏览器都支持 XMLHttpRequest，如果需要考虑支持一些旧版的浏览器可以使用下面跨浏览器的通用方法：
```javascript
// Provide the XMLHttpRequest class for IE 5.x-6.x:
// Other browsers (including IE 7.x-8.x) ignore this
//   when XMLHttpRequest is predefined
var xmlHttp;
if (typeof XMLHttpRequest != "undefined") {
    xmlHttp = new XMLHttpRequest();
} else if (window.ActiveXObject) {
    var aVersions = ["Msxml2.XMLHttp.5.0", "Msxml2.XMLHttp.4.0", "Msxml2.XMLHttp.3.0", "Msxml2.XMLHttp", "Microsoft.XMLHttp"];
    for (var i = 0; i < aVersions.length; i++) {
        try {
            xmlHttp = new ActiveXObject(aVersions[i]);
            break;
        } catch (e) {}
    }
}
```

## 优缺点
*TODO*

## 解决方案
*TODO*

# 参考文献
- [维基百科-Ajax](https://zh.wikipedia.org/wiki/AJAX)
