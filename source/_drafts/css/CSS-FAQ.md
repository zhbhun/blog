---
title: CSS 疑惑解答
date: 2016-09-11
categories: CSS
tags: CSS
---

# 用法
**HTML link VS CSS @import**
两者都能引入样式表，但 link 属于 HTML 标签，而 @import 是 CSS 提供的。

link 可以并行立即加载，而 @import 可能被 link 阻塞，且不能立即下载（link 和 script 先下载）。

- @import @import（使用 @import 引入两个样式表 ）：各个样式表并发下载，不会互相阻塞；
- link @import（混合使用 link 和 @import）：在 IE 下，@import 会等到 link 下载完才开始下载；
- link with @import（@import 放在 link 指定的样式表中）：所有浏览器都是要等待该样式表下载完，才开始下载 @import 样式表；
- link blocks @import（同上，但是在之前还有其他的 link）：在 IE 下，@import 会等待所有 link 下载完才开始下载，其他浏览器只要该 link 下载完就开始下载 @import 样式表；
- many @imports（多个 @import）：在 IE 中，@import 样式表在 js 和 img 之后开始加载（导致图片重复渲染），并且下载顺序可能不同于声明顺序；
- link link（使用 link 引入两个样式表）：所有浏览器都会并发下载样式表；
- link with @imports（使用一个 link 引入多个 @import 样式表）：@import 样式表必须等待 link 样式表下载完才开始下载；
- many links（使用 link 引入多个样式表）：样式表会按顺序并发下载，；
- http://stevesouders.com/tests/atimport/import-import.php?t=1473749144

- [Difference between @import and link in CSS](http://stackoverflow.com/questions/1022695/difference-between-import-and-link-in-css)
- [don’t use @import](http://www.stevesouders.com/blog/2009/04/09/dont-use-import/)

**FOUC**

FOUC（Flash Of Unstyled Content，无样式内容闪烁）是浏览器在外部样式下载完成前渲染页面时，出现短暂的无样式（默认样式）网页。

出现 FOUC 的原因

- 使用 import 方法导入样式表
- 将样式表放在页面底部
- 有几个样式表，放在 HTML 结构的不同位置

解决方案：使用 link 标签将样式表放在文档 head 中。

- [Flash of unstyled content](https://en.wikipedia.org/wiki/Flash_of_unstyled_content)
- [Prevent FOUC](https://gist.github.com/johnpolacek/3827270)
- [The FOUC Problem](https://webkit.org/blog/66/the-fouc-problem/)

# 选择器
**有哪些选择器**
...

**优先级算法**
- !important > 内联样式 > 外部样式 > 默认样式
- 外部样式权重计算：ID 选择器-类选择器-元素选择器
- 就近原则

# 层叠
- [KB005: CSS 层叠](http://w3help.org/zh-cn/kb/005/)

# 继承
哪些属性可以继承？

- font-size
- font-family
- color
- text-indent

# 定位
position:absolute VS float

- 共同点：都可以让元素脱离文档流，并且可以设置其宽高；
- 不同点：float 仍会占据位置，position 会覆盖文档流中的其他元素；

position:relative VS position:absolute

- absolute 生成绝对定位的元素，相对于最近一级的定位不是 static 的父元素来进行定位；
- relative 生成相对定位的元素，相对于其在普通流中的位置进行定位；

浮动带来的问题

- 父元素的高度无法被撑开，影响与父元素同级的元素；
- 与浮动元素同级的非浮动元素（内联元素）会跟随其后；
- 若非第一个元素浮动，则该元素之前的元素也需要浮动，否则会影响页面显示的结构；

如何清除浮动

- 使用 clear 样式清除
- 使用伪元素 :after 清除
- 使用 overflow 清除
- 更多：[CS001: 清理浮动的几种方法以及对应规范说明](http://w3help.org/zh-cn/casestudies/001)

浮动实际应用

TODO

- [KB009: CSS 定位体系概述](http://w3help.org/zh-cn/kb/009/)
- [KB010: 常规流( Normal flow )](http://w3help.org/zh-cn/kb/010/)
- [KB011: 浮动( Floats )](http://w3help.org/zh-cn/kb/011/)
- [KB012: 绝对定位( Absolute positioning )](http://w3help.org/zh-cn/kb/012/)
- [KB013: 分层的显示( Layered presentation )](http://w3help.org/zh-cn/kb/013/)

# 盒模型
**display:none VS visibility:hidden**
- display:none：隐藏对应的元素，在文档布局中不再给它分配空间，它各边的元素会合拢，
就当他从来不存在；
- visibility:hidden：隐藏对应的元素，但是在文档布局中仍保留原来的空间；

**box-sizing**
box-sizing 属性主要用来控制元素的盒模型的解析模式；

content-box VS border-box

- content-box ：让元素维持W3C的标准盒模型。元素的宽度/高度由border + padding + content的宽度/高度决定，设置width/height属性指的是content部分的宽/高；
- border-box ：让元素维持IE传统盒模型（IE6以下版本和IE6~7的怪异模式）。设置 width/height 属性指的是border + padding + content；

**Margin Collapse**
是什么？

在 CSS 当中，相邻的两个盒子（可能是兄弟关系也可能是祖先关系）的外边距可以结合成一个单独的外边距。这种合并外边距的方式被称为折叠，并且因而所结合成的外边距称为折叠外边距。

折叠外边距计算规则

 - 两个相邻的外边距都是正数时，折叠结果是它们两者之间较大的值；
 - 两个相邻的外边距都是负数时，折叠结果是两者绝对值的较大值；
 - 两个外边距一正一负时，折叠结果是两者的相加的和；

外边距折叠条件

- 必须是处于常规文档流（非float和绝对定位）的块级盒子，并且处于同一个BFC当中；
    - 浮动元素不与任何元素的外边距产生折叠（包括其父元素和子元素）；
    - 绝对定位元素不与任何元素的外边距产生折叠；
    - 创建了新的 BFC 的元素（例如浮动元素或者'overflow'值为'visible'以外的元素）与它的子元素的外边距不会折叠；
    - inline-block元素不与任何元素的外边距产生折叠
- 没有线盒，没有空隙（clearance，下面会讲到），没有 padding 和 border 将他们分隔开
- 都属于垂直方向上相邻的外边距，可以是下面任意一种情况
    - 元素的 margin-top 与其第一个常规文档流的子元素的 margin-top
    - 元素的 margin-bottom 与其下一个常规文档流的兄弟元素的 margin-top
    - height 为 auto 的元素的 margin-bottom 与其最后一个常规文档流的子元素的 margin-bottom
    - 高度为 0 并且最小高度也为 0，不包含常规文档流的子元素，并且自身没有建立新的 BFC 的元素的 margin-top 和 margin-bottom

# CSS3
**CSS3 新特性**

1. border-radius：圆角；
2. box-shadow：阴影；
3. text-shadow：文字特效；
4. gradient：线性渐变
5. transform：旋转；
6. ...

# 应用
## 单行文本居中与多行文本居左

我们让内层元素居左 text-align:left，外层元素居中 `text-align:center`，并且将内存元素设置为 `display:inline-block` ，利用 `inline-block` 元素可以被父级 `text-align:center` 居中的特性，这样就可以实现单行居中，多行居左。

https://github.com/zhbhun/program-demo/tree/master/css/faq/single-center-and-multi-left

## 文本截断
**需求**

- 单行截断
- 多行截断
- 按高度截断

**误区**

- 字符一定等宽
- 超过 n 个字符截断显示，英文数字算一个字符，汉字算两个字符

备注：为了显示效果，前端往往会采用优先西文字体族的 font-family 设置，即西文字符用西文字体，汉字用中文字体，这就很容易使得文本的宽度不好根据字符数来控制。非代码的内容本身就不一定适合用等宽西文字体显示，即使用了等宽西文字体，汉字也基本不可能正好是其两倍宽

**单行单行截断**

- 基于 `text-overflow:ellipsis` 实现

    行内文本截断需要设置块级容器设置样式：`white-space: nowrap; text-overflow: ellipsis; overflow: hidden;`
    
    输入框文本截断需要设置样式：`wdith: 指定宽度; text-overflow: ellipsis;`

    存在的问题：

    - 在 IE8 和 IE9 的元素 `<input type="text">` 上不起作用；
    - 一些三星移动设备的浏览器，必须设置 text-rendering 为 auto 才能截断；
    - 在 IE 和 Chrome 的 Select 元素上不起作用 —— Firefox 可以；

- 通过计算内容宽度来实现

    计算每个字符的宽度，找到加上 ... 正好小于指定宽度的边界，然后截去后续字符。

**多行文本截断**

- 基于 line-clamp 实现：设置元素的样式为 `display: -webkit-box; overflow: hidden; -webkit-line-clamp: 2; -webkit-box-orient: vertical;`
- 计算内容行数

    - `getComputedStyle`
    - `Element.getClientRects()`
    - `Selection.modify()`
    - https://github.com/josephschmitt/Clamp.js/
    - ...

**按高度截断**

通过比较 scrollHeight 和 clientHeight 可以方便地测试元素内容的高度是否溢出容器范围，如果超出了指定高度，反复截去尾部内容直到不再溢出。

**实现案例**

- https://github.com/zhbhun/program-demo/tree/master/css/faq/text-truncation

**开发工具**
- http://www.css88.com/webkit/-webkit-line-clamp/
- https://github.com/josephschmitt/Clamp.js/

**参考文献**

- [text-overflow](http://caniuse.com/#feat=text-overflow)
- [line-clamp](http://caniuse.com/#feat=css-line-clamp)
- [前端文本截断](http://efe.baidu.com/blog/text-truncating/)
- [CSS LINE CLAMPING](http://guerillalabs.co/blog/css-line-clamping.html)
- [Line Clampin’ (Truncating Multiple Line Text)](https://css-tricks.com/line-clampin/)
- [Ellipse My Text…](https://software.intel.com/en-us/html5/hub/blogs/ellipse-my-text/)
- [CSS Ellipsis: How to Manage Multi-Line Ellipsis in Pure CSS](http://www.mobify.com/blog/multiline-ellipsis-in-pure-css/)
- [ELLIPSE MY TEXT…](http://html5hub.com/ellipse-my-text/)
- [Line Clampin’ (Truncating Multiple Line Text)](https://css-tricks.com/line-clampin/)
- [谈谈一些有趣的CSS题目（5）： 单行居中，两行居左，超过两行省略](http://web.jobbole.com/88219/)

# 高级
## BFC
**什么是 BFC ？**

- BFC，是 block formatting context 的缩写
- W3C 定义：浮动元素和绝对定位元素，非块级盒子的块级容器（例如 inline-blocks, table-cells, 和 table-captions），以及 overflow 值不为“visiable”的块级盒子，都会为他们的内容创建新的 BFC（块级格式上下文）。
- 在 BFC 中，盒子从顶端开始垂直地一个接一个地排列，两个盒子之间的垂直的间隙是由他们的 margin 值所决定的。在一个 BFC 中，两个相邻的块级盒子的垂直外边距会产生折叠。
- 除了 BFC，还有 IFC，这是 W3C CSS2.1 规范中的概念（Formatting context）。Formatting context 是页面中的一块渲染区域，并且有一套渲染规则，它决定了其子元素将如何定位，以及和其他元素的关系和相互作用。CSS2.1 中只有 BFC 和 IFC, CSS3 中还增加了 GFC 和 FFC。

**BFC 的渲染规则**

1. 内部的块级盒子会在垂直方向，从顶部开始一个接一个地放置；
2. 块级盒子垂直方向的距离由 margin 决定。属于同一个 BFC 的两个相邻块级盒子的 margin 会发生叠加；
3. 每个块级元素的左外边距与容器的左边相接触(对于从左往右的格式化，否则相反)，即使存在浮动也是如此；
4. BFC 的区域不会与 float box 叠加；
5. BFC 就是页面上的一个隔离的独立容器，容器里面的子元素不会影响到外面的元素，反之亦然；
6. 计算 BFC 的高度时，浮动元素也参与计算；

**BFC 的实际运用**

1. 避免外边距叠加；
2. 实现侧边栏布局；
3. 清除浮动；

参考文献

- [CSS之BFC详解](http://www.html-js.com/article/1866)
- [CSS中的BFC](http://www.ido321.com/1642.html)
- [深入理解BFC和Margin Collapse](http://www.w3cplus.com/css/understanding-bfc-and-margin-collapse.html)
- [Understanding Block Formatting Contexts in CSS](https://www.sitepoint.com/understanding-block-formatting-contexts-in-css/)
- [理解CSS中的BFC(块级可视化上下文)](http://www.jianshu.com/p/fc1d61dace7b)
- [CSS深入理解流体特性和BFC特性下多栏自适应布局](http://www.zhangxinxu.com/wordpress/2015/02/css-deep-understand-flow-bfc-column-two-auto-layout/)

## CSS Sprites
是什么？

CSS Sprites，图像拼合技术，将许过小的图片组合在一起，使用 CSS 定义背景属性，来控制图片的显示位置和方式。CSS Sprites 大大减少了 HTTP 请求的次数，减轻服务器压力，同时缩短了悬停加载图片所需要的时间延迟，使效果更流畅，不会停顿。

工具

- 制作工具：http://csssprites.com/
- 图标定位：http://getspritexy.com/

案例

- 苹果网站使用 CSS Sprites 来制作导航菜单的鼠标悬停效果；
- ...

参考文献

- [CSS Sprites: CSS图片合并技术详解](http://www.cnblogs.com/masky5310/archive/2010/08/31/1813358.html)
- [CSS Sprites: What They Are, Why They’re Cool, and How To Use Them](https://css-tricks.com/css-sprites/)
- [CSS Sprites: Image Slicing’s Kiss of Death](http://alistapart.com/article/sprites)
- [CSS Sprites](http://www.tutorialrepublic.com/css-tutorial/css-sprites.php)
- [What are CSS Sprites](http://spritegen.website-performance.org/)
- [The Mystery Of CSS Sprites: Techniques, Tools And Tutorials](https://www.smashingmagazine.com/2009/04/the-mystery-of-css-sprites-techniques-tools-and-tutorials/)
- http://csssprites.com/

## 图片优化
- 对于非动画的GIF更建议使用PNG8因为它同样能做到一样的效果，而且能为你节省 10%-30% 的文件体积；
- Photoshop 相比起 Fireworks，导出同等质量的PNG图片，体积会稍大。而 Fireworks 虽然做了相应压缩优化，但没有达到最优秀的压缩。
- 图片体积及尺寸方面，建议体积保持在 100K 以内，尺寸为800px；

# 兼容性问题
- png 24 位的图片在iE6浏览器上出现背景，解决方案是做成PNG8.也可以引用一段脚本处理；
- 浏览器默认的 margin 和 padding 不同，解决方案是加一个全局的 `{margin:0; padding:0;}` 来统一；
- IE6 双边距 bug：块属性标签float后，又有横行的 margin 情况下，在 ie 6显示 margin 比设置的大；
- 渐进识别的方式，从总体中逐渐排除局部；
 
    首先，巧妙的使用“\9”这一标记，将IE游览器从所有情况中分离出来接着，再次使用“+”将IE8和IE7、IE6分离开来，这样IE8已经独立识别。 

    ```
    .bb {
        background-color: #f1ee18; /*所有识别*/
        .background-color: #00deff\9; /*IE6、7、8识别*/
        +background-color: #a200ff; /*IE6、7识别*/
        _background-color: #1e0bd1; /*IE6识别*/
    } * IE下，可以使用获取常规属性的方法来获取自定义属性
    ```

- Chrome 中文界面下默认会将小于 12px 的文本强制按照 12px 显示, 可通过加入 CSS 属性 -webkit-text-size-adjust: none 来解决; 
- 超链接访问过后 hover 样式就不出现了，被点击访问过的超链接样式不在具有 hover 和 active 了 —— 解决方法是改变CSS属性的排列顺序 L-V-H-A：`a:link {} a:visited {} a:hover {} a:active {}`；

## 渐进增强/优雅降级

> 优雅降级和渐进增强印象中是随着css3流出来的一个概念。由于低级浏览器不支持css3，但css3的效果又太优秀不忍放弃，所以在高级浏览中使用 css3而低级浏览器只保证最基本的功能。咋一看两个概念差不多，都是在关注不同浏览器下的不同体验，关键的区别是他们所侧重的内容，以及这种不同造成的 工作流程的差异。

- 渐进增强（progressive enhancement）：针对低版本浏览器进行构建页面，保证最基本的功能，然后再针对高级浏览器进行效果、交互等改进和追加功能达到更好的用户体验。
- 优雅降级（graceful degradation）：一开始就构建完整的功能，然后再针对低版本浏览器进行兼容。
