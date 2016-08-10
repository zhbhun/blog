---
title: Webpack 插件
date: 2016-04-28
category: Webpack
tags: Webpack
---

webpack有丰富的插件接口，使得webpack变得更加灵活。webpack内部集成了一些插件，另外在npm上也有发布一些第三方的插件，当然你可以自己根据webpack的接口，开发属于自己的插件。


## 内建插件
webpack本身提供了一些插件供我们使用，如` webpack.optimize.DedupePlugin` ——查找相等或近似的模块，避免在最终生成的文件中出现重复的模块。 下面就以` webpack.optimize.DedupePlugin`为例 展示webpack内部插件的使用：


- webpack.config.js
    ```

    var webpack = require("webpack");
    var path = require("path");
    module.exports = {
         entry: "./example.js",
         output: {
              path: path.join(__dirname, "js"),
              filename: "output.js"
         },
        plugins: [
            new webpack.optimize.DedupePlugin()
        ]
    }
    ```
-  example.js
    ```
     var a = require("./a");
    var b = require("./b");
    a.x !== b.x;
    a.y !== b.y;
    ```
-  a/index.js
    ```
    module.exports = {
        x: require("./x"),
        y: require("./y"),
        z: require("../z")
    }
    ```
-  a/x.js
   ` module.exports = {"this is": "x"};`
- a/y.js
    ` module.exports = {"this is": "y", "but in": "a"}; `
-  b/index.js
    ```

    module.exports = {
        x: require("./x"),
        y: require("./y"),
        z: require("../z")
    }
    ```
-  b/x.js
    ` module.exports = {"this is": "x"};`
-  b/y.js
    ` module.exports = {"this is": "y", "but in": "b"}; `
-  z.js
    ` module.exports = {"this is": "z"}; `
- [ js/output.js ]( https://github.com/webpack/webpack/tree/master/examples/dedupe#jsoutputjs )
- 总结
    观察上面的示例代码，a和b下都有模块x，且他们的代码是一样的。如果直接在命令行运行`webpack example.js output.js`，最终的生成文件会有两个模块x。再观察上面的webpack配置文件webpack.config.js，最后增加了` plugins: [ new webpack.optimize.DedupePlugin() ] `，如果使用这个配置运行webpack构建，可以发现最后的生成文件`js/ouput.js`里只有个模块x，这个就是插件 webpack.optimize.DedupePlugin的作用。


更多内建插件的使用请参考[ LIST OF PLUGINS ]( http://webpack.github.io/docs/list-of-plugins.html )


## 其他插件
除了内建插件外，还有一些webpack插件发布在npm上了，我们可以通过npm命令来安装，例如 :
`npm install --save-dev  extract-text-webpack-plugin `—— ` extract-text-webpack-plugin `是用于将某些类型的模块，如css，单独提取到文件的插件，具体如何使用该插件可以参考该项目的主页[ extract-text-webpack-plugin ]( https://github.com/webpack/extract-text-webpack-plugin )。
如果想要查找更多的webpack插件，可以在npm上利用` webpack-plugin `关键字来搜索，即[webpack-plugin]( https://www.npmjs.com/search?q=webpack-plugin )。

- [copy-webpack-plugin](https://github.com/kevlened/copy-webpack-plugin)


## 自定义插件
[Plugins-api](http://webpack.github.io/docs/plugins.html)

# extract-text-webpack-plugin
- [relative urls to images in css point to the wrong place](https://github.com/webpack/extract-text-webpack-plugin/issues/27)

# TODO
- [深入了解 Webpack Plugins](https://rhadow.github.io/2015/05/30/webpack-loaders-and-plugins/)
