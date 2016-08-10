---
title: Webpack
date: 2016-04-28
category: Webpack
tags: Webpack
---

webpack是一个模块打包工具，通过依赖处理模块，并生成那些模块静态资源。
![what-is-webpack](../../images/Webpack/what-is-webpack.png)
观察上图，webpack把所有的资源（js，css和图片等）都当做是模块——webpack中可以引用css，css中可以嵌入图片dataUrl，对于不同类型的资源，webpack有对应的模块加载器。webpack模块打包器会分析模块间的依赖关系，最后 生成了优化且合并后的静态资源。

参考文献：
- [What is webpack?]( http://webpack.github.io/docs/what-is-webpack.html)
- [Webpack是什么——Webpack入门指迷](http://segmentfault.com/a/1190000002551952#articleHeader0)

社区：
- [StackOverflow Webpack Tag]( http://stackoverflow.com/tags/webpack/info)
- [segmentfault Webpack Tag]( http://segmentfault.com/t/webpack)
- https://github.com/search?o=desc&q=webpack&s=stars&type=Repositories&utf8=%E2%9C%93
- http://survivejs.com/webpack/

# 工具对比
- [Browserify vs. Webpack]( http://www.oschina.net/translate/browserify-vs-webpack)
- [webpack到底好在哪里]( http://react-china.org/t/webpack/1277 )

# 项目模板
- [react-starter-kit](https://github.com/kriasoft/react-starter-kit)：React 同构 Web 应用模板(Node.js, Express, GraphQL, React.js, Babel 6, PostCSS, Webpack, Browsersync)
- [react-transform-boilerplate](https://github.com/gaearon/react-transform-boilerplate)：支持热加载 React 组件，并支持模块/组件级别错误处理的模板
- [react-redux-universal-hot-example](https://github.com/erikras/react-redux-universal-hot-example)：使用 express, react, redux, webpack, and react-transform 的 Web 应用模板
- [jaketrent/html-webpack-template]( https://github.com/jaketrent/html-webpack-template)：更好的 html-webpack-template 模板
- [angular2-webpack-starter](https://github.com/AngularClass/angular2-webpack-starter)
- [frontend-boilerplate](https://github.com/tj/frontend-boilerplate)：webpack-react-redux-babel-autoprefixer-hmr-postcss-css-modules-rucksack-boilerplate
- [react_on_rails](https://github.com/shakacode/react_on_rails)：集成 React，Webpack，Rails 的同构 App
- [generator-react-webpack](https://github.com/newtriks/generator-react-webpack)：oman generator for ReactJS and Webpack
- [hjs-webpack](https://github.com/HenrikJoreteg/hjs-webpack)：Helpers/presets for setting up webpack with hotloading react and ES6(2015) using Babel.
- [react-webpack-node](https://github.com/choonkending/react-webpack-node)：Your One-Stop solution for a full-stack universal Redux App!
- [react-static-boilerplate](https://github.com/koistya/react-static-boilerplate)：Boilerplate and tooling for React.js apps optimized for CDN hosting like GitHub Pages, Amazon S3, or Firebase. Stack: React.js, postCSS, Sass, ES6+, Babel, Webpack, BrowserSync, React Hot Loader
- [NG6-starter](https://github.com/AngularClass/NG6-starter)：An AngularJS Starter repo for Angular + ES6 + (Webpack or JSPM) by
- [ruanyf/webpack-demos](https://github.com/ruanyf/webpack-demos)
- [css-modules/webpack-demo](https://github.com/css-modules/webpack-demo)：Working demo of CSS Modules, using Webpack's css-loader in module mode
- [webpack-express-boilerplate](https://github.com/christianalfoni/webpack-express-boilerplate)：A boilerplate for running a Webpack workflow in Node express
- [react-native-webpack-starter-kit](https://github.com/jhabdas/react-native-webpack-starter-kit)： Write your React Native app using ES7+ with Webpack and Babel.
- [ruanyf/react-babel-webpack-boilerplate](https://github.com/ruanyf/react-babel-webpack-boilerplate)：a boilerplate for React-Babel-Webpack project
- [fullstack-react](https://github.com/Widen/fullstack-react)：A simple, full-stack JavaScript single page app featuring React, Webpack, and Falcor
- [angular-webpack](https://github.com/preboot/angular-webpack)：A complete, yet simple, starter for Angular using webpack
- [koa-react-full-example](https://github.com/dozoisch/koa-react-full-example)：Full example using Koa, React, Passport, Mongoose, Webpack, Mocha, Babel
- [vuejs-templates/webpack](https://github.com/vuejs-templates/webpack)：A full-featured Webpack + vue-loader setup with hot reload, linting, testing & css extraction.
- [react-seed](https://github.com/badsyntax/react-seed)：Seed project for React apps using ES6 & webpack.
- [meteor-webpack-react](https://github.com/jedwards1211/meteor-webpack-react)：Meteor/React skeleton with full ES6/import support on client and server thanks to Webpack
- [geniuscarrier/webpack-boilerplate](https://github.com/geniuscarrier/webpack-boilerplate)：A webpack boilerplate in order to quickly build up a production-ready marketing website.
- [gaearon/library-boilerplate](https://github.com/gaearon/library-boilerplate)：An opinionated boilerplate for React libraries including ESLint, Mocha, Babel, Webpack and an example powered by Webpack Dev Server and React Hot Loader
- [react-starterkit](https://github.com/wbkd/react-starterkit)：Yet another react starterkit. Including react-router, reflux, jest, webpack, gulp and stylus.


# 参考文献
- [Tree-shaking with webpack 2 and Babel 6](http://www.2ality.com/2015/12/webpack-tree-shaking.html)
- [Webpack Document](https://wohugb.gitbooks.io/webpack/content/index.html)
- [webpack-howto](https://github.com/petehunt/webpack-howto)：如何使用 Webpack
- [WebpackTutorial](https://github.com/AriaFallah/WebpackTutorial)：一篇简单的 webpack 教程
- [webpack](https://github.com/survivejs/webpack)：一本讲解 Webpack 的在线书籍
- [webpack_react](https://github.com/survivejs/webpack_react)：一本讲解 Webpack + React 的在线书籍
- [react-webpack-rails-tutorial](https://github.com/shakacode/react-webpack-rails-tutorial)

中文文档
- [Webpack 入门指迷]( http://segmentfault.com/a/1190000002551952)
- [深入浅出React（二）：React开发神器Webpack]( http://www.infoq.com/cn/articles/react-and-webpack)
- [webpack这个js模块管理器(module bundler)怎么样?]( http://www.zhihu.com/question/27500759)
- [webpack前端模块加载工具]( http://www.cnblogs.com/YikaJ/p/4586703.html)
- [Webpack 和 Gulp 构建伪命令行项目]( http://www.tuicool.com/articles/VJbMbmE)
- [基于gulp+webpack的"约定大于配置"的构建方案探讨](http://www.html-js.com/article/3214)

最佳实践
- [Getting started with webpack]( http://www.uxebu.com/blog/2014/09/getting-started-webpack/)
- [newtriks/generator-react-webpack]( https://github.com/newtriks/generator-react-webpack)
- [book-of-modern-frontend-tooling-webpack]( http://tooling.github.io/book-of-modern-frontend-tooling/dependency-management/webpack/introduction.html)
- [Tutorial: Setting Up a Single Page React Web App with React-router and Webpack]( http://jmfurlott.com/tutorial-setting-up-a-single-page-react-web-app-with-react-router-and-webpack/)
- [Configure reactjs with webpack and grunt]( http://javascript.tutorialhorizon.com/2014/08/31/configure-reactjs-with-webpack-and-grunt/)
- [Single Page Modules with Webpack]( http://dontkry.com/posts/code/single-page-modules-with-webpack.html)

Webpack + React
- [react-webpack-cookbook](https://fakefish.github.io/react-webpack-cookbook/)
- [Creating a workflow with WebPack]( http://christianalfoni.github.io/javascript/2014/12/13/did-you-know-webpack-and-react-is-awesome.html)
- [React Hot Loader]( http://gaearon.github.io/react-hot-loader/)
- [基于ES6，使用React、Webpack、Babel构建模块化JavaScript应用]( http://www.csdn.net/article/2015-05-24/2824757-building-modular-javascript-applications-in-es6-with-react-webpack-and-babel)
- [轻松入门React和Webpack]( http://lingyu.wang/2015/05/15/react-and-webpack/)
- [The React.js Way: Getting Started Tutorial]( http://blog.risingstack.com/the-react-way-getting-started-tutorial/)
- [轻松入门React和Webpack]( http://www.cocoachina.com/webapp/20150702/12357.html)
- [webpack前端模块加载工具]( http://www.cnblogs.com/YikaJ/p/4586703.html)
- [How-to setup Webpack on an ES6 React Application with SASS?]( http://www.jonathan-petitcolas.com/2015/05/15/howto-setup-webpack-on-es6-react-application-with-sass.html)
- [轻松入门React和Webpack]( http://lingyu.wang/2015/05/15/react-and-webpack/)
- [Webpack with LESS and React](http://www.tuicool.com/articles/goto?id=qENZJba)
- [Building modular javascript applications in ES6 with React, Webpack and Babel](http://www.tuicool.com/articles/goto?id=Rziiuem)
- [基于ES6，使用React、Webpack、Babel构建模块化JavaScript应用]( http://www.csdn.net/article/2015-05-24/2824757-building-modular-javascript-applications-in-es6-with-react-webpack-and-babel)
- [前端革命，革了再革：WebPack]( http://inside.mcfog.wang/2015/01/tech4fun-2/) - - [一小时包教会 —— webpack 入门指南](http://www.cnblogs.com/vajoy/p/4650467.html)
- [如何使用webpack—webpack-howo](http://qiutc.me/post/%E5%A6%82%E4%BD%95%E4%BD%BF%E7%94%A8webpack%E2%80%94webpack-howo.html)
- [Using React with Webpack Tutorial](https://blog.risingstack.com/using-react-with-webpack-tutorial/)
    - [christianalfoni/webpack-express-boilerplate](https://github.com/christianalfoni/webpack-express-boilerplate)
    - [CSS Modules](http://glenmaddern.com/articles/css-modules)
    - [react-transform](https://github.com/gaearon/react-transform)

# 衍生项目
- [react-native-webpack-server](https://github.com/mjohnston/react-native-webpack-server)
- [webpack-stream](https://github.com/shama/webpack-stream)： Run webpack through a stream interface
- [webpack-isomorphic-tools](https://github.com/halt-hammerzeit/webpack-isomorphic-tools)：Server-side rendering for your Webpack-built applications (e.g. React)

# Todo
- [postcss-loader](https://github.com/postcss/postcss-loader)
- [css-loader](https://github.com/webpack/css-loader)
- [/css-modules](https://github.com/css-modules/css-modules)
    - [webpack-demo](https://github.com/css-modules/webpack-demo)
- [jamesknelson](http://jamesknelson.com/)
    - [Writing Happy Stylesheets with Webpack](http://jamesknelson.com/writing-happy-stylesheets-with-webpack/)
    - [webpack-made-simple-build-es6-less-with-autorefresh-in-26-lines](http://jamesknelson.com/webpack-made-simple-build-es6-less-with-autorefresh-in-26-lines/)
    - [Writing Happy Stylesheets with Webpack](http://jamesknelson.com/writing-happy-stylesheets-with-webpack/)
    - [react-pacomo](https://github.com/unicorn-standard/react-pacomo)
    - [Why You Shouldn’t Style React Components With JavaScript](http://jamesknelson.com/why-you-shouldnt-style-with-javascript/)
    - [Introducing react-pacomo: Automatic namespacing for className](http://jamesknelson.com/taming-css-globals-with-react-without-webpack-or-inline-style/)
- using-react-with-webpack-tutorial/
- [[译] Webpack——令人困惑的地方](https://segmentfault.com/a/1190000005089993)
- http://webpack.toobug.net/zh-cn/
