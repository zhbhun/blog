---
title: JavaScript 字符串
date: 2016-02-09
categories: JavaScript
tags: JavaScript
---

JavaScript内部，字符以 UTF-16 的格式储存，每个字符固定为 2 个字节。对于那些需要 4 个字节储存的字符（Unicode码点大于0xFFFF的字符），JavaScript会认为它们是两个字符。


# ECMAScript 6
## Unicode 表示法
### 问题
JavaScript允许采用 `\uxxxx` 形式表示一个字符（Unicode 表示法），其中“xxxx”表示字符的码点，例如：

```
var s = '\u0061';
console.log(s); // "a"
```

但这种表示法只限于码点在 `\u0000` — `\uFFFF` 之间的字符，超出范围的字符，必须使用两个双字节的形式表达，例如：

```
var errorStr = '\u20BB7'; // 吉的码点对应的十六进制值
console.log(errorStr); // ₻7 --- JavaScript会理解成“\u20BB+7”，由于 \u20BB 是一个不可打印字符，所以只会显示一个空格，后面跟着一个7。
var s = '\uD842\uDFB7'; // 吉的十六进制双字节表示
console.log(s); // "𠮷"
```

总结：
- 允许采用 `\uxxxx` 形式表示一个字符；
- 双字节形式表示的字符的码点值不能超出 `FFFF`；
- 使用两个双字节形式表示的字符长度为 2；

## 解决方案
ES6 解决了之前遇到的问题（字符码点值不能超出 `FFFF`），只要将码点放入大括号，就能正确解读该字符，例如：
```
'\u{20BB7}" // 𠮷
'\u{41}\u{42}\u{43}' // ABC
'\u{20BB7}' == '\uD842\uDFB7' // true
```

总结：
- 根据上面最后一个例子可知大括号表示法与四字节的UTF-16编码是等价的；
- Javascript 字符的六种表示法：
    - `'\z' === 'z'  // true`
    - `'\172' === 'z' // true`
    - `'\x7A' === 'z' // true`
    - `'\u007A' === 'z' // true`
    - `'\u{7A}' === 'z' // true`

## codePointAt
### 问题
根据 JavaScript 字符存储原理可知，JavaScript 不能正确处理 4 字节字符（字符串长度会误判为2，而且 charAt 方法无法读取整个字符，charCodeAt方法只能分别返回前两个字节和后两个字节的值），例如
```
var s = '\u{20BB7}\u{0061}'; // 吉的十六进制双字节表示
console.log(s); // "𠮷a"
console.log(s.length); // 3
console.log(s.charAt(0)); // �
console.log(s.charAt(1)); // �
console.log(s.charAt(2)); // a
console.log(s.charCodeAt(0).toString('16')); // d842
console.log(s.charCodeAt(1).toString('16')); // dfb7
console.log(s.charCodeAt(2).toString('16')); // 61
```

### 解决方案
ES6 提供了 `codePointAt` 方法，能够正确处理4个字节储存的字符，返回一个字符的码点；
```
var s = '\u{20BB7}\u{0061}'; // 吉的十六进制双字节表示
console.log(s); // "𠮷a"
console.log(s.codePointAt(0).toString(16)); // 20bb7
console.log(s.codePointAt(1).toString(16)); // dfb7
console.log(s.charCodeAt(2).toString('16')); // 61
```

上面例子在输出字符 `a` 的码点时，传入位置为 2，从字符角度来看，正确的位置应该是 1。解决这个问题的一个办法是使用for...of循环，因为它会正确识别 32 位的 UTF-16 字符。
```
var s = '\u{20BB7}\u{0061}';
for (let ch of s) {
    console.log(ch.codePointAt(0).toString(16));
}
// 20bb7
// 61
```

最佳实践
- 检测字符由两个字节还是由四个字节组成的方法
    ```
    function is32Bit(c) {
        return c.codePointAt(0) > 0xFFFF;
    }
    ```
- 支持两个字节字符和四个字节字符的 charAt
    ```
    function charAt(s, i) {
        let index = 0;
        for (let ch of s) {
            if (index == i) {
                return ch;
            }
            index++;
        }
        return '';
    }
    ```
- 支持两个字节字符和四个字节字符的 charCodeAt
    ```
    function charCodeAt(s, i) {
        let index = 0;
        for (let ch of s) {
            if (index == i) {
                return ch.codePointAt(0).toString(16);
            }
            index++;
        }
        return NaN;
    }
    ```

## fromCodePoint
### 问题
ES5 提供了 `String.fromCharCode` 方法，用于从码点返回对应字符，但是这个方法不能识别 32 位的 UTF-16 字符（Unicode 编号大于 0xFFFF）。
```
String.fromCharCode(0x20BB7) // "ஷ"
// String.fromCharCode 不能识别大于 0xFFFF 的码点，所以 0x20BB7 就发生了溢出，最高位 2 被舍弃了，最后返回码点 U+0BB7 对应的字符，而不是码点 U+20BB7 对应的字符。
```

### 解决方案
ES6 提供了 fromCodePoint 来解决该问题
```
String.fromCodePoint(0x20BB7) // "𠮷"
String.fromCodePoint(0x78, 0x1f680, 0x79) === 'x\uD83D\uDE80y' // true
```

## 遍历器
ES6 为字符串添加了遍历器接口，使得字符串可以被 `for...of` 循环遍历。除了遍历字符串，这个遍历器最大的优点是可以识别大于 `oxFFFF` 的码点，传统的 for 循环无法识别这样的码点。
```
var text = String.fromCodePoint(0x20BB7);
for (let i = 0; i < text.length; i++) {
  console.log(text[i]);
}
// " "
// " "
for (let i of text) {
  console.log(i);
}
// "𠮷"
```

## normalize
- 问题：为了表示语调和重音符号，Unicode提供了两种方法。一种是直接提供带重音符号的字符，比如Ǒ（\u01D1）。另一种是提供合成符号（combining character），即原字符与重音符号的合成，两个字符合成一个字符，比如O（\u004F）和ˇ（\u030C）合成Ǒ（\u004F\u030C）。这两种表示方法，在视觉和语义上都等价，但是JavaScript不能识别。
    ```
    '\u01D1' === '\u004F\u030C' // false
    '\u01D1'.length // 1
    '\u004F\u030C'.length // 2
    ```
- 解决：使用 normalize 方法来合成和分解字符
    ```
    '\u01D1' === '\u004F\u030C'.normalize() // true
    '\u01D1' === '\u004F\u030C'.normalize('NFC') // true
    '\u01D1'.normalize('NFD') === '\u004F\u030C' // true
    ```
- 总结：normalize方法可以接受四个参数
    - NFC，默认参数，表示“标准等价合成”（Normalization Form Canonical Composition），返回多个简单字符的合成字符。所谓“标准等价”指的是视觉和语义上的等价。
    - NFD，表示“标准等价分解”（Normalization Form Canonical Decomposition），即在标准等价的前提下，返回合成字符分解的多个简单字符。
    - NFKC，表示“兼容等价合成”（Normalization Form Compatibility Composition），返回合成字符。所谓“兼容等价”指的是语义上存在等价，但视觉上不等价，比如“囍”和“喜喜”。（这只是用来举例，normalize方法不能识别中文。）
    - NFKD，表示“兼容等价分解”（Normalization Form Compatibility Decomposition），即在兼容等价的前提下，返回合成字符分解的多个简单字符。
- 注意点：normalize方法目前不能识别三个或三个以上字符的合成。这种情况下，还是只能使用正则表达式，通过Unicode编号区间判断。



# 提案
## at
ES5 对字符串对象提供 charAt 方法，返回字符串给定位置的字符。但是，该方法不能识别码点大于 0xFFFF 的字符。目前，有一个提案，提出字符串实例的at方法，可以识别Unicode编号大于0xFFFF的字符，返回正确的字符。该方法的垫片库：https://github.com/es-shims/String.prototype.at。
