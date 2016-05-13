---
title: Webpack 入门
date: 2016-04-28
category: Webpack
tags: Webpack
---


# 安装
1. 安装[node.js](http://nodejs.org/)——node.js自带有一个模块管理器npm
2. 安装webpack
    - 全局安装：` npm install webpack -g `，如果有将npm全局安装路径加入path，则可以直接在命令行输入webpack命令了
    - 本地安装：` npm install webpack --save-d `，本地安装后的命令行工具在`./ node_modules/.bin/ webpack.cmd `，也可以在npm package.json里的scripts里引用webpack

# 用法
除了在命令行界面使使用webpack外，也可以直接在代码中使用webpack。


- [命令行界面](http://webpack.github.io/docs/cli.html)
    - ` webpack --entry entry.js --output bundle.js`
    - `webpack --config webpack.config.js`
    - `webpack --config  webpack.config.js  -d`：开发模式
    - `webpack --config  webpack.config.js  -w`：观察模式     - `webpack --config  webpack.config.js  -p`：生成模式
- [node.js-api](http://webpack.github.io/docs/node.js-api.html)
    - 简单示例
         ```

        var webpack = require("webpack");
        // returns a Compiler instance
        webpack({
            // configuration
        }, function(err, stats) {
            // ...
        });
         ```
    - 复杂示例
         ```
        var webpack = require("webpack");


        // returns a Compiler instance
        var compiler = webpack({
            // configuration
        });


        compiler.run(function(err, stats) {
            // ...
        });
        // or
        compiler.watch({ // watch options:
            aggregateTimeout: 300, // wait so long for more changes
            poll: true // use polling instead of native watchers
            // pass a number to set the polling interval
        }, function(err, stats) {
            // ...
        });
         ```


常见问题：
- webpack命令的`--confgi`选项是做什么的？
    `--config`用来指定一个[配置文件]( http://webpack.github.io/docs/configuration.html)，代替命令行中的选项，从而简化命令。如果直接执行`webpack`的话，webpack会在当前目录查找名为`webpack.config.js`的文件。
- ...


# 简单示例
本例展示`Hello World!`， 源代码如下：


- index.html
    ```
    <html>
        <head>
            <meta charset="utf-8">
        </head>
        <body>
            <script type="text/javascript" src="bundle.js" charset="utf-8"></script>
        </body>
    </html>
    ```
-  entry.js
    ```
     document.write(require("./content.js"));
    ```
- content.js
    ```
     module.exports = "Hello World.";
    ```


模块打包及运行：


1. 执行命令`webpack ./entry.js bundle.js`，该命令会编译entry.js和content.js，并合并生成一个bundle.js。
2. 在浏览器中打开`index.html`，显示：`Hello World!.`。


除了在webpack命令选项中指定模块入口文件和模块打包生成文件外，可以创建`webpack.config.js`来配置，具体配置如下代码所示。配置好后，在命令行中直接输入`webpack`（默认查找配置文件 `webpack.config.js` ）或者`webpack --config webpack.config.js`，这样效果同上面的命令 `webpack ./entry.js bundle.js`。
```
module.exports = {
    entry: "./entry.js",
    output: {
        path: __dirname,
        filename: "bundle.js"
    }
};
```


更多关于`webpack.config.js`的配置见下文。


参考文献：
- [Installation]( http://webpack.github.io/docs/installation.html)
