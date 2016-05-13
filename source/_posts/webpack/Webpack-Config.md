---
title: Webpack 配置详解
date: 2016-04-28
category: Webpack
tags: Webpack
---

# 配置详解
webpack命令提供了一系列的命令选项 用于控制模块打包 ——可通过`webpack --help`查看这些选项。当需要配置较多的选项时，会使webpack命令变得非常臃肿，如：`webpack --entry entry.js  --output-path ./build --ouput-file bundle.js `。所以webpack提供了一个配置对象来简化项目模块打包，在运行webpack命令的时候，只要指定这个配置对象即可——`webpack --config webpack.config.js`，`webpack.config.js`会输出配置对象，例如：
```
module.exports = {
    entry: "./entry.js,
    output: {
         path: "./build",
         filename: "bundle.js"
    }
};
```


观察上面的配置对象，可以发现配置对象本身就是一个模块，而不是JSON，我们可以在配置对象中随意的使用Javascript代码。除了在命令行界面中直接使用webpack，也可以在js代码中使用webpack api，例如：
```
var webpack = require("webpack");
webpack({
    entry: "./entry.js,
    output: {
         path: "./build",
         filename: "bundle.js"
}, callback);
```


webpack配置对象：
- context
    webpack处理entry选项时的基础路径（绝对路径），默认值为`process.cmd() `，即`webpack.config.js`文件所在路径
- entry：
    - 简介： webpack模块打包的入口，可以给entry赋字符串类型，数组类型和对象类型的值。
    - 可选值：
         - 字符串：字符串指定的模块在项目程序启动的时候加载
          - 字符串数组：字符串数组指定的所有模块被当做一个模块集，在项目程序启动的时候都会加载，数组最后一个元素作为模块集输出
          - 对象：webpack会打包多个模块集，对象的每个属性名作为模块集的名称，属性值可以是字符串和字符串数组。这个配置可用于实现非单页的程序，程序会有多个启动入口，具体实例可参考[ multiple entry points ]( https://github.com/webpack/webpack/tree/master/examples/multiple-entry-points )。
    - 实例：
         ```

        {
            entry: {
                page1: "./page1",
                page2: ["./entry1", "./entry2"]
            },
            output: {
                // Make sure to use [name] or [id] in output.filename
                //  when using multiple entry points
                filename: "[name].bundle.js",
                chunkFilename: "[id].bundle.js"
            }
        }
         ```
- output：option是个对象类型的值，option下的每个属性都可能会影响webpack模块打包结果。
    - output.path：字符串类型的值，指定webpack的输出文件路径——要求是个绝对路径
    - output.filenam: 字符串类型的值，指定模块集生成的文件名——在output.path指定的路径下，另外可以在字符串值中使用下列变量
         - [name]：代表模块集的名称，与entry配置有关，具体可自行测试
         - [hash]：代表编译hash值，与模块集的代码有关，如果模块集的代码有修改，hash值也会变，这个在生成环境里可以解决客户端的缓存问题
         - [ chunkhash ]：代表模块集名称的hash值，注意chunkhash与hash不能同时使用
     - output.chunckFileName：字符串类型，用于指定非程序入口模块集的文件名称—— 在output.path指定的路径下，另外可以在字符串值中使用下列变量
         -  [id]: 代表模块集的id
         -  [name]: 代表模块集的名称， 和require.ensure的第三个参数，具体可以自行测试
         -  [hash]: 代表编译hash值， 与模块集的代码有关，如果模块集的代码有修改，hash值也会变，这个在生成环境里可以解决客户端的缓存问题
         -  [chunkhash]:  代表模块集名称的hash值，注意chunkhash与hash不能同时使用
    - [ output.sourceMapFilename]( http://webpack.github.io/docs/configuration.html#output-sourcemapfilename ): SourceMaps的文件名称生成规则
     - [ output.devtoolModuleFilenameTemplate ]( http://webpack.github.io/docs/configuration.html#output-devtoolmodulefilenametemplate )
    - [ output.devtoolFallbackModuleFilenameTemplate ]( http://webpack.github.io/docs/configuration.html#output-devtoolfallbackmodulefilenametemplate )
    - [ output.devtoolLineToLine ]( http://webpack.github.io/docs/configuration.html#output-devtoollinetoline )
    - [ output.hotUpdateChunkFilename]( http://webpack.github.io/docs/configuration.html#output-hotupdatechunkfilename)
    - [ output.hotUpdateMainFilename ]( http://webpack.github.io/docs/configuration.html#output-hotupdatemainfilename )
    - [ output.publicPath ]( http://webpack.github.io/docs/configuration.html#output-publicpath )
    - [ output.jsonpFunction ]( http://webpack.github.io/docs/configuration.html#output-jsonpfunction )
    - [ output.hotUpdateFunction ]( http://webpack.github.io/docs/configuration.html#output-hotupdatefunction )
    - [ output.pathinfo ]( http://webpack.github.io/docs/configuration.html#output-pathinfo )
    - [ output.pathinfo ]( http://webpack.github.io/docs/configuration.html#output-library )
    - [ output.library ]( http://webpack.github.io/docs/configuration.html#output-library )
    - [ output.libraryTarget ]( http://webpack.github.io/docs/configuration.html#output-librarytarget )
    - [ output.sourcePrefix ]( http://webpack.github.io/docs/configuration.html#output-sourceprefix )
    - [ output.crossOriginLoading]( http://webpack.github.io/docs/configuration.html#output-crossoriginloading )
- [module]( http://webpack.github.io/docs/configuration.html#module )：用于配置模块加载插件，后面的章节再具体介绍
- [ resolve ]( http://webpack.github.io/docs/configuration.html#resolve )
- [ externals ]( http://webpack.github.io/docs/configuration.html#externals )
- [ target ]( http://webpack.github.io/docs/configuration.html#target )
- [ bail ]( http://webpack.github.io/docs/configuration.html#bail )
- [ profile ]( http://webpack.github.io/docs/configuration.html#profile )
- [ cache ]( http://webpack.github.io/docs/configuration.html#cache )
- [ watch ]( http://webpack.github.io/docs/configuration.html#watch )
- [ watchOptions.aggregateTimeout ]( http://webpack.github.io/docs/configuration.html#watchoptions-aggregatetimeout )
- [ watchOptions.poll ]( http://webpack.github.io/docs/configuration.html#watchoptions-poll )
- [ debug ]( http://webpack.github.io/docs/configuration.html#debug )
- [ devtool ]( http://webpack.github.io/docs/configuration.html#devtool )
- [ node ]( http://webpack.github.io/docs/configuration.html#node )
- [ amd ]( http://webpack.github.io/docs/configuration.html#amd )
- [ loader ]( http://webpack.github.io/docs/configuration.html#loader )
- [ recordsPath, recordsInputPath, recordsOutputPath ]( http://webpack.github.io/docs/configuration.html#recordspath-recordsinputpath-recordsoutputpath )
- [ plugins ]( http://webpack.github.io/docs/configuration.html#plugins): 插件


注：不得不说webpack的强大，提供如此之多的配置选项，由于精力有限，后续再慢慢维护完善各个配置选项的说明。
