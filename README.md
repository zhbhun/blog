## 项目

### 个人项目

- [Webpack Study Demo](https://github.com/zhbhun/WebpackStudyDemo)：Webpack 早期(1/2.x)学习笔记和示例。

    2014 年的时候，公司技术负责人考虑把前端开发框架从 Ext.js 转向 React。而我在其中主要负责做相关的技术调研，当时前端模块化还比较流行使用 AMD（require.js），我基于 require.js 初步搭建好了 react 开发脚手架。有一天，技术 Leader 说我们转用 Webpack 吧，而我刚把基于 require.js 搭建好的脚手架投入到项目中使用，心里充满了成就感，前端代码做好了模块拆分，有条不紊的交给 require.js 加载，当时心里还有点抗拒。后面在转去调研 webpack 过程中，被 webpack 的模块化、热更新和拆包技术给闪瞎眼了，特别是当时 Redux 作者 Dan Abramov 基于 webpack 实现了 React 组件的热更新，对前端开发者的开发效率带来了较大的提升。
    
    在调研和使用 webpack 的过程中，要理解不少新的概念和配置，当时还是 1.x 版本，缺乏相关的中文教程文档，而且官方文档很多说明还不够友好。因此，就将学习过程中的测试 demo 和笔记整理成一个开源项目放在 github 上了，当时还因此收到了一些邮件感谢信，这对我后续的前端编程学习之路带来了强大的动力，也因为自己有前端打包和工程化建设的基础，后来去美柚才有机会去帮助团队做好前端工程化的建设。

- [easepack](https://github.com/zhbhun/easepack/tree/feature/5)：前端通用打包工具

    easepack 是 webpack 封装的打包工具，其配置思想借鉴了 babel preset 模式，即 preset 是一些列插件和加载器的集合，这样可以方便开发者快速复用现有的配置。

- [react-native-intersection-observer](https://github.com/zhbhun/react-native-intersection-observer)：适用于 react native 的 intersection observer 组件。

    参照了 H5 Intersection Observer API 实现了 RN 版本的组件， 主要用于项目中实现懒加载和曝光埋点上报。

- [eaxios](https://github.com/zhbhun/eaxios)：前端 HTTP 请求库

    exaios 基于 axios 封装，实现更易使用的响应结果和错误处理，以及 TS 类型推导。

- [inline-css-cache](https://github.com/zhbhun/inline-css-cache)：内联样式缓存

    在 HTML 中使用内联样式可以提升首屏渲染速度，但是内联样式增加了 HTML 的大小，失去了缓存优势，这个库的作用就是缓存 HTML 中的内联样式。

- [Android Solitaire](https://github.com/zhbhun/AndroidSolitaire)：Android 纸牌游戏

    在学校自学 Android 开发的一个小游戏，后来没有从事客户端开发，当时作为开源项目和教程，收到了一些社区的鼓励反馈和其他网站的收录。

### 组织项目

- [standard](https://github.com/openeagle/standard)：前端编码规范

    基于 commitlint、eslint、stylelint 和 prettier 配置的一套前端编码规范

- [mocker](https://github.com/openeagle/mocker)：接口模拟工具

    以 Node.js 中间件的形式提供接口模拟数据，支持本地自定义、接口文档和反向代理。

- [antd-vue](https://github.com/openeagle/antd-vue)：基于 vue3, ant-design 封装的中后台开发框架

    抽象封装了后台常用的一些业务组件，可以较大的提升开发者的中后台开发效率。

- [moble](https://github.com/openeagle/mobile)：移动端 H5 开发框架

    抽象封装好了 H5 常用的一些业务组件。

- [polyfill](https://github.com/openeagle/polyfill)：移动端 H5 polyfill 库

    主要针对 H5 环境提供的 polyfill 库。

- [semantic-release-template](https://github.com/openeagle/semantic-release-template)：npm 包版本语义化自动发布模板

    基于 semantic-release 和 github action 的 npm 包自动发布模板。

- [vue-component-template](https://github.com/openeagle/vue-component-template)：vue3 组件开发模板
- [wechat-webview](https://github.com/openeagle/wechat-webview)：支持通信的小程序 webview 组件

    用于解决旧 H5 项目迁移小程序时跨页面通信问题。

- [miniprogram-webpack-plugin](https://github.com/openeagle/miniprogram-webpack-plugin)：小程序 webpack 插件

    支持自动打开小程序开发者工具和打包上传。

- [uniapp-using-component-webpack-plugin](https://github.com/openeagle/uniapp-using-component-webpack-plugin)：uni-app 集成小程序原生组件的 webpack 插件

### 开源贡献

- [fix(useTouch): fix wrong ternary expressio](https://github.com/youzan/vant/pull/10426) （2022.03.23）

    优化 vant 滚动穿透处理时的用户拖拽方向判断逻辑

- [resolveNextVersion should provide bumpStrategy instead of releaseStrategy](https://github.com/dhoulb/multi-semantic-release/pull/69) (2021.07.08)

    解决 multi-semantic-release 版本升级策略错误的 bug

- [fix(packages/next-polyfill-nomodule): url-polyfill is replaced by cor…](https://github.com/vercel/next.js/pull/12764) (2022.05.12)

    虽然发现并解决 url-polyfill 的问题，但因为我采用 core-js 导致打包体积增加，最终 review 的人最后还是采纳了 url-polyfill 的修复版本。

- [fix javascript "CaptureConsole" wrong title level](https://github.com/getsentry/sentry-docs/pull/1301) (2019.10.29)

    修复 Sentry 官方文档上的一些问题。

- [[WIP]: webpack 4 support ](https://github.com/asfktz/autodll-webpack-plugin/pull/106#issuecomment-386800231) (2018.06.02)

    项目使用了 autodll-webpack-plugin 插件，但是 webpack 4 支持有问题，而对应维护的人员一直没有进展，在这个问题上主要参与讨论解决方案，后续 fork 了一个版本先临时解决了问题。

## 笔记&文章

### 2022

- [TailwindCSS](https://github.com/zhbhun/frontend-learning/blob/b94e3a41db/language/css/framework/tailwindcss/README.md) （2022.04.12）
- [JavaScript Polyfill](https://github.com/zhbhun/frontend-learning/blob/b94e3a41db/language/javascript/tutorial/polyfill/README.md) （2022.04.22）

### 2021

- [Eaxios - 更容易处理响应的网络请求库](https://segmentfault.com/a/1190000039280426) （2021.02.25）

### 2020

- [屏幕适配](https://github.com/zhbhun/frontend-learning/blob/b94e3a41db/thinking/screen/README.md) （2020.12.17）
- [Reacct Native 技术介绍](https://github.com/zhbhun/frontend-learning/tree/b94e3a41db/framework/native/react-native/tutorial/share/README.md) （2020.09.02）
- [CI&CD](https://github.com/zhbhun/frontend-learning/tree/b94e3a41db/tutorials/ci) （2020.09.02）

### 2019

- [异常处理机制](https://github.com/zhbhun/frontend-learning/blob/b94e3a41db/language/javascript/tutorial/practice/error/README.md) （2019.09.18）
- [错误监控](https://github.com/zhbhun/frontend-learning/blob/b94e3a41db/tutorials/monitor/error/README.md) （2019.08.27）
- [Docker](https://github.com/zhbhun/frontend-learning/blob/b94e3a41db/tutorials/container/docker/README.md) （2019.08.27）
- [JavaScript 代码压缩优化](https://github.com/zhbhun/frontend-learning/blob/b94e3a41db/tutorials/performance/optimize/javascript-compression/README.md) （2019.06.26）
- [前端性能指标](https://github.com/zhbhun/frontend-learning/blob/b94e3a41db/tutorials/performance/metrics/README.md) （2019.05.05）
- [浏览器工作原理](https://github.com/zhbhun/frontend-learning/blob/b94e3a41db/tutorials/performance/principle/README.md) （2019.05.05）
- [Script](https://github.com/zhbhun/frontend-learning/blob/b94e3a41db/language/html/tutorials/elements/embedded/script/README.md) （2019.05.05）
- [定位](https://github.com/zhbhun/frontend-learning/blob/b94e3a41db/language/javascript/tutorial/browser/geolocation/README.md) （2019.05.05）
- [Performance API](https://github.com/zhbhun/frontend-learning/blob/b94e3a41db/language/javascript/tutorial/browser/performance/README.md) （2019.05.05）
- [前端常见问题-长按弹出菜单](https://github.com/zhbhun/frontend-learning/blob/b94e3a41db/issues/longpress-menu/README.md) （2019.05.05）
- [Ajax](https://github.com/zhbhun/frontend-learning/blob/9a1781af941362524a7d1735bd523ef51275aac5/language/javascript/tutorial/browser/network/ajax/README.md) （2019.05.05）

### 2018

- [前端常见问题——安卓文本无法垂直居中](https://segmentfault.com/a/1190000017088168) （2018.11.21）
- [前端常见问题——Canvas 图片跨域](https://segmentfault.com/a/1190000016423028) （2018.09.17）
- [前端常见问题——一像素显示](https://segmentfault.com/a/1190000016116868) （2018.08.23）

### 2016

- [React 兼容性](https://zhbhun.github.io/blog/react/React-Compatibility/#more) （2016.05.13）
