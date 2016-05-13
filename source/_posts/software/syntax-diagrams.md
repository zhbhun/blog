---
title: 语法图
date: 2016-04-14
category: Software
tags: Software
---

语法图（Syntax diagrams），又叫铁路图（railroad diagrams），是一种表示形式语法的方式，是巴科斯范式（BNF）和扩展巴科斯范式的图形化表示。最早使用语法图的书包括 Niklaus Wirth 写的《Pascal User Manual》（语法图开始于47页）和《the Burroughs CANDE manual》。在编译领域，像 BNF 和它的变体这样的文字式表示法都是首选的。BNF 能很好的被编译器作者和编译器理解，但是不能很好的被这些语言的大部分用户理解。铁路图能更容易被大多数人理解。数据交换格式 JSON 之所以流行的部分原因就是它用铁路图来表示。

# 一些铁路图
JSON(JavaScript Object Notation) 是一种轻量级的数据交换格式，如果熟悉 JSON 的话，很容易看懂下面的铁路图。

![对象（object）](http://www.json.org.cn/misc/object.gif)
![数组（array）](http://www.json.org.cn/misc/array.gif)
![值（value）](http://www.json.org.cn/misc/value.gif)
![字符串（string）](http://www.json.org.cn/misc/string.gif)
![数值（number）](http://www.json.org.cn/misc/number.gif)

# 铁路图规则
理解铁路图的规则很简单，可以带着下面的规则观察 JSON 铁路图。
1. 从左边界开始，沿着轨道去到右边界。 
2. 沿途，在圆框中遇到的是字面量，在方块中遇到的是规则或者描述。
3. 任何沿着轨道能走通的序列都是合法的。
4. 任何不能沿着轨道走通的序列都是非法的。 
5. 每个末端只有一个竖条的铁路图，表示允许在任何一对标记中间插入空白。而在末端有两个竖条的铁路图是不允许的。

# 铁路图生成器
- https://github.com/tabatkins/railroad-diagrams

# 参考文献
- [语法图](http://www.cnblogs.com/jdcbbk/archive/2009/12/14/1623380.html)
- [语法图(Syntax diagram)、铁路图(railroad diagrams)](http://wenku.baidu.com/link?url=vGU-nGJcbXfmud7ThAT6g2gyAoKKFI-enehCXIFMh6v9dzOf6qgYi8G22pUjTDV4vG8gbLE_UGA-MZo7_i2-oyhgSxcAI6thyaDY-Yl-B7q)
