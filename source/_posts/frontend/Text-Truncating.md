---
title: 前端文本截断
date: 2016-05-09
category: Frontend
tags: Frontend
---

# 需求
- 单行截断
- 多行截断
- 按高度截断

# 误区
- 字符一定等宽
- 超过 n 个字符截断显示，英文数字算一个字符，汉字算两个字符

备注：为了显示效果，前端往往会采用优先西文字体族的 font-family 设置，即西文字符用西文字体，汉字用中文字体，这就很容易使得文本的宽度不好根据字符数来控制。非代码的内容本身就不一定适合用等宽西文字体显示，即使用了等宽西文字体，汉字也基本不可能正好是其两倍宽

# 单行截断
## `text-overflow: ellipsis`

## 计算内容宽度
计算每个字符的宽度，找到加上 ... 正好小于指定宽度的边界，然后截去后续字符。

# 多行截断
## `-webkit-line-clamp`

## 计算内容行数
- `getComputedStyle`
- `Element.getClientRects()`
- `Selection.modify()`
- https://github.com/josephschmitt/Clamp.js/
- ...

# 按高度截断
通过比较 scrollHeight 和 clientHeight 可以方便地测试元素内容的高度是否溢出容器范围，如果超出了指定高度，反复截去尾部内容直到不再溢出。


# 参考文献
- [前端文本截断](http://efe.baidu.com/blog/text-truncating/)
- [ELLIPSE MY TEXT…](http://html5hub.com/ellipse-my-text/)
- [Line Clampin’ (Truncating Multiple Line Text)](https://css-tricks.com/line-clampin/)
- [https://css-tricks.com/line-clampin/](http://www.mobify.com/blog/multiline-ellipsis-in-pure-css/)

# 实现
- http://www.css88.com/webkit/-webkit-line-clamp/
- https://github.com/josephschmitt/Clamp.js/
