---
title: React Native ListView
date: 2016-04-23
category: ReactNative
tags: ReactNative
---

# 性能优化
- initialListSize：初始化渲染多少行，设置的越小初始化越快完成；
- pageSize：每次时间循环渲染多少行，设置太大可能会出现掉帧；
- removeClippedSubviews：用于优化大数据量列表的性能；
- scrollRenderAheadDistance：距离屏幕显示区域还有多少像素时，开始渲染；

注意要点
1. 一般无限滚动列表的加载每一页数据记录数在 15 到 20 之间。虽然 initialListSize 越小初始化越快，但是过小的话，可能屏幕可能出现空白（必须手动滑动屏幕才会渲染）。另外过小的 initialListSize 影响用户的快速滑动（在滚动到 initialListSize 最后一条记录时出现卡顿，影响继续向下滚动）。同理 pageSize 过小，也会遇到相似的问题，我们一般将 initialListSize 和 pageSize =设置为前文提到的加载每一页的记录数。
2. removeClippedSubviews 设置为 true 时必须将 行渲染容器的 overflow 设置为 'hiddden'
3. ...


# 常见问题
## 必须滚动才能渲染
- [[ListView] rows aren't rendered until scroll](https://github.com/facebook/react-native/issues/1831)
- [ListView Grid Layout doesn't show full content ](https://github.com/facebook/react-native/issues/4728)
- [[iOS][ListView] Pretty nasty bug with UIExplorer's ListView implementation on master](https://github.com/facebook/react-native/issues/4179)
- https://productpains.com/post/react-native/listview-doesnt-render-rows-until-scroll/

## 内存问题
- [Infinite Scroll Memory Issues](https://github.com/facebook/react-native/issues/3656)

## onEndReached 频繁触发
- [onEndReached fired again and again](https://github.com/facebook/react-native/issues/6002)
