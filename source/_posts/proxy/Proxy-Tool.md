---
title: 代理工具
date: 2016-08-03
category: Proxy
tags: Proxy
---

| 名称 | 兼容性 | 协议 | 替换 | 审查 |
| --- | --- | --- |
| [NProxy](https://github.com/goddyZhao/nproxy) | Window, Linux, Mac | HTTP, HTTPS | 单文件, 组合文件, 目录 | 不支持 |
| [Fiddler](http://www.telerik.com/fiddler) | Window, Mac | HTTP, HTTPS | 单文件 | 支持 |
| [Charles](https://www.charlesproxy.com/) | Window, Mac, Linux | HTTP, HTTPS | 单文件 | 支持 |
| [Rythem](https://github.com/AlloyTeam/Rythem) | Window, Mac | HTTP | 单文件, 目录 | 支持 |
| [Tinyproxy](https://tinyproxy.github.io/) | Mac, Linux | HTTP, HTTPS | 不支持 | 支持 |

备注
- 单文件/single file：单个文件替换
- 组合文件/combo file：多个文件合并为一个文件的替换
- 目录

# NProxy
1. 安装：`npm install -g nproxy`
2. 配置：[模板文件](https://github.com/goddyzhao/nproxy/blob/master/replace-rule.sample.js)
3. 启动：`nproxy -l replace_rule.js`
4. [浏览器设置](https://github.com/goddyZhao/nproxy/wiki/How-to-set-browser's-proxy)
5. 参考文献
    - [前端调试利器---nproxy](http://www.cnblogs.com/wenber/p/3893308.html)
    - [NProxy——Mac和Linux平台下的Fiddler](http://koda.iteye.com/blog/1772504)


# Fiddler
1. 准备：`sudo apt-get install mono-mcs`
2. 下载： http://fiddler.wikidot.com/mono
3. 启动：`mono Fiddler.exe`

参考文献
- http://fiddler.wikidot.com/mono
- [Fiddler 在 linux/OSx 下的替代品?](https://segmentfault.com/q/1010000000094520)
- [What alternatives are there to Fiddler debugging proxy?](http://askubuntu.com/questions/175306/what-alternatives-are-there-to-fiddler-debugging-proxy)
- http://alternativeto.net/software/fiddler/?platform=linux


# Paros
- [工具介绍——Paros使用简介](http://www.51testing.com/html/37/n-111337.html)
