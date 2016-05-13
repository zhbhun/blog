---
title: Jekyll 使用教程
date: 2016-01-30
categories: Blog
tags: Blog
---

Jekyll 是一个简单的博客形态的静态站点生产机器。它有一个模版目录，其中包含原始文本格式的文档，通过一个转换器（如 Markdown）和我们的 Liquid 渲染器转化成一个完整的可发布的静态网站，你可以发布在任何你喜爱的服务器上。Jekyll 也可以运行在 GitHub Page 上，也就是说，你可以使用 GitHub 的服务来搭建你的项目页面、博客或者网站，而且是完全免费的。

- 官方网站：https://jekyllrb.com/
- 中文网站：http://jekyllcn.com/

# 1 安装
1. 安装 Ruby，RubyGems，NodeJS
2. 安装 Jekyll （选择以下一种方式安装）
    - 默认安装：`gem install jekyll`
    - 安装预览版：`gem install jekyll --pre`
    - 安装指定版本：`gem install jekyll -v '2.0.0.alpha.1'`
3. DONE

常见问题：
1. Error installing Jekyll, requires Ruby >= 2.0.0
    Jekyll 3 需要安装 ruby 2.0.0 以上版本，也可以选择安装 Jekyll 2
2. `ERROR: Could not find a valid gem ‘jekyll’ (>= 0)`
    配置 [RubyGems 镜像 - 淘宝网](https://ruby.taobao.org/)
3. `Error Installing Jekyll - Native Extension Build`
    需要安装 ruby-dev

参考文献
- 「中文翻译官方文档」安装说明：http://jekyllcn.com/docs/installation/
- 「中文翻译官方文档」安装问题：http://jekyllcn.com/docs/troubleshooting/#section
- Window Jekyll 安装文档：http://jekyllcn.com/docs/windows/#installation


# 2 使用
## 2.1 简单示例
以下是一个获取最简单 Jekyll 模板并生成静态页面并运行的例子

```
~ $ jekyll new myblog
~ $ cd myblog
~/myblog $ jekyll serve
# => Now browse to http://localhost:4000
```

如果你希望把 jekyll 安装到当前目录，你可以运行 jekyll new . 来代替。
从现在开始，你可以通过创建文章、改变头信息来控制模板和输出、修改 Jekyll 设置来使你的站点变得更有趣～

## 2.2 目录结构
上一节「简单示例」创建的了一个基本的 Jekyll 网站，其目录结构如下（本文中的示例使用的 Jekyll 版本为 3.1.1）：

```
├── css
|   └── main.scss
├── _includes
|   ├── footer.html
|   ├── head.html
|   ├── header.html
|   ├── icon-github.html
|   ├── icon-github.svg
|   ├── icon-twitter.html
|   └── icon-twitter.svg
├── _layouts
|   ├── default.html
|   ├── page.html
|   └── post.html
├── _posts
|   └── 2016-01-30-welcome-to-jekyll.markdown
├── _sass
|   ├── _base.scss
|   ├── _layout.scss
|   └── _syntax-highlighting.scss
├── _site
├── about.md
├── _config.yml
├── feed.xml
├── index.html
└── .gitignore
```

- 「中文翻译官方文档」目录结构：http://jekyllcn.com/docs/structure/

## 2.3 命令用法
- 「中文翻译官方文档」基本用法：http://jekyllcn.com/docs/usage/

## 2.4 配置详解
- 「中文翻译官方文档」配置：http://jekyllcn.com/docs/configuration/


## 2.5 代码高亮
- [Pygments](http://pygments.org/)
- [Rouge](https://github.com/jayferd/rouge)
- https://highlightjs.org/

参考
- https://ruby-china.org/topics/6168
- http://www.2cto.com/kf/201602/489968.html?WebShieldDRSessionVerify=vkmObdvSqallVLhR9mNh


## 2.6 永久链接
自定义文章的地址：http://jekyllcn.com/docs/permalinks/


## 2.7 博客目录
- [为Jekyll博客添加目录与ScrollSpy效果](http://t.hengwei.me/post/%E4%B8%BAjekyll%E5%8D%9A%E5%AE%A2%E6%B7%BB%E5%8A%A0%E7%9B%AE%E5%BD%95%E4%B8%8Escrollspy%E6%95%88%E6%9E%9C/)
- jekyll-table-of-contents: https://github.com/ghiculescu/jekyll-table-of-contents



# 3 主题
http://jekyllthemes.org/

# 4 案例
- bootstrap：https://github.com/twbs/bootstrap

# 5 其他
- [octopress](https://github.com/imathis/octopress)
- [jekyllbootstrap](http://jekyllbootstrap.com/)
- [jekyll-now](https://github.com/barryclark/jekyll-now)
- [poole/poole](https://github.com/poole/poole)
- [poole/hyde](https://github.com/poole/hyde)
- [poole/lanyon](https://github.com/poole/lanyon)
- [octopress/octopress](https://github.com/octopress/octopress)
- [restcookbook/restcookbook](https://github.com/restcookbook/restcookbook)
- [kippt/jekyll-incorporated](https://github.com/kippt/jekyll-incorporated)
- https://github.com/search?o=desc&p=2&q=jekyll&s=stars&type=Repositories&utf8=%E2%9C%93


# 6 问题
- http://jekyllcn.com/docs/troubleshooting/

# 7 参考
- [搭建一个免费的，无限流量的Blog----github Pages和Jekyll入门](http://www.ruanyifeng.com/blog/2012/08/blogging_with_jekyll.html)
- [用Jekyll写博客的工具套装](http://www.tuicool.com/articles/3QN3AfJ)
- [Jekyll使用篇 1 - 发布文章、加入评论功能、加入Google Analytics](http://www.tuicool.com/articles/An2aUzE)
- [Jekyll search组件](http://www.tuicool.com/articles/qINVbq)
- [用 Jekyll + Github 建立静态站点](http://www.tuicool.com/articles/aYzaIr)
- [Github、Jekyll 搭建及优化静态博客方法指南](http://www.tuicool.com/articles/N3Efei6)
- http://www.tuicool.com/articles/IFnM3i
- [拥抱Jekyll的新方式](http://www.tuicool.com/articles/6bUFryV)
- [在GitHub Pages中安装并使用jekyll](http://www.tuicool.com/articles/3mYbMz)
- http://www.tuicool.com/articles/feiu2im
- http://www.tuicool.com/articles/yAnUrq
- http://www.tuicool.com/articles/ZfMRr2
- http://www.tuicool.com/articles/ZvyQvy6
- [Writing on GitHub Pages and Jekyll using Markdown](https://milanaryal.com/2015/writing-on-github-pages-and-jekyll-using-markdown/)
- https://github.com/minixalpha/StrayBirds
- [jekyll kramdown 语法高亮配置](http://noyobo.com/2014/10/19/jekyll-kramdown-highlight.html)
- [Writing on GitHub Pages and Jekyll using Markdown](https://milanaryal.com/2015/writing-on-github-pages-and-jekyll-using-markdown/)
- http://ajoz.github.io/2014/06/29/i-want-my-github-flavored-markdown/
- [Kramdown Support for Jekyll](http://jason.the-graham.com/2010/11/21/kramdown_support_for_jekyll/)
- https://github.com/blog/2100-github-pages-now-faster-and-simpler-with-jekyll-3-0
- [Github+Jekyll（免费建站）](https://www.douban.com/group/431117/)
- http://www.360doc.com/content/12/0801/09/21412_227595308.shtml
- [Jekyll博客系统初探(持续更新中...)](http://www.jianshu.com/p/558a5d50e077)
- [采用Jekyll + github + pygments构建个人博客的最终说明](http://www.jianshu.com/p/609e1197754c)

# 8 问题
1.redcarpet 的 with_toc_data 与中文存在兼容性问题
    - [with_toc_data with Japanese](https://github.com/vmg/redcarpet/issues/538)
    - [Supplement the template.md of Chinese docs.](https://github.com/mozilla/nunjucks/pull/658)
