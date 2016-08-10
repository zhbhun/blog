---
title: Webpack 优化
date: 2016-06-15
category: Webpack
tags: Webpack
---

- https://github.com/webpack/docs/wiki/optimization
- [webpack-optimization](https://github.com/fanjunzhi/webpack-optimization)
- [Webpack: Use a root instead of a module directory for client](https://github.com/Automattic/wp-calypso/pull/4128)
- [babel-react-optimize](https://github.com/thejameskyle/babel-react-optimize)
- [OPTIMIZING WEBPACK FOR FASTER REACT BUILDS](http://engineering.invisionapp.com/post/optimizing-webpack/)
- [如何 10 倍提高你的 Webpack 构建效率](http://eternalsky.me/ru-he-10-bei-ti-gao-ni-de-webpack-gou-jian-xiao-lu/)
- [Optimising build performance, initial: 40s, incremental: 6s](https://github.com/webpack/webpack/issues/1574#issuecomment-157520561)
- [build performance](https://github.com/webpack/docs/wiki/build-performance/99b3c2758589c35d62c3cdc03e312682de31dd6b)
- http://webpack.github.io/docs/build-performance.html
- http://qiita.com/pirosikick/items/c77db84dbed4c447a6fe#%E3%81%8A%E3%81%BE%E3%81%91cachedirectory
- http://www.slideshare.net/trueter/how-to-make-your-webpack-builds-10x-faster
- [Webpack 性能优化 （一）](http://code.oneapm.com/javascript/2015/07/07/webpack_performance_1/)

# 通用优化方法
## resolve.root vs resolve.moduleDirectories
- [resolve.root vs moduleDirectories](https://github.com/webpack/webpack/issues/472#issuecomment-55706013)
- http://webpack.github.io/docs/configuration.html#resolve-root
- http://webpack.github.io/docs/configuration.html#resolve-modulesdirectories

## module.noParse

## babel-loader

## CommonsChunk

## HappyPack

## Cache
- webpack.cache
- babel-loader.cacheDirectory
- HappyPack.cache

# 开发环境优化
## devtool

## external

## DLLReferencePlugin

## FileSystem

# 生产环境优化
## UglifyJsPlugin

## OccurrenceOrderPlugin

## DedupePlugin
