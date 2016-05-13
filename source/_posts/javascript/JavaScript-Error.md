---
title: JavaScript 错误处理
date: 2016-03-05
categories: JavaScript
tags: JavaScript
---

# 错误对象
## 错误类型
- Error：基类型，其他错误类型都继承自该类型；
- EvalError：ECMA 规定：以非直接调用的方式使用 eval 或者为 eval 赋值时，会抛出该类型错误（实际上，浏览器不一定抛出 EvalError，对于第一种情况会抛出 TypeError，而第二种情况会成功执行）;

    ```Javascript
    new eval(); // TypeError
    eval = foo; // 正常执行
    ```

- InternalError：Javascript 引擎内部错误的异常抛出的实例， 如: "递归太多"；
- RangeError：数值变量或参数超出其有效范围；

    ```Javascript
    var items1 = new Array(-20);
    var items2 = new Array(Number.MAX_VALUE);
    ```

- ReferenceError：无效引用；

    ```Javascript
    var obj = x; // 在 x 并未声明的情况下抛出 ReferenceError
    ```

- SyntaxError：eval() 在解析代码的过程中发生的语法错误；
- TypeError：变量或参数不属于有效类型；
- URIError：给 encodeURI() 或 decodeURl() 传递的参数无效
- 自定义：[What's a good way to extend Error in JavaScript?](http://stackoverflow.com/questions/1382107/whats-a-good-way-to-extend-error-in-javascript)

    ```Javascript
    // Create a new object, that prototypally inherits from the Error constructor.
    function MyError(message) {
      this.name = 'MyError';
      this.message = message || 'Default Message';
      this.stack = (new Error()).stack;
    }
    MyError.prototype = Object.create(Error.prototype);
    MyError.prototype.constructor = MyError;

    try {
      throw new MyError();
    } catch (e) {
      console.log(e.name);     // 'MyError'
      console.log(e.message);  // 'Default Message'
    }

    try {
      throw new MyError('custom message');
    } catch (e) {
      console.log(e.name);     // 'MyError'
      console.log(e.message);  // 'custom message'
    }
    ```

## 错误属性
### 标准属性
- message：错误信息
- name：错误名称

### IE 属性
- description：类似 message
- number：错误数量

### FireFox
- fileName：抛出异常的文件路径
- lineNumberLine：抛出异常的代码行
- columnNumber：抛出异常的代码列
- stack：堆栈信息

# 错误处理
## 默认处理
脚本出错时，浏览器通常会给出类似于 "object expected" 这样的信息，没有上下文信息，让人摸不着头脑。
- IE：唯一一个在界面窗体中显示 JavaScript 错误信息的浏览器；
- Firefox/Chrome/Safari/Opera：所有错误都会被记录到错误控制台中；

## 捕获错误
ECMA-262 第三版引入了 try-catch-finally 语句，用于捕获异常。语法如下所示：

```Javascript
try {
   try_statements
}
[catch (exception_var_2) {
   catch_statements_2
}]
[finally {
   finally_statements
}]
```

备注：try 语句包含了由一个或者多个语句组成的 try 块, 和至少一个 catch 子句或者一个 finally 子句的其中一个，或者两个兼有。如果没有 catch 子句，异常没有被处理，继续向外抛出。

## 抛出错误
- 语法：`throw expression;`
- 说明：expression 指定了异常的内容，可以是任何类型，catch 时捕获的错误便是该值

## 监听错误
- 简介：任何没有通过 try-catch 处理的错误都会触发 window 对象的 error 事件。
- 兼容性：IE，Firefox，Chrome
- 用法：`window.onerror = function(message, url, line) {return false;}`，事件处理程序返回 false 时，会阻止浏览器报告错误的默认行为

## 记录错误
可以将错误信息记录到服务器中集中处理，以便对数据进行分析。

```Javascript
/**
* @param {String} sev 错误严重程度
* @param {String} msg 错误信息
*/
function logError(sev, msg) {
    var img = new Image();
    // 避免跨域问题
    img.src = 'log.php?sev=' + encodeURIComponent(sev) + '&msg=' + encodeURIComponent(msg);
}
```

## 避免错误
JavaScript 是松散类型的，而且也不会验证函数的参数，因此错误只会在代码运行期间出现。在编写程序的时候，需要特别关注下面三种错误：

- 类型转换错误：类型转换错误发生在使用某个操作符，或者使用其他可能会自动转换值的数据类型的语言结构时。
    - 相等（`==`）和不相等（`！=`）操作符在执行比较前会先转换不同类型的值，例如：`1 == true` 返回 true。这样增加了程序的复杂性，很容易导致程序出错，所以强烈推荐使用全等（`===`）和非全等（`！==`）操作符
    - 在 if，for 和 while 等流控制语句中使用非布尔值时，会自动把该值转换成布尔值。使用非布尔值，要求比较熟悉 JavaScript 自动类型转换，这增加了程序的不确定性（特别是 0 代表 false，常常被忽略）。所以不要在这里使用非布尔值。
- 数据类型错误：为了保证不会发生数据类型错误，只能依靠开发人员编写适当的数据类型检测代码。在检测时遵从一下规则
    - 基本类型的值应该使用 typeof 来检测；
    - 对象类型的值应该使用 instanceof 来检测；
    - 根据使用函数的方式，有时候不需要逐个检查所有参数的数据类型。但是，面向公众的 API 则必须无条件地执行类型检查，以确保函数始终能够正确地执行；
- 通信错误：常见的通信错误如下
    - URL 或发送的数据格式不正确（最常见的错误是：在将数据发送给服务器之前，没有使用 encodeURIComponent() 对数据进行编码），例如：下面的 URL 格式是不正确的 `http://www.yourdomain.com/?redir=http://www.someotherdomain.com?a=b&c=d`，使用 encodeURIComponent 将 redir 转换后就可以解决问题，转换后的 URL为：`http://www.yourdomain.com/?redir=http%3A%2F%2Fwww.someotherdomain.com%3Fa%3Db%26c%3Dd`
    - ...

## 区分错误
在程序遇到错误时，需要判断错误是否是致命来决定后续的处理。
对于非致命错误，可以暂停该错误相关功能的使用，例如：雅虎邮箱有个发送短信的功能，如果由于某种原因，导致手机短信发送不了了，这就不算致命错误（因为邮箱是用于查收和发送邮件的，发送短信并不是邮箱的主要功能），不能打断用户，没有必要因为发生了非致命错误而对用户给出提示，可以把页面中收到影响的区域替换掉，例如改成说明相应功能无法使用的信息。
对于致命错误，应该立即给用户发送一条信息，告诉他们无法再继续手头上的事情了，例如：必须刷新页面才能让应用程序正常运行时，就必须通知用户，同时提供一个刷新按钮。

# 错误调试
- 错误消息记录到控制台：适用于 IE8+，Chrome，Firefox，Safari；
- 错误消息记录到页面：适用于不支持 JavaScript 控制台的 IE7 及更早版本；
- 抛出错误：适用于确定具体错误时，抛出具体的错误信息，省去其他调试操作；
- 其他：借助浏览器自带的调试工具；

# 实践
## 什么错误该处理和怎么处理
接下来的问题是什么样的错误我们需要处理？怎么处理？我们可以将错误分个类：

- 操作错误：不是程序 bug 导致的运行时错误。比如：连接数据库服务器失败、请求接口超时、系统内存用光等等。
- 程序错误：程序 bug 导致的错误，只要修改代码就可以避免。比如：尝试读取未定义对象的属性、语法错误等等。

很显然，我们真正需要处理的是操作错误，程序错误应该马上进行修复。

那怎么处理操作错误呢？总结起来大概有下面这些方法：

- 直接处理。这个简直是废话。举个例子：尝试向一个文件中写东西，但是这个文件不存在，那这个时候会报错吧？处理这个错误的方法就是先创建好要写入的文件。如果我们知道怎么处理错误，那直接处理就是。
- 重试。有时候某些错误可能是偶发的（比如：连接的服务不稳定等），我们可以尝试对当前操作进行重试。但是一定要设置重试的超时时间、次数，避免长时间的等待卡死应用。
直接将错误抛给调用方。如果我们不知道具体怎么处理错误，那最简单的就是将错误往上抛。比如：检查到用户没有权限访问某个资源，那我们直接 throw 一个 Error（并带上 status 是 403）比较好，上层代码可以 catch 这个错误，然后要么展示一个统一的无权限页面给用户，要么返回一个统一的错误 json 给调用方。
- 写日志然后将错误抛出。这种情况一般是发生了比较致命的错误，没法处理，也不能重试，那我们需要记下错误日志（方便以后定位问题），然后将错误往上抛（交给上层代码去进行统一错误展示）。

备注：本段摘自[如何优雅的在 koa 中处理错误](http://taobaofed.org/blog/2016/03/18/error-handling-in-koa)

## 抛出错误 VS 捕获错误
- 捕获错误：避免浏览器以默认方式处理他们（只应该捕获那些确定地知道如何处理的错误）；
- 抛出错误：提供错误发生具体原因的消息（不知道如何处理错误，可以将错误信息包装后抛出该错误）；

## 抛出错误的时机
抛出错误的时机在出现某种特定的已知错误条件，导致函数无法正常执行时抛出错误。。一般来说，应用程序架构的较低层次中经常会抛出错误，但这个层次并不会影响当前执行的代码，因而错误通常得不到真正的处理。如果编写一个要在很多应用程序中使用的 JavaScript 库，甚至编写一个可能会在应用程序内部多个地方使用的辅助函数，都建议在抛出错误时提供详尽的信息。

```javascript
function process(values) {
  values.sort();
  // ...
}
process(1);
/*
TypeError: values.sort is not a function
    at process (<anonymous>:3:10)
    at <anonymous>:2:6
    at Object.InjectedScript._evaluateOn (<anonymous>:875:140)
    at Object.InjectedScript._evaluateAndWrap (<anonymous>:808:34)
    at Object.InjectedScript.evaluate (<anonymous>:664:21)
*/
// 尽管异常堆栈信息指出了代码中导致错误的部分，在调试处理这样的错误信息也没有什么困难。但是，在面对包含千行 JavaScript 代码的复杂的 Web 应用程序时，要想查找来源就没那么容易了。这种情况下，带有适当信息的自定义错误能够提升代码的可维护性。修改后的代码如下所示。   
function process(values) {
  if (!(values instanceof Array)) {
    throw new Error('process(): Argument must be an array.');
  }
  values.sort();
  // ...
}
```

## 条件 catch 子句

```Javascript
try {
    myroutine(); // may throw three types of exceptions
} catch (e) {
    if (e instanceof TypeError) {
        // statements to handle TypeError exceptions
    } else if (e instanceof RangeError) {
        // statements to handle RangeError exceptions
    } else if (e instanceof EvalError) {
        // statements to handle EvalError exceptions
    } else {
       // statements to handle any unspecified exceptions
       logMyErrors(e); // pass exception object to error handler
    }
}
```

## 从 finally 块返回
如果从 finally 块中返回一个值，那么这个值将会成为整个 try-catch-finally 的返回值，无论是否有 return 语句在 try 和 catch 中。

# 规范
- [ECMAScript 5.1 Error](http://www.ecma-international.org/ecma-262/5.1/#sec-15.11)
- [ECMAScript 2015 Error](http://www.ecma-international.org/ecma-262/6.0/#sec-error-objects)
- [ECMAScript 2016 Draft Error](https://tc39.github.io/ecma262/#sec-error-objects)

# 文档
- [MDN-Error](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Error)
- [MDN-EvalError](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/EvalError)
- [MDN-InternalError](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/InternalError)
- [MDN-RangeError](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/RangeError)
- [MDN-ReferenceError](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/ReferenceError)
- [MDN-SyntaxError](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/SyntaxError)
- [MDN-TypeError](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/TypeError)
- [MDN-URIError](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/URIError)
- [MDN-throw](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Statements/throw)
- [MDN-try...catch](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Statements/try...catch)


# 博文
- [如何优雅的在 koa 中处理错误](http://taobaofed.org/blog/2016/03/18/error-handling-in-koa/?utm_source=tuicool&utm_medium=referral)
