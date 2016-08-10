---
title: Java 异常
date: 2016-07-13
categories: Java
tags: Java
---

# 什么是异常
> 异常情形是指阻止当前方法或者作用域继续执行的问题。——《Think in Java》

# 怎么处理异常
- 通过函数的返回值来告诉函数调用者出现异常
- 通过某种异常处理机制来告诉函数调用者出现异常，例如 Java 的异常处理机制

# 为什么使用异常处理机制？
异常作为返回值带来的问题
- 很容易与正常的返回值混淆；
- 需要约定返回值的数据结构，降低代码可阅读性；
- 如果函数嵌套调用且最里层函数出现异常，则需要每个调用函数都处理异常；
- 由调用函数来分析异常，这要求程序员对库函数有很深的了解；

Java 的异常处理机制在程序发生异常时，强制终止程序继续执行，记录异常信息并跳转至最近的异常处理程序去处理异常，如果当前函数作用域内没有找到可用的异常处理程序，则转向外层调用函数寻找可用的异常处理程序。

# Java 的异常体系
- ![Java 异常](http://images.cnitblog.com/blog/381060/201311/22185952-834d92bc2bfe498f9a33414cc7a2c8a4.png)

- Throwable：java语言中所有错误和异常的超类；
- Error VS Exception：前者为错误，是程序无法处理的，出现这种情况你唯一能做的就是听之任之，交由 JVM 来处理，不过 JVM 在大多数情况下会选择终止线程。Exception 是程序可以处理的异常，分为两种 CheckedException（受捡异常），一种是 UncheckedException（不受检异常）；
- CheckedException VS UncheckedException：CheckException 发生在编译阶段，必须要使用try…catch（或者throws）否则编译不通过。UncheckedException 发生在运行期，具有不确定性；

常见的运行时异常
- NullPointerException
- ClassNotFoundException
- ClassCastException
- ArithmeticException
- ArrayIndexOutOfBoundsException

# 异常处理
- try...catch
- try...catch...finally
- throw
- throws

# 自定义异常
TODO

# 异常链
TODO

TODO 异常链的打印信息

# 最佳实践
下面是错误使用 Java 异常处理机制的示例：
```java
Connection conn = null;
try {
    Statement stat = conn.createStatement();
    ResultSet rs = stat.executeQuery("...");
    while (rs.next()){
        //
    }
    conn.close();
    out.close();
}
catch (Exception ex){
    ex.printStackTrace();
    throw ex;
}
```

1. 尽可能减小 try 块，虽然将一大块代码包含在 try 里面，比较容易实现，但不利于分析和维护代码（后期不知道哪一行代码可能抛出异常，以及产生什么类型的异常）；
2. 保证所有资源都被正确释放，充分利用 finally 关键字；
3. catch 语句尽量指定具体的异常类型，然后针对特定类型的异常做特定的处理，避免使用 Exception 处理所有可能出现的异常；
4. 异常捕获后的处理方案
    - 自己处理不了，就不要捕获异常；
    - 抛出封装异常；
5. 在异常处理模块中提供适量的错误原因信息，组织错误信息使其易于理解和阅读 —— 类，方法，异常；
6. 不要在 finally 返回值；
7. 不要在构造函数中抛出异常；

# 高级用法
一个用例通常由一个主事件流和 n 个异常流组成，异常流可能发生在主事件流的过程，而 try 语句里面实现的是主事件流，而 catch 里面实现的是异常流，在这里异常不代表程序出现了异常或者错误，它只是面向对象化的业务逻辑控制方法。

在实际开发中，可以设计好异常类层次，这些异常类并不都表示程序出现了异常或错误，只是代表非主事件流的发生，用来进行那些分之流程的控制。例如，下面是登陆方法的实现方案对比，可以看出一个设计好的异常类层次的优势。
- boolean login(String username, String password)：只能返回 true 或 false 表示是否登陆成功；
- int login(String username, String password)：1 表示成功登陆，0 表示找不到用户，-1 表示密码不对。。。调用该方法时必须记住 login 返回代码的含义，并使用 if...else 来判断不同的执行结果；
- User login(String username, String password) throws UserNotFoundException, PasswordNotMatchException：登陆方法返回成功登陆后的用户信息，在登陆失败的时候抛出相应的异常，调用方法直接使用受检异常来处理不同的执行结果，借助 IDE 开发起来非常方便；

争议：关于 Java 的受检异常，存在着很多反对意见。支持的人认为受检异常可以增加程度的鲁棒性（健壮）。反对的人认为受检异常很少被开发人员正确使用过，并且降低了程序开发的生产率和代码的执行效率。更多详情可参考[Java异常使用的讨论](http://www.cnblogs.com/mailingfeng/archive/2012/11/14/2769974.html)。

优秀开源项目实现案例
- Spring DataAccessException
- ...

总结：
- 什么时候使用异常？使用自定义方法的返回值，还是使用异常来表示各种事件流？

    我们可以适当使用异常来表示各种事件流，Spring，Hibernate3 都已经采用异常来表示事件流，特别是 Spring 的 DataAccessException 异常层次设计。

- 使用受检异常还是非受检异常？

    > Use checked exceptions for recoverable conditions and run-time exceptions for programming errors
    >
    > 一些异常本质上是次要的返回代码（它通常指示违反业务规则），而一些异常则是“发生某种可怕错误”（例如数据库连接失败）的变种。Johnson 提倡对于第一种类别的异常（可选的返回代码）使用检查型异常，而对于后者使用运行时异常。在“发生某种可怕错误”的类别中，其动机是简单地认识到没有调用 者能够有效地处理该异常，因此它也可能以各种方式沿着栈向上扩散而对于中间代码的影响保持最小（并且最小化异常淹没的可能性）。—— Rod Johnson
    >
    > 我已经发现非检查型异常的最大风险之一就是它并没有按照检查型异常采用的方式那样自我文档化。除非 API 的创建者明确地文档化将要抛出的异常，否则调用者没有办法知道在他们的代码中将要捕获的异常是什么。

# 参考文献
- [java提高篇之异常（上）](http://www.cnblogs.com/chenssy/p/3438130.html)
- [java提高篇(十七)-----异常(二)](http://www.cnblogs.com/chenssy/p/3453039.html)
- [Java之美[从菜鸟到高手演变]之Exception](http://blog.csdn.net/zhangerqing/article/details/8248186)
- [Failure and Exceptions](http://www.artima.com/intv/solid.html)
- [The C# Design Process](The C# Design Process)
