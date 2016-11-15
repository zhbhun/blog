---
title: React 基于“全局变量”的组件通信
date: 2016-05-25
category: React
tags: React
---

React 开发中，一般将状态放在外层组件，然后将状态通过属性一层层的传到相应的里层组件中，再渲染显示出来。例如下面这段代码，外层组件 App 有个状态 color，其以属性的形式经过 MessageList，Message 传给 Button。

```
var Button = React.createClass({
  render: function() {
    return (
      <button style={{background: this.props.color}}>
        {this.props.children}
      </button>
    );
  }
});

var Message = React.createClass({
  render: function() {
    return (
      <div>
        {this.props.text} <Button color={this.props.color}>Delete</Button>
      </div>
    );
  }
});

var MessageList = React.createClass({
  render: function() {
    var color = "purple";
    var children = this.props.messages.map(function(message) {
      return <Message text={message.text} color={this.props.color} />;
    });
    return <div>{children}</div>;
  }
});

var App = React.createClass({
    getInitialState: function() {
    return {
      messages: [],
      color: 'purple',
    };
  },
  render: function() {
    return (
      <MessageList
        messages={this.state.messages}
        color={this.state.color}
      />
    );
  }
});
```

但是，有时候我们不想一层层的传递属性，Context 就是帮助我们实现这个的 React 特性。

# 基本使用
要将外层组件的状态直接传递给里层组件，要求：
- 外层组件定义属性 childContextTypes，作为需要传递的属性类型声明
- 外层组件实例定义 getChildContext 方法，用于获取需要传递的属性值
- 里层组件定义属性 contextTypes，可以只声明需要用到属性的类型声明（没有声明的不会传递）
- 里层组件通过 this.context 获取 getChildContext 返回的值，如果没有 contextTypes，则为 undefined

```
var Button = React.createClass({
 contextTypes: {
   color: React.PropTypes.string
 },
 render: function() {
   return (
     <button style={{background: this.context.color}}>
       {this.props.children}
     </button>
   );
 }
});

var Message = React.createClass({
 render: function() {
   return (
     <div>
       {this.props.text} <Button>Delete</Button>
     </div>
   );
 }
});

var MessageList = React.createClass({
  render: function() {
   var children = this.props.messages.map(function(message) {
     return <Message text={message.text} />;
   });
   return <div>{children}</div>;
 }
});

var App = React.createClass({
  childContextTypes: {
    color: React.PropTypes.string
  },
  getInitialState: function() {
    return {
      messages: [],
      color: 'purple',
    };
  },
  getChildContext: function() {
    return {color: "purple"};
  },
  render: function() {
    return (
      <MessageList messages={this.state.messages} />
    );
  }
});
```
# 在无状态组件中使用 Context
如果无状态组件有定义属性 contextTypes，那么该组件也可以引用 context。下面代码重构前面的 Button 组件：
```
function Button(props, context) {
  return (
    <button style={{background: context.color}}>
      {props.children}
    </button>
  );
}
Button.contextTypes = {color: React.PropTypes.string};
```

# Context 更新与生命周期
- 外层组件实例会在 render 后调用 getChildContext，获取到的值会传递给声明了 contextTypes 的里层组件
- 声明了 contextTypes 的里层组件会在生命周期函数获取额外的的参数 context

```
var Button = React.createClass({
  contextTypes: {
    color: React.PropTypes.string
  },
  componentWillMount: function() {
    console.log('Button', 'componentWillMount');
  },
  componentDidMount: function() {
    console.log('Button', 'componentDidMount');
  },
  componentWillReceiveProps: function(nextProps, nextContext) {
    console.log('Button', 'componentWillReceiveProps', nextContext);
  },
  shouldComponentUpdate: function(nextProps, nextState, nextContext) {
    console.log('Button', 'shouldComponentUpdate', nextContext);
    return true;
  },
  componentWillUpdate: function(nextProps, nextState, nextContext) {
    console.log('Button', 'componentWillUpdate', nextContext);
  },
  componentDidUpdate: function(prevProps, prevState, prevContext) {
    console.log('Button', 'componentDidUpdate', prevContext);
  },
  render: function() {
    console.log('Button', 'render');
    return (
      <button style={{background: this.context.color}}>
        {this.props.children}
      </button>
    );
  }
});

var Message = React.createClass({
  render: function() {
    return (
      <div>
        {this.props.text} <Button>Delete</Button>
      </div>
    );
  }
});

var MessageList = React.createClass({
  componentWillMount: function() {
    console.log('MessageList', 'componentWillMount');
  },
  componentDidMount: function() {
    console.log('MessageList', 'componentDidMount');
  },
  componentWillReceiveProps: function(nextProps) {
    console.log('MessageList', 'componentWillReceiveProps');
  },
  shouldComponentUpdate: function(nextProps, nextState) {
    console.log('MessageList', 'shouldComponentUpdate');
    return true;
  },
  componentWillUpdate: function(nextProps, nextState) {
    console.log('MessageList', 'componentWillUpdate');
  },
  componentDidUpdate: function(prevProps, prevState) {
    console.log('MessageList', 'componentDidUpdate');
  },
  render: function() {
    console.log('MessageList', 'render');
    var children = this.props.messages.map(function(message, index) {
      return <Message key={index} text={message.text} />;
    });
    return <div>{children}</div>;
  }
});

var App = React.createClass({
  childContextTypes: {
    color: React.PropTypes.string
  },
  getInitialState: function() {
    console.log('App', 'getInitiateState');
    return {
      messages: [
        { text: 'a' },
      ],
      color: 'purple',
    };
  },
  getChildContext: function() {
    console.log('App', 'getChildContext');
    return {color: this.state.color};
  },
  componentWillMount: function() {
    console.log('App', 'componentWillMount');
  },
  componentDidMount: function() {
    console.log('App', 'componentDidMount');
    setTimeout(() => {
      this.setState({
        color: 'blue',
      });
    }, 3000);
  },
  componentWillReceiveProps: function(nextProps) {
    console.log('App', 'componentWillReceiveProps');
  },
  shouldComponentUpdate: function(nextProps, nextState) {
    console.log('App', 'shouldComponentUpdate');
    return true;
  },
  componentWillUpdate: function(nextProps, nextState) {
    console.log('App', 'componentWillUpdate');
  },
  componentDidUpdate: function(prevProps, prevState) {
    console.log('App', 'componentDidUpdate');
  },
  render: function() {
    console.log('App', 'render');
    return (
      <MessageList messages={this.state.messages} />
    );
  }
});
/* 打印日志
App getInitiateState
App componentWillMount
App render
App getChildContext
MessageList componentWillMount
MessageList render
utton componentWillMount
Button render
Button componentDidMount
MessageList componentDidMount
App componentDidMount
App shouldComponentUpdate
App componentWillUpdate
App render
App getChildContext
MessageList componentWillReceiveProps
MessageList shouldComponentUpdate
MessageList componentWillUpdate
MessageList render
Button componentWillReceiveProps Object {color: "blue"}
Button shouldComponentUpdate Object {color: "blue"}
Button componentWillUpdate Object {color: "blue"}
Button render
Button componentDidUpdate Object {color: "purple"}
MessageList componentDidUpdate
App componentDidUpdate
*/
```

一般 Context 值取自外层组件状态，以便 getChildContext 获取最新的状态传递给自组件。

Context 并不是万能的，如果中间组件的 shouldComponentUpdate 返回 false，那么里层组件将无法更新。


# 实际运用
- 主题切换
- 响应式设计
- 登陆会话
- 语言设置

# 参考文献
- http://facebook.github.io/react/docs/context.html
- https://segmentfault.com/a/1190000004636213
- https://github.com/facebook/react/issues/2517
