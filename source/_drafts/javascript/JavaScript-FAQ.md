---
title: JavaScript 疑惑解答
date: 2016-09-11
categories: JavaScript
tags: JavaScript
---

# ES
## 操作符
### 相等操作符
**== 与 !=**

- 如果两个操作数是相同类型，则返回与 === 或 !== 操作相同的结果；
- null/undefined == null/undefined 返回 true；
- NaN 不与任何值相等；
- 布尔值 == 任意非布尔值，先将布尔值转换为数值（false 转为 0，true 转为 1）；
- 数值 == 字符串，先将字符串转为数值（Number(str)，Number('') 为 0）；
- 数值 == 对象，对象转换为原始数据类型后再比较 —— 先调用 valueOf 转换，如果能转换为原始数据类型，则使用该值。否则再调用用 toString 将对象转换为原始数据类型；
- 字符串 == 字符串，比较两个字符串是否相等 —— 同上；
- 字符串 == 对象，对象转换为原始数据类型后再比较

备注：`[]` 转为为 `''`，`['0']` 转换为 `'0'`，`['1']` 转换为 `'1'`。

**=== 与 !==**

除了，NaN 不与任何值（包括 NaN）相等外，其他操作数只要类型和值（对象是引用）相同，就相等。

**参考文献**

- [Abstract Equality Comparison](http://www.ecma-international.org/ecma-262/7.0/index.html#sec-abstract-equality-comparison)
- [Strict Equality Comparison](http://www.ecma-international.org/ecma-262/7.0/index.html#sec-strict-equality-comparison)

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
**什么是闭包**

闭包是指有权访问另一个函数作用域中的变量的函数，创建闭包的最常见的方式就是在一个函数内创建另一个函数，通过另一个函数访问这个函数的局部变量。

**闭包特性**

1. 函数嵌套函数；
2. 函数内部可以引用外部的参数和变量；
3. 参数和变量不会被垃圾回收机制回收；

**闭包的作用**

1. 设计私有的方法和变量；
2. 避免全局变量的污染；
3. 实现变量长期驻扎在内存中；

**闭包的副作用**

闭包会导致变量常驻内存，会增大内存使用量，使用不当很容易造成内存泄露

**参考文献**

- [Use JavaScript Closures Efficiently](Use JavaScript Closures Efficiently)
- [详解js闭包](https://segmentfault.com/a/1190000000652891)
- [JavaScript 闭包](https://segmentfault.com/a/1190000006875662)

## 数据类型
### null VS undefined

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

### Array
**Arrap.prototype.reduce 用法***

- 计数
- 求最大/小值
- 转为对象
- ...

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


## use strict

**是什么**

ECMAscript 5 添加了第二种运行模式："严格模式"（strict mode）。顾名思义，这种模式使得 Javascript 在更严格的条件下运行。

**为什么**

- 消除 Javascript 语法的一些不合理、不严谨之处，减少一些怪异行为；
- 消除代码运行的一些不安全之处，保证代码运行的安全；
- 提高编译器效率，增加运行速度；
- 为未来新版本的 Javascript 做好铺垫；

**区别**

- ...
- TODO

**兼容性**

IE6，7，8，9 均不支持严格模式

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
**事件流**

要点：事件传播机制，兼容性

- 事件冒泡：IE 团队提出事件开始时应由最具体的元素接收，然后逐级向上传播。

    - IE5.5 及更早版本：div -> body -> document；
    - IE6-8：div -> body -> html -> document；
    - IE9，Chrome，Firefox，Safari： div -> body -> html -> document -> window；

- 事件捕获：Netscape Communicator 团队提出事件由上层节点最先接收事件，然后逐级向下传播。

     尽管 DOM2 级事件规范要求从 document 开始传播，但大部分浏览器都是从 window 对象开始捕获时间对象（window -> document -> html -> body -> div）。IE9 及以上版本，Chrome，Firefox，Safari 均支持事件捕获，但 IE8 及以下版本不支持。

- DOM 事件流：DOM2 级事件规定事件流包括三个阶段：事件捕获阶段，处理目标阶段和事件冒泡阶段 —— IE9 及以上版本，Chrome，Firefox，Safari 均支持 DOM 事件流，但 IE8 及以下版本不支持。

**事件处理程序**

要点：兼容性，事件流，作用域，多事件处理程序和执行顺序，解绑事件处理程序

- HTML 事件处理程序：某个元素支持的每种事件，都可以使用一个与相应事件处理程序同名的 HTML 属性来指定

    - 所有浏览器都支持
    - 用法

        - 属性值是能够执行的 JavaScript 代码（不能在其中使用未经转义的 HTML 语法字符）
        - 存在局部变量 event
        - this 等于事件的目标元素
        - 可以像访问局部变量一样访问 document 及该元素本身的成员 —— 事件目标元素？
        - 如果当前元素是一个表单输入元素，则作用域中还可以访问表单元素的成员

    - 缺点

        - 时间处理程序的作用域链在不同的浏览器中会导致不同的结果
        - HTML 与 JavaScript 代码紧密耦合

- DOM0 级事件处理程序：每个元素都有自己的事件处理程序属性，将这种属性设置为一个函数，就可以指定事件处理程序

    - 所有浏览器都支持
    - 事假处理程序在元素的作用域中运行；
    - 这种方式定义的事件处理程序会在事件流的冒泡阶段处理；
    - 可以通过重新指定属性来修改或删除时间处理程序；
    - HTML 事件处理程序可以使用改方式来访问修改删除；

- DOM2 级事件处理程序：定义了两个方法：addEventListener 和 removeEventListener

    - IE9 及以上版本，Chrome，Firefox，Safari 均支持；
    - 三个参数：事件名（没有 on），事件处理函数，布尔值（true 表示捕获事件流，false 表示冒泡事件流，默认为 false）；
    - 事件处理程序的执行作用域为当前元素；
    - 可以添加多个事件处理程序，执行顺序同事件添加顺序；
    - 移除事件处理程序的参数必须与添加时的一致；

- IE 事件处理程序：IE 实现了与 DOM2 级事件处理程序类似的两个方法：attachEvent 和 detachEvent

    - 只有 IE 和 Opera 支持；
    - 两个参数：事件名（有 on）和事件处理程序；
    - 事件处理程序的执行作用域为全局；
    - 可以添加多个事件处理程序，执行顺序与事件添加顺序相反；
    - 移除事件处理程序的参数必须与添加时的一致；

- 跨浏览器的事件处理程序

    ```
    var eventUtil = {
        addHandler: function(element, type, handler) {
            if (element.addEventListener) {
                element.addEventListener(type, handler, false);
            } else if (element.attachEvent) {
                element.attachEvent('on' + type, handler);
            } else {
                element['on' + type] = handler;
            }
        },
        removeHandler: function(element, type, handler) {
            if (element.removeEventListener) {
                element.removeEventListener(type, handler, false);
            } else if (element.detachEvent) {
                element.detachEvent('on' + type, handler);
            } else {
                element['on' + type] = null;
            }
        },
    }
    // TODO 解决时间处理程序作用域问题
    ```

**事件对象**

获取方式

- HTML 事件处理程序：直接访问局部变量 event
- DOM0 级事件处理程序：在 IE 下是从全局变量中获取 —— window.event，其他浏览器从参数中获取 event
- IE 事件处理程序 和 DOM2 级事件处理程序：从参数中获取 event

属性和方法
    
- 标准属性

    - bubbles：Boolean，只读，事件是否冒泡
    - cancelable：Boolean，只读，是否可以取消事件的默认行为
    - currentTarget：Element，只读，事件处理程序当前正在处理事件的那个元素
    - defaultPrevented：Boolean，只读，true 表示已经调用了 preventDefault（DOM3 级事件中新增）
    - detail：Integer，只读，与事件相关的细节信息
    - eventPhase：Integer，只读，调用事件处理程序的阶段（1|捕获，2|目标，3|冒泡）
    - preventDefault：Function，只读，取消事件的默认行为（要求 cancelable 为 true）
    - stopImmediatePropagation：Function，只读，取消事件的进一步捕获或冒泡，同事阻止任何事件处理程序被调用（DOM3 级事件中新增）
    - stopPropagation：Function，只读，取消事件的进一步捕获或冒泡（要求 bubbles 为true）
    - target：Element，只读，事件目标
    - trusted：Boolean，只读，true 表示事件是浏览器生成的，false 表示通过 JavaScript 创建的（DOM3 级新增）
    - type：String，只读，事件类型
    - view：AbstractView，只读，与事件相关的抽象视图

- IE8 及以下版本的特殊属性：

    - cancelBubble，Boolean，读写，默认为 false，设置为 true 时表示可以取消事件冒泡
    - returnValue：Boolean，读写，默认值为 true，设置为 false 时表示取消事件的默认行为
    - srcElement：Element，只读，事件的目标

**事件类型**

- HTML5 事件
- UI 事件
- 焦点事件
- 鼠标事件
- 键盘事件
- 符合事件
- 变动事件
- 触摸和手势事件
- 设备事件

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

**优缺点**

- 优点

    - 支持局部刷新
    - 减少了宽带占用
    - 减轻服务器端压力

- 缺点

    - 不支持浏览器返回按钮
    - 暴露了与服务器交互的细节
    - 不支持 SEO

**封装库**

- [request](https://github.com/request/request)
- [github/fetch](https://github.com/github/fetch)
- [reqwest](https://github.com/ded/reqwest)
- [node-fetch](https://github.com/github/fetch)
- [NODE.JS TUTORIAL - HOW TO USE REQUEST MODULE](http://blog.modulus.io/node.js-tutorial-how-to-use-request-module)

## 跨域
**浏览器的同源策略**

- 简介：同源策略限制了一个源中加载文本或脚本与来自其它源中资源的交互方式。

    - 跨域网络访问

        - 允许跨域写操作（Cross-origin writes），例如链接（links）、重定向以及表单提交，特定少数的 HTTP 请求需要添加 preflight；
        - 允许跨域资源嵌入（Cross-origin embedding），例如：script、link、img、video、object、embed、applet、@font-face、iframe；
        - 不允许跨域读操作（Cross-origin reads）：不能通过脚本直接访问不同源的服务器资源；

    - 跨域脚本访问：当两个文档的源不同时，将对 Window 和 Location 对象的访问添加限制 —— 可以使用 window.postMessage 作为替代方案，提供跨域文档间的通讯；
    - 跨域数据存储访问：存储在浏览器中的数据，如 localStorage 和 IndexedDB，以源进行分割。每个源都拥有自己单独的存储空间，一个源中的 Javascript 脚本不能对属于其它源的数据进行读写操作；
    - cookie：Cookies 使用不同的源定义方式。一个页面可以为本域和任何父域设置 cookie，只要是父域不是公共后缀即可；

- 同源：如果两个页面拥有相同的协议，端口（如果指定），和主机，那么这两个页面就属于同一个源。
- 源继承：来自about:blank，javascript:和data:URLs中的内容，继承了将其载入的文档所指定的源，因为它们的URL本身未指定任何关于自身源的信息。
- IE特例

    - 端口：IE 未将端口号加入到同源策略的组成部分之中；
    - 授信范围：两个相互之间高度互信的域名，如公司域名（corporate domains），不遵守同源策略的限制；

- 变更源：在同源策略中有一个例外，脚本可以设置 document.domain 的值为当前域的一个后缀，如果这样做的话，短的域将作为后续同源检测的依据。

    - 浏览器单独保存端口号，任何的赋值操作，包括 document.domain = document.domain 都会以 null 值覆盖掉原来的端口号；
    - 使用 document.domain 来让子域安全地访问其父域，需要同时将子域和父域的 document.domain 设置为相同的值；

**跨域网络访问**

> 出于安全考虑，浏览器会限制脚本中发起的跨站请求。例如，使用 XMLHttpRequest 对象发起 HTTP 请求就必须遵守同源策略 —— 并非浏览器限制了发起跨站请求，而是跨站请求可以正常发起，但是返回结果被浏览器拦截了。最好的例子是CSRF跨站攻击原理，请求是发送到了后端服务器无论是否跨域！注意：有些浏览器不允许从 HTTPS 的域跨域访问HTTP，比如 Chrome 和 Firefox，这些浏览器在请求还未发出的时候就会拦截请求。

- CORS（Cross-Origin Resource Sharing ），跨源资源共享；
- JSONP：json + padding，JSONP 不存在兼容性问题，但只能发送 GET 请求；
- CSST：一种用 CSS 跨域传输文本的方案，其原理是通过读取 CSS3 content 属性获取传送内容。相比 JSONP 更为安全，不需要执行跨站脚本。但没有 JSONP 适配广，且依赖支持 CSS3 的浏览器 —— [csst](https://github.com/zswang/csst)；
- flash：已没落；

**跨域脚本访问**

- document.domain：可以解决两个主域名一致的页面之间的脚本访问；
- location.hash：改变 hash 不会导致页面刷新，可以在两个不同源的页面之间相互修改 hash 来传递信息 —— 有些浏览器不允许修改不同源页面的 hash，这可以借助隐藏的 iframe 来实现（将 iframe 设置为与需要传递信息的目标页面同源，间接地通过该 iframe 来传递信息）；
- window.name：window.name 在一个窗口(window)的生命周期内，窗口载入的所有的页面都是共享一个 window.name，每个页面对 window.name 都有读写的权限，window.name 是持久存在一个窗口载入过的所有页面中的，并不会因新页面的载入而进行重置；
- window.postMessage：HTML5 新引进的特性，可以使用它来向其它的 window 对象发送消息，无论这个 window 对象是属于同源或不同源；

**参考文献**

- [浏览器的同源策略](https://developer.mozilla.org/zh-CN/docs/Web/Security/Same-origin_policy)
- [前端跨域的整理](http://qiutc.me/post/cross-domain-collections.html)
- [js中几种实用的跨域方法原理详解](http://www.cnblogs.com/2050/p/3191744.html)
- [js跨域及解决方法](http://www.cnblogs.com/malaikuangren/archive/2012/01/16/2323705.html)
- [详解js跨域问题](https://segmentfault.com/a/1190000000718840#articleHeader6)
- [浅谈浏览器端 JavaScript 跨域解决方法](http://gold.xitu.io/entry/577636e42e958a005579c3b0)
- CORS

    - [HTTP访问控制(CORS)](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Access_control_CORS)
    - [跨域资源共享 CORS 详解](http://www.ruanyifeng.com/blog/2016/04/cors.html)

- [window.name实现的跨域数据传输](http://www.cnblogs.com/rainman/archive/2011/02/21/1960044.html)
- [Window.postMessage()](https://developer.mozilla.org/en-US/docs/Web/API/Window/postMessage)

## 推送
- Javascript 数据推送
- Commet：基于HTTP长连接的服务器推送技术
- 基于 WebSocket 的推送方案
- SSE（Server-Send Event）：服务器推送数据新方式

# 安全
## 加密
- https://github.com/blueimp/JavaScript-MD5

# 高级
## 内存管理
**垃圾回收**

- 标记清除
- 引用计数

**内存泄露**

- setTimeout 的第一个参数使用字符串而非函数的话，会引发内存泄漏；
- 闭包
- 控制台日志
- 循环：在两个对象彼此引用且彼此保留时，就会产生一个循环

## 模块化

- 浏览器

    - AMD：RequireJS
    - CMD：SeaJS

- 服务器

    - CommonJS：NodeJS

- 统一：UMD

**参考文献**

- [amdjs-api](https://github.com/amdjs/amdjs-api) —— [AMD (中文版)](https://github.com/amdjs/amdjs-api/wiki/AMD-(%E4%B8%AD%E6%96%87%E7%89%88))

    - [REQUIREJS API](http://www.requirejs.cn/docs/api.html)
    - [Javascript模块化编程（一）：模块的写法](http://www.ruanyifeng.com/blog/2012/10/javascript_module.html)
    - [Javascript模块化编程（二）：AMD规范](http://www.ruanyifeng.com/blog/2012/10/asynchronous_module_definition.html)
    - [Javascript模块化编程（三）：require.js的用法](http://www.ruanyifeng.com/blog/2012/11/require_js.html)

- [CommonJS规范](http://javascript.ruanyifeng.com/nodejs/module.html)
- [详解JavaScript模块化开发](https://segmentfault.com/a/1190000000733959)
- [http://www.ruanyifeng.com/blog/2012/11/require_js.html](https://www.douban.com/note/283566440/)

## 通知
- [iNotify](https://github.com/jaywcjlove/iNotify)

## 重构
- 布局改进：表格布局改为 div + css，实现响应式布局
- 优化兼容性
- 优化移动平台
- 优化 SEO
- 减少代码耦合
- 优化代码格式
- 压缩 JS、CSS 和图片
- ...

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
