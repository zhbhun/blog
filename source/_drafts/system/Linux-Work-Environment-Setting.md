---
title: Linux 工作环境设置
date: 2016-07-22
category: System
tags:
- System
- Linux
---

# 系统
- Ubuntu
- Linux
- ...

# 软件
## 清理
- `sudo apt-get purge libreoffice?`

## 字体
...

## 办公
- WPS
- Thunderbird
- [为知笔记](http://www.wiz.cn/wiznote-linux.html)
- FoxitReader
- Master PDF Editor
- Okular

# 下载
- Deluge
- FileZilla

## 娱乐
- 网易云音乐
- VLC
- Banshee

## 游戏
- ppsspp

## 辅助
- Remmina
    1. `sudo apt-add-repository ppa:remmina-ppa-team/remmina-next`
    2. `sudo apt-get update`
    3. `sudo apt-get install remmina remmina-plugin-rdp libfreerdp-plugins-standard`
- 有道词典
- Cairo
- Diffuze
- GitBook
- Diffuze
- Shutter

## 网盘
- Dropbox
- 坚果云

## 通讯
- Slack
- Wine-QQ
- Wechat
- Gitter

## 设计
- Wine Balsamiq Mockups
- Dia
- Xmind
    1. 下载安装：http://www.xmindchina.net/xiazai.html
    2. 如果是 64 位系统，修改 `/usr/lib/xmind/XMind.ini`，设置 vm 为 64 位的 jdk 路径

        ```
        -vm
        /home/xxx/software/java/7/64/bin/java
        ```

- Gimp
- Pencil
- UMLDesigner

## 输入法
- 搜狗输入法
    1. 安装 Fcitx：设置 -> 输入法 -> Fctix
    2. 下载并直接安装搜狗输入法：http://pinyin.sogou.com/linux/?r=pinyin
    3. 设置 Fcitx：去除多余的输入法，但保留搜狗输入法和英文键盘
    4. 使用：shift 键切换中英文输入法
- ...

## 浏览器
- Chrome
- Firefox

## 编辑器
- Sublime
    1. 下载并安装：https://www.sublimetext.com/3
    2. 解决输入法问题：https://github.com/lyfeyaj/sublime-text-imfix
- Atom

## IDE
- Eclipse
- Webstorm
- IntelliJ IEAD
- Android Studio

## 文档
- tldr
- Zeal

# 代理
[NProxy](http://goddyzhao.me/nproxy/)
[前端调试利器---nproxy](http://www.cnblogs.com/wenber/p/3893308.html)
[nproxy](https://github.com/goddyZhao/nproxy)
[ NProxy——Mac和Linux平台下的Fiddler](http://blog.csdn.net/xiaoyu411502/article/details/45671323)

## 命令行
- Apache
- Apache Tomcat
- Gradle
- Java
- Maven
- Node

## 数据库
- MySQL
    1. 安装：`sudo apt-get install mysql-server`
    2. [关闭开机启动](Ubuntu16.04 关闭apache/mysql/php的开机启动)
        - [Ubuntu10.04 下关闭 MySQL 的开机启动](http://wowubuntu.com/ubuntu1004-close-mysql.html)
        - [Ubuntu下关闭apache和mysql的开机启动](http://blog.163.com/thinki_cao/blog/static/839448752012112694037995/)

## 模拟器/虚拟机
- Genymotion
    1. 注册：https://www.genymotion.com/account/create/
    2. 登陆：https://www.genymotion.com/account/login/
    3. 下载：https://www.genymotion.com/download/
    4. 权限：`sudo chmod +x genymotion-?.?.?-linux_x??.bin`
    5. 安装：`./genymotion-？.？.？-linux_x??.bin`
- Virtual Box
- VMWare
    1. 下载：http://www.vmware.com/cn/products/workstation/workstation-evaluation.html
    2. 权限：`sudo chmod +x VMware-Workstation-Full-?.?.?-?.x??.bundle`
    2. 安装：`./VMware-Workstation-Full-?.?.?-?.x??.bundle`

## 版本管理
- SmartGit
    1. 下载：http://www.syntevo.com/smartgit/download
    2. 解压：`tar xf smartgit-linux-x_x_x.tar.gz -C 目标路径`
    3. 菜单配置：`./bin/add-menuitem.sh`
    4. 备注：
        - 也可以选择下载 deb 文件直接安装
        - smartgit1.7.1 以上版本需要使用 jdk 1.8
- GitEye
- GitKraken

## 其他
- Wine Fiddler
- Paros
- JD-GUI


# 常见问题
- [GPG 错误：http://archive.ubuntukylin.com:10006/ubuntukylin xenial InRelease: 由于没有公钥，无法验证下列签名： NO_PUBKEY 8D5A09DC9B929006](http://blog.csdn.net/lina_acm/article/details/51803756)

    ```
    W: GPG 错误：http://archive.ubuntukylin.com:10006/ubuntukylin xenial InRelease: 由于没有公钥，无法验证下列签名： NO_PUBKEY 8D5A09DC9B929006
    W: 仓库 “http://archive.ubuntukylin.com:10006/ubuntukylin xenial InRelease” 没有数字签名。
    N: 无法认证来自该源的数据，所以使用它会带来潜在风险。
    N: 参见 apt-secure(8) 手册以了解仓库创建和用户配置方面的细节。
    ```
