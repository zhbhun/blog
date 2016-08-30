---
title: CSS 资源合集
date: 2016-08-27
category: CSS
tags: CSS
---

- http://blog.vjeux.com/2014/javascript/react-css-in-js-nationjs.html
- https://speakerdeck.com/vjeux/react-css-in-js

# 为什么要模块化？
CSS 模块化重要的是要解决好两个问题：CSS 样式的导入和导出。灵活按需导入以便复用代码；导出时要能够隐藏内部作用域，以免造成全局污染。CSS 预处理器解决了 CSS 编程能力弱的问题，但并没有解决模块化最重要的问题。

- 全局污染
- 命名混乱
- 依赖管理不彻底
- CSS 和 JS 无法共享变量
- 代码压缩不彻底


# 模块化方案
- 彻底抛弃 CSS，使用 JS 或 JSON 来写样式：优点是能给 CSS 提供 JS 同样强大的模块化能力；缺点是不能利用成熟的 CSS 预处理器（或后处理器） Sass/Less/PostCSS，`:hover` 和 `:active` 伪类处理起来复杂。
    - [Radium](https://github.com/FormidableLabs/radium)
    - [jsxstyle](https://github.com/petehunt/jsxstyle)
    - [react-style](https://github.com/js-next/react-style)
- 依旧使用 CSS，但使用 JS 来管理样式依赖：最大化地结合现有 CSS 生态和 JS 模块化能力，API 简洁到几乎零学习成本。
    - [CSS Modules](https://github.com/css-modules/css-modules)

# CSS Mosules

# 参考文献
- [CSS Modules 详解及 React 中实践](https://zhuanlan.zhihu.com/p/20495964?refer=purerender)
