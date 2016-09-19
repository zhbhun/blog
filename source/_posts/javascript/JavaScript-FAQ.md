---
title: JavaScript 疑惑解答
date: 2016-09-11
categories: JavaScript
tags: JavaScript
---

# ES
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
    - 对象没有赋值的属性，默认为 null —— 参照 Java 的 Map
    - 函数没有返回值，默认返回 undefined

- 参考文献：[undefined 与 null 的区别](http://www.ruanyifeng.com/blog/2014/03/undefined-vs-null.html)

## 闭包
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

## 原型链
- [Javascript的原型链图](https://zhuanlan.zhihu.com/p/22189387)

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

# 面向对象编程
- [Javascript三招两式之对象继承(下)](https://www.zhuyingda.com/blog/article.html?id=12&origin=gold)

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
