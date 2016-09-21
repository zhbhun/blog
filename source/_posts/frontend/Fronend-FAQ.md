---
title: 前端常见问题
date: 2016-09-18
category: Frontend
tags: Frontend
---

- https://github.com/markyun/My-blog/tree/master/Front-end-Developer-Questions
- [前端面试之CSS总结(上)](https://segmentfault.com/a/1190000006890725)
- [Awsome-Front-End-learning-resource](https://github.com/helloqingfeng/Awsome-Front-End-learning-resource)

# 性能测试
性能测试工具

- [JSLitmus](http://www.broofa.com/Tools/JSLitmus/)
- [benchmark.js](https://benchmarkjs.com/)：基准测试工具
- [JSPerf](https://github.com/jsperf/jsperf.com)：代码性能测试
- [Dromaeo](http://dromaeo.com/)：浏览器性能测试

参考文献

- [Bulletproof JavaScript benchmarks](https://mathiasbynens.be/notes/javascript-benchmarking)
- [JavaScript Benchmark Quality](http://ejohn.org/blog/javascript-benchmark-quality/)
- [利用jsPerf优化Web应用的性能](https://software.intel.com/zh-cn/articles/optimize-web-app-using-jsperf)

# 性能优化
- [浅谈网站性能之前端性能优化](https://acrens.github.io/2016/07/03/2016-07-03-performance/)
- [Best Practices for Speeding Up Your Web Site](https://developer.yahoo.com/performance/rules.html)]
- [网站性能最佳体验的34条黄金守则](http://www.kancloud.cn/imjzq/frontend/98105)

**内容优化**

- 尽量减少 HTTP 请求次数

    - 为什么？

        浏览器存在同域名 HTTP 并发请求限制，通常限制在 2 到 8 个请求之间。所以，将文件分割的越多越小，不一定能提高响应速度。每次 HTTP 请求都有一定的开销，反而可能会影响性能。

    - 解决方案
        - 合并文件：CSS，JS
        - 图像拼合：CSS Sprite
        - 图象区块 —— 确定图片的坐标和可能会比较繁琐且容易出错，所以不推荐
        - 内联图像 —— 还没有得到主流浏览器支持

    - 参考文献
        - [How to Reduce Your Website's HTTP Requests](http://blog.hubspot.com/marketing/reduce-http-requests#sm.0001lmgp3wsd2d3dtnn1nld69u1hp)
        - [HTTP Requests are How Browsers Ask to View Your Pages](http://webdesign.about.com/od/speed/qt/minimize-http-requests.htm)
- ...

**服务器**

- 使用 CDN(Content Delivery Network)
 
    - 为什么：用户与你网站服务器的接近程度会影响响应时间的长短。把你的网站内容分散到多个、处于不同地域位置的服务器上可以加快下载速度。
    - 实际运用： 一些大型的网络公司拥有自己的CDN，但是使用像Akamai Technologies，Mirror Image Internet， 或者Limelight Networks这样的CDN服务成本却非常高。对于刚刚起步的企业和个人网站来说，可能没有使用CDN的成本预算，但是随着目标用户群的不断扩大和更加 全球化，CDN就是实现快速响应所必需的了。

- 为文件头指定 Expires 或 Cache-Control
    
    - 对于静态内容：设置文件头过期时间Expires的值为“Never expire”（永不过期） —— 要切记，如果使用了 Expires 文件头，当页面内容改变时就必须改变内容的文件名。
    - 对于动态内容：使用恰当的 Cache-Control 文件头来帮助浏览器进行有条件的请求

- Gzip 压缩文件内容

    为什么？

    > 终端用户的带宽、互联网提供者、与对等交换点的靠近程度等都不是网站开发者所能决定的，通过减小 HTTP 响应的大小可以节省 HTTP 响应时间。
    
    解决方案

    > 从 HTTP/1.1 开始，浏览器都默认支持 HTTP 请求中有 Accept-Encoding 文件头的压缩格式：Accept-Encoding: gzip, deflate。如果服务器在请求的文件头中检测到上面的代码，就会以客户端列出的方式压缩响应内容。Web服务器把压缩方式通过响应文件头中的 Content-Encoding 来返回给浏览器。
    > 
    > Gzip 是目前最流行也是最有效的压缩方式，大概可以减少 70% 的响应规模。目前大约有 90% 通过浏览器传输的互联网交换支持 gzip 格式。另外仅有的一个压缩格式是 deflate，但是它的使用范围有限效果也稍稍逊色。

    哪些文件可以压缩？

    HTML，CSS，JS，XML，JSON 等都适合使用 gzip 压缩。图像和 PDF 文件由于已经压缩过了，所以不能再进行 gzip 压缩 —— 如果试图 gizp 压缩这些文件的话不但会浪费CPU资源还会增加文件的大小。

**CSS**

- 把样式表置于顶部

    样式表乱放可能导致 FOUC（无样式内容闪烁），而且把样式表放在文档底部会导致包括 Internet Explorer 在内的很多浏览器终止内容的有序呈现，用户不得不面对一个空白页面。

- 避免使用 CSS 表达式：存在兼容性和性能问题
- 使用外部 CSS：使用外部文件不仅可以降低页面大小，还可以利用 CSS 在浏览器的缓存，大大提高页面加载速度

**JavaScript**

- 把脚本置于页面底部
- 使用外部 JavaScript：同 CSS

- Add an Expires or a Cache-Control Header
- Gzip Components
- Put Stylesheets at the Top
- Put Scripts at the Bottom
- Avoid CSS Expressions
- Make JavaScript and CSS External
- Reduce DNS Lookups
- Minify JavaScript and CSS
- Avoid Redirects
- Remove Duplicate Scripts
- Configure ETags
- Make Ajax Cacheable
- Flush the Buffer Early
- Use GET for AJAX Requests
- Post-load Components
- Preload Components
- Reduce the Number of DOM Elements
- Split Components Across Domains
- Minimize the Number of iframes
- No 404s
- Reduce Cookie Size
- Use Cookie-free Domains for Components
- Minimize DOM Access
- Develop Smart Event Handlers
- Choose <link> over @import
- Avoid Filters
- Optimize Images
- Optimize CSS Sprites
- Don't Scale Images in HTML
- Make favicon.ico Small and Cacheable
- Keep Components under 25K
- Pack Components into a Multipart Document
- Avoid Empty Image src

# 移动端
- [如何让 H5 体验接近 APP：（一）触摸反馈](https://segmentfault.com/a/1190000006864910)

# 自我认识
> 前端是最贴近用户的程序员，比后端、数据库、产品经理、运营、安全都近。 
> 1、实现界面交互 
> 2、提升用户体验
> 3、有了Node.js，前端可以实现服务端的一些事情
>
> 前端是最贴近用户的程序员，前端的能力就是能让产品从 90 分进化到 100 分，甚至更好。
> 参与项目，快速高质量完成实现效果图，精确到1px；
> 与团队成员，UI设计，产品经理的沟通；
> 做好的页面结构，页面重构和用户体验；
> 处理 hack，兼容、写出优美的代码格式；
> 针对服务器的优化、拥抱最新前端技术；

# TODO
- [Web开发工具和资源整合](https://xituqu.com/170.html)
