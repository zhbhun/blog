---
title: React Native UIExplorer 运行问题
date: 2016-03-28
categories: ReactNative
tags: ReactNative
---

# 错误一：没有安装 NDK
- 错误日志：
	```
	Failed to notify ProjectEvaluationListener.afterEvaluate(), but primary configuration failure takes precedence.
	java.lang.IllegalStateException: buildToolsVersion is not specified.
		...

	FAILURE: Build failed with an exception.

	* What went wrong:
	ndk-build binary cannot be found, check if you've set $ANDROID_NDK environment variable correctly or if ndk.dir is setup in local.properties

	* Try:
	Run with --info or --debug option to get more log output.

	* Exception is:
	org.gradle.api.GradleScriptException: ndk-build binary cannot be found, check if you've set $ANDROID_NDK environment variable correctly or if ndk.dir is setup in local.properties
		...

	BUILD FAILED

	Total time: 1.405 secs
	```
- 问题原因：分析错误日志可以知道是因为没有找到 ndk-build，这个是 Android NDK 下的脚本文件，需要安装 Android NDK，并配置环境变量 ANDROID_NDK。
- 解决办法：去下载安装 Android NDK

# 错误二：NDK 版本过高
- 错误日志
	```
	[armeabi-v7a] Prebuilt       : libjsc.so <= /home/zhanghuabin/work/project/study/reactnative/react-native/react-native-0.22.0/ReactAndroid/build/third-party-ndk/jsc/jni/armeabi-v7a/
	make: Leaving directory `/home/zhanghuabin/work/project/study/reactnative/react-native/react-native-0.22.0/ReactAndroid/src/main/jni/react/jni'
	:ReactAndroid:buildReactNdkLib FAILED

	FAILURE: Build failed with an exception.

	* What went wrong:
	Execution failed for task ':ReactAndroid:buildReactNdkLib'.
	> Process 'command '/home/zhanghuabin/work/android-ndk/android-ndk-r11b/ndk-build'' finished with non-zero exit value 2

	* Try:
	Run with --info or --debug option to get more log output.

	* Exception is:
	org.gradle.api.tasks.TaskExecutionException: Execution failed for task ':ReactAndroid:buildReactNdkLib'.
		...

	BUILD FAILED

	Total time: 6 mins 28.272 secs
	```
- 问题原因：React Native 0.22 不支持最新的 Android NDK (r11) —— 因为 React Native 需要 prebuilt 4.8，而 r11 没有这个。
- 解决办法：使用 Android NDK r10e
    - [Windows 32-bit](http://dl.google.com/android/repository/android-ndk-r10e-windows-x86.zip)
    - [Windows 64-bit](http://dl.google.com/android/repository/android-ndk-r10e-windows-x86_64.zip)
    - [Mac OS X 64-bit](http://dl.google.com/android/repository/android-ndk-r10e-darwin-x86_64.zip)
    - [Linux 64-bit (x86)](http://dl.google.com/android/repository/android-ndk-r10e-linux-x86_64.zip)
- 参考文献：[Unable to run React-Native UIExplorer example project](http://stackoverflow.com/questions/36209774/unable-to-run-react-native-uiexplorer-example-project)

# 问题三：boost 下载失败
- 错误日志：
	```
	* What went wrong:
Could not expand ZIP '/home/zhanghuabin/work/project/study/reactnative/react-native/react-native-0.23.1/ReactAndroid/build/downloads/boost_1_57_0.zip'.
> archive is not a ZIP archive
	```
- 问题原因：Boost 是 Cpp 重要的库, 比较大100M左右, 下载较慢.
- 解决办法：删除该文件，重新下载即可

# 更多
- [运行ReactNative的默认工程UIExplorer](http://www.jianshu.com/p/bcaaf51a9d0b)
