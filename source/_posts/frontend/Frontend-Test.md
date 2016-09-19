---
title: 前端测试
date: 2016-05-28
categories: Frontend
tags: Frontend
---

# 测试范围
- 单元测试：测试逻辑性强的代码
- 界面测试：测试界面是否正常
- 功能测试：测试功能操作是否正常，利用测试运行器来模拟用户操作
- 性能测试：Phantomas
- 页面特征检测：
    - 移动端大图素材检测
    - 页面区块静态资源是否符合预期
    - 广告部署检测
- 兼容性测试：selenium，dalekjs

备注：测试金字塔，单元测试 -> 服务测试 -> UI 测试

# 测试原则
1. 针对网站核心功能而不是所有功能来添加case
2. ...

# 测试方案
- 单元测试：使用测试框架和断言来实现单元测试
- 界面测试：常见的做法有像素对比和dom结构对比两个方向 —— PhantomCSS 和 page-monitor
- 功能测试：使用测试运行器模拟环境和用户操作来实现功能测试
- 性能测试：？

# 测试工具
## 框架
- [mocha](https://github.com/mochajs/mocha)：适用于 node.js 和浏览器、简易、灵活、有趣的 JavaScript 测试框架。
- [jasmine](https://github.com/jasmine/jasmine)：简单无 DOM 的 JavaScript 测试框架。
- [qunit](https://github.com/jquery/qunit)：一个易于使用的 JavaScript 单元测试框架。
- [jest](https://github.com/facebook/jest)：简单的 JavaScript 单元测试框架。
- [prova](https://github.com/azer/prova)：基于 Tape 和 Browserify 的测试运行器，它适用于 Node & 浏览器。
- [DalekJS](https://github.com/dalekjs/dalek)：自动化且跨浏览器的 JavaScript 功能测试框架。

## 断言
- [chai](https://github.com/chaijs/chai)：适用于 node.js 和浏览器的 BDD / TDD 断言框架，并能搭配其它测试框架使用。
- [Sinon.JS](https://github.com/sinonjs/sinon)：对 JavaScript 进行 spies、stubs 和 mock 测试。
- [expect.js](https://github.com/Automattic/expect.js)：简约的、适用于 Node.js 和浏览器端的 BDD 式断言工具。
- [should.js](https://github.com/tj/should.js)：适用于 Node.js 的 BDD 式断言工具。

## 覆盖率
- [istanbul](https://github.com/gotwarlost/istanbul)：另一个 JS 代码覆盖率检测工具。
- [blanket](https://github.com/alex-seville/blanket)：一个简单的代码覆盖率检测库。它的设计理念是易于安装和使用，且可用于浏览器端和 node.js。
- [JSCover](https://github.com/tntim96/JSCover)：JSCover 是一个检测 JavaScript 程序代码覆盖率的工具。

## 运行器
- [phantomjs](https://github.com/ariya/phantomjs)：脚本化的 Headless WebKit。
- [slimerjs](https://github.com/laurentj/slimerjs)：一个内核为 Gecko 的类似 PhantomJS 工具。
- [casperjs](https://github.com/n1k0/casperjs)：基于 PhantomJS 和 Slimer JS 的导航脚本和测试工具。
- [zombie](https://github.com/assaf/zombie)：基于 node.js 、快速、全栈且无图形界面的浏览器的测试工具。
- [totoro](https://github.com/totorojs/totoro)：一个简单可靠且能跨浏览器运行的测试工具。
- [karma](https://github.com/karma-runner/karma)：一个优秀的的 JavaScript 测试运行器。
- [nightwatch](https://github.com/nightwatchjs/nightwatch)：基于 node.js 和 selenium webdriver 的图形界面自动化测试框架。
- [intern](https://github.com/theintern/intern)：下一代 JavaScript 代码测试栈。
- [yolpo](http://www.yolpo.com/)：在浏览器逐句执行的 JavaScript 解释器。

## 辅助
- https://github.com/Huddle/PhantomCSS
- https://github.com/fouber/page-monitor

# 持续集成
- jenkin
- http://wercker.com/
- https://semaphoreci.com/
- https://codeship.com
- https://circleci.com/

# 问题
- 什么是单元测试，运用场景？
- 什么是自动化测试，运用场景？

# 参考文献
- [前端自动化测试探索](http://fex.baidu.com/blog/2015/07/front-end-test/)
- http://rupl.github.io/frontend-testing/
- https://www.phase2technology.com/blog/css-testing-with-phantomcss-phantomjs-casperjs-and-grunt/
- http://blog.nodejitsu.com/npmawesome-page-metrics-with-phantomas/
- http://fideloper.com/ubuntu-beanstalkd-and-laravel4
- http://www.yegor256.com/2014/10/05/ten-hosted-continuous-integration-services.html
- [自动化测试的成本高效果差，那么自动化测试的意义在哪呢](http://www.zhihu.com/question/19786019)
- [如何进行前端自动化测试？](https://www.zhihu.com/question/29922082)
- [javascript单元测试](http://www.cnblogs.com/frostbelt/archive/2012/08/03/2622302.html)
- [Jest vs. Mocha: Why Jest Wins](http://andrew.codes/jest-vs-mocha-why-jest-wins/)
- [大家写 js 都用什么测试框架？](https://www.v2ex.com/t/266660)
- https://www.awesomes.cn/repos/Applications/testings
- http://www.ruanyifeng.com/blog/2015/12/a-mocha-tutorial-of-examples.html
- [GUI软件测试](http://baike.baidu.com/view/5131653.htm)
- [7 天打造前端性能监控系统](http://fex.baidu.com/blog/2014/05/build-performance-monitor-in-7-days/)
- [如何编写测试](http://growth.phodal.com/#如何编写测试)
- [Coding-Guide](https://github.com/ecmadao/Coding-Guide/blob/master/Notes/UnitTest/%E5%89%8D%E7%AB%AF%E5%8D%95%E5%85%83%E6%B5%8B%E8%AF%95%E6%8E%A2%E7%B4%A2.md)
