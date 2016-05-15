---
title: JavaScript 数组
date: 2016-03-05
categories: JavaScript
tags: JavaScript
---

JavaScript 中 Array 是一个全局对象，用来构造数组，是一个高阶的类似有序列表的对象。

# 构造
构造函数
- `new Array(element0, element1[, ...[, elementN]])`
- `new Array(arrayLength)`

字面量：`[element0, element1, ..., elementN]`
- `[]`
- `[1]`
- `[1,]`

其他方法
- RegExp.exec
- String.match
- String.replace

# 属性
- length： Array.prototype 也是个数组，Array 的 length 值为 1

# 方法
- from(es6)：从类数组或者迭代对象（iterable object）中创建一个新的数组实例
- isArray：假如一个变量是数组则返回 true，否则返回 false
- of：创建一个有可变数量的参数的新的数组实例，无论参数有多少数量，而且可以是任意类型

# 实例
## 属性
- length：数组长度

## 方法
增加
- push：在数组的末尾增加一个或多个元素，并返回数组的新长度
- unshift：在数组的开头增加一个或多个元素，并返回数组的新长度

删除
- pop：删除数组的最后一个元素，并返回这个元素
- shift：删除数组的第一个元素，并返回这个元素

修改
- splice：在任意的位置给数组添加或删除任意个元素
- copyWithin(es6)：在数组内部，将一段元素序列拷贝到另一段元素序列上，覆盖原有的值
- fill(es6)：将数组中指定区间的所有元素的值，都替换成某个固定的值

排序
- reverse：颠倒数组中元素的排列顺序，即原先的第一个变为最后一个，原先的最后一个变为第一个
- sort：对数组元素进行排序，并返回当前数组

迭代
- forEach(es5)：为数组中的每个元素执行一次回调函数
- entries(es6)：返回一个数组迭代器对象，该迭代器会包含所有数组元素的键值对
- every(es5)：如果数组中的每个元素都满足测试函数，则返回 true，否则返回 false
- some(es5)：如果数组中至少有一个元素满足测试函数，则返回 true，否则返回 false
- filter(es5)：将所有在过滤函数中返回 true 的数组元素放进一个新数组中并返回
- find(es6)：找到第一个满足测试函数的元素并返回那个元素的值，如果找不到，则返回 undefined
- findIndex(es6)：找到第一个满足测试函数的元素并返回那个元素的索引，如果找不到，则返回 -1
- keys(es6)：返回一个数组迭代器对象，该迭代器会包含所有数组元素的键
- map(es5)：返回一个由回调函数的返回值组成的新数组
- reduce(es5)：从左到右为每个数组元素执行一次回调函数，并把上次回调函数的返回值放在一个暂存器中传给下次回调函数，并返回最后一次回调函数的返回值。
- reduceRight(es5)：从右到左为每个数组元素执行一次回调函数，并把上次回调函数的返回值放在一个暂存器中传给下次回调函数，并返回最后一次回调函数的返回值
- values：返回一个数组迭代器对象，该迭代器会包含所有数组元素的值

其他：下面的这些方法绝对不会改变调用它们的对象的值，只会返回一个新的数组或者返回一个其它的期望值。
- concat：返回一个由当前数组和其它若干个数组或者若干个非数组值组合而成的新数组
- includes(es6)：判断当前数组是否包含某指定的值，如果是返回 true，否则返回 false
- join：连接所有数组元素组成一个字符串
- slice：抽取当前数组中的一段元素组合成一个新数组
- toSource：返回一个表示当前数组字面量的字符串。遮蔽了原型链上的 Object.prototype.toSource()方法
- toString：返回一个由所有数组元素组合而成的字符串。遮蔽了原型链上的Object.prototype.toString() 方法
- toLocaleString：返回一个由所有数组元素组合而成的本地化后的字符串。遮蔽了原型链上的Object.prototype.toLocaleString() 方法
- indexOf：返回数组中第一个与指定值相等的元素的索引，如果找不到这样的元素，则返回 -1
- lastIndexOf：返回数组中最后一个（从右边数第一个）与指定值相等的元素的索引，如果找不到这样的元素，则返回 -1
- ...

# 实践
## 迭代时增删数组元素
在 Array 众多遍历方法中，有很多方法都需要指定一个回调函数作为参数。在回调函数执行之前，数组的长度会被缓存在某个地方，所以，如果你在回调函数中为当前数组添加了新的元素，那么那些新添加的元素是不会被遍历到的。此外，如果在回调函数中对当前数组进行了其它修改，比如改变某个元素的值或者删掉某个元素，那么随后的遍历操作可能会受到未预期的影响（不会被迭代）。总之，不要尝试在遍历过程中对原数组进行任何修改，虽然规范对这样的操作进行了详细的定义，但为了可读性和可维护性，请不要这样做。

## Generic 方法
有时你想对字符串或其他类似数组的对象使用数组的方法（如函数arguments）。通过这样做，你可以把一个字符串作为（或以其他方式把非数组作为数组）数组里的字符来使用。例如，为了检查变量str每一个字符是否是字母，你会这样写：
```
function isLetter(character) {
  return character >= 'a' && character <= 'z';
}
if (Array.prototype.every.call(str, isLetter)) {
  console.log("The string '" + str + "' contains only letters!");
}
```

为了简化代码，使用下面的 shim 可以直接使用 Array 上的 every 方法。
```
/ Assumes Array extras already present (one may use polyfills for these as well)
(function() {
  'use strict';

  var i,
    // We could also build the array of methods with the following, but the
    //   getOwnPropertyNames() method is non-shimable:
    // Object.getOwnPropertyNames(Array).filter(function(methodName) {
    //   return typeof Array[methodName] === 'function'
    // });
    methods = [
      'join', 'reverse', 'sort', 'push', 'pop', 'shift', 'unshift',
      'splice', 'concat', 'slice', 'indexOf', 'lastIndexOf',
      'forEach', 'map', 'reduce', 'reduceRight', 'filter',
      'some', 'every', 'find', 'findIndex', 'entries', 'keys',
      'values', 'copyWithin', 'includes'
    ],
    methodCount = methods.length,
    assignArrayGeneric = function(methodName) {
      if (!Array[methodName]) {
        var method = Array.prototype[methodName];
        if (typeof method === 'function') {
          Array[methodName] = function() {
            return method.call.apply(method, arguments);
          };
        }
      }
    };

  for (i = 0; i < methodCount; i++) {
    assignArrayGeneric(methods[i]);
  }
}());
```

简化后的示例代码：
```
if (Array.every(str, isLetter)) {
  console.log("The string '" + str + "' contains only letters!");
}
```

# 规范
- ECMAScript-5.1-Array：http://www.ecma-international.org/ecma-262/5.1/#sec-15.4
- ECMAScript-2015(ECMAScript-6)-Array： http://www.ecma-international.org/ecma-262/6.0/#sec-array-objects
- ECMAScript-2016-Array：https://tc39.github.io/ecma262/#sec-array-objects

# 参考文献
- [MDN-Array-英文](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)
- [MDN-Array-中文](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array)
- [JavaScript-标准参考教程-Array](http://javascript.ruanyifeng.com/stdlib/array.html)
