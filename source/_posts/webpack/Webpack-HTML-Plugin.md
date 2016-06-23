---
title: Webpack HTML 插件
date: 2016-06-19
category: Webpack
tags: Webpack
---

在 HTTP 资源过期之前，浏览器将一直使用本地缓存的响应。但我们可以将文件内容指纹码嵌入网址，强制客户端更新到新版的响应。目前，Webpack 的配置属性 output.filename 本身就是支持 hash 命名。剩下的主要问题在于如何确保在 webpack 打包生成的文件 hash 值变化后，能同时修改 HTML 文件中的资源引用地址。html-webpack-plugin 正是帮主我们解决这个问题的插件，它可以生成一个包含 webpack 打包文件的 HTML。如果打包文件的命名里包含 hash 值（每次打包都可能变化），不用担心，有了 html-webpack-plugin，我们不需要再手动的修改 HTML 中的资源引用路径，它可以自动填写正确的资源路径。

html-webpack-plugin 简化了需要引用 webpack 打包文件的 HTML 创建，它配置起来非常的灵活，支持 lodash 模板或自定义的模板加载器。

项目地址：https://github.com/ampedandwired/html-webpack-plugin。

安装命令：`npm install html-webpack-plugin --save-dev`

备注：编写本文时 html-webpack-plugin 版本为 2.x

# 快上上手
最简单的用法是在 webpack.plugins 增加一项 html-webpack-plugin 的实例，不设置任何参数的化。这个配置将会生成一个包含所有 webpack 构建生成资源的 HTML5 文件 —— 使用 script 或 link 标签。

示例配置代码
```
var HtmlWebpackPlugin = require('html-webpack-plugin');
var webpackConfig = {
  entry: 'index.js',
  output: {
    path: 'dist',
    filename: 'index_bundle.js'
  },
  plugins: [new HtmlWebpackPlugin()]
};
```

示例生成代码
```
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Webpack App</title>
  </head>
  <body>
    <script src="index_bundle.js"></script>
  </body>
</html>
```

备注
- 如果 webpack 有 css 文件输出（借助 ExtractTextPlugin），则会使用 link 标签包含在 HTML 中。
- 如果 webpack 配置有多个入口，则每个入口生成的文件都会被包含在 script 标签中，并写入 HTML —— 如果是多页应用程序则需要考虑配置多个 html-webpack-plugin，并利用模块过滤配置来设置写入 HTML 的模块，这再下文中将会详细介绍。

# 配置说明
- title: HTML 标题.
- filename: HTML 文件名，可以设置到子目录，如：`assets/admin.html`。
- inject：插入所有静态资源到给定的模板文件或模板内容中
    - true：所有的 javascript 资源都会被放在 body 底端；
    - head：放在 head 里；
    - body：通 true；
    - false：不插入，在自定义模板里已经声明了静态资源的输出时，就要设置为 false，否则会重复输出。
- favicon: 给定 favicon 路径；
- minify: {...} | false，设置一个 html-minifier 选项来最小化输出；
- hash: true | false，如果为 true，在静态资源尾部加一个唯一的 webapck 编译 hash —— 放在参数里；
- cache: true | false, 默认为 true，表示文件没有变化时不会生成新的 HTML；
- showErrors: true | false，默认为 true，表示错误明细会被写进 HTML；
- chunks: []，只允许添加指定的打包文件 —— 入口配置定义的 key 作为打包文件名，如果是程序中的模块呢？；
- chunksSortMode: 控制打包文件的在 HTML 中的引用顺序，允许的值：none，auto， dependency，function，默认是 auto；
- excludeChunks: 不需要放到 HTML 的打包文件；
- xhtml: true | false，默认是 false，表示在引用打包文件时，标签是否是自闭合，还是要求服务
XHTML；

# 定制模板
## 简单模板
如果默认生成的 HTML 不能满足你的需求，可以设置自己的模板。最简单的方式就是使用 inject 属性和设置一个 HTML 模板，html-webpack-plugin 会自动插入所有需要的 CSS，JS，Manifest 和 Favicon。例如：

webpack.config.js
```
plugins: [
  new HtmlWebpackPlugin({
    title: 'Custom template',
    template: 'my-index.ejs', // Load a custom template (ejs by default but can be changed)
    inject: 'body' // Inject all scripts into the body (this is the default so you can skip it)
  })
]
```

my-index.ejs
```
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
    <title><%= htmlWebpackPlugin.options.title %></title>
  </head>
  <body>
  </body>
</html>
```

## lodash 模板
如果 inject 不能满足你的需求，想要完全控制 HTML 的生成，那么可以直接使用 lodash 语法自定义模板，不要额外的依赖和配置。

模板中可以使用的变量如下：
- htmlWebpackPlugin：html-webpack-plugin 的相关数据
    - htmlWebpackPlugin.files：包含一个 JSON 对象，映射入口名称到打包文件名，例如：
        ```
        "htmlWebpackPlugin": {
          "files": {
            "css": [ "main.css" ],
            "js": [ "assets/head_bundle.js", "assets/main_bundle.js"],
            "chunks": {
              "head": {
                "entry": "assets/head_bundle.js",
                "css": [ "main.css" ]
              },
              "main": {
                "entry": "assets/main_bundle.js",
                "css": []
              },
            }
          }
        }
        ```
    - htmlWebpackPlugin.options：html-webpack-plugin 的配置属性，就是上面实例化插件时传的参数，可以根据需要传递一些额外的数据给模板
- webpack
- webpackConfig

[html-webpack-template](https://github.com/jaketrent/html-webpack-template) 提供了一个最佳的默认模板 [index.ejs](https://github.com/jaketrent/html-webpack-template/blob/master/index.ejs)，可以参考它的具体配置。

## 模板加载器
如果已经有一个模板加载器，那么可以直接使用它来解析模板。

webpack.config.js
```
module: {
  loaders: [
    { test: /\.hbs$/, loader: "handlebars" }
  ]
},
plugins: [
  new HtmlWebpackPlugin({
    title: 'Custom template using Handlebars',
    template: 'my-index.hbs'
  })
]
```

## 模块过滤
在多页应用中，每个 HTML 页面不需要引用所有的打包文件，可以利用 html-webpack-plugin 的配置属性 chunks 和 excludeChunks 来控制需要包好的模块；

# 实际运用
## 多页应用配置
```
{
  entry: {
    'page1': 'page1.js',
    'page2': 'page2.js',
  },
  output: {
    path: 'dist',
    filename: 'index_bundle.js'
  },
  plugins: [
    new HtmlWebpackPlugin({
        title: 'page1',
        filename: 'page1.html',
        chunks: ['page1']
    }),
    new HtmlWebpackPlugin({
        title: 'page2',
        filename: 'page2.html',
        chunks: ['page2']
    })
  ]
}
```

## 单页应用配置
```
{
  entry: 'index.js',
  output: {
    path: 'dist',
    filename: 'index_bundle.js'
  },
  plugins: [
    new HtmlWebpackPlugin({
        filename: 'index.html',
    })
  ]
}
```

# 参考文献
- [Webpack HTML plug-in in a Nutshell](http://www.jonathan-petitcolas.com/2016/01/23/webpack-html-plugin-in-a-nutshell.html)
- [webpack 插件： html-webpack-plugin](http://www.cnblogs.com/haogj/p/5160821.html)
