---
title: ESLint
date: 2016-04-29
category: lint
tags: lint
---

- 官方网站：http://eslint.org/
- awesome-eslint：https://github.com/dustinspecker/awesome-eslint



# 安装
两种安装方式
- 本地安装：`npm install eslint --save-dev`
- 全局安装：`npm install eslint -g`

# 使用
## 快速上手
ESLint 是一个非常强大和灵活的工具，因此配置起来有点复杂。幸好 ESLint 自带了一个初始化向导命令，可以生成一个基本的配置。
1. `cd 项目路径`
2. 运行向导
    - 如果 ESLint 是全局安装的，则运行：`eslint --init`
    - 如果 ESLint 是本地安装的，则运行：`./node_modules/.bin/eslint --init`
3. 然后会问你一系列问题，下面是我初始化的例子：
    ```
    ? How would you like to configure ESLint? Answer questions about your style
    ? What style of indentation do you use? Spaces
    ? What quotes do you use for strings? Single
    ? What line endings do you use? Unix
    ? Do you require semicolons? Yes
    ? Are you using ECMAScript 6 features? Yes
    ? Where will your code run? Browser
    ? Do you use JSX? Yes
    ? Do you use React Yes
    ? What format do you want your config file to be in? JSON
    Successfully created .eslintrc.json file in /home/zhanghuabin/tmp
    Installing React plugin   
    ```

4. 初始化完成后，会生成一个配置文件 `.eslintrc.json`
    ```
    {
        "rules": {
            "indent": [
                2,
                2
            ],
            "quotes": [
                2,
                "single"
            ],
            "linebreak-style": [
                2,
                "unix"
            ],
            "semi": [
                2,
                "always"
            ]
        },
        "env": {
            "es6": true,
            "browser": true
        },
        "extends": "eslint:recommended",
        "ecmaFeatures": {
            "jsx": true,
            "experimentalObjectRestSpread": true
        },
        "plugins": [
            "react"
        ]
    }
    ```

## 规则详解
http://eslint.org/docs/rules/

## 使用插件
### eslint-plugin-react
https://github.com/yannickcr/eslint-plugin-react

## 命令用法
http://eslint.org/docs/user-guide/command-line-interface

## DEMO
- http://eslint.org/demo/
- http://eslint.org/parser/


# 配置模板
- [eslint-config-airbnb](https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb)
- [library-boilerplate](https://github.com/gaearon/library-boilerplate)
- [eslint-config-google](https://github.com/google/eslint-config-google)
- [eslint-config-standard](https://github.com/feross/eslint-config-standard)
- [eslint-config-defaults](https://github.com/walmartlabs/eslint-config-defaults)
- [eslint-config-standard-react](https://github.com/feross/eslint-config-standard-react)

# 问题
## ES7 async/await
- [Support ES7 async/await proposal](https://github.com/eslint/eslint/issues/1657)
- [Use of `babel-eslint`](https://github.com/AtomLinter/linter-eslint/issues/35)

# 参考文献
- [Get Started with ESLint v1.0](http://devnull.guru/get-started-with-eslint/)
- [LT - ESLint Best Practices By Ian VanSchooten](https://youtu.be/L6vMey4FtQ0)
