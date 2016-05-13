---
title: Why Webpack?
date: 2016-04-28
category: Webpack
tags: Webpack
---

当今网站正在变成一个web应用：一个页面包含的javascript代码越来越多，结果客户端存在着大量的代码。通过模块系统划分代码到一个个小模块中，是管理大量代码的有效方式。目前有好几种方式用于实现模块和依赖关系定义：


- `<script>`标签
    - 简介：这是最基本的代码模块化方式，这种模块输出方式会暴露接口道一个全局对象，即`window`，需要通过全局对象来访问依赖的模块。
    - 实例：
        ```
        <script src="module1.js"></script>
        <script src="module2.js"></script>
        <script src="libraryA.js"></script>
        <script src="module3.js"></script>
        ```

    - 缺点
         - 不同模块容易发生 冲突
         - 加载顺序依赖script标签的顺序
         - 在一个大项目中，script标签列表可能变得很长，难以管理
- CommonJS
    - 简介：CommonJS使用同步的require方法加载依赖模块——模块可以通过给`exports`对象绑定属性或者给` module.exports `赋值来定义输出，
    - 实例：
         ```
          require("module");
          require("../file.js");
          exports.doStuff = function() {};
          module.exports = someValue;
         ```
    - 优点
         - 服务端模块可以重用？
         - 这种方式开发的模块有很多（NPM）
         - 非常简单，很容易使用
    - 缺点
         - 阻塞式的调用不适用于网络（网络请求是异步的）
         - 不能并发请求多个模块
    - 实现
         - [ node.js]( http://nodejs.org/ )
         - [ browserify]( https://github.com/substack/node-browserify )
         - [ modules-webmake ]( https://github.com/medikoo/modules-webmake )
         - [wrep]( https://github.com/substack/wreq )
- AMD
    - 简介：AMD是异步版本的模块CommonJS
    - 实例：
         ```
          require(["module", "../file"], function(module, file) { /* ... */ });
          define("mymodule", ["dep1", "dep2"], function(d1, d2) {
               return someExportedValue;
          });
         ```
    - 优点
         - 实现了异步请求方式
         - 并行加载多个模块
    - 缺点
         - 代码读写起来比较吃力
         - 看起来像个变通方案
    - 实现
         - [require.js]( http://requirejs.org/ )
         - [curl]( https://github.com/cujojs/curl )
- ES6
    - 简介： EcmaScript6给Javascript增加了一些语法，形成了另外一种模块系统
    - 实例：
        ```
            import "jquery";
            export function doStuff() {}
            module "localModule" {}
        ```
    - 优点
         - 静态分析很简单？
         - ES标准，不会过时


模块确定了，要在客户端执行，必须从服务器传输到客户端。以下是两种极端的传输方式：
- 一个请求一个模块
    - 优点：只传输请求的模块
    - 缺点：多个模块需要多次请求，影响性能，应用启动慢
- 一次请求 所有模块
    - 优点：较少的请求消耗
    - 缺点：不需要的模块也会被传输到客户端


上面两种模块加载方式比较极端，我们需要一个能够更加灵活地传输模块的方法。当在编译所有模块的时候，将整个系统划分成多个更小的模块集。各个模块集不会一开始就加载进来，只有在需要的时候才加载，所以初始化的时候并没有包含所有的模块代码。 模块集的划分点取决于开发者，例如按功能划分，将该模块依赖的一个个模块当做一个模块集， 当访问系统某项功能时，一次请求加载该项功能的模块集。


前面讨论完关于模块的定义与加载，我们发现为什么只提到了Javascript的模块系统，而前段还有许多其他的静态资源需要加载，如：样式表、图片、字体和html模板等。我们能不能像javascript一样使用require来加载指定的静态资源，例如：
```
require("./style.css");
require("./style.less");
require("./template.jade");
require("./image.png");
```


一个大点的项目，都会遇到上面的问题——模块划分和静态资源，目前已有的模块打包工具已经不适用了。而webpack作者曾尝试扩展已有的模块打包工具，但也是无法实现所有的构建目标。
webpack的目标：

- 将所有模块划分成一个个子模块集，在需要的时候才加载
- 保证较低的加载时间
- 将每一个静态资源都当做一个模块
- 能够以模块的方式集成第三方库
- 能够定制模块打包的每一部分
- 适用于大型项目

webpack的特性


- 模块划分
    webpack不仅支持CommonJS——支持同步依赖，而且也支持AMD——支持异步依赖，也是模块划分点，形成一个新的模块集。
- 加载器
    webpack只能加载本地的Javascript，通过一系列的加载器可以实现不同静态资源的加载。
- 智能编译
- 插件系统
    webpack有着丰富的插件系统，大多数内部特性都是基于插件系统。


参考文献 - [Motivation]( http://webpack.github.io/docs/motivation.html)
