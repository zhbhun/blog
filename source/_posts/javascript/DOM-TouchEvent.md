---
title: DOM 触摸事件
date: 2016-06-18
category: JavaScript
tags: JavaScript
---

# TouchEvent
触发逻辑
- 轻按
    1. touchstart
    2. touchend
    3. mouseover
    4. mouseenter
    5. mousemove
    6. mousedown
    7. mouseup
    8. click
- 长按空白
    1. touchstart
    2. mouseover
    3. mouseenter
    4. mousemove
    5. mousedown
    6. touchend
- 长按文字
    1. touchstart
    2. touchcancel
- 拖动
    1. touchstart
    2. touchmove
    3. touchend

事件要点
- 在 ontouchstart 里 preventDefault 可以阻止鼠标事件的触发
- 在 ontouchmove 里 preventDefault 可以阻止页面滚动
- 鼠标事件再触摸设备上会延迟执行，除非设置页面为禁止缩放
- ontouchmove 事件触发非常频繁，需要借助 requestAnimationFrame 来渲染动画

实践
- 触摸事件实现的相关功能
    - 轻按：相当于鼠标的点击功能
    - 短暂按：同上
    - 长按：取消轻按效果（不一定触发），触发响应的行为，如：复制，菜单等 —— 这点与鼠标不同
    - 拖动：列表滚动，鼠标不支持

规范与文档
- [W3C TouchEvent](https://www.w3.org/TR/touch-events/)
- [Touch Events - Level 2](https://w3c.github.io/touch-events/)
- [MDN TouchEvent](https://developer.mozilla.org/zh-CN/docs/Web/API/TouchEvent)

精彩博文
- [Understanding touch events](http://stackoverflow.com/questions/14486804/understanding-touch-events)
- [多点触摸网络开发](http://www.html5rocks.com/zh/mobile/touch/)
- [Touch And Mouse](http://www.html5rocks.com/en/mobile/touchandmouse/)
- [Chrome DevTools for Mobile: Screencast and Emulation](http://www.html5rocks.com/en/tutorials/developertools/mobile/)
- [A non-responsive approach to building cross-device webapps](http://www.html5rocks.com/en/mobile/cross-device/)
- [Touch Event Handling in JavaScript](http://tutorials.jenkov.com/responsive-mobile-friendly-web-design/touch-events-in-javascript.html)
- [HTML5 for the Mobile Web: Touch Events](https://mobiforge.com/design-development/html5-mobile-web-touch-events)
- [移动开发之touch event篇](http://www.aliued.cn/2013/04/27/%E7%A7%BB%E5%8A%A8%E5%BC%80%E5%8F%91%E4%B9%8Btouch-event%E7%AF%87.html)
- [移动开发之touch event篇](http://www.aliued.cn/2013/04/27/%E7%A7%BB%E5%8A%A8%E5%BC%80%E5%8F%91%E4%B9%8Btouch-event%E7%AF%87.html)
- [ HTML5实战与剖析之触摸事件(touchstart、touchmove和touchend)](http://blog.csdn.net/lee_magnum/article/details/17753807)
- [Touch开发必须知道的事儿](http://div.io/topic/398)
- [HTML5的javascript touch事件](http://hedgehogking.com/?p=556)
- [简单聊聊touch事件](http://lucyhao.com/2016/02/03/%E7%AE%80%E5%8D%95%E8%81%8A%E8%81%8Atouch%E4%BA%8B%E4%BB%B6/)

实现
- [hammer.js](https://github.com/hammerjs/hammer.js)：A javascript library for multi-touch gestures
- [interact.js](interact.js)：JavaScript drag and drop, resizing and multi-touch gestures with inertia and snapping for modern browsers (and also IE8+)
- [Touchy.js](https://github.com/jairajs89/Touchy.js)：A simple light-weight JavaScript library for dealing with touch events
- [jQuery-Touch-Events](https://github.com/benmajor/jQuery-Touch-Events)：A collection of mobile event plugins for jQuery.
- [pointer.js](https://github.com/mozilla/pointer.js)：Normalizes mouse/touch events into 'pointer' events.
- [jquery.finger](https://github.com/ngryman/jquery.finger)： jQuery touch & gestures, fingers in the nose.
- [touchy](https://github.com/HotStudio/touchy)：jQuery plugin for touch events
- [Touchable-jQuery-Plugin](https://github.com/dotmaster/Touchable-jQuery-Plugin)：Touchable jQuery Plugin
- [tappable](https://github.com/cheeaun/tappable)
- [touchpoint-js](https://github.com/jonahvsweb/touchpoint-js)：A vanilla JavaScript library that visually shows taps/clicks for HTML prototypes using CSS3 transitions on desktop and mobile.
- [jQuery Mobile Touch Events](http://www.w3schools.com/jquerymobile/jquerymobile_events_touch.asp)
- [Event.js](https://github.com/mudcube/Event.js)： Multi-touch, gestures, and other events—click, dblclick, dbltap, tap, longpress, drag, swipe, pinch, rotate, shake. For pointer events, each listener can handle anywhere from 1 to 12 fingers at a time, or more, depending on the device. Includes MetaKey tracking (CMD, CTRL) to support native key-commands in various platforms.
- [hover-on-touch](https://github.com/vin-ni/hover-on-touch)：Javascript plugin for an alternative hover function on mobile devices. It shows secondary information on Taphold & goes to a link on Tap.

问题
- [解决页面使用overflow: scroll在iOS上滑动卡顿的问题](http://www.cnblogs.com/lyingSmall/p/5235178.html)
- [iOS safari 如何阻止“橡皮筋效果”？](https://www.zhihu.com/question/22256539)
