---
title: Babel 6 loose 模式
date: 2016-08-02
category: Babel
tags: Babel
---

许多 Babel 插件有两种工作模式：

1. normal：尽可能符合 ES6 语义；
2. loose：生成更简单的 ES5 代码；

通常，不推荐使用 loose 模式，其优缺点如下：

- 优点：生成的代码更快，兼容性更好，代码更加简洁，更符合 ES5
- 缺点：？？？

# 如何使用 loose 模式
TODO 如何查看哪些 Babel 插件支持 loose 模式 ？
TODO 如何区分 normal 和 loose 模式生成代码？

对于支持 loose 模式的插件，例如： `transform-es2015-classes`，可以按如下方式配置（`.babelrc`）：

```
···
  "plugins": [
    ···
    ["transform-es2015-classes", {"loose": true}],
    ···
  ],
 ...
 ```

除了配置指定插件的 loose 模式方式外，可以使用一些预设来减轻工作量。例如：[ES2015-loose](https://github.com/bkonkle/babel-preset-es2015-loose) 就是标准的ES6 预设 ES2015-2015 的 loose 版，使用时直接再 Babel 配置的预设里指定 loose 版，如下：

```
···
  "presets": [
    ···
    "es2015-loose",
    ···
  ],
 ···
```

# 对比 normal 与 loose 的输出
TODO

# 参考文献
- [Babel 6: loose模式](http://www.w3ctech.com/topic/1708)
- [Babel 6: loose mode](http://www.2ality.com/2015/12/babel6-loose-mode.html)
