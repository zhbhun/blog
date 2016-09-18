---
title: HTML 常见问题
date: 2016-09-11
category: HTML
tags: HTML
---

- https://leohxj.gitbooks.io/front-end-database/content/html-and-css-basic/index.html
- https://html5up.net/
- https://html5test.com/results/desktop.html
- http://html5demos.com/

# DOCTYPE
是什么？

> DOCTYPE，文档类型，一个文档类型标记是一种标准通用标记语言的文档类型声明，它的目的是要告诉标准通用标记语言解析器，它应该使用什么样的文档类型定义（DTD）来解析文档。Doctype还会对浏览器的渲染模式产生影响，不同的渲染模式会影响到浏览器对于 CSS 代码甚至 JavaScript 脚本的解析，所以Doctype是非常关键的，尤其是在 IE 系列浏览器中，由DOCTYPE 所决定的 HTML 页面的渲染模式至关重要。

解析方式

- 非怪异（标准）模式
- 怪异模式：IE6 以下，IE6+ 的非标准模式
- 部分怪异（近乎标准）模式


- [What is DOCTYPE?](http://stackoverflow.com/questions/414891/what-is-doctype)
- [Uppercase or lowercase doctype?](http://stackoverflow.com/questions/7020961/uppercase-or-lowercase-doctype)
- [Set HTML5 doctype with XSLT](http://stackoverflow.com/questions/3387127/set-html5-doctype-with-xslt)
- [HTML5 is not based on SGML, so what is it based on then?](http://stackoverflow.com/questions/16185880/html5-is-not-based-on-sgml-so-what-is-it-based-on-then)
- [Any reason not to start using the HTML 5 doctype? [closed]](http://stackoverflow.com/questions/5629/any-reason-not-to-start-using-the-html-5-doctype)

# 语义化
什么是语义化

语义化是指根据内容的结构化（内容语义化），选择合适的标签（代码语义化），便于开发者阅读和写出更优雅的代码的同时，让浏览器的爬虫和机器很好的解析。

为什么要语义化

- 有利于SEO，有助于爬虫抓取更多的有效信息，爬虫是依赖于标签来确定上下文和各个关键字的权重；
- 语义化的 HTML 在没有 CSS 的情况下也能呈现较好的内容结构与代码结构；
- 方便其他设备的解析
- 便于团队开发和维护

语义化标签

- 全局属性
    - id：标示符 (用于引用)，不应依赖其语义处理相应元素
    - class
    - title：链接（描述目标信息），图片（版权 / 描述），引用（来源信息），交互元素（操作指南）
    - lang：内容的语言
- 元数据
    - head
    - meta：元数据，描述网页信息，控制网页显示方式...
    - title：文档对外的标题 —— 窗口标题 / 历史记录 / 搜索结果标题 / ...
- 链接：
    - link：元数据，用来描述文档本身与其他资源的关系，必须包含 rel 及 href 属性
    - a：存在 href 属性时为超链接，缺少 href 属性时为链接占位符
        - rel="prev", rel="next"：链接到文档的前一篇 / 后一篇 / 前一页 / 后一页
        - rel="nofollow"：当前文档的作者并不推荐超链接指向的文档，由 Google 引入，他们认为适用场景有 (via)：不可信赖的内容，付费链接，按优先级别进行抓取 (比如通知 Googlebot 不要抓取「注册」或「登陆」页面)
    - area
- 区块
    - header：一组介绍性描述或导航信息(目录 / 搜索框 / logo / ...)，用来描述最近的父级区块，通常包含 h1–h6，但不影响文档提纲的生成
    - h1-h6
    - nav：可以帮助 UA 迅速获得导航内容，例如读屏器可以省去很多渲染直接跳到导航位置
    - aside：表示与周围内容关系不太密切的内容 (eg. 广告)，通常表现为侧边栏内容 (eg. 相关背景内容)、引述内容
    - article：独立的文档、页面、应用、站点，可以是：一篇帖子，一篇文章，一则用户评论，一个可交互的 widget ...
    - section：按主题将内容分组，通常会有标题 —— 何时使用？当你希望这个元素的内容体现在文档的提纲中时，用 section 是合适的
    - address：代表与最近父级 article 或整个文档关联的联系人信息
    - footer：代表最近的父级区块内容的页脚，包含：作者信息 / 相关文档 / 版权信息，不影响文档提纲的生成
- 分组内容
    - p：段落
    - hr：水平分隔线，区块内容之间不需要用 hr 元素分隔
    - pre：表示已排版的内容，代码片段 / ASCII art / ...
    - blockquote：引用的来自其他来源的内容，cite 属性表示该来源的 URL
    - ol, ul, li：有序 / 无序列表，ol 下 li 元素的 value 属性代表该列表项的序号值
    - dl, dt, dd：名值对的集合，术语定义表 / 元数据 / FAQ / ...
    - figure：比较独立的、被主要内容引用的部分，如：插图 / 图表 / 照片 / 代码 / ...
    - figcaption：figure 通常会有一个标题 —— figcaption，如：图表标题 / 图例 / 代码说明 / ...
    - div：本身无语义，最后考虑的选择
    - main：文档的主内容 / 应用的核心功能
- 文本级语义
    - em：表示侧重点的强调，em 的位置不同，文本本身含义不同，在可视化 UA 上一般渲染为斜体
    - strong：表示内容的重要性，strong 的位置不同，文本本身含义不变，在可视化 UA 上一般渲染为粗体
    - i：表示另一种叙述方式，如：画外音 / 分类学名词 / 外来语片段 / 舞台指示 / 船名 / ...
    - b：表示某种需要引起注意却又没有其他额外语义的内容，如：摘要中的关键词 / 评介中的产品名称 / 文章的开篇内容 ...
    - small：免责声明 / 许可证声明 / 注意事项 / ...
    - s：不再只是「带删除线的文字」，表示不再准确或不再相关的内容，与 del 元素含义不同
    - u：不再只是「带下划线的文字」，表示用非文本进行的标注的内容，如：中文专名 / 拼写检查的错误内容 / ...
    - cite：引述的作品标题，如：书 / 论文 / 散文 / 电影 / 歌曲 / 电视节目 / 画作 / ...
    - q：引用的来自其他来源的段内内容，cite 属性表示该来源的 URL，不用 q 而用引号亦正确
    - abbr：缩写，其 title 属性的含义为所写的全称
    - dfn：用来展现一个术语的定义实例，最接近的父级段落、定义列表组或区块内容必须包含 dfn 元素指定术语的定义
    - time：为表述的内容增加一个机器可读的时间数据，datetime 属性值必须是预定义的几种时间格式之一，如果不含 datetime 属性，则会解析其文本内容值
    - code： 代码片段
    - samp： 计算机程序的输出
    - kbd： 用户输入的内容 / 按键
    - mark：在引用的文字中使用，表示在当前文档中需要引起注意但原文中并没有强调的含义 (eg. 对一篇文章的分析中对原文的标注)，表示与用户当前的行为相关的内容 (eg. 高亮显示搜索关键词)
    - ruby, rt, rp：注音标示，「ruby」来自日本印刷业，主要于 CJK 文字
    - span：本身无语义，可以和 class, lang 等属性结合，为文本片段增加语义，有更合适的元素时不应选择 span
- 更改记录
    - ins, del：表示对当前文档内容进行的增添与删改
        - cite 属性指向对某个修改的说明文档的 URL
        - datetime 属性表示了修改发生的时间 (取值规范)
        - 用来记录文档的编辑历史
- http://justineo.github.io/slideshows/semantic-html/#/

不同标签的区别

- em vs i，为什么 font-awesome 这类字体是用 i 标签？

    em 以斜体的形式展现，表示强调的文本。i 标签通常表示因为某种原因和正常文本不同的文本，例如专业术语、外语短语或排版用的文字。通常表现为斜体。

- strong vs b
    
    strong 以加粗的形式展现，表示文本的重要性。b 表示的文本风格不同于正常的文本，没有表达任何特殊的重要性和相关性。通常用于关键字回顾，如：回顾中的产品名称或者是其他需要表现为粗体的文本，另一个例子是标志每个段落的 lead sentence。

- em vs strong

    在 HTML4 中，strong 一般指的是更强的强调。HTML5 中 strong 表示的是内容的重要性，em 被用来改变一个句子的含义。

参考文献

- [HTML语义化](https://segmentfault.com/a/1190000005626375)
- [如何理解 Web 语义化？](https://www.zhihu.com/question/20455165)
- [语义化的HTML结构到底有什么好处？](http://www.css88.com/archives/1668)
- [HTML 5的革新——语义化标签(一)](http://www.html5jscss.com/html5-semantics-section.html)
- [HTML 5的革新——语义化标签(二)](http://www.html5jscss.com/html5-semantics-rich.html)
- [理解HTML语义化](http://www.cnblogs.com/freeyiyi1993/p/3615179.html)
- [HTML语义化标签探析](https://segmentfault.com/a/1190000004285858)

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

# SEO
- [Google Search Console](https://support.google.com/webmasters#topic=3309469)
