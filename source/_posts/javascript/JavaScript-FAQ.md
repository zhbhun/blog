---
title: JavaScript 疑惑解答
date: 2016-09-11
categories: JavaScript
tags: JavaScript
---

# ES
## 原型链
- [Javascript的原型链图](https://zhuanlan.zhihu.com/p/22189387)

**函数创建过程**

1. 创建函数 func —— new Function()
2. 创建原型对象 prototype —— new Object()
3. func.prototype = prototype
4. prototype.constructor = func

**函数，原型和示例之间的关系**

...

**原型对象**

测试代码：https://github.com/zhbhun/program-demo/tree/master/javascript/es/proptype

## 作用域
### 函数作用域

### 块作用域
**实现方式**

- const 
- let
- try/catch
- with

### 声明提升
**原理**

编译源代码时，会将代码拆分为声明和赋值两个阶段。声明会被提升到函数作用域的上方，而赋值操作保持原来的顺序。

**原则**

1. 变量声明会被提升
2. 函数声明会被提升
3. 赋值操作/函数表达式不会被提升
4. 函数声明优先被提升，重复的变量声明会被忽略
5. 后面的函数声明会覆盖前面的函数声明
6 一个普通块内部的函数声明通常会被提升到所在作用域的顶部，而且遵循原则 5，与普通快是否会执行无关；

测试代码：https://github.com/zhbhun/program-demo/tree/master/javascript/es/scope/hoisting

### 闭包
什么是闭包？

1. 函数嵌套函数；
2. 函数内部可以引用外部的参数和变量；
3. 参数和变量不会被垃圾回收机制回收；

闭包的作用？

1. 设计私有的方法和变量；
2. 避免全局变量的污染；

闭包的副作用？

1. 闭包会常驻内存，会增大内存使用量，使用不当很容易造成内存泄露

闭包的实际运用

TODO

- [Use JavaScript Closures Efficiently](Use JavaScript Closures Efficiently)
- [JavaScript 闭包](https://segmentfault.com/a/1190000006875662)


## 数据类型
**null VS undefined**

- 为什么会有 undefined

    > 首先，null 像在 Java 里一样，被当成一个对象。但是，JavaScript 的数据类型分成原始类型 (primitive) 和合成类型 (complex) 两大类，JavaScript 的设计者 Brendan Eich 觉得表示"无"的值最好不是对象。
    > 
    > 其次，JavaScript 的最初版本没有包括错误处理机制，发生数据类型不匹配时，往往是自动转换类型或者默默地失败。Brendan Eich 觉得，如果 null 自动转为 0，很不容易发现错误。
    >
    > 因此，Brendan Eich又设计了一个 undefined。

    总结：null 代表对象的空值，而变量可能是合成类型，也可能是原始类型，所以变量的默认值不能是 null，而是未定义 undefined

- 两者的区别

    - null：表示”空值“，转为数值时为 0；
        - 作为函数的参数，表示该函数的参数不是对象；
        - 作为对象原型链的终点；
    - undefined：表示”缺少值“，转为数值时为 NaN；
        - 变量被声明了，但没有赋值时，就等于 undefined；
        - 调用函数时，应该提供的参数没有提供，该参数等于 undefined；
        - 对象没有赋值的属性，该属性的值为 undefined
        - 函数没有返回值时，默认返回 undefined

- null 和 undefined 带来的困扰？

    - typeof null 结果是 "object"
    - ES 6 对象解构时，只能给 undefined 的值设置默认值；

- 真的需要 undefined？

    假设使用没有 undefined 的话，会怎样？

    - 变量声明，初始化值为 null
    - 调用函数，参数默认值为 null
    - 对象没有赋值的属性，默认为 null —— 设置为 null 的属性，无法区分是否存在
    - 函数没有返回值，默认返回 null

- 参考文献：[undefined 与 null 的区别](http://www.ruanyifeng.com/blog/2014/03/undefined-vs-null.html)

## 面向对象
### 创建对象
- 字面量/new Object：可以用来构造单个对象，但需要大量创建同类对象时，会产生大量的重复代码；
- 工厂模式：解决了创建多个相似对象的问题, 但没有解决对象识别的问题；
- 构造函数模式：解决了对象识别的问题，但每次实例化对象时，对象方法都要在重新创建一遍；
- 原型模式：解决了对象方法不能复用的问题，但同时也共享了属性 —— 修改引用类型的属性值存在隐患；
- 混合构造函数和原型模式：构造函数模式用于定义实例属性，而原型模式用于定义方法和共享的属性；
- 动态原型模式：把所有信息都封装在构造函数中, 解决构造函数和原型独立的问题；
- 寄生构造函数模式：类似于工厂模式，但通过 new 函数来实例化对象，这个模式可以在特殊情况下用来为对象创建构造函数。例如：想要创建一个具有额外方法的特殊数组，由于不能直接修改 Array 构造函数，因此可以使用这个模式。
- 稳妥构造函数模式：没有公共属性，且构造函数不引用 this。该模式适合在一些安全的环境中，或者在防止数据被其他应用程序改动时使用。

总结：创建对象需要考虑：重用, 类型, 性能, 安全。

测试代码：https://github.com/zhbhun/program-demo/tree/master/javascript/es/oop/create

### 继承
- 原型链继承：原型链是实现继承的主要方法，基本思想是将子类型的原型对象设置为要继承类型的实例。但原型链继承存在以下问题，在实践中很少会单独使用。

    1. 包含引用类型值的原型属性会被所有实例共享
    2. 无法给父类型的构造函数传递参数

- 借用构造函数继承：借用构造函数是在子类型构造函数的内部调用父类构造函数来实现继承，这种方式存在和构造函数模式一样的问题 —— 方法都在构造函数中定义，导致无法复用函数。此外，不能识别出子类型实例是父类型的后代实例。
- 组合继承(原型+借用构造)：组合模式将原型链和借用构造函数的技术组合到一块，使用原型链实现对原型属性和方法的继承，而通过借用构造函数来实现对实例属性的继承 —— 该模式避免了原型链和借用构造函数的缺陷，融合了他们的优点，成为了 JavaScript 中最常用的继承模式。
- 原型式继承：Object.create —— 在没有必要创建构造函数，只想让一个对象与另外一个对象保持类似的情况下，原型式继承完成可以胜任。
- 寄生式继承：寄生式继承对原型式继承创建的对象进行扩展，可以批量制造相似的对象实例。在主要考虑对象而不是自定义类型和构造函数的情况下，寄生式继承也是一种有用的模式。
- 寄生组合式继承：寄生组合继承通过借用构造函数来继承属性，通过原型链的混成形式来实现继承，从而解决了组合继承存在必须调用两次父类构造函数的问题 —— 普遍认为寄生组合式继承是引用类型最理想的继承范式。
- 参考文献
    - [JavaScript继承方式详解](https://segmentfault.com/a/1190000002440502)

- [Javascript三招两式之对象继承(下)](https://www.zhuyingda.com/blog/article.html?id=12&origin=gold)


## TODO
- [如何在 JavaScript 中声明变量](https://github.com/rccoder/blog/issues/15)

# DOM
## 节点/元素
创建节点

- createDocumentFragment()：创建一个DOM片段；
- createElement()： 创建一个具体的元素；
- createTextNode()： 创建一个文本节点；

添加、移除、替换、插入节点
- appendChild()
- removeChild()
- replaceChild()
- insertBefore()

查找节点

- getElementsByTagName()：通过标签名称
- getElementsByName()： 通过元素的Name属性的值(IE容错能力较强，会得到一个数组，其中包括 id 等于 name  值的)；
- getElementById()：通过元素 Id，唯一性

## 事件
- [JS事件模型](https://segmentfault.com/a/1190000006934031)

### 触摸事件

- 触发逻辑
    - 轻按：touchstart -> touchend -> mouseover -> mouseenter -> mousemove -> mousedown -> mouseup -> click
    - 长按空白: touchstart -> mouseover -> mouseenter -> mousemove -> mousedown -> touchend
    - 长按文字: touchstart -> touchcancel
    - 拖动: touchstart -> touchmove -> touchend
- 事件用法
    - 在 ontouchstart 里 preventDefault 可以阻止鼠标事件的触发
    - 在 ontouchmove 里 preventDefault 可以阻止页面滚动
    - 鼠标事件再触摸设备上会延迟执行，除非设置页面为禁止缩放
    - ontouchmove 事件触发非常频繁，需要借助 requestAnimationFrame 来渲染动画
- 触摸交互设计
    - 轻按：相当于鼠标的点击功能
    - 短暂按：同上
    - 长按：取消轻按效果（不一定触发），触发响应的行为，如：复制，菜单等 —— 这点与鼠标不同
    - 拖动：列表滚动，鼠标不支持
- 常见问题
    - [解决页面使用overflow: scroll在iOS上滑动卡顿的问题](http://www.cnblogs.com/lyingSmall/p/5235178.html)
    - [iOS safari 如何阻止“橡皮筋效果”？](https://www.zhihu.com/question/22256539)
- 参考文献
    - [MDN TouchEvent](https://developer.mozilla.org/zh-CN/docs/Web/API/TouchEvent)
    - [Understanding touch events](http://stackoverflow.com/questions/14486804/understanding-touch-events)
    - [多点触摸网络开发](http://www.html5rocks.com/zh/mobile/touch/)
    - [Touch And Mouse](http://www.html5rocks.com/en/mobile/touchandmouse/)
    - [Chrome DevTools for Mobile: Screencast and Emulation](http://www.html5rocks.com/en/tutorials/developertools/mobile/)
    - [A non-responsive approach to building cross-device webapps](http://www.html5rocks.com/en/mobile/cross-device/)
    - [Touch Event Handling in JavaScript](http://tutorials.jenkov.com/responsive-mobile-friendly-web-design/touch-events-in-javascript.html)
    - [HTML5 for the Mobile Web: Touch Events](https://mobiforge.com/design-development/html5-mobile-web-touch-events)
    - [移动开发之touch event篇](http://www.aliued.cn/2013/04/27/%E7%A7%BB%E5%8A%A8%E5%BC%80%E5%8F%91%E4%B9%8Btouch-event%E7%AF%87.html)
    - [移动开发之touch event篇](http://www.aliued.cn/2013/04/27/%E7%A7%BB%E5%8A%A8%E5%BC%80%E5%8F%91%E4%B9%8Btouch-event%E7%AF%87.html)
    - [ HTML5实战与剖析之触摸事件(touchstart、touchmove和touchend)](http://blog.csdn.net/lee_magnum/article/details/17753807)
    - [Touch开发必须知道的事儿](http://div.io/topic/398)
    - [HTML5的javascript touch事件](http://hedgehogking.com/?p=556)
    - [简单聊聊touch事件](http://lucyhao.com/2016/02/03/%E7%AE%80%E5%8D%95%E8%81%8A%E8%81%8Atouch%E4%BA%8B%E4%BB%B6/)
- 开源项目
    - [hammer.js](https://github.com/hammerjs/hammer.js)：A javascript library for multi-touch gestures
    - [interact.js](interact.js)：JavaScript drag and drop, resizing and multi-touch gestures with inertia and snapping for modern browsers (and also IE8+)
    - [Touchy.js](https://github.com/jairajs89/Touchy.js)：A simple light-weight JavaScript library for dealing with touch events
    - [jQuery-Touch-Events](https://github.com/benmajor/jQuery-Touch-Events)：A collection of mobile event plugins for jQuery.
    - [pointer.js](https://github.com/mozilla/pointer.js)：Normalizes mouse/touch events into 'pointer' events.
    - [jquery.finger](https://github.com/ngryman/jquery.finger)： jQuery touch & gestures, fingers in the nose.
    - [touchy](https://github.com/HotStudio/touchy)：jQuery plugin for touch events
    - [Touchable-jQuery-Plugin](https://github.com/dotmaster/Touchable-jQuery-Plugin)：Touchable jQuery Plugin
    - [tappable](https://github.com/cheeaun/tappable)
    - [touchpoint-js](https://github.com/jonahvsweb/touchpoint-js)：A vanilla JavaScript library that visually shows taps/clicks for HTML prototypes using CSS3 transitions on desktop and mobile.
    - [jQuery Mobile Touch Events](http://www.w3schools.com/jquerymobile/jquerymobile_events_touch.asp)
    - [Event.js](https://github.com/mudcube/Event.js)： Multi-touch, gestures, and other events—click, dblclick, dbltap, tap, longpress, drag, swipe, pinch, rotate, shake. For pointer events, each listener can handle anywhere from 1 to 12 fingers at a time, or more, depending on the device. Includes MetaKey tracking (CMD, CTRL) to support native key-commands in various platforms.
    - [hover-on-touch](https://github.com/vin-ni/hover-on-touch)：Javascript plugin for an alternative hover function on mobile devices. It shows secondary information on Taphold & goes to a link on Tap.

## 位置/大小
- [document.body.scrollTop is always 0 in IE even when scrolling](http://stackoverflow.com/questions/2717252/document-body-scrolltop-is-always-0-in-ie-even-when-scrolling)
- [Finding the size of the browser window](http://www.howtocreate.co.uk/tutorials/javascript/browserwindow)
- [document.body.scrollTop in IE](https://forums.digitalpoint.com/threads/document-body-scrolltop-in-ie.11965/)
- [ScrollTop not working in IE](http://stackoverflow.com/questions/6736849/scrolltop-not-working-in-ie)
- [火狐、谷歌、IE关于document.body.scrollTop和document.documentElement.scrollTop 以及值为0的问题](http://www.cnblogs.com/aaronjs/p/4153519.html)

# 存储
有哪些存储方式

1. cookie
2. usedata
3. sessionStorage
4. globalStorage
5. localStorage

Cookie VS Web Storage

1. cookie 的作用是与服务器进行交互，作为 HTTP 规范的一部分而存在，而 Web Storage 仅仅是为了在本地“存储”数据而生；
2. Web Storage 为了更大容量存储设计的，而 Cookie 大小是受限制的；
3. Cookie 需要指定作用域，且不能跨域共享；
4. Cookie 随着 HTTP 请求一起发送给服务端，而 Web Storage 不会；
5. 兼容性问题：除了 IE7 及以下版本外，都支持 Web Storage，IE7、IE6 的本地存储解决方案是 userData，可以自行封装统一的 Web Storage； 

## Cookie
Cookie 的弊端

1. 每个特定的域名下最多生成 20 个 cookie；
    - IE6 或更低版本最多 20 个 cookie；
    - IE7 和之后的版本最后可以有 50 个 cookie；
    - Firefox 最多 50 个 cookie；
    - chrome 和 Safari 没有做硬性限制；
2. IE 和 Opera 会清理近期最少使用的 cookie， Firefox 会随机清理 cookie；
3. cookie 的最大大约为 4096 字节，为了兼容性，一般不能超过 4095 字节；

Cookie 使用经验

1. 控制 cookie 的生命期，避免使用不会失效的 cookie；
2. 只在 cookie 中存放不敏感数据；
3. 通过加密和安全传输技术（SSL），减少 cookie 被破解的可能性；


# 网络
## Ajax
- [request](https://github.com/request/request)
- [github/fetch](https://github.com/github/fetch)
- [reqwest](https://github.com/ded/reqwest)
- [node-fetch](https://github.com/github/fetch)
- [NODE.JS TUTORIAL - HOW TO USE REQUEST MODULE](http://blog.modulus.io/node.js-tutorial-how-to-use-request-module)

## 数据推送
- Javascript 数据推送
- Commet：基于HTTP长连接的服务器推送技术
- 基于 WebSocket 的推送方案
- SSE（Server-Send Event）：服务器推送数据新方式


# 安全
## 加密
- https://github.com/blueimp/JavaScript-MD5

# 高级
## 内存泄露
**可能存在的内存泄露**

- setTimeout 的第一个参数使用字符串而非函数的话，会引发内存泄漏；
- 闭包
- 控制台日志
- 循环：在两个对象彼此引用且彼此保留时，就会产生一个循环

## 通知
- [iNotify](https://github.com/jaywcjlove/iNotify)

# 数据结构&算法
- [十大经典排序算法总结（JavaScript描述）](http://gold.xitu.io/post/57dcd394a22b9d00610c5ec8?utm_source=gold_browser_extension)

# 移动端
- [mobileTech](https://github.com/jtyjty99999/mobileTech)

# 兼容性
## DOM
- IE下，可以使用获取常规属性的方法来获取自定义属性, 也可以使用 getAttribute() 获取自定义属性; Firefox下,只能使用getAttribute()获取自定义属性 —— 解决方法:统一通过getAttribute()获取自定义属性；
- IE下，event对象有 x，y 属性，但是没有 pageX，pageY 属性; Firefox下，event 对象有 pageX， pageY 属性，但是没有 x，y 属性；
- ...

# 函数式编程
- [谈谈函数式编程](https://github.com/joeyguo/blog/issues/10)

# TODO
- [querySelector 和 querySelectorAll 方法浏览器实现无误，避免将其与 JQuery 的选择器混淆](http://w3help.org/zh-cn/casestudies/003)
- [轻量级的JavaScript表单验证，字符串验证validator.js](http://gold.xitu.io/post/57dd86e90e3dd900696b22d0?utm_source=gold_browser_extension)
- [JavaScript SDK设计指南](http://www.zcfy.cc/article/javascript-sdk-design-guide-530.html)
- [为什么 Math.min() 比 Math.max() 大？（续）](https://zhuanlan.zhihu.com/p/22482870)
- [从一行代码里面学点 JavaScript](https://segmentfault.com/a/1190000006860477)
- [一个微型 Javascript 开源项目如何在 4 天到 1000 star ？](https://segmentfault.com/a/1190000006893696)
- [提升JavaScript性能](https://zaynex.github.io/2016/09/15/%E6%8F%90%E5%8D%87JavaScript%E6%80%A7%E8%83%BD/#more)
