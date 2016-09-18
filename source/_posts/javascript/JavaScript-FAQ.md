---
title: JavaScript 疑惑解答
date: 2016-09-11
categories: JavaScript
tags: JavaScript
---

# 闭包
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
