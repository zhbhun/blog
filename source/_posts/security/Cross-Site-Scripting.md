---
title: 跨站脚本攻击
date: 2016-08-03
category: Security
tags: Security
---

什么是跨站脚本？

> 跨站脚本（Cross-site scripting，通常简称为XSS）是一种网站应用程序的安全漏洞攻击，是代码注入的一种。它允许恶意用户将代码注入到网页上，其他用户在观看网页时就会受到影响。 —— 摘自《维基百科》

# 危害
- 盗取信息
    - 盗用 cookie，获取敏感信息；
    - 键盘监听
    - 伪造表单
- 恶意操作
    - 利用可被攻击的域受到其他域信任的特点，以受信任来源的身份请求一些平时不允许的操作，如进行不当的投票活动；
    - 利用 iframe、frame、XMLHttpRequest 或上述 Flash 等方式，以（被攻击）用户的身份执行一些管理动作，或执行一些一般的如发微博、加好友、发私信等操作；
    - 在访问量极大的一些页面上的XSS可以攻击一些小型网站，实现 DDoS 攻击的效果；
- 越权
    - 利用植入Flash，通过 crossdomain 权限设置进一步获取更高权限；

# 方式
按照 XSS 来源，可以将 XSS 攻击方式分为三类：

- Persistent XSS：恶意代码来自数据库
- Reflected XSS：恶意代码来自受害者请求
- DOM-based XSS：客户端代码漏洞

可能存在 XSS 的标签或属性

- script
- 事件属性
- 链接 href
- iframe src
- image src
- ...

# 防御
防御 XSS 攻击的方法如下：

- 禁用浏览器脚本；
- 将重要的 cookie 标记为 http only；
- 使用 HTTP 头指定类型；
- 转义
    - PHP：htmlentities()，htmlspecialchars()；
    - Python：cgi.escape()；
    - ASP：Server.HTMLEncode；
    - ASP.NET：Server.HtmlEncode()，Microsoft Anti-Cross Site Scripting Library；
    - Java：xssprotect (Open Source Library)；
    - Node.js：node-validator；
- 验证
    - 检查用户输入数据类型和规则；
    - 过滤或移除特殊的 HTML 标签；
    - 过滤 JavaScript 事件的标签；

根据XSS 攻击方法的不同，要采用不同的方法防御，具体防御策略如下：

- 普通文本参数：有业务需要的话，做些正则表达式验证，例如：昵称使用正则表达式验证，只能包含特定字符，并且显示的时候需要转义
- 多行文本参数：显示时转义
- 富文本参数：过滤危险标签(使用白名单)，显示时转义
- coolie：http only

备注：显示可能在服务端渲染，也可能在客户端渲染，根据具体程序语言做相应处理。

疑问：存储数据前转义 VS 显示前转义？

存储数据前转义，显示就不需要再转义，但这样数据库的数据不是用户真实输入的数据，不便于移植（例如，将数据导出到 CSV）。并且如果需要重新编辑转义数据的化，还需要反转义。

此外，存储数据前转义只能防御 Persistent XSS 漏洞，要避免 Reflected XSS 和 DOM-based XSS，还是要做显示前转义。

# 测试

# Java
转义

- [StringEscapeUtils.escapeHtml()](http://commons.apache.org/lang/api-2.6/org/apache/commons/lang/StringEscapeUtils.html#escapeHtml%28java.lang.String%29)
- [HtmlUtils.htmlEscape()](http://static.springsource.org/spring/docs/3.0.x/javadoc-api/org/springframework/web/util/HtmlUtils.html#htmlEscape%28java.lang.String%29)
- [JSTL <c:out> ](http://stackoverflow.com/questions/2658922/xss-prevention-in-jsp-servlet-web-application)
- [EL fn:escapeXml()](http://docs.oracle.com/javaee/5/jstl/1.1/docs/tlddocs/fn/escapeXml.fn.html)

过滤

- [Sanitize untrusted HTML (to prevent XSS)](https://jsoup.org/cookbook/cleaning-html/whitelist-sanitizer)
- [remark](http://remark.overzealous.com/manual/usage.html)
- [xssprotect](https://code.google.com/archive/p/xssprotect/)
- [java-html-sanitizer](https://github.com/OWASP/java-html-sanitizer)
- [xss-html-filter](https://github.com/finn-no/xss-html-filter)

参考文献

- [XSS prevention in JSP/Servlet web application](http://stackoverflow.com/questions/2658922/xss-prevention-in-jsp-servlet-web-application)：如何在 JSP 中应对 XSS 攻击。
- [How to avoid apps from XSS attacks?](http://stackoverflow.com/questions/5769847/how-to-avoid-apps-from-xss-attacks)
- [I'm looking for a Java HTML encoder [closed]](http://stackoverflow.com/questions/7505387/im-looking-for-a-java-html-encoder)
- [Stripping HTML tags in Java](http://stackoverflow.com/questions/832620/stripping-html-tags-in-java)

# JavaScript/Node.js
- React：自带
- JQuery
    - [HTML-encoding in JavaScript/jQuery](http://stackoverflow.com/questions/1219860/html-encoding-in-javascript-jquery)

TODO

- [H5SC](https://github.com/cure53/H5SC)
- [js-xss](https://github.com/leizongmin/js-xss)
- [DOMPurify](https://github.com/cure53/DOMPurify)
- [sleepy-puppy](https://github.com/Netflix/sleepy-puppy)
- [XSSChallengeWiki](https://github.com/cure53/XSSChallengeWiki/wiki)
- [xsscrapy](https://github.com/DanMcInerney/xsscrapy)
- [xss-filters](https://github.com/yahoo/xss-filters)
- [xsschef](https://github.com/koto/xsschef)
- [BlueLotus_XSSReceiver](https://github.com/firesunCN/BlueLotus_XSSReceiver)

# 参考文献
- [Excess XSS](http://excess-xss.com/)：XSS 研究

- [Google XSS challenge](https://xss-game.appspot.com/)：XSS 攻击游戏
- [Google XSS challenge solutions..](https://gist.github.com/pbssubhash/2f99644a4f24e8fe6b3e)

- [Web安全测试之XSS](http://www.cnblogs.com/TankXiao/archive/2012/03/21/2337194.html)：XSS 介绍和防御

- [Cross-site Scripting (XSS)](https://www.owasp.org/index.php/Cross-site_Scripting_(XSS))
- [OWASP XSS (Cross Site Scripting) Prevention Cheat Sheet](https://www.owasp.org/index.php/XSS_%28Cross_Site_Scripting%29_Prevention_Cheat_Sheet)：XSS 攻击防御备忘单

- [Cross-site Scripting (XSS) Attack](http://www.acunetix.com/websitesecurity/cross-site-scripting/)
- [The Cross-Site Scripting (XSS) FAQ](http://www.cgisecurity.com/xss-faq.html)
- [关于XSS（跨站脚本攻击）和CSRF（跨站请求伪造）](https://cnodejs.org/topic/50463565329c5139760c34a1)：实战介绍 XSS 攻击
- [An XSS on Facebook via PNGs & Wonky Content Types](https://whitton.io/articles/xss-on-facebook-via-png-content-types/)
- [XSS的原理分析与解剖](http://www.freebuf.com/articles/web/40520.html)
- [Cross-site scripting](https://www.google.com/about/appsecurity/learning/xss/index.html)

# TODO
- [xssValidator](https://github.com/nVisium/xssValidator)
- [coverity-security-library](https://github.com/coverity/coverity-security-library)
