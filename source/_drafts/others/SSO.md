---
title: 单点登陆
date: 2016-05-17
category: Others
tags: Others
---

# 单点登陆系统
- 系统演变历史：单系统、单模块 ——> 单系统、多模块 ——> 多系统、多模块
- 用户需求：
    - 只需要注册一个账号
    - 一次登陆便可使用多个系统
    - 一次注销所有系统的登陆
- 系统案例
    - 阿里系统：
        - [淘宝](https://www.taobao.com)
        - [天猫](https://www.tmall.com/)
        - [阿里旅行](https://www.alitrip.com/)
    - ...
- 技术难点
    1. 服务器和浏览器端之间的通信协议是无状态协议 HTTP。 —— 使用 Cookie 解决该问题
    2. 无法保证多系统的二级域名一致，Cookie 只适用于单系统。
    3. 多系统实现方式不一样，服务端会话难以共享。

参考文献
- [大型网站的用户登录系统是如何设计的？](https://www.zhihu.com/question/25400195)
    - https://www.zhihu.com/question/25400195/answer/65140805：SSO 技术问题
- [app-sso 实现原来是怎样的？](https://www.zhihu.com/question/22992471)
    - https://www.zhihu.com/question/22992471/answer/65164090
- [《SSO系列专题》之 15分钟让你了解SSO技术到底是个什么鬼！](http://www.imooc.com/article/3555)
