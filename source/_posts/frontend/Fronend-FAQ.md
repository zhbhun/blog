---
title: 前端常见问题
date: 2016-09-18
category: Frontend
tags: Frontend
---

- https://github.com/markyun/My-blog/tree/master/Front-end-Developer-Questions
- [前端面试之CSS总结(上)](https://segmentfault.com/a/1190000006890725)
- [Awsome-Front-End-learning-resource](https://github.com/helloqingfeng/Awsome-Front-End-learning-resource)
- [Front-end-Interview-questions](https://github.com/hawx1993/Front-end-Interview-questions)

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
**内容优化**

- 减少 HTTP 请求次数

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

- 减少 DNS 查找次数

    什么是 DNS？

    DNS（Domain Name System）是域名系统，提供了域名和 IP 的对应关系。当你在浏览器地址栏中输入网址时，DNS 解析服务器就会返回这个域名对应的 IP 地址。
    
    DNS 查找对性能的影响？

    DNS 解析的过程同样也是需要时间的。一般情况下返回给定域名对应的IP地址会花费 20 到 120 毫秒的时间，而且在这个过程中浏览器什么都不会做直到 DNS 查找完毕。
    
    实际运用

    虽然减少 DNS 查找次数可以节省响应时间，但同时也会减少并行下载数，而增加响应时间。实际开发中，需要在减少 DNS 查找次数和保持较高程度并行下载两者之间权衡，通常把页面中的内容分割成至少两部分但不超过四部分。

- 使 Ajax 可缓存
- 推迟加载内容：将网页分为必须首先加载的和可以稍后加载的，例如：用于实现拖放和动画的 JavaScript，隐藏部分的内容和处于折叠部分的图像等都可以稍后加载。

    - 图片延迟加载：YUI Image Loader；

- 预加载：在浏览器空闲时请求将来可能会用到的页面内容，如图像、样式表和脚本。

    - 无条件加载
    - 有条件加载：根据用户的操作来有根据地判断用户下面可能去往的页面并相应的预加载页面内容；
    - 有预期的加载：载入重新设计过的页面时使用预加载；

- 减少 DOM 元素数量
- 根据域名划分页面内容：把页面内容划分成若干部分可以使你最大限度地实现平行下载 —— 由于 DNS 查找带来的影响你首先要确保你使用的域名数量在 2 个到 4 个之间。例如，你可以把用到 的 HTML 内容和动态内容放在 www.example.org 上，而把页面各种组件（图片、脚本、CSS)等静态资源存放在 statics.example.org 上。
- 减少使用 iframe
    - iframe 优点：解决加载缓慢的第三方内容如图标和广告等的加载问题；Security sandbox；并行加载脚本；
    - iframe 缺点：即时内容为空，加载也需要时间；会阻止面加载；没有语意；

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

- 配置 ETag
- 尽早刷新输出缓冲

    > 当用户请求一个页面时，无论如何都会花费200到500毫秒用于后台组织HTML文件。在这期间，浏览器会一直空闲等待数据返回。在 PHP 中，你可以使用 flush() 方法，它允许你把已经编译的好的部分 HTML 响应文件先发送给浏览器，这时浏览器就会可以下载文件中的内容（脚本等）而后台同时处理剩余的 HTML 页面。这样做的效果会在后台烦恼或者前台较空闲时更加明显。

- 使用 GET 来完成 AJAX 数据获取请求

    > Yahoo!Mail 团队发现，当使用 XMLHttpRequest 时，浏览器中的 POST 方法是一个“两步走”的过程：首先发送文件头，然后才发送数 据。因此使用 GET 最为恰当，因为它只需发送一个 TCP 包（除非你有很多 cookie）。IE 中 URL 的最大长度为 2K，因此如果你要发送一个超过 2K 的 数据时就不能使用 GET 了。
    >
    > 一个有趣的不同就是 POST 并不像 GET 那样实际发送数据。根据 HTTP 规范，GET 意味着“获取”数据，因此当你仅仅获取数据时使用GET更加有意义（从语意上讲也是如此），相反，发送并在服务端保存数据时使用 POST。


**JavaScript/CSS**

- 使用外部 CSS 和 JavaScript：使用外部文件不仅可以降低页面大小，还可以利用文件在浏览器的缓存，大大提高页面加载速度
- 把样式表置于顶部

    样式表乱放可能导致 FOUC（无样式内容闪烁），而且把样式表放在文档底部会导致包括 Internet Explorer 在内的很多浏览器终止内容的有序呈现，用户不得不面对一个空白页面。

- 把脚本置于页面底部
- 避免使用 CSS 表达式：存在兼容性和性能问题
- 精简 JavaScript 和 CSS：去除代码不必要的字符（注释、空白字符等）可以减少文件大小从而节省下载时间。

    - JavaScript：JSMin，YUI Compressor；
    - CSS：YUI Compressor；

- 删除重复脚本：重复脚本会引起不必要的 HTTP 请求和无用的 JavaScript 运算，这降低了网站性能
- 避免使用 @import 引入外部样式表
- 避免使用滤镜

    > IE 独有属性 AlphaImageLoader 用于修正 7.0 以下版本中显示 PNG 图片的半透明效果。这个滤镜的问题在于浏览器加载图片时它会终止内容的 呈现并且冻结浏览器。在每一个元素（不仅仅是图片）它都会运算一次，增加了内存开支，因此它的问题是多方面的。完全避免使用 AlphaImageLoader 的最好方法就是使用 PNG8 格式来代替，这种格式能在 IE 中很好地工作。如果你确实需要使用 AlphaImageLoader，请使用下划线 _filter 又使之对 IE7 以上版本的用户无效。

**Cookie**

- 减小 Cookie

    - 删除不需要的 Cookies
    - 尽可能减小 Cookies，确保不影响用户响应时间
    - 注意在恰当的域名设置 Cookies，避免影响子域名
    - 设置域名过期时间；

- 对静态内容使用无 Cookie 域名

**图片**

- 检查一下你的 GIF 图片中图像颜色的数量是否和调色板规格一致（调色板颜色较多时，可能还有压缩空间）；
- 尝试把 GIF 格式转换成 PNG 格式；
- 在所有的 PNG 图片上运行 pngcrush，或者其它PNG优化工具；
- 在所有的 JPEG 图片上运行 jpegtran —— 这个工具可以对图片中的出现的锯齿等做无损操作，同时它还可以用于优化和清除图片中的注释以及其它无用信息（如 EXIF 信息）；
- 优化 CSS Spirite

    - 在 Spirite 中水平排列你的图片，垂直排列会稍稍增加文件大小；
    - Spirite 中把颜色较近的组合在一起可以降低颜色数，理想状况是低于 256 色以便适用 PNG8 格式；
    - 不要在 Spirite 的图像中间留有较大空隙；

- 确保 favicon.ico 要小而且可缓存：favicon.ico 是位于服务器根目录下的一个图片文件。它是必定存在的，因为即使你不关心它是否有用，浏览器也会对它发出请求，因此最好不要返回一 个 404 的响应。

    - 文件尽量地小，最好小于 1K；
    - 在适当的时候为它设置 Expires 响应头；

- 避免空图像：即使 img 的 src 属性为空，有些浏览器也会向服务器发送请求；

**移动端**

- 保持单个内容小于 25K：这条限制主要是因为iPhone不能缓存大于25K的文件 —— 注意这里指的是解压缩后的大小。
- 打包组件成复合文本：把页面内容打包成复合文本就如同带有多附件的Email，它能够使你在一个HTTP请求中取得多个组件 —— HTTP请求是很奢侈的。

**参考文献**

- [浅谈网站性能之前端性能优化](https://acrens.github.io/2016/07/03/2016-07-03-performance/)
- [Best Practices for Speeding Up Your Web Site](https://developer.yahoo.com/performance/rules.html)]
- [网站性能最佳体验的34条黄金守则](http://www.kancloud.cn/imjzq/frontend/98105)

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
