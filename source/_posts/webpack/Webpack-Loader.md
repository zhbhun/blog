---
title: Webpack 加载器
date: 2016-04-28
category: Webpack
tags: Webpack
---


加载器在webpack中作为资源（不只是javascript，包含其他静态资源）转换器，它本身是个可以运行在node.js环境中的函数。加载器根据参数对源文件进行处理，返回新的源文件，例如：在webpack中使用加载器处理CoffeeScrip和JSX——CoffeeScript是JavaScript的转译语言，JSX是Javascript的超集，都不能直接运行在浏览器中，但加载器会将他们编译成普通的javascript代码。


加载器的特性：


- 加载器可以链接使用——多个加载器作用在一个资源上，按编写顺序使用加载器
- 加载器可以是同步的，也可以是异步的？
- 加载器运行在nodejs环境里，可以做node.js所能做的一切事情——开发 自己的 加载器时，可以体会到
- 加载器可以接受参数，作为加载器的配置来影响加载器对资源的转换
- 加载器可以通过npm来安装和发布——上面提到了加载器本身就是个运行在node.js环境的函数，所以可以作为node.js包发布在npm上
- 加载器可以读取webpack的配置
- 加载器可以结合webpakc的插件使用——插件在后面章节介绍


# 安装加载器
简介中提到了加载器 是 发布在npm上，作为一个模块使用——输出一个转换函数。所以我们可以通过npm来安装管理加载器，例如：
` npm install xxx-loader --save-dev `
或者
` npm install xxx-loader --save `
作为约定，加载器的命名通常为`xxx-loader`——xxx是加载器的名字，例如：json-loader。我们既可以使用`xxx-loader`来引用加载器，也可以直接使用`xxx`。


# 加载器使用
在webpack中使用加载器有三种方式：
1. 直接在require中引用——不推荐
2. 在webpack.config.js中配置——推荐
3. 通过命令选项配置——不推荐

除了一些特殊情况在require中引用加载器外， 我们推荐使用第二种方式来使用加载器——不需要解释，在后面的使用中很容易体会到。


下面简单介绍下这三种方式的用法：
- require
    - 说明：可以在require语句（或者define，require.ensure等等）中指定加载器，加载器名称与模块名称通过`!`分割
    - 实例：
         ```
        require("./loader!./dir/file.txt");
        // => uses the file "loader.js" in the current directory to transform
        //    "file.txt" in the folder "dir".


        require("jade!./template.jade");
        // => uses the "jade-loader" (that is installed from npm to "node_modules")
        //    to transform the file "template.jade"


        require("!style!css!less!bootstrap/less/bootstrap.less");
        // => the file "bootstrap.less" in the folder "less" in the "bootstrap"
        //    module (that is installed from github to "node_modules") is
        //    transformed by the "less-loader". The result is transformed by the
        //    "css-loader" and then by the "style-loader".
         ```
    - 总结：第一个require使用了当前目录下的加载器`./loader.js`；第二个require使用了npm安装的加载器` jade-loader `；第三个加载器使用了加载器的链接特性，首先会使用`less-loader`处理源文件，处理后的源文件交给`css-loader`处理，最后交给`style-loader`——`less-loader`转换less源文件为普通的css文件，`css-loader`处理css文件中的url（由于webpack构建的代码会合并统一放在一个路径下，所以要处理下css引用的资源，否则在实际运行时，无法正确找到资源的位置）， `style-loader`会处理css文件，通过js代码将插入到html页面中
- 配置文件
    - 说明：学习require直接引用加载器后，我们发现很多资源使用的加载器是一样的。webpack提供了配置选项，让我们可以在配置文件中通过正则表达式来匹配资源，指定某一类资源要使用的加载器
    - 实例：
         ```
        {
            module: {
                loaders: [
                    { test: /\.jade$/, loader: "jade" },
                    // => "jade" loader is used for ".jade" files


                    { test: /\.css$/, loader: "style!css" },
                    // => "style" and "css" loader is used for ".css" files
                    // Alternative syntax:
                    { test: /\.css$/, loaders: ["style", "css"] },
                ]
            }
        }
         ```
- 命令行选项
`webpack --module-bind jade --module-bind 'css=style!css'`


## 加载器参数
加载器提供了一些参数来控制加载器对资源的转换，添加参数的方式类似于url链接中的查询参数。
- require
     `require("url-loader?mimetype=image/png!./file.png");`
- 配置


    `{ test: /\.png$/, loader: "url-loader?mimetype=image/png" }`


    或者


    ```
    {
        test: /\.png$/,
        loader: "url-loader",
        query: { mimetype: "image/png" }
    }
    ```


- 命令行选项
     ` webpack --module-bind "png=url-loader?mimetype=image/png" `


# 加载器库
webpack有着丰富的加载器实习，可以参考[list-of-loaders ]( http://webpack.github.io/docs/list-of-loaders.html )来查找你需要的加载器。


autoprefixer-loader
- 简要介绍：Webpack loader for autoprefixer
- GitHub网站: https://github.com/passy/autoprefixer-loader


extract-text-webpack-plugin
- 简要介绍: Extract text from bundle into a file.
- GitHub网站: https://github.com/webpack/extract-text-webpack-plugin
