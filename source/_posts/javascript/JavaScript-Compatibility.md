---
title: JavaScript 兼容性
date: 2016-05-12
categories: JavaScript
tags: JavaScript
---

- [You-Dont-Need-jQuery](https://github.com/oneuijs/You-Dont-Need-jQuery/)
- [如何做到 jQuery-free？](http://www.ruanyifeng.com/blog/2013/05/jquery-free.html)

# 兼容性查询
- [es5](http://kangax.github.io/compat-table/es5/)
- [ECMAScript 5 compatibility table](http://kangax.github.io/compat-table/strict-mode/)
- [es6](http://kangax.github.io/compat-table/es6/)
- [esnext](http://kangax.github.io/compat-table/esnext/)
- [esintl](http://kangax.github.io/compat-table/esintl/)
- [non-standard](http://kangax.github.io/compat-table/non-standard/)

# 兼容性处理
## [babel-polyfill](https://babeljs.io/docs/usage/polyfill/)
babel-polyfill 基于 [regenerator runtime](https://github.com/facebook/regenerator/blob/master/runtime.js) 和 [core-js](https://github.com/zloirock/core-js) 模拟 ES2015 环境，并且在使用 babel-node 的时候会自动加载。有了它，我们就可以使用内置的 Promise，WeakMap，以及静态方法 Array.from 和 Object.assign，无需担心兼容性问题。

**安装**

`npm install --save-dev babel-polyfill`

**用法**

1. Node/Browserify/Webpack
    - CommonJS：`require("babel-polyfill");`
    - ES6：`import "babel-polyfill";` —— 放在入口代码的顶部
    - webpack 配置：`module.exports = { entry: ['babel-polyfill', './app/js'] };`
2. Browser：`<script src="node_modules/babel-polyfill/dist/polyfill.js"></script>`

**注意要点**

1. 直接引入 babel-polyfill 会修改全局命名控件，如果不想这么做的话，可以使用 Babel 插件 [transform-runtime](https://babeljs.io/docs/plugins/transform-runtime) 来处理；

## [core-js](https://github.com/zloirock/core-js)
1. `require('core-js');`：默认，包含所有特性（标准和非标准）
2. `var core = require('core-js/library');`：同默认，但是不会污染全局命名空间
3. `require('core-js/shim');`：只包含标准方法
4. `require('core-js/fn/set');`：引入需要的模块
5. `var Set = require('core-js/library/fn/set');`：同上，但不会污染全局命名空间
6. `<script src="core-js/client/core.js"></script>`

包结构
- index.js：对应用法 1
- library
    - index.js：对应用法 2
    - shim.js：？？？
    - core：对应用法5
    - es5：同上
    - es6：同上
    - es7：同上
    - fn：同上
    - modules：同上
    - stage：同上
    - web：同上
- shim.js：对应用法 3
- core：对应用法 4
- es5：同上
- es6：同上
- es7：同上
- fn：同上
- modules：同上
- stage：同上
- web：同上
- client：对应用法 6
    - core.js
    - library.js
    - shim.js

## 其他
- [es-shims](https://github.com/es-shims)
- [es5-shim](https://github.com/es-shims/es5-shim)
- [es6-shim](https://github.com/paulmillr/es6-shim)
- [es7-shim](https://github.com/es-shims/es7-shim)

# 问题
- [Mobile Safari Autofocus text field](http://stackoverflow.com/questions/6287478/mobile-safari-autofocus-text-field)
- [How do you set focus in Safari on iOS, or determine that you can't?](https://www.quora.com/How-do-you-set-focus-in-Safari-on-iOS-or-determine-that-you-cant)


---


# TODO
- document.documentElement.scrollTop VS document.body.scrollTop
- window.matchMedias
- [Placeholder in IE9](http://stackoverflow.com/questions/6366021/placeholder-in-ie9)
- https://github.com/mathiasbynens/jquery-placeholder
- https://github.com/ginader/HTML5-placeholder-polyfill
