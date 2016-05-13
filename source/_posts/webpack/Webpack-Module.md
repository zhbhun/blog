---
title: Webpack 模块详解
date: 2016-04-28
category: Webpack
tags: Webpack
---

webpack同时支持CommonJS和AMD规范的模块编写方式， `Hello World`实例已经简单地演示了模块的定义和加载，下面我们开始学习webpack模块相关的api。


## 模块定义
-  module.exports
    - 简介：CommJS规范的模块定义，module.exports指定的对象作为模块的输出，没有指定的话默认返回一个新对象，即{}。
    - 实例：
         ```

        module.exports = function doSomething() {
            // Do something
        };
         ```
    - 总结：在加载module.exports格式定义的模块时，模块返回的是module.exports指定的对象
    - 注意点：不可以在异步函数中使用module.exports
- exports
    - 简介：CommonJS规范的模块定义，exports是被输出的对象，如果已经指定了module.exports，则exports会被忽略
    - 实例：
         ```
          exports.someValue = 42;
        exports.anObject = {
            x: 123
        };
        exports.aFunction = function doSomething() {
            // Do something
        } ;
         ```
- export label
    - 简介：Labeld模块定义格式
    - 实例：
         ```

        export: var answer = 42;
        export: function method(value) {
          // Do something
        };
         ```
    - 注意点：在异步函数中使用可能得不到想要的效果
- define
    - 简介：AMD规范的模块定义
    - 语法：
         - ` define(value: !Function)`
              - value 非函数值
         - ` define([name: String], [dependencies: String[]], factoryMethod: function(...))`
              - name String 可选参数，表示模块名
              - dependencies String[] 可选参数，依赖的模块名数组
              - factoryMethod function 必填参数，该函数要求有个返回值，作为模块的输出
    - 示例
         - define with value
              ```

            define({
                answer: 42
            });
              ```
          - define with factory
              ```

            define(["jquery", "my-module"], function($, myModule) {
                // Do something with $ and myModule.
                // Export a function
                return function doSomething() {
                    // Do something
                };
            });
              ```
    - 总结：          - define没有指定模块名称的时候，默认使用模块所在文件路径和名称作为模块名称，通常推荐使用这个名称就行了，不要再自己指定模块名称。
         -  define函数可以指定依赖的模块，需要注意的是这些模块是同步加载的——模块本身和dependencies模块在同一个模块集里，即，webpack构建生成后放到同一个文件里。
         - ...
    - 注意点：不能在异步函数中使用

## 模块加载
- require CommonJs
    - 简介：CommonJS规范的require，同步加载指定的模块。webpack编译器会确保客户端执行到这行代码的时候，依赖的模块已经可用，无需向服务器发送请求——实际上webpack就是把需要加载的模块代码和require合并到同一文件里了，所以无需再发送请求获取模块了。
    - 语法：` require(dependency: String)`
    - 参数
         - dependency：需要加载的模块名
    - 实例：HellowWorld实例的entry.js中存在这样一行代码` document.write(require("./content.js")); `，这便是一个commonJS规范的require。这里有两个模块：entry.js和content.js，执行webpack却只生成了一个文件bundle.js。
- require label
    - 简介：同CommonJS，require label也是同步加载指定模块，只是require语法不通罢了——webpack编译器会处理这种语法
    - 语法：` require: "dependency"`
    - 实例：
         - webpack自带实例 [ labeled modules ]( https://github.com/webpack/webpack/tree/master/examples/labeled-modules )
         - 自己写的测试实例[ labeled-modules ]( https://github.com/zhbhun/WebpackStudyDemo/tree/master/labeled-modules )
    - 备注：注意require label需要借助插件 webpack.dependencies.LabeledModulesPlugin，关于插件的使用， 后续会介绍， 暂时忽略，本节只是关注require label的写法
-  require AMD
    - 简介：AMD规范的require，异步加载指定的模块——在需要的时候（代码执行到AMD require）才会加载依赖的模块。
    - 语法：` require(dependencies: String[], [callback: function(...)]) `
         - dependencies String[] 需要加载的模块名数组
         - callback function 回调函数，在所有模块加载后执行，dependencies指定的模块实例按参数定义的顺序传递给callback
    - 实例：
         ```

        // in file.js
        var a = require("a");
         var d = require("d);
        require(["b", "d"], function(b, d) {
          var c = require("c");
        });
        /* This results in:
            * entry chunk
                - file.js
                - a
                   - d
            * anonymous chunk
                - b
                - c
        */
         ```
    - 总结：require AMD会影响webpack的模块打包结果，前面有提到AMD规范的模块依赖便是模块划分点。上例中执行`webpack file.js bundle.js`生成bundle.js和1.chunk.js ，前者包含模块file.js、a.js和d.js，后者 包含模块b.js和c.js。关于require AMD模块划分规则，如下所示：
         -  dependencies的模块和callback中以CommonJS require的模块在之前都没有加载过，则webpack会将这些模块合并到同一个模块集里，生成一个chunk.js文件
         -  dependencies的模块和callback中以CommonJS require的模块在之前有加载过，则加载过的模块会合并的之前的模块集里，本模块集不会包含这个模块，对于没有加载过的模块webpack处理同上
         - callback中以 AMD  require加载的模块按新的模块集处理
         - 关于如何判断一个模块是否有加载过？webpack编译器自己会处理模块间的依赖关系来分析，一个比较复杂的例子可以参考[ CommonsJs, AMD and labeled modules mixed ]( https://github.com/webpack/webpack/tree/master/examples/mixed )
-  require.ensure
    - 简介：与require AMD类似，也是在需要的时候才会加载相应的模块。但不同的是，require.ensure在模块被下载下来后（模块还没被执行）便立即执行回调函数，另外require.ensure可以指定构建后chunk名，如果之前已有require.ensure指定了该名称，webpack会将这些模块统一合并到一个模块集里。
    - 语法： require.ensure(dependencies: String[], callback: function([require]), [chunkName: String])
    - 实例：
         - 简单示例：
              ```

            // in file.js
            var a = require("a");
            require.ensure(["b"], function(require) {
                var c = require("c");
            });
            require.ensure(["d"], function() {
                var e = require("e");
            }, "my chunk");
            require.ensure([], function() {
                var f = require("f");
            }, "my chunk");
            /* This results in:
                * entry chunk
                    - file.js
                    - a
                * anonymous chunk
                    - b
                    - c
                * "my chunk"
                    - d
                    - e
                    - f
            */


              ```
         - [ code-splitted-require.context ]( https://github.com/webpack/webpack/tree/master/examples/code-splitted-require.context )
         - [ require.ensure VS require AMD ]( https://github.com/zhbhun/WebpackStudyDemo/tree/master/module-require )
    - 总结：除了require.ensure可以直接指定模块名外，require.ensure与require AMD一致，都可以进行代码划分，规则也一致。
- require.include
    - 简介 : 确保模块是可用的（已经下载到客户端），但没有执行该模块（还没有得到模块输出），可用于优化模块在模块集的位置
    - 语法：` require.include(dependency: String) `
    - 实例：
         ```

        // in file.js
        require.include("a");
        require.ensure(["a", "b"], function(require) {
          // Do something
        });
        require.ensure(["a", "c"], function(require) {
          // Do something
        });
        /* This results in:
           * entry chunk
             - file.js
             - a
           * anonymous chunk
             - b
           * anonymous chunk
             - c
        Without require.include "a" would be in both anonymous chunks.
        The runtime behavior isn't changed.
        */
         ```
    - 总结：略


## 其他API
- [require.resolve](http://webpack.github.io/docs/api-in-modules.html#require-resolve): 获取指定模块的id
- [module.id](http://webpack.github.io/docs/api-in-modules.html#module-id):  当前模块的id
- [require.cache](http://webpack.github.io/docs/api-in-modules.html#require-cache): 模块缓存
- [require.context](http://webpack.github.io/docs/api-in-modules.html#require-context): 创建模块动态加载上下文，关于上下文的知识，后面章节会介绍
- [module.loaded](http://webpack.github.io/docs/api-in-modules.html#module-loaded)
- [module.hot](http://webpack.github.io/docs/hot-module-replacement.html): 判断是否开启模块热加载，关于模块热加载的知识，后面章节会介绍
- [global](http://webpack.github.io/docs/api-in-modules.html#global)
- [ process ](http://webpack.github.io/docs/api-in-modules.html#process)
- [ __dirname ]( http://webpack.github.io/docs/api-in-modules.html#__dirname )
- [ __filename ]( http://webpack.github.io/docs/api-in-modules.html#__filename )
- [ __resourcequery ]( http://webpack.github.io/docs/api-in-modules.html#__resourcequery)
- [ __webpack_public_path__ ]( http://webpack.github.io/docs/api-in-modules.html#__webpack_public_path__ )
- [ __webpack_require__ ]( http://webpack.github.io/docs/api-in-modules.html#__webpack_require__ )
- [ __webpack_chunk_load__ ]( http://webpack.github.io/docs/api-in-modules.html#__webpack_chunk_load__)
- [ __webpack_modules__ ]( http://webpack.github.io/docs/api-in-modules.html#__webpack_modules__)
- [ require-resolveweak ]( http://webpack.github.io/docs/api-in-modules.html#require-resolveweak)
- [ __webpack_hash__ ]( http://webpack.github.io/docs/api-in-modules.html#__webpack_hash__)
- [ __non_webpack_require__ ]( http://webpack.github.io/docs/api-in-modules.html#__non_webpack_require__)
- [ DEBUG ]( http://webpack.github.io/docs/api-in-modules.html#debug )
