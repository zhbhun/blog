---
title: 正则表达式
date: 2016-05-16
category: Others
tags: Others
---

# 参考手册
## 元字符
- .： 匹配除换行符以外的任意字符
- \w： 匹配字母或数字或下划线或汉字
- \s： 匹配任意的空白符
- \d： 匹配数字
- \b： 匹配单词的开始或结束
- ^： 匹配字符串的开始
- $： 匹配字符串的结束
- \W：匹配任意不是字母，数字，下划线，汉字的字符
- \S：匹配任意不是空白符的字符
- \D：匹配任意非数字的字符
- \B：匹配不是单词开头或结束的位置
- [^x]：匹配除了x以外的任意字符，例如：<a[^>]+>匹配用尖括号括起来的以a开头的字符串
- [^aeiou]：匹配除了aeiou这几个字母以外的任意字符

## 限定符
- `*`： 重复零次或更多次
- `+`： 重复一次或更多次
- `?`： 重复零次或一次
- `{n}`： 重复n次
- `{n,}`： 重复n次或更多次
- `{n,m}`： 重复n到m次

## 字符类
元字符预定义了一些常用的字符集合，如\w。如果要匹配没有预定义元字符的字符集合(比如元音字母a,e,i,o,u)，可以使用方括号来自定义，如[aeiou]]可以匹配任何一个英文元音字母。其他常见自定义字符集如下所示：
- [.?!]： 匹配标点符号(.或?或!)
- [0-9]：代表的含意与\d就是完全一致的
- [a-z0-9A-Z_]：完全等同于\w（如果只考虑英文的话）

## 分支条件
正则表达式里的分枝条件指的是有几种规则，如果满足其中任意一种规则都应该当成匹配，具体方法是用|把不同的规则分隔开。例如：0\d{2}-\d{8}|0\d{3}-\d{7}这个表达式能匹配两种以连字号分隔的电话号码：一种是三位区号，8位本地号(如010-12345678)，一种是4位区号，7位本地号(0376-2233445)。
使用分枝条件时，要注意各个条件的顺序，匹配分枝条件时，将会从左到右地测试每个条件，如果满足了某个分枝的话，就不会去再管其它的条件了。

## 分组/子表达式
在使用限定符来重复字符时，只能针对单个字符。如果需要重复多个字符需要使用分组（子表达式），分组使用小括号来指定。例如：(\d{1,3}\.){3}\d{1,3}是一个简单的IP地址匹配表达式。
**注意点**
-  使用小括号指定一个子表达式后，匹配这个子表达式的文本(也就是此分组捕获的内容)可以在表达式或其它程序中作进一步的处理。
-  默认情况下，每个分组会自动拥有一个组号，规则是：从左向右，以分组的左括号为标志，第一个出现的分组的组号为1，第二个为2，以此类推。

**向后引用**
用于重复搜索前面某个分组匹配的文本， 例如： \b(\w+)\b\s+\1\b可以用来匹配重复的单词，像go go, 或者kitty kitty。

**常用分组语法**
- 捕获
    - (exp)    匹配exp,并捕获文本到自动命名的组里
    - (?<name>exp)    匹配exp,并捕获文本到名称为name的组里，也可以写成(?'name'exp)
    - (?:exp)    匹配exp,不捕获匹配的文本，也不给此分组分配组号
- 零宽断言
    - (?=exp)    匹配exp前面的位置
    - (?<=exp)    匹配exp后面的位置
    - (?!exp)    匹配后面跟的不是exp的位置
    - `(?<!exp)`    匹配前面不是exp的位置
-注释
    -(?#comment)    这种类型的分组不对正则表达式的处理产生任何影响，用于提供注释让人阅读

## 字符转义
\

---

# 应用
## 数字校验
``` javascript
/^[0-9]*$/; // 数字


```

``` javascript
/[\u4e00-\u9fa5]/; // 中文字符
/[^\x00-\xff]/; // 双字节字符(包括汉字在内)
/\n\s*\r/; // 空白行
/[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/; // Email 地址
/[a-zA-z]+://[^\s]*/; // URL
/\d{3}-\d{8}|\d{4}-\{7,8}/; // 国内电话号码
/[1-9][0-9]{4,}/; // QQ
/[1-9]\d{5}(?!\d)/; // 中国邮政编码
/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/; // 18位身份证号
/([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8])))/; // (年-月-日)格式日期
/^[1-9]\d*$/; // 正整数
/^-[1-9]\d*$/; // 负整数
/^-?[1-9]\d*$/; // 整数
/^[1-9]\d*|0$/; // 非负整数
/^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$/; // 正浮点数
/^-[1-9]\d*\.\d*|-0\.\d*[1-9]\d*$/; // 负浮点数
/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/; // 账号或密码: 以字母开头, 5-16字符, 字母数字下划线
```

---

# 学习资源
- [正则表达式30分钟入门教程]( http://deerchao.net/tutorials/regex/regex.htm)
- 《精通正则表达式（第3版）》
- [微软的正则表达式教程]( https://msdn.microsoft.com/zh-cn/library/d9eze55x(v=vs.90).aspx)
- [System.Text.RegularExpressions.Regex类(MSDN)]( https://msdn.microsoft.com/zh-cn/library/system.text.regularexpressions.regex.aspx)
- [专业的正则表达式教学网站(英文)]( http://www.regular-expressions.info/)
- [关于.Net下的平衡组的详细讨论（英文）]( http://weblogs.asp.net/whaggard/377025)
- [在线正则表达式测试]( http://tool.oschina.net/regex#)
- [常用的正则表达式集锦](http://www.jb51.net/article/54868.htm)
- [常用正则表达式](http://www.williamlong.info/archives/433.html)
- [常用正则表达式大全](http://blog.csdn.net/onebigday/article/details/5429868)
- [最全的常用正则表达式大全](http://blog.jobbole.com/96052/)
- [JS正则表达式验证大全收集](http://www.cnblogs.com/pannysp/archive/2012/02/09/2343906.html)