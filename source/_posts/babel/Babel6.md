---
title: Babel 6
date: 2016-04-28
category: Babel
tags: Babel
---

# 简介
- 官方网站：https://babeljs.io/

Babel 是一个 JavaScript 编译器。特性如下
- 支持 ES2015 及以上版本
- 支持 JSX 和 React
- 支持插件

项目结构
+ babel
    - doc 文档
    - pacakges 子模块
        - babel 已废弃，由 babel-cli 取代
        - babel-cli 命令行
        - babel-code-frame
    - scripts
    - test
    - ...

https://github.com/thejameskyle/babel-handbook

# 安装配置
https://babeljs.io/docs/setup/

## CLI
https://babeljs.io/docs/usage/cli/

## Require Hook
https://babeljs.io/docs/usage/require/


# 使用详解
## 插件
https://babeljs.io/docs/plugins/#


## Presets
https://babeljs.io/docs/plugins/#presets

## 第三方集成
## webpack
- https://babeljs.io/docs/setup/#webpack
- https://github.com/babel/babel-loader

# 常见问题
## You have mistakenly installed the `babel` package, which is a no-op in Babel 6.
- 错误日志
    ```
    You have mistakenly installed the `babel` package, which is a no-op in Babel 6.
    Babel's CLI commands have been moved from the `babel` package to the `babel-cli` package.
        npm uninstall babel
        npm install babel-cli
    See http://babeljs.io/docs/usage/cli/ for setup instructions.

    ```
- 原因分析：babel6 以上版本将命令行包移动到 `babel-cli` 里了
- 解决方案
    1. npm uninstall babel
    2. npm install babel-cli

# 参考文献
- https://github.com/thejameskyle/babel-handbook

# 附录
## 命令行
### babel
```
Usage: babel [options] <files ...>
Options:
  -h, --help                           output usage information
  -f, --filename [filename]            filename to use when reading from stdin - this will be used in source-maps, errors etc
  --retain-lines                       retain line numbers - will result in really ugly code
  --no-highlight-code                  enable/disable ANSI syntax highlighting of code frames (on by default)
  --presets [list]                     
  --plugins [list]                     
  --ignore [list]                      list of glob paths to **not** compile
  --only [list]                        list of glob paths to **only** compile
  --no-comments                        write comments to generated output (true by default)
  --compact [booleanString]            do not include superfluous whitespace characters and line terminators [true|false|auto]
  --minified                           save as much bytes when printing [true|false]
  -s, --source-maps [booleanString]    [true|false|inline]
  --source-map-target [string]         set `file` on returned source map
  --source-file-name [string]          set `sources[0]` on returned source map
  --source-root [filename]             the root from which all sources are relative
  --no-babelrc                         Whether or not to look up .babelrc and .babelignore files
  --source-type [string]               
  --auxiliary-comment-before [string]  print a comment before any injected non-user code
  --auxiliary-comment-after [string]   print a comment after any injected non-user code
  --module-root [filename]             optional prefix for the AMD module formatter that will be prepend to the filename on module definitions
  -M, --module-ids                     insert an explicit id for modules
  --module-id [string]                 specify a custom name for module ids
  -x, --extensions [extensions]        List of extensions to compile when a directory has been input [.es6,.js,.es,.jsx]
  -w, --watch                          Recompile files on changes
  -o, --out-file [out]                 Compile all input files into a single file
  -d, --out-dir [out]                  Compile an input directory of modules into an output directory
  -D, --copy-files                     When compiling a directory copy over non-compilable files
  -q, --quiet                          Don't log anything
  -V, --version                        output the version number

```

### babel-node
```
Usage: babel-node [options] [ -e script | script.js ] [arguments]
Options:
  -h, --help                     output usage information
  -e, --eval [script]            Evaluate script
  -p, --print [code]             Evaluate script and print result
  -o, --only [globs]             
  -i, --ignore [globs]           
  -x, --extensions [extensions]  List of extensions to hook into [.es6,.js,.es,.jsx]
  -w, --plugins [string]         
  -b, --presets [string]         
  -V, --version                  output the version number
```


# 学习资源
- [使用Babel和ES7创建JavaScript模块](http://blog.oneapm.com/apm-tech/693.html)
