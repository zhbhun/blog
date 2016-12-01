---
title: HTML 常见问题
date: 2016-09-11
category: HTML
tags: HTML
---

- http://w3help.org
- https://leohxj.gitbooks.io/front-end-database/content/html-and-css-basic/index.html
- https://html5up.net/
- http://html5demos.com/

# 标签
## meta
meta 译为元数据，meta 标签的内容一般都是表示关于 HTML 页面的信息，另外也可以模拟一个 HTTP 响应头部（例如重定向到不同页面）。

用法

- 描述网页信息
    - name="author"
    - name="copyright"
    - name="keywords"
    - name="description"
    - name="generator"
    - name="application-name"
- 控制显示
    - name="vewiport"
    - name="renderer"
    - http-equiv="X-UA-Compatible"
- 搜索引擎爬虫
    - name="robos"
    - name="revisit-after"
- HTTP 响应头
    - charset=""
    - [http-equiv](http://reference.sitepoint.com/html/meta/http-equiv)：一般不用
- 扩展
    - Baidu：mobile-agent, baiduspider
    - Twitter: twitter:card, twitter:image, twitter:creator:id
    - Google: application-url, google-site-verification, googlebot
    - Facebook：[Open Graph](https://developers.facebook.com/docs/opengraph)
    - 360: renderer (未注册)
- [Meta Tag Builder - 100% Free!](http://www.scrubtheweb.com/abs/builder.html)

误区

1. 设定网页字符集

    - HTML4：`<meta http-equiv="content-Type" content="text/html;charset=utf-8">`
    - HTML5：`<meta charset="utf-8">`
    - [<meta charset=“utf-8”> vs <meta http-equiv=“Content-Type”>](http://stackoverflow.com/questions/4696499/meta-charset-utf-8-vs-meta-http-equiv-content-type)

2. response header VS meta tag

    > http-equiv 这个属性对应 HTTP response headers 里面的项目，它也是因此而得名。其初衷是让不能（比如没有权限）设定服务器 header 的站点可以通过它来告知浏览器一些页面内容的相关信息。

    [response header VS meta tag](http://stackoverflow.com/questions/9417024/response-header-vs-meta-tag)

3. SEO

    > 在过去，搜索引擎是靠meta标签，如标题（title）、描述（description）甚至关键字（keywords）来索引网页页面的。在一个理想情况下，如果每个人都正常地使用它们，那它们将很好地应用于页面当中。然而，某些网站已经开始滥用它们了，在页面中塞满众多著名的关键词，目的在于获得一个更好的搜索结果。但Google在2009年就宣布在搜索算法中不再使用元关键词或者描述来得出排名（Ranking）了。

    > 尽管描述meta标签已经对搜索引擎的排名没有影响了，但它们确会出现在搜索结果当中。换句话说，一个人在点击你的链接之前是会在搜索结果中先看到页面的描述，这个也说明，应该添加上meta描述，方便用户去阅读而不是为了方便网络机器人去查找。总的来说，虽然一个好的meta描述不会增加网站排名，但在搜索结果中却会增加点击率。

    > 百度中文搜索引擎算法则是考虑到关键词标签作为算法的一个重要因素。如果你希望流量的重要组成部分是来自中文用户，那么你应该添加关键字meta标签——但是要小心，避免使用不必要和不道德的关键词。

实践

- 描述网页信息：keywords，description
- 网页显示：viewport，X-UA-Compatible
- 搜索引擎爬虫：none
- HTTP 响应头： charset

参考文献

- [HTML meta标签总结与属性使用介绍](https://segmentfault.com/a/1190000004279791)
- [在HTML中使用meta标签的基础知识和最佳实践](http://www.w3cplus.com/css/meta-tags-html-basics-best-practices.html)
- [meta on MDN](https://developer.mozilla.org/zh-CN/docs/Web/HTML/Element/meta)
- [html的meta总结，html标签中meta属性使用介绍](http://www.haorooms.com/post/html_meta_ds)

## link
link 标签指定当前文档和外部文档的关系，最常见的用法是指定外部样式表。

常见用法

- 引入样式表
- 引入可选样式表
- 监听外部资源加载事件



- rel="stylesheet"：链接到样式表
- rel="alternate stylesheet"：链接到可替换的样式表
- rel="alternate"：链接到当前文档的其他形式，如：`<link rel="alternate" type="application/rss+xml" title="Matt Mullenweg » Feed" href="http://ma.tt/feed/" />`
- rel="prev", rel="next"：链接到文档的前一篇 / 后一篇 / 前一页 / 后一页，在生成站点目录、归档视图时很有帮助 —— [显示分页内容](https://support.google.com/webmasters/answer/1663744?hl=zh-Hans)
- rel="icon"：当前文档的 favicon

- https://developer.mozilla.org/en-US/docs/Web/HTML/Link_types
- http://www.w3schools.com/tags/att_link_rel.asp
- [HTML <link> rel Attribute](http://www.w3schools.com/tags/att_link_rel.asp)
- [Pagination with rel=“next” and rel=“prev”](https://webmasters.googleblog.com/2011/09/pagination-with-relnext-and-relprev.html)
- [Indicate paginated content](https://support.google.com/webmasters/answer/1663744?hl=en)
- [Specify your canonical](https://webmasters.googleblog.com/2009/02/specify-your-canonical.html)
- [ALTERNATIVE STYLE SHEETS](https://www.w3.org/Style/Examples/007/alternatives.en.html)
- [CSS Media Queries & Using Available Space](https://css-tricks.com/css-media-queries/)
- [Difference Between HTML LINK Media and CSS Media Queries](http://stackoverflow.com/questions/25711297/difference-between-html-link-media-and-css-media-queries)
- [Screen and Mobile Stylesheets](http://stackoverflow.com/questions/7479849/screen-and-mobile-stylesheets)

## script
**用法**

- head script
- body script
- document write
- script insert：动态创建 script，插入到 DOM 中
- defer：HTML 4.0 规范，其作用是告诉浏览器等到 DOM+CSSOM 渲染完成，再执行指定脚本 —— 可以保证执行顺序就是它们在页面上出现的顺序；

    1. 浏览器开始解析 HTML 网页
    2. 解析过程中，发现带有 defer 属性的 script 标签
    3. 浏览器继续往下解析 HTML 网页，解析完就渲染到页面上，同时并行下载 script 标签中的外部脚本
    4. 浏览器完成解析 HTML 网页，此时再执行下载的脚本，完成后触发 DOMContentLoaded

- async：HTML 5 规范，其作用是，使用另一个进程下载脚本，下载时不会阻塞渲染，并且下载完成后立刻执行 —— 但是 async 无法保证脚本的执行顺序。哪个脚本先下载结束，就先执行那个脚本。；

    1. 浏览器开始解析 HTML 网页
    2. 解析过程中，发现带有 async 属性的 script 标签
    3. 浏览器继续往下解析 HTML 网页，解析完先显示页面并触发 DOMContentLoaded，同时并行下载 script 标签中的外部脚本
    4. 脚本下载完成，浏览器暂停解析 HTML 网页，开始执行下载的脚本
    5. 脚本执行完毕，浏览器恢复解析 HTML 网页

- 按需异步载入 js

**defer VS async**

- defer 可以保证执行顺序，async 不行；
- async 可以提前触发 domReady，defer 不行；
- defer 在 iOS 和部分 Android 下依然阻塞渲染，白屏时间长；
- 当 script 同时加 async 和 defer 属性时，后者不起作用，浏览器行为由 async 属性决定；
- async 和 defer 的兼容性不一致，好在 async 和 defer 无线端基本都支持，async 不支持 IE 9-；

    - defer 支持 IE6+（包含 IE6），async 不支持 IE9-（不包含IE9）
    - <=IE 9 defer 执行顺序有 bug，但可以 [hack](https://github.com/h5bp/lazyweb-requests/issues/42)
    - Firefox 的 defer 也可以提前触发 domready

**async vs script insert**

浏览器有‘preload scanner’ 的功能，在 HTML 解析时就可以提前并发去下载 JS 文件。而 script insert 将 JS 的文件隐藏在 JS 逻辑中，浏览器就没这么智能发现了。对于 CSS/JS 已经预加载到客户端了，可以使用 script inject。如果要在浏览器中运行，还是推荐使用 async 和 defer。


**最佳实践**

- 业务 JS 尽量异步，放 body 底部的 JS 在 iOS 上和部分 Android 是无效的，依然会阻塞首屏渲染 —— 不同的浏览器执行原理不一致；
- 异步的方式尽可能原生用 async，容器（浏览器、webview 等）级别自带优化，不要通过 JS 去模拟实现，如 getScript/ajax/KISSY.use/$.use 等；
- 有顺序依赖关系的 JS 可以加 defer，不改变执行顺序，相当于放到页面底部，如 TMS head 中一时无法挪动位置的类库等；

**参考文献**
- [无线性能优化：页面可见时间与异步加载](http://taobaofed.org/blog/2016/01/20/mobile-wpo-pageshow-async/)
- [JS一定要放在Body的最底部么？聊聊浏览器的渲染机制](http://delai.me/code/js-and-performance/)
- [JavaScript 的性能优化：加载和执行](https://www.ibm.com/developerworks/cn/web/1308_caiys_jsload/)
- [网站为什么 JS 调用尽量放到网页底部？](https://www.zhihu.com/question/34147508)
- async  and defer

    - [script的defer和async](http://ued.ctrip.com/blog/script-defer-and-async.html)
    - [Asynchronous and deferred JavaScript execution explained](http://peter.sh/experiments/asynchronous-and-deferred-javascript-execution-explained/)
    - [HTML5’s async Script Attribute](https://davidwalsh.name/html5-async)
    - [Les attributs async et defer pour <script>](http://www.alsacreations.com/astuce/lire/1562-script-attribut-async-defer.html)
    - [Difference between async and defer attributes in script tags](http://javascript.tutorialhorizon.com/2015/08/11/script-async-defer-attribute/)
    - [async vs defer attributes](http://www.growingwiththeweb.com/2014/02/async-vs-defer-attributes.html)

- [onLoad and onDOMContentLoaded](http://javascript.info/tutorial/onload-ondomcontentloaded)
- [从onload和DOMContentLoaded谈起](http://www.cnblogs.com/hh54188/archive/2013/03/01/2939426.html)
- [使用 JavaScript 添加交互](https://developers.google.com/web/fundamentals/performance/critical-rendering-path/adding-interactivity-with-javascript?hl=zh-cn)
- [高性能JavaScript学习笔记-执行与加载](https://segmentfault.com/a/1190000004379833)


# SEO
- [Google Search Console](https://support.google.com/webmasters#topic=3309469)

# 兼容性问题
- https://html5test.com/
- https://html5test.com/results/desktop.html
