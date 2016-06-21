---
title: Webpack HTML 插件
date: 2016-06-19
category: Webpack
tags: Webpack
---

- https://github.com/ampedandwired/html-webpack-plugin

在 HTTP 资源过期之前，浏览器将一直使用本地缓存的响应。但我们可以将文件内容指纹码嵌入网址，强制客户端更新到新版的响应。目前，Webpack 的配置属性 output.filename 本身就是支持 hash 命名。剩下的主要问题在于如何确保在 webpack 打包生成的文件 hash 值变化后，能同时修改 HTML 文件中的资源引用地址。html-webpack-plugin 正是帮主我们解决这个问题的插件。除此之外，html-webpack-plugin 配置起来非常的灵活，支持 lodash 模板或自定义的模板加载器。

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

## 定制模板
默认模板：https://github.com/jaketrent/html-webpack-template/blob/86f285d5c790a6c15263f5cc50fd666d51f974fd/index.html
```
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6" <% if(htmlWebpackPlugin.files.manifest) { %> manifest="<%= htmlWebpackPlugin.files.manifest %>"<% } %>> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7" <% if(htmlWebpackPlugin.files.manifest) { %> manifest="<%= htmlWebpackPlugin.files.manifest %>"<% } %>> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8" <% if(htmlWebpackPlugin.files.manifest) { %> manifest="<%= htmlWebpackPlugin.files.manifest %>"<% } %>> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="ie9" <% if(htmlWebpackPlugin.files.manifest) { %> manifest="<%= htmlWebpackPlugin.files.manifest %>"<% } %>> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="" <% if(htmlWebpackPlugin.files.manifest) { %> manifest="<%= htmlWebpackPlugin.files.manifest %>"<% } %>> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <title><%= htmlWebpackPlugin.options.title || 'Webpack App'%></title>

  <% if (htmlWebpackPlugin.files.favicon) { %>
  <link rel="shortcut icon" href="<%= htmlWebpackPlugin.files.favicon%>">
  <% } %>
  <% if (htmlWebpackPlugin.options.mobile) { %>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <% } %>

  <% for (var css in htmlWebpackPlugin.files.css) { %>
  <link href="<%= htmlWebpackPlugin.files.css[css] %>" rel="stylesheet">
  <% } %>
</head>
<body>
<% if (htmlWebpackPlugin.options.unsupportedBrowser) { %>
<style>.unsupported-browser { display: none; }</style>
<div class="unsupported-browser">
  Sorry, your browser is not supported.  Please upgrade to
  the latest version or switch your browser to use this site.
  See <a href="http://outdatedbrowser.com/">outdatedbrowser.com</a>
  for options.
</div>
<% } %>

<% if (htmlWebpackPlugin.options.appMountId) { %>
<div id="<%= htmlWebpackPlugin.options.appMountId%>"></div>
<% } %>

<% if (htmlWebpackPlugin.options.appMountIds && htmlWebpackPlugin.options.appMountIds.length > 0) { %>
<% for (var index in htmlWebpackPlugin.options.appMountIds) { %>
<div id="<%= htmlWebpackPlugin.options.appMountIds[index]%>"></div>
<% } %>
<% } %>

<% if (htmlWebpackPlugin.options.window) { %>
<script>
  <% for (var varName in htmlWebpackPlugin.options.window) { %>
    window['<%=varName%>'] = <%= JSON.stringify(htmlWebpackPlugin.options.window[varName]) %>;
  <% } %>
</script>
<% } %>

<% for (var chunk in htmlWebpackPlugin.files.chunks) { %>
<script src="<%= htmlWebpackPlugin.files.chunks[chunk].entry %>"></script>
<% } %>

<% if (htmlWebpackPlugin.options.devServer) { %>
<script src="<%= htmlWebpackPlugin.options.devServer%>/webpack-dev-server.js"></script>
<% } %>

<% if (htmlWebpackPlugin.options.googleAnalytics) { %>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
  <% if (htmlWebpackPlugin.options.googleAnalytics.trackingId) { %>
    ga('create', '<%= htmlWebpackPlugin.options.googleAnalytics.trackingId%>', 'auto');
    <% } else { throw new Error("html-webpack-template requires googleAnalytics.trackingId config"); }%>
  <% if (htmlWebpackPlugin.options.googleAnalytics.pageViewOnLoad) { %>
    ga('send', 'pageview');
  <% } %>
</script>
<% } %>
</body>
</html>
```

## 模块过滤
TODO

## 事件处理
TODO

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

# 参考文献
- [Webpack HTML plug-in in a Nutshell](http://www.jonathan-petitcolas.com/2016/01/23/webpack-html-plugin-in-a-nutshell.html)
- [webpack 插件： html-webpack-plugin](http://www.cnblogs.com/haogj/p/5160821.html)
