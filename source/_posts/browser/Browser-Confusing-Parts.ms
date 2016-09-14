---
title: 浏览器疑惑解答
date: 2016-09-12
categories: Browser
tags: Browser
---



# 内核
- Trident：IE
- Gecko：Firefox
- Presto：Opera
- Webkit：Safari，Chrome
- Edge：Edge

# 并发数限制
浏览器在同一时间针对同一域名下的请求是有一定数量限制的。

|   Browser   | HTTP/1.1 | HTTP/1.0 |
|     ---     |    ---   |   ---    |
|    IE 6,7   |    2     |    4     |
|    IE 8     |    6     |    6     |
|  Firefox 2  |    2     |    8     |
|  Firefox 3  |    6     |    6     |
|  Safari 3,4 |    4     |    4     |
|  Chrome 1,2 |    6     |    ?     |
|  Chrome 3   |    4     |    4     |
|  Chrome 4+  |    6     |    ?     |
|  iPhone 2   |    4     |    ?     |
|  iPhone 3   |    6     |    ?     |
|  iPhone 4   |    4     |    ?     |

为什么要限制？

- 基于端口数量和线程切换开销的考虑，浏览器不可能无限量的并发请求；
- 服务器端有并发阀值，客户端不做限制的化，请求很可能被禁止 —— 即使现在大量应用负载均衡和各类 NoSQL，足以应付 C10K 问题，但也不是每个网站都有多域名来加速访问；
- HTTP/1.1 Keep alive 技术使得浏览器复用现有连接和服务器通信比新建立连接的性能要更好；

开发工具

- 浏览器并发数检测器：http://developer.oncecode.com/comet/
- 网站测速：http://sitespeed.me/en/

开发实践

- 少用 iframe： iframe 阻塞页面加载，占用浏览器并发连接数，并且 window 的 onload 事件需要在所有 iframe 加载完毕后（包含里面的元素）才会触发；
- 减少请求数 —— 浏览器解析时，过多的 CSS 和 JS 分开请求，会导致多次重新渲染；
    - CSS Combine
    - CSS Sprites
    - JS Combine
    - minify
    - compress
    - gzip
- cookie free：使用和主站不同的域名来放置静态资源；
- domain hash：面对普遍网页都有过百的请求数，浏览器只提供了数个并发数，可以利用 domain hash 技术来使用多个域名加大并发量（但过多的话会导致 DNS 解析上付出额外的代价，一般控制再 2-4 个）；
- cache：使用缓存；

案例

TODO

参考文献

- [浏览器允许的并发请求资源数是什么意思？](https://www.zhihu.com/question/20474326)
- [Roundup on Parallel Connections](http://www.stevesouders.com/blog/2008/03/20/roundup-on-parallel-connections/)
- [理解浏览器的并发请求](http://www.feelcss.com/browser-concurrent-requests.html)
- [为什么要少用 iframe ?](http://www.feelcss.com/browser-concurrent-requests.html)
- [Max parallel http connections in a browser?](http://stackoverflow.com/questions/985431/max-parallel-http-connections-in-a-browser)
- [Why do big sites host their images/css on external domains?](http://webmasters.stackexchange.com/questions/26753/why-do-big-sites-host-their-images-css-on-external-domains)
