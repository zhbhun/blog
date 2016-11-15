---
title: HTML 浏览器识别
date: 2016-05-12
categories: HTML
tags: HTML
---

# 项目示例
## React-IE
https://github.com/zhbhun/program-demo/blob/master/react/react-ie/index.html
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <title>Document</title>
</head>
<body>
  <!--[if lt IE 9]>
    <script type="text/javascripts" src="vendor/console-polyfill.0.2.1.js"></script>
    <script type="text/javascript" src="vendor/es5-shim.4.3.1.min.js"></script>
    <script type="text/javascript" src="vendor/es5-sham.4.3.1.min.js"></script>
    <script type="text/javascript" src="vendor/html5shiv.3.7.2.min.js"></script>
  <![endif]-->
  <!--[if IE]>
    <script type="text/javascript" src="vendor/es6-promise.min.js"></script>
  <![endif]-->
  <!--[if lte IE 9]>
    <script type="text/javascript" src="vendor/fetch-ie8.js"></script>
  <![endif]-->
  <!--[if gte IE 10]>
    <script type="text/javascript" src="vendor/fetch.js"></script>
  <![endif]-->
  <div id="app"></div>
  <!--[if lte IE 8]>
    <script type="text/javascript" src="dist/ie8/bundle.js"></script>
  <![endif]-->
  <!--[if ((gt IE 8))|(!IE)]><-->
    <script type="text/javascript" src="dist/bundle.js"></script>
  <!--<![endif]-->
</body>
</html>
```

# 参考文献
- [How to Target IE6, IE7, IE8, IE9, IE10 and IE11](http://www.realcombiz.com/2014/10/how-to-target-ie6-ie7-ie8-ie9-ie10-and.html)
- [条件注释判断浏览器版本](http://www.cnblogs.com/thinkingthigh/archive/2013/06/19/3144239.html)
- [条件注释区分非IE浏览器](http://www.cnblogs.com/sohighthesky/archive/2010/03/05/1679379.html)
