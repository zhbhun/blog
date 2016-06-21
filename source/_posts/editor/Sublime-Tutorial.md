---
title: Sublime 安装配置
date: 2015-11-14
categories: Editor
tags: Editor
---

# 配置
- trim_trailing_white_space_on_save，自动移除行尾多余空格，处女座更安心了
- ensure_newline_at_eof_on_save，文件末尾自动保留一个空行，懂的人自然知道它的用处
- font_face 设置字体。Microsoft YaHei Mono 是一款混合字体，专为代码优化，看起来很舒服。当然你也可以使用你自己喜欢的字体，或者删掉本行，使用默认字体
- disable_tab_abbreviations 设置为 true ，禁用 Emmet 的 tab 键功能（请使用 ctrl+e），系统自带的 tab 功能还是可圈可点的。当然你也可以不设置它，以完全使用 Emmet 的 tab 补全功能
- translate_tabs_to_spaces 很明白就是把代码 tab 对齐转换为空格对齐，tab_size 配合设置空格数。这个需求因人而异了，不喜欢可以去掉
- draw_minimap_border，用于右侧代码预览时给所在区域加上边框，方便识别
- save_on_focus_lost，窗口失焦立即保存文件，嘛嘛再也不用担心你忘记保存了
- highlight_line，当前行高亮
- word_wrap，设置自动换行
- fade_fold_buttons，默认显示行号右侧的代码段闭合展开三角号
- bold_folder_labels，侧边栏文件夹显示加粗，区别于文件
- highlight_modified_tabs，高亮未保存文件
- default_line_ending: “unix”, 使用 unix 风格的换行符
- auto_find_in_selection: true ，开启选中范围内搜索（而不是整个文档
- ignored_packages: 禁用的插件
- auto_find_in_selection: 在选中范围内搜索和替换
- caret_style: phase, 使光标闪动更加柔和
- rulers: [80, 100], 行宽标尺
- draw_white_space: all, 显示空白字符
- folder_exclude_patterns: 文件夹排除模式
    ``` javascript
    "folder_exclude_patterns": [
      ".svn",
      ".git",
      ".hg",
      "CVS",
      "node_modules",
      "bower_components"
    ]
    ```

---

# 插件
- 仓库地址: https://packagecontrol.io/
- 统计地址: https://packagecontrol.io/stats
- 概览地址: https://packagecontrol.io/browse
- 文档地址: https://packagecontrol.io/docs

## 安装必备
- [PackageControl](https://packagecontrol.io/installation): 包管理器
- [ConvertToUTF8](https://packagecontrol.io/packages/ConvertToUTF8): 编辑和保存文件编码为 GBK, BIG5, EUC-KR, EUC-JP, Shift_JIS 等格式.
- [EncodingHelper](https://packagecontrol.io/packages/EncodingHelper): 在状态栏显示文件编码

## 语言语法
- [Babel](http://https//github.com/babel/babel-sublime)
- [CSS3](https://packagecontrol.io/packages/CSS3): 对 CSS 支持最完善的插件
- [Sass](https://packagecontrol.io/packages/Sass)
- [LESS](https://packagecontrol.io/packages/LESS)
- [SCSS](https://packagecontrol.io/packages/SCSS)

## 代码片段
- [jQuery](https://packagecontrol.io/packages/jQuery)
http://www.hongkiat.com/blog/sublime-code-snippets/
- [angularJS-sublime-package](https://github.com/angular-ui/AngularJS-sublime-package)
- [Nodejs](https://packagecontrol.io/packages/Nodejs)
- [React-native-snippets](https://packagecontrol.io/packages/react-native-snippets)

### Emmet
#### HTML
- html:5: 生成 HTML5 模板
#### CSS
- fz3.6/2 -> ctrl + shift + y -> ctrl + e -> font-size: 1.8em

### ReactJS
https://packagecontrol.io/packages/ReactJS
- cdm: componentDidMount: fn() { ... }
- cdup: componentDidUpdate: fn(pp, ps) { ... }
- cs: var cx = React.addons.classSet;
- cwm: componentWillMount: fn() { ... }
- cwr: componentWillReceiveProps: fn(np) { ... }
- cwu: componentWillUpdate: fn(np, ns) { ... }
- cwun: componentWillUnmount: fn() { ... }
- cx: cx({ ... })
- fdn: React.findDOMNode(...)
- fup: forceUpdate(...)
- gdp: getDefaultProps: fn() { return {...} }
- gis: getInitialState: fn() { return {...} }
- ism: isMounted()
- props: this.props.
- pt: propTypes { ... }
- rcc: component skeleton
- refs: this.refs.
- ren: render: fn() { return ... }
- scu: shouldComponentUpdate: fn(np, ns) { ... }
- sst: this.setState({ ... })
- state: this.state.

### Bootstrap 3 Snippets
https://packagecontrol.io/packages/Bootstrap%203%20Snippets

## 语法分析
- [SublimeLinter](https://packagecontrol.io/packages/SublimeLinter)
- [SublimeLinter-html-tidy](https://packagecontrol.io/packages/SublimeLinter-html-tidy)
- [SublimeLinter-contrib-mdl](https://packagecontrol.io/packages/SublimeLinter-contrib-mdl)
- [SublimeLinter-json](https://packagecontrol.io/packages/SublimeLinter-json)
- [SublimeLinter-jshint](https://packagecontrol.io/packages/SublimeLinter-jshint)
- [SublimeLinter-jscs](https://packagecontrol.io/packages/SublimeLinter-jscs)
- [SublimeLinter-contrib-eslint](https://packagecontrol.io/packages/SublimeLinter-contrib-eslint)
- [SublimeLinter-jsxhint](https://packagecontrol.io/packages/SublimeLinter-jsxhint)
- [SublimeLinter-csslint](https://packagecontrol.io/packages/SublimeLinter-csslint)
- [SublimeLinter-contrib-scss-lint](https://packagecontrol.io/packages/SublimeLinter-contrib-scss-lint)
- [SublimeLinter-contrib-sqlint](https://packagecontrol.io/packages/SublimeLinter-contrib-sqlint)
- [SublimeLinter-javac](https://packagecontrol.io/packages/SublimeLinter-javac)
- [SublimeLinter-xmllint](https://packagecontrol.io/packages/SublimeLinter-xmllint)

## 格式化
- [HTML/CSS/JS Prettify](https://packagecontrol.io/packages/HTML-CSS-JS%20Prettify): 代码格式化(文件路径不能由中文)
- [HTMLBeautify](https://github.com/rareyman/HTMLBeautify)
- [JsFormat](https://github.com/jdc0589/jsFormat)
- [Sublime-CSS-Format](http://mutian.github.io/Sublime-CSS-Format/)
- [Pretty JSON](https://packagecontrol.io/packages/Pretty%20JSON): JSON 格式化/压缩/查询工具
- [SublimeAStyleFormatter](https://packagecontrol.io/packages/SublimeAStyleFormatter)
- [CodeFormatter](https://packagecontrol.io/packages/CodeFormatter)
- [Alignment](https://sublime.wbond.net/packages/Alignment): 智能对齐

### CSS Format
- 功能: CSS Formatting for Sublime Text, you can convert CSS/SASS/SCSS/LESS code to Expanded, Compact or Compressed format. CSS Format is just only a formatter, do not supports grammar check and auto correct feature.
- 地址: https://packagecontrol.io/packages/CSS%20Format
- 用法:
    - 鼠标右键 -> CSS Format
    - Edit -> CSS Format
    - ctrl + shift + p -> Format CSS: XXX
- 快捷键
- 配置: *Preferences > Package Settings > CSS Format > Settings - User*
    - indentation: Format indentation, you can set it to " ". By default, this is set to "\t"
    - format_on_save: Set to true to trigger format on save. By default, this is set to false.
    - format_on_save_action: Format action. You can refer to Settings - Default. By default, this is set to "expand".
    - format_on_save_filter: CSS Format matches the name of the file being saved against this regular expression to determine if a build should be triggered. By default, the setting has a value of `"\\.(css|sass|scss|less)$"`.

### SqlBeautifier
- 功能: A sublime plugin to format SQL
- 地址: https://packagecontrol.io/packages/SqlBeautifier
- 兼容性: sublime 2 and 3
- 配置
    - keyword_case: Changes how keywords are formatted. Allowed values are “upper”, “lower” and “capitalize” and null (leaves case intact).
    - identifier_case: Changes how identifiers are formatted. Allowed values are “upper”, “lower”, and “capitalize” and null (leaves case intact).
    - strip_comments: If True comments are removed from the statements.
    - reindent: If True the indentations of the statements are changed.
    - indent_tabs: If True tabs instead of spaces are used for indentation.
    - indent_width: The width of the indentation, defaults to 2.
- 快捷键
    - mac: `{ "keys": ["super+k", "super+f"], "command": "sql_beautifier" }`
    - Windows / Linux: `{ "keys": ["ctrl+k", "ctrl+f"], "command": "sql_beautifier" }`


## 注释
- [DocBlockr](https://github.com/spadgos/sublime-jsdocs)

## 其他
- [SideBarEnhancements](https://packagecontrol.io/packages/SideBarEnhancements): 增强侧边栏
- [SideBarGit](https://packagecontrol.io/packages/SideBarGit): 侧边栏增加 git 命令
- [Focus File on Sidebar](https://packagecontrol.io/packages/Focus%20File%20on%20Sidebar)
- [Modific](https://packagecontrol.io/packages/Modific): 高亮自从上一次提交后的修改行
- [ExpandRegion](https://packagecontrol.io/packages/ExpandRegion): 扩展选区
- [MultiEditUtils](https://packagecontrol.io/packages/MultiEditUtils)
- [Color Highlighter](https://packagecontrol.io/packages/Color%20Highlighter): 颜色高亮
- [ApplySyntax](https://packagecontrol.io/packages/ApplySyntax): 语言分析增强
- [IMESupport](https://packagecontrol.io/packages/IMESupport):  Windows 下输入法支持, 解决输入法的输入栏不在光标位置的问题
- [Package Syncing](https://packagecontrol.io/packages/Package%20Syncing): 插件同步工具
- [HexViewer](https://packagecontrol.io/packages/HexViewer): 十六进制文件查看
- [Clipboard History](https://packagecontrol.io/packages/Clipboard%20History): 剪贴板历史
- [SyncedSideBar](https://packagecontrol.io/packages/SyncedSideBar)
- [Terminal](https://packagecontrol.io/packages/Terminal): 从当前文件或项目根路径启动控制台
- [BracketHighlighter](https://sublime.wbond.net/packages/BracketHighlighter: 括号高亮
- [Autoprefixer](https://packagecontrol.io/packages/Autoprefixer): CSS 自动加前缀
- [Vintageous](https://packagecontrol.io/packages/Vintageous): vi / vim 模拟器
- [Alignment](https://packagecontrol.io/packages/Alignment)
- [Can I Use](https://packagecontrol.io/packages/Can%20I%20Use)
- [Tag](https://packagecontrol.io/packages/Tag)
- [AutoFileName](https://github.com/BoundInCode/AutoFileName)
- [AllAutocomplete](https://github.com/alienhard/SublimeAllAutocomplete)
- [SublimeREPL](https://github.com/wuub/SublimeREPL)
- [ColorPicker](http://weslly.github.io/ColorPicker/)

---

# 主题
https://sublime.wbond.net/browse/labels/theme
- [soda-theme](http://buymeasoda.github.io/soda-theme/)
    - [Soda Light](https://sublime.wbond.net/packages/Theme%20-%20Soda)
    - [Soda Dark](https://sublime.wbond.net/packages/Theme%20-%20Soda)
- [Nexus](https://sublime.wbond.net/packages/Theme%20-%20Nexus)
- [Flatland](https://sublime.wbond.net/packages/Theme%20-%20Flatland)
- [Material Theme](https://packagecontrol.io/packages/Material%20Theme)
- [Spacegray Light](https://sublime.wbond.net/packages/Theme%20-%20Spacegray)
- [Spacegray Dark](https://sublime.wbond.net/packages/Theme%20-%20Spacegray)

---

# 配色
- http://colorsublime.com/
- http://colorsublime.com/how-to-install-a-theme
- [Flatland Dark](https://sublime.wbond.net/packages/Theme%20-%20Flatland)

---

# 快捷键
## 跳转
- ctrl + p: 文件定位
    - 查找文件, 斜杠代表路径, 支持模糊匹配
    - `@`: 符号跳转
    - `#`: 关键字跳转
    - `:`: 行号跳转
    -
- ctrl + ;: 词语定位
- ctrl + r: 函数定位
- ctrl + g: 行数定位

## 光标
- ctrl + m: 光标在开闭括号之间跳转
- ctrl + shift + m: 将匹配括号中的内容选中
- ctrl + left/right: 向左或向右移动一个单词的光标
- ctrl + d: 选中相同的词(可用于修改本地变量名)
- ctrl + k:
- ctrl + alt + up/down: 将选中的区域分割成多行选中状态
- shift + 鼠标右键拖动: 多重光标选中
- ctrl + l: 选中一行
- ctrl + shif + j: 已缩进层级为依据，一层层向外选中
- alt + f3: 选择所有相同的词
- ctrl + shift + ': 选中 HTML 一对标签(Emmet)
- ctrl + shift + space: 扩展选取(ExpandRegion)

## 查找
- 选中关键字
    - f3: 下一个
    - shift f3: : 上一个
- ctrl + f: 普通查找
    - enter: 下一个
    - shift + enter: 上一个
    - alt + enter: 选中其出现的所有位置
    - alt + r: 切换正则表达式模式
    - alt + c: 切换大小写敏感模式
    - alt + w: 切换整字匹配模式
- ctrl + h: 查找替换
    - ctrl + shift + h: 替换当前关键字
    - ctrl + alt + enter: 替换所有匹配关键字
- ctrl + shift + f: 在文件夹中查找
- ctrl + i: 代码字符串定位

## 编辑
- ctrl + shift + enter: 向光标前插入一行
- ctrl + enter: 向光标后插入一行
- shift + ctrl + up/down: 上下移动行
- ctrl + shift + d: 复制粘贴当前行
- ctrl + shift + v: 以当前缩进粘贴代码
- ctrl + J: 拼接行(css格式化时挺有用)
- ctrl + k, k: 从光标开始的地方删除到行尾
- ctrl + shift + backspace: 左侧全部删除
- ctrl + shift + delete: 右侧全部删除
- ctrl + shift + k: 删除当前行
- ctrl + x: 删除当前行
- ctrl + t: 相邻字母互换位置
- ctrl + [: 向左缩进
- ctrl + ]: 向右缩进
- ctrl + /: 注释
- ctrl + shift + /: 当前位置插入块注释
- ctrl + z: 恢复至前编辑状态
- ctrl + y: ...
- ctrl + k, u: 转换选中文本为大写
- ctrl + k, l: 转换选中文本为小写
- ctrl + e: emmet
- ctrl + shift + y: 将光标处的表达式计算，对于数学不好的很有用

## 视图
- ctrl + shit [: 折叠代码
- ctrl + shift ]: 展开代码

## 工程
- ctrl + alt + p: 切换项目

## 窗口/标签
- ctrl + shift + n: 创建一个新窗口
- ctrl + n: 新增标签
- ctrl + shift + t: 打开最后一次关闭的文件
- ctrl + tab: 循环遍历标签
- ctrl + shift + tab: 反向循环遍历标签
- ctrl + pgup: 前一标签
- ctrl + pgdn: 后一标签
- ctrl + w: 关闭标签
- ctrl + shift + w: 关闭所有标签

## 分屏
- Alt + Shift + 2: 左右分屏
- Alt + Shift + 8: 上下分屏
- Alt + Shift + 5: 上下左右分屏
- ctrl + 数字: 跳转到指定屏
- ctrl + shift + 数字键: 将当前屏移动到指定屏

## 通用
- ctrl + f2: 设置书签
- f2: 切换书签
- f11: 全屏
- shift + f11: 无干扰全屏
- ctrl + shift + p: 打开命令行, 并利用缩写快速查找命令
    - package control/pc: 包管理器, 常用命令: pci(安装插件), pcr(卸载插件), pcd(禁用插件), pce(启用插件)
    - project: 项目
    - snippet: 代码片段
    - set syntax/ss: 语法设置命令
- ctrl + k, ctrl + b: 隐藏/打开侧边栏

---

# 项目

---

# 参考文献
## 文档
- 官方文档：http://www.sublimetext.com/docs/3/
- 非官方文档: http://sublime-text-unofficial-documentation.readthedocs.org/

## 社区论坛
- 官方论坛：http://www.sublimetext.com/forum/
- [Stack Overflow Sublime Text](http://stackoverflow.com/questions/tagged/sublimetext)
- [Stack Overflow Sublime Text 2](http://stackoverflow.com/questions/tagged/sublimetext2)
- [Stack Overflow Sublime Text 3](http://stackoverflow.com/questions/tagged/sublimetext3) --- 比官方文档还要全面
- Package Control: https://sublime.wbond.net/ --- 大量的Sublime Text插件和主题


## 推荐书籍
- [Mastering Sublime Text](http://www.amazon.com/Mastering-Sublime-Community-Experience-Distilled/dp/1849698422/) --- 书中介绍的插件很实用，但对编辑技巧介绍不全
- [Instant Sublime Text Starter](http://www.amazon.com/Instant-Sublime-Text-Starter-Haughee/dp/1849693927/)

## 视频
- Getting Started with SublimeText：https://www.youtube.com/watch?v=04gKiTiRlq8
- Sublime Text Pefect Workflow：https://www.youtube.com/watch?v=bpEp0ePIOEM&list=PLuwqxbvf3olpLsnFvo06gbrkcEB5o7K0g
- 前端开发工具技巧介绍—Sublime篇: http://www.imooc.com/learn/40

## 精选博文
- [Sublime Text 全程指南](http://zh.lucida.me/blog/sublime-text-complete-guide/)
- [jikeytang/sublime-text](https://github.com/jikeytang/sublime-text)

## 其他
- [Sublime Text：初学者不知道的那些事](http://blog.jobbole.com/23949/)
- [译:Sublime Text 2 项目设置](http://blog.jenux.me/?p=49)
- [Sublime Text 知乎话题](http://www.zhihu.com/topic/19668076)
- [Sublime Text 有哪些实用技巧](http://www.zhihu.com/question/19976788)
    - [常用代码片段](https://github.com/gyfnice/javascript/tree/sublime-snippets/snippets/sublime/javascript)
    - [Sublime Text 2 Tips and Tricks](http://net.tutsplus.com/tutorials/tools-and-tips/sublime-text-2-tips-and-tricks/)
    - [Sublime Text 2 入门及技巧](http://lucifr.com/139225/sublime-text-2-tricks-and-tips/)
    - [一些必不可少的Sublime Text 2插件](一些必不可少的Sublime Text 2插件)
    - [Sublime Text 3 调教你的私人利器（上](http://www.sheyilin.cn/2015/05/sublime_text_3_tiao_jiao_ni_de_si_ren_li_qi_1/)
    - [Sublime Text 3 调教你的私人利器（下）](http://www.sheyilin.cn/2015/05/sublime_text_3_tiao_jiao_ni_de_si_ren_li_qi_2/)
    - [Commands — Sublime Text Unofficial Documentation](http://docs.sublimetext.info/en/latest/reference/commands.html)
    - http://code.tutsplus.com/categories/sublime-text
    - https://github.com/jikeytang/sublime-text
    - [前端开发工具技巧介绍—Sublime篇](http://www.imooc.com/learn/40)
    - [快乐的sublime编辑器](http://www.imooc.com/learn/333)
    - [Sublime Text 手冊](http://docs.sublimetext.tw/)
    - [Tuts+ Premium Course: Perfect Workflow in Sublime Text 2](https://tutsplus.com/course/improve-workflow-in-sublime-text-2/)
    - [sublime text 使用攻略](http://www.yunxiu.org/blog/article/5487.htm)
    - [Emmet 插件使用教程](http://www.yunxiu.org/blog/article/5490.htm)
    - [前端开发工具技巧介绍](http://www.imooc.com/learn/40)
    - [Raining » sublime Text 快捷键常用总结](http://1.lgmrain.sinaapp.com/?p=163)
- [我的 Sublime Text 2 笔记](http://yanhaijing.com/tool/2014/10/24/my-sublime/)
- [KeymapManager增加检测快捷键冲突的功能](http://www.welefen.com/keymapmanager-add-check-plugins-keymap-conflict-feature.html)
- [Emmet：HTML/CSS代码快速编写神器](http://www.iteye.com/news/27580)
- [Sublime Text 2快捷键大全 ](http://blog.sina.com.cn/s/blog_7d34486c0100vu20.html)
- [sublime-text-3-win 快捷键练习](https://www.shortcutfoo.com/app/dojos/sublime-text-3-win)
- [/markdown-to-pdf](http://www.tcreator.info/social/experience/markdown-to-pdf.html)
- [KeymapManager增加检测快捷键冲突的功能http://www.welefen.com/keymapmanager-add-check-plugins-keymap-conflict-feature.html]
- [如何优雅地使用Sublime Text](http://www.jeffjade.com/2015/12/15/2015-04-17-toss-sublime-text/)


# Mac
```
[
  /* tab */
  { "keys": ["super+pageup"], "command": "prev_view" },
  { "keys": ["super+pagedown"], "command": "next_view" },
  /* find */
  { "keys": ["f3"], "command": "find_next" },
  { "keys": ["shift+f3"], "command": "find_prev" },
  /* cursor*/
  { "keys": ["super+left"], "command": "move", "args": {"by": "subwords", "forward": false} },
  { "keys": ["super+right"], "command": "move", "args": {"by": "subword_ends", "forward": true} },
  { "keys": ["home"], "command": "move_to", "args": {"to": "bol", "extend": false} },
  { "keys": ["end"], "command": "move_to", "args": {"to": "eol", "extend": false} },
  /* line */
  { "keys": ["super+up"], "command": "swap_line_up" },
  { "keys": ["super+down"], "command": "swap_line_down" },
  /* comment */
  { "keys": ["super+shift+forward_slash"], "command": "toggle_comment", "args": { "block": true } }
]
```

# Linux
1. 解决 Sublime Text 无法使用中文输入法：http://www.jianshu.com/p/bf05fb3a4709
2. ...