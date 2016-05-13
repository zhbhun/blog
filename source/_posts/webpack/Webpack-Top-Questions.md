---
title: Webpack 常见问题
date: 2016-04-28
category: Webpack
tags: Webpack
---

- webpack-dev-server的运行配置方式？
     - 命令行选项，参考[ webpack-dev-server-cli ]( http://webpack.github.io/docs/webpack-dev-server.html#webpack-dev-server-cli )，此外webpack-dev-server在命令行里也可以使用webpack的配置选项来控制服务器构建
     - nodejs自定义脚本运行，参考[api]( http://webpack.github.io/docs/webpack-dev-server.html#api )
     - webpack.config.js的 devServer选项，参考[ devserver ]( http://webpack.github.io/docs/configuration.html#devserver )
     - 可参考实例[ run-option-mode ]( https://github.com/zhbhun/WebpackStudyDemo/tree/master/dev-server/run-option-mode )
- webpack-dev-server的运行选项content-base与publicPath的区别？
     webpack-dev-server是一个 轻量级 服务器， content-base指定服务静态资源（html等）的路径。webpack-dev-server构建后的代码是放在内存里的，并通过publicPath指定的路径发布，如果没有指定的话在服务器地址的根路径下（如：假设host为127.0.0.1，port为8080，output.filename为bundle，则构建后的代码文件地址是 http://127.0.0.1:8080/bundle.js ）
- hot模式与inline模式？
- 不支持的模块(如jQuery插件)格式编译
    - [ shimming-modules ]( http://webpack.github.io/docs/shimming-modules.html )
     - [Managing Jquery plugin dependency in webpack]( http://stackoverflow.com/questions/28969861/managing-jquery-plugin-dependency-in-webpack)
- echarts整合问题
    - [ Webpack #1407 ]( https://github.com/ecomfe/echarts/issues/1407 )
    - [ webpack能加载echarts吗？ ]( https://github.com/ecomfe/echarts/issues/1624 )
    - [ 请原生支持webpack #1632 ]( https://github.com/ecomfe/echarts/issues/1632 )
    - [ webpack集成echarts #1625 ]( https://github.com/ecomfe/echarts/issues/1625 )
    - [ hushicai/echarts-develop ]( https://github.com/hushicai/echarts-develop/blob/master/webpack.config.js )

- babel-loader配置
```
        loaders: [{
            test: /\.jsx$/,
            loaders: ['babel']
        }, {
            test: /\.js$/,
            include: /src/,
            loader: 'babel'
        }
```
- webpack.config.js 与 package.json的编码必须一致，否则会出现奇怪的模块找不到的错误。另外，npm模块大部分是utf-8的，所以src下要是utf-8的编码文件
