---
title: React 兼容性
date: 2016-05-13
category: React
tags: React
---

React 兼容 IE8+ 浏览器的开发环境配置。

# 需要的 Ployfill
- [console-polyfill](https://github.com/paulmillr/console-polyfill)：IE9 及以下版本只有在开发者工具打开的时候才支持 console，否则 console 是 undefined，调用的话会抛出错误。
- [es6-promise](https://github.com/jakearchibald/es6-promise)：所有版本的 IE 都不支持 Promise。
- [fetch](https://github.com/github/fetch)：所有版本的 IE 都不支持 fetch，需要注意的是该 polyfill 只支持 IE10 及以上版本的浏览器，IE10 以下版本的浏览器需要特殊处理。

# IE8 需要特殊处理
开发要点
- 不使用 React v15 或更高版本 —— 从 React v15 开始，React DOM 将不会再支持 IE8 了。
- 建议使用 CommonJS 风格来引入需要的模块 —— babel 把 import 编译成了 Object.defineProperty，而 IE8 中没有这个方法。
- JSON 要在 IE8 标准模式下才能使用 —— 即添加 `<!DOCTYPE html>` 和 `<meta http-equiv="X-UA-Compatible" content="IE=EDGE"/>`。

需要的 Polyfill
- [es5-shim](https://github.com/es-shims/es5-shim)：IE8 不支持 ES5。
- [es5-sham](https://github.com/es-shims/es5-shim#shams)：同上。
- [es3ify-loader](https://github.com/sorrycc/es3ify-loader)：代码中或者第三方模块中使用了保留字，比如 default，会抛出错误 `Expected identifier`，使用 es3ify-loader 可以将 ES5 代码转换为 ES3。
- [fetch-ie8](https://github.com/camsong/fetch-ie8)：针对 IE8 的 fetch polyfill。

# 程序示例
https://github.com/zhbhun/program-demo/tree/master/react/react-ie

## 代码结构
- verdor/：polyfill
- debug.html：开发环境 HTML 入口文件，访问 `http://ip:port/debug.html`
- index.html：生产环境 HTML 入口文件
- webpack.config.dev.js：针对 IE9 及以上版本的开发环境配置
- webpack.config.dev.ie8.js：针对 IE8 的开发环境配置
- webpack.config.prod.js：针对 IE9 及以上版本的生产环境配置
- webpack.config.prod.ie8.js：针对 IE8 的生产环境配置

## 脚本命令
- `npm start`：IE9 及以上版本的开发服务器启动命令
- `npm run startByIP`
- `npm run product:clean`
- `npm run product:webpack`
- `npm run product`
- `npm startIE8`：IE8 的开发服务器启动命令
- `npm run startIE8ByIP`
- `npm run productIE8:clean`
- `npm run productIE8:webpack`
- `npm run productIE8`

# 参考文献
- [React Browser Support](https://facebook.github.io/react/docs/working-with-the-browser.html#browser-support)- https://github.com/ant-tool/atool-build/issues/28
- https://github.com/xcatliu/react-ie8
- https://github.com/ant-design/ant-design/issues/858
