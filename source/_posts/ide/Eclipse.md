---
title: Eclipse
date: 2016-06-15
category: IDE
tags: IDE
---

# 简介
## 版本
- Eclipse 3.1 版本代号 IO 【木卫1，伊奥】 
- Eclipse 3.2 版本代号 Callisto 【木卫四，卡里斯托 】 
- Eclipse 3.3 版本代号 Eruopa 【木卫二，欧罗巴 】 
- Eclipse 3.4 版本代号 Ganymede 【木卫三，盖尼米德 】 
- Eclipse 3.5 版本代号 Galileo 【伽利略】 
- Eclipse 3.6 版本代号 Helios 【太阳神】 
- Eclipse 3.7 版本代号 Indigo 【靛青】 
- Eclipse 4.2 版本代号 Juno  【朱诺】
- Eclipse 4.3 版本代号 Kepler 【开普勒】
- Eclipse 4.4 版本代号 Luna 【月亮】
- Eclipse 4.5 版本代号 Mars 【火星】
- Eclipse 4.6 版本代码 Neon 【霓虹灯】

# 插件
https://marketplace.eclipse.org/

## 主题
- [eclipse-moonrise-ui-theme](https://marketplace.eclipse.org/content/eclipse-moonrise-ui-theme)

## 编辑
- [Emacs+](https://marketplace.eclipse.org/content/emacs)
- [Vrapper (Vim)](https://marketplace.eclipse.org/content/vrapper-vim)
- [properties-editor](https://marketplace.eclipse.org/content/properties-editor)：解决编辑 properties 属性文件的中文出现乱码的问题
- [protobuf-dt](https://code.google.com/p/protobuf-dt)
- [JSON Editor Plugin](https://marketplace.eclipse.org/content/json-editor-plugin)
- [Emmet](https://marketplace.eclipse.org/content/emmet-ex-zen-coding-eclipse-plugin)

## 设计
- [Xtext](http://www.eclipse.org/Xtext/index.html)
- ER
    - [ermaster](http://ermaster.sourceforge.net/)
- UML
    - [6个Java项目UML反向工程工具](http://www.csdn.net/article/2012-09-12/2809862-6-java-to-uml-tools)
    - [umlet](http://www.umlet.com/)
    - [modelgoon](http://www.modelgoon.org/)
    - [ObjectAid UML](http://www.objectaid.com/home)
    - [umldesigner](http://www.umldesigner.org/overview/)
    - [Green UML](http://green.sourceforge.net/builds.html)

## 构建
- [M2Eclipse](http://www.eclipse.org/m2e/)

## 统计
- [Codecity](https://marketplace.eclipse.org/content/codecity)
- [Codecity for Eclipse：可视化源代码度量工具](http://www.infoq.com/cn/news/2015/03/codecity-eclipse)

## 反编译
- [Eclipse Class Decompiler](http://opensource.cpupk.com/decompiler)
- [JD-Eclipse](http://jd.benow.ca/)

## 其他
- [AnyEdit Tools](https://marketplace.eclipse.org/content/anyedit-tools)
- [FindBugs Eclipse Plugin](https://marketplace.eclipse.org/content/findbugs-eclipse-plugin)
- [Checkstyle Plug-in](https://marketplace.eclipse.org/content/checkstyle-plug)
- [EclEmma Java Code Coverage](https://marketplace.eclipse.org/content/eclemma-java-code-coverage)
- [PMD Eclipse](https://marketplace.eclipse.org/content/pmd-eclipse)
- [MoreUnit](https://marketplace.eclipse.org/content/moreunit)

## 教程
- [eclipse如何卸载插件](http://jingyan.baidu.com/article/54b6b9c02dcd5a2d583b4704.html)

# 快捷键
## 项目/文件
- Ctrl+N 通过向导创建新项目 -  Ctrl+shift+R 查找并打开资源
- Alt+Enter 查看文件属性
- Ctrl+S 保存当前文件
- Ctrl+Shift+S 保存所有文件
- Ctrl+W 关闭当前文件窗口
- Ctrl+Shift+W 关闭所有文件窗口
- F5 对选中的元素与本地文件系统进行同步刷新
 
## 窗口
- f12 焦点切换到编辑窗口
- ctrl+f10：显示视图菜单 ？？？
- ctrl+f8/(shift+f8)：全局 下/上一个透视图
- ctrl+f7/(shift+f7)：切换至前一个/后一个视图，可改为 ctrl+shift+PageDown/ctrl+PageUp
- ctrl+PageDown/ctrl+PageUp：切换至前一个/后一个编辑窗口
- ctrl+e 展示编辑窗口列表，通过方向建选择要显示的编辑窗口
- ctrl+m：最大化/非最大化编辑窗口
- ctrl+shift+e：显示管理当前打开的所有的 View 的管理器(可以选择关闭,激活等操作)
- ctrl+shift+w：关闭所有打开的 Editer
- ctrl+f10：打开编辑窗口左侧栏的可选菜单
- alt+-：打开编辑窗口的可选菜单
- shift+f10：打开鼠右键菜单
 
## 导航
- f3：跳转至类型/变量定义位置
- f4：打开类型层次结构
- Ctrl+shift+T 查找并打开类文件（在编辑器里起作用）
- Ctrl+shift+R 查找并打开资源
- home/end：跳转至一行代码的起始（带缩进）/结尾，双击home跳转至行首
- ctrl+home/end：跳转至文件的头/尾
- ctrl+right/left：向左或向右跳转一个单词
- ctrl+shift+down/up：跳转至前一个或后一个方法
- alt+right：下一个编辑的页面
- alt+left：上一个编辑的页面
- ctrl+q：定位到最后编辑的地方
- ctrl+l: 跳转至某一行
- ctrl+o：快速显示 OutLine
- ctrl+t：快速显示当前类的继承结构
- ctrl+shift+p：定位到对于的匹配符(譬如{}) (从前面定位后面时,光标要在匹配符里面,后面到前面,则反之)
- ctrl+g：工作区中的声明
- ctrl+shift+g：工作区中的引用
- ctrl+alt+h: 查找调用层次体系

## 查找
- ctrl+h：打开搜索对话框
- ctrl+f：查找并替换
- ctrl+j：正向增量查找(按下 ctrl+j 后，你所输入的每个字母编辑器都提供快速匹配定位到某个单词，如果没有，则在 stutes line 中显示没有找到了，查一个单词时，特别实用，这个功能 Idea 两年前就有了)
- ctrl+shift+j： 反向增量查找(和上条相同,只不过是从后往前查)
- ctrl+k：参照选中的 Word 快速定位到下一个
- ctrl+shift+k：参照选中的 Word 快速定位到上一个
- alt+shif+up：扩大选中范围，元素 > 行 > 块 > 方法 > 类
- alt+shif+down：缩小选中范围，类 > 方法 > 块 > 行 > 元素

## 编辑
- ctrl+1：快速修复
- alt+/：内容辅助
- ctrl+d：删除当前行，可同 sublime 等改为 ctrl + x
- shift+enter：在当前行的下一行插入空行，可同 sublime 等改为 ctrl + enter
- ctrl+shift+enter：在当前行的上一行插入空行
- ctrl+alt+down：复制当前行到下一行，与 Linux 系统工作区间冲突，可同 sublime 等改为 ctrl + shift down
- ctrl+alt+up：复制当前行到上一行，与 Linux 系统工作区间冲突，只用复制到下一行即可
- alt+down：当前行和下面一行交互位置，可同 sublime 等改为 ctrl + down（取消原先的动作绑定）
- alt+up：当前行和上面一行交互位置，可同 sublime 等改为 ctrl + down（取消原先的动作绑定）
- ctrl+/： 注释当前行，再按则取消注释
- ctrl+shif+f：格式化
- ctrl+shift+x：把当前选中的文本全部变味小写
- ctrl+shift+y：把当前选中的文本全部变为小写
- ctrl+shift+O：自动调整import部分

## 调试
- f7：单步返回
- f6：单步跳过
- f5：单步跳入 f5
- ctrl+f5：单步跳入选择
- f11：调试上次启动
- f8：继续
- shift+f5：使用过滤器单步执行
- ctrl+shift+b：添加/去除断点
- ctrl+d：显示
- ctrl+f11：运行上次启动
- ctrl+r：运行至行
- ctrl+u：执行

## 重构
- alt+shift+r：重命名，可同 sublime 等改为 ctrl + d（原删除动作可改为 ctrl + x）
- alt+shift+m：抽取方法 (这是重构里面最常用的方法之一了，尤其是对一大堆泥团代码有用)
- alt+shift+c：修改函数结构(比较实用，有 n 个函数调用了这个方法，修改一次搞定)
- alt+shift+l：抽取本地变量( 可以直接把一些魔法数字和字符串抽取成一个变量，尤其是多处调用的时候)
- alt+shift+f：把 class 中的 local 变量变为 field 变量 (比较实用的功能)
- alt+shift+i：合并变量(可能这样说有点不妥 inline)
- alt+shift+v：移动函数和变量(不怎么常用)
- alt+shift+z：重构的后悔药(undo)

## 其他
- ctrl+shift+b：设置或取消断点
- Ctrl+=：放大
- ctrl+-：缩小

## TODO
创建统一的快捷键

# 主题
- https://github.com/guari/eclipse-ui-theme 
- http://eclipsecolorthemes.org/?list=toppicks&lang=html 
- https://github.com/jeeeyul/eclipse-themes
 
# 配置
## 启动
- arch [processor architecture]
描述：指定所使用的处理器的类别
举例：eclipse -arch x86或eclipse -arch sparc

-application [id]
描述：指定要运行的应用，id为扩展org.eclipse.core.applications扩展点的插件id加扩展id
举例：例如有个插件id为edu.sdu.app，扩展id为myapp，则eclipse -application edu.sdu.app.myapp，就会执行你的扩展应用

-clean
描述：清空插件缓存内容
举例：eclipse -clean，有时插件显示不出来是因为Eclipse将插件进行了缓存以加速启动过程，若指定此参数则会清空缓存，从头加载

-configuration [cofigfile location]
描述：指定配置文件的位置，在启动时使用此目录下的配置文件config.ini来启动
举例：eclipse -configuration d:/eclipse/configuration

-data [workspace location]
描述：指定启动时的Workspace位置
举例：例如Workspace位置设在D:/myworkspace，则eclipse -data D:/myworkspace

-debug [option file]
描述：以Debug状态启动Eclipse，所有的Debug开关在.options文件中指定
举例：eclipse -debug d:/eclipse/.options

-dev [classpath entry]
描述：以开发状态启动Eclipse，这会添加所有指定的路径作为每个插件的Classpath
举例：例如eclipse -dev bin，会将产生在bin目录下的所有类加载到类路径中，这在开发插件时非常有用

-nosplash
描述：指定启动时不显示闪屏
举例：eclipse -nosplash

-vm [jre path]
描述：指定启动时所使用的Java虚拟机
举 例：例如要使用自己的Java虚拟机，则eclipse -vmD:/j2sdk1.4.2_04/jre/bin/java.exe，这样还有一个好处，就是可以开启一个Console，能够显示控制台信息， 当然若使用eclipse -vm D:/j2sdk1.4.2_04/jre/bin/javaw.exe则不会再显示控制台

-vmargs [Java VM arguments]
描述：指定启动时要使用的Java虚拟机参数
举例：例如要指定使用的内存容量，则eclipse -vmargs "-Xms256m -Xmx1024m"
注：此参数一定要放在所有参数变量的最后面
如果你觉得你的Eclipse在启动的时候很慢（比如说超过20秒钟），也许你要调整一下你的Eclipse启动参数了，以下是一些``小贴士'':
1. 检查启动Eclipse的JVM设置。 在Help\About Eclipse SDK\Configuration Detail里面，你可以看到启动Eclipse的JVM。 这个JVM和你在Eclipse中设置的Installed JDK是两回事情。 如果启动Eclipse的JVM还是JDK 1.4的话，那最好改为JDK 5，因为JDK 5的性能比1.4更好。
C:\eclipse\eclipse.exe -vm "C:\Program Files\Java\jdk1.5.0_08\ bin\javaw.exe"
2. 检查Eclipse所使用的heap的大小。 在C:\eclipse目录下有一个配置文件eclipse.ini，其中配置了Eclipse启动的默认heap大小
-vmargs
-Xms40M
-Xmx256M
所以你可以把默认值改为:
-vmargs
-Xms256M
-Xmx512M
当然，也可以这样做，把堆的大小改为256 - 512。
C:\eclipse\eclipse.exe -vm "C:\Program Files\Java\jdk1.5.0_08\ bin\javaw.exe" -vmargs -Xms256M -Xmx512M
3. 其他的启动参数。 如果你有一个双核的CPU，也许可以尝试这个参数:
-XX:+UseParallelGC
让GC可以更快的执行。（只是JDK 5里对GC新增加的参数）

## 热加载
- [Using Tomcat Reload Features To Speed Up Development](https://www.mulesoft.com/tcat/tomcat-reload)
- [How to configure hot deploy in Eclipse](http://www.mkyong.com/eclipse/how-to-configure-hot-deploy-in-eclipse/)
- [Eclipse: Apache Tomcat doesn't update my project until I restarted Eclipse](http://stackoverflow.com/questions/10250861/eclipse-apache-tomcat-doesnt-update-my-project-until-i-restarted-eclipse)

问题：在 Eclipse 外编辑文件时，无法热加载

- [能够提高开发效率的Eclipse实用操作](http://blog.jobbole.com/103503/)
- [提高开发效率的 Eclipse 实用操作（2）](http://blog.jobbole.com/106343/)

# 常见问题
## 新建工程三个 JRE 选项的区别
- Use an execution environment JRE：根据 Execution Environment 来选择对应版本的 JRE，在 Window > Preference > Java > Installed JRES > Execution Environment 中配置 —— 虽然 JRE 高版本兼容低版本，但选择了低版本的编译环境，而没有安装对应的 JRE，还是会出现警告，最好还是安装对应版本的 JRE。
- Use project specific JRE：指定项目的 JRE，选中该项后可从 Window > Preference > Java > Installed JRES 配置的 JRE 列表选择一个 JRE。
- Use default JRE：使用默认配置的 JRE（Window > Preference > Java > Installed JRES > default）。

备注：Compiler compliance level（编译器服从的等级）可用于设置你的 class 的运行等级，即你的程序是以哪种版本的 JDK 进行编译，所以得到的 class 至少要在这个版本的 JRE 上运行才行。

[eclipse中新建Java工程的三个JRE选项区别](http://blog.csdn.net/wdjhzw/article/details/42086615)

## JavaDoc 中文乱码
- [Eclipse导出JavaDoc中文乱码问题解决](http://blog.csdn.net/xzknet/article/details/7999983)

## Fail to create the java Virtual Machine
- [解决Fail to create the java Virtual Machine](http://jingyan.baidu.com/article/afd8f4de466baf34e286e917.html)
- 虚拟机内存分配配置问题
- Nexus Release repository redeploy
- [Nexus Tips: Disable Redeployment in Nexus](http://blog.sonatype.com/2009/11/nexus-tips-disable-redeployment-in-nexus/#.ViifuH4rLIU)
- [deploy on nexus artifacts with Snapshot policy but without SNAPSHOT string in version](http://stackoverflow.com/questions/13590257/deploy-on-nexus-artifacts-with-snapshot-policy-but-without-snapshot-string-in-ve)
- [Maven deploy: forcing the deploy even if artifact already exists](http://stackoverflow.com/questions/11175288/maven-deploy-forcing-the-deploy-even-if-artifact-already-exists)
- [release repository allow redeploy](https://www.google.com/?gws_rd=ssl#q=release+repository+allow+redeploy)

## Toggle Word Wrap 
- https://www.eclipse.org/eclipse/news/4.6/platform.php#word-wrap
- http://stackoverflow.com/questions/2846002/does-eclipse-have-line-wrap

## M2Eclipse class not found
问题：M2Eclipse 创建的 Web 项目在 Eclipse 中启动时，可能会遇到 class not found 的问题，而直接使用 maven 在命令行打包却没有问题。

分析：

1. JRE 版本问题

    这是由源码要求的 JRE 版本和 maven-compiler-plugin 配置不一致导致的。可打开 Problems 视图，查看是否存在该问题相关的提示。如果有的话，只要设置 maven-compiler-plugin 为正确的 JRE 编译级别即可避免该问题。

2. 项目没有正确的构建

    在 Eclipse 里直接部署 M2Eclipse 创建的 Web 项目时，会将项目根目录下的 target/classes 和 target/m2e-wtp/web-resources 拷贝至部署目录下。如果检查 target 目录下没有对应的文件存在，请执行"项目 > Maven -> Update Project"和"项目 > Build Project"。

总结：关键是学会使用 Problems 试图提供的错误提示解决问题，以及熟悉 M2Eclipse 生成的 target 目录（和 Web Deployment Assembly 有关，要与 maven 命令生成的文件结构区分），可参考如下的解释。

- target/classes：项目源码变异后的文件和一些资源文件（src/main/java/ 和 src/main/resource）
- target/m2e-wtp/web-resources：META-INF 和 WEB-INF（包含一些系统路径指定的依赖 jar 包）

# 教程
- [eclipse使用国内镜像站点安装插件](http://www.cnblogs.com/smartdog/archive/2012/11/06/2757372.html)
- [再也不怕重装eclipse! 让你的eclipse插件只下载一次](http://www.oschina.net/question/54100_49351)
- [Eclipse在线安装插件奇慢的解决办法](http://blog.csdn.net/aa4790139/article/details/42643683)
- [eclipse插件安装方式](http://jingyan.baidu.com/article/15622f2454893cfdfcbea5d1.html)
- [eclipse插件安装的四种方法](http://www.blogjava.net/javajoyo/archive/2008/10/20/235495.html)
- [Eclipse Shortcuts](http://www.shortcutworld.com/en/win/Eclipse.html)
- [有哪些使用 Eclipse 的好习惯或者小技巧？](http //www.zhihu.com/question/29013594)
- [Setting up Eclipse](https://docs.moodle.org/dev/Setting_up_Eclipse)


---

# 待整理
- [UML Designer](http://marketplace.obeonetwork.com/module/uml)
- [VJET](http://wiki.eclipse.org/VJET)
- [multiproperties](https://code.google.com/a/eclipselabs.org/p/multiproperties/)
- [SQL Explorer](http://eclipsesql.sourceforge.net/)
- [Acceleo](http://www.eclipse.org/acceleo/)
- [Eclipse HTML Tidy ](http://eclipsetidy.sourceforge.net/)
- [Regex Util](http://www.oschina.net/p/regex+util)
- [MyBatis Editor](http://www.oschina.net/p/mybatiseditor)
- [JSON Editor Plugin](http://www.oschina.net/p/json+editor+plugin)
- [Activiti Designer](http://www.oschina.net/p/activiti-designer)
- [Eclim](http://www.oschina.net/p/eclim)
- [AmaterasUML](http://amateras.osdn.jp/cgi-bin/fswiki_en/wiki.cgi?page=AmaterasUML)
