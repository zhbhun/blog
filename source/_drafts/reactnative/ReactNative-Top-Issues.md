---
title: React Native 常见问题
date: 2016-08-12
category: ReactNative
tags: ReactNative
---

# 如何创建旧版本 React Native 项目
- [New React Native project with old version of react native](http://stackoverflow.com/questions/34211131/new-react-native-project-with-old-version-of-react-native)

# 导航
1. NavigatorIOS 没有 jumpBack —— 赢点金开户步骤
2. NavigatorIOS 无法实现返回上一步时，无法动态输入路由 —— 赢点金开户步骤

# 触摸/事件
- [React-Native 触摸与动画](http://xgfe.github.io/2016/08/21/lulutia/react-native-touch-animation/)

# 升级变更
## 0.25.1
Deprecations

Requiring React API from react-native is now deprecated - 2eafcd4 0b534d1

Instead of:

`import React, { Component, View } from 'react-native';`

you should now:

```
import React, { Component } from 'react';
import { View } from 'react-native';
```

## 0.26.0
Breaking changes

- React API must be now required from react package (previously a warning on 0.25)
- setBridge is no longer called on the main thread - 34ec6a9

## 0.27.0
Breaking changes

- Kill NavigationLegacyNavigator (ef44781) - @hedgerwang
- Kill NavigationExperimental Containers (14eb427) - @ericvicenti
- Kill NavigationView (c3714d7) - @hedgerwang

Deprecations

- Keyboard events should now be registered via Keyboard module:

```javascript
// previously
const { DeviceEventEmitter } = require('react-native');
DeviceEventEmitter.addListener('keyboardWillShow', func);

// on 0.27.2 and newer
const { Keyboard } = require('react-native');
Keyboard.addListener('keyboardWillShow', func);

// 0.27.0 & 0.27.1
const Keyboard = require('Keyboard');
Keyboard.addListener('keyboardWillShow', func);
```
## 0.28.0
Breaking changes

- flex styling property behavior now behaves slightly differently. If you previously used flex: 1 where not necessary this change will likely break your layout as the measuring behavior is slightly different than before due to performance optimizations. Removing that unnecessary flex: 1 will solve your layout in most cases.
- Due to performance tweaks flexWrap: wrap no longer works together with alignItems: 'stretch' (the default). If you use flexWrap: wrap you probably will want to add the alignItems: 'flex-start' style as well.
