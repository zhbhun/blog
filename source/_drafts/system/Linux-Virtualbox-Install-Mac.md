---
title: Linux's VirtualBox 安装 Mac 虚拟机
date: 2015-09-19
category: System
tags:
- system
- mac
- virtualbox
---


# 下载资源
- OS X 10.11 El Capitan Retail by TechReviews.rar
    - Google Drive (1 part): https://goo.gl/DIIFv4
    - Google Drive (7 part): https://goo.gl/PcIQRC
    - Google Drive (4 part): https://goo.gl/jkS1zL
    - Key for virtualBox: https://goo.gl/egCKFI
- Key for virtualBox: https://goo.gl/egCKFI



- [Install OS X El Capitan 10.11 on Ubuntu on VirtualBox](https://www.youtube.com/watch?v=iHcxszAmqOI)
- [Install Bootloader and Fix Display Resolution on El Capitan on VirtualBox](https://www.youtube.com/watch?v=sVX8WK2b-9Y&nohtml5=False)


---



  - [Tech Reviews](https://www.youtube.com/channel/UC6v6ljwkDGjk8Q7Dj-yjuqg?nohtml5=False)：使用虚拟机安装 Mac 的各种教程视频


# 安装

- [VMware 11安装Mac OS X 10.10](http://jingyan.baidu.com/article/ff411625b9011212e48237b4.html)

- [在 Win 7 下使用 VMware Workstation 虚拟机安装 Mac OS X Lion 10.7.2 及 XCode](http://bbs.feng.com/read-htm-tid-3412071.html)

- [在 Win 7 下使用 VirtualBOX 虚拟机安装 OS X 10.9 Mavericks 及 Xcode 5](http://bbs.feng.com/read-htm-tid-7625465.html)
- [VirtualBOX 虚拟机安装 OS X 10.9 Mavericks 及 Xcode 5，本人X220亲测](http://www.cnblogs.com/yipu/p/3611611.html)
- [VMware 11安装Mac OS X 10.10](http://jingyan.baidu.com/article/ff411625b9011212e48237b4.html)
- [vmware怎么安装os x10.9？vmware 10安装mac os 10.9教程详解](http://www.jb51.net/os/MAC/238845.html)
- [虚拟机VMware 9安装苹果MAC OSX 10.8图文教程](http://www.33lc.com/article/4344.html)
- [VMware Workstation 11.0.0 永久注册码](http://my.oschina.net/ykuaile/blog/357552)
- [Optimize OS X 10.11 El Capitan Faster with Update Combo on VMware](http://bbs.feng.com/read-htm-tid-9908410.html)
- [在 Win 7或8 下使用 VirtualBOX 虚拟机安装 OS X 10.11 El Capitan 及 Xcode 7.0](http://bbs.feng.com/read-htm-tid-9908410.html)

- [Ubuntu 安装 OS X 10.11 虚拟机](http://hanks.xyz/2015/12/02/mac-os-in-Ubuntu/)

- [How To Change Resolution Display On Mac OS X On Virtualbox (Without Bootload)](https://www.youtube.com/watch?v=orrNHlgb-2Y&feature=youtu.be)

- [Install Bootloader and Fix Display Resolution on El Capitan on VirtualBox](https://www.youtube.com/watch?v=sVX8WK2b-9Y)





## 分辨率

[Install Bootloader and Fix Display Resolution on El Capitan on VirtualBox](https://www.youtube.com/watch?v=sVX8WK2b-9Y

1. 下载工具：https://drive.google.com/folderview?id=0B84m7Z19gucXZDlfbXdmeW5aNUk&usp=sharing

2. 在 Virtual Box 里启动 Mac OS

3. 载入 Bootload El on Virtualbox.iso，将文件拷贝到 Mac OS 系统里

4. 打开 Extra.zip，将解压后的文件夹拷贝至 系统根路径

5. 解压 Kext Wizard.zip，并打开解压后的文件

6. ...





# 优化配置

- 显示器: 系统偏好设置->辅助功能->显示器
    - 减少透明度
- Dock: 系统偏好设置->Dock
    - 最小化窗口时使用缩放效果
    - 取消弹跳打开应用程序
- 扩展: 系统偏好设置->扩展, 禁用通知中心中无用的组件和扩展
- [beamoff](https://github.com/JasF/beamoff)
    - [用beamoff给VMware的Mac OS X 10.10.x加速](http://www.cnblogs.com/yipu/p/4422355.html)
    - [VMWare 装mac os x 一个必备优化神器 beamoff](http://blog.csdn.net/whitehack/article/details/47074403)

- [VMware 11安装Mac OS X 10.10虚拟机以及优化心得](http://www.jianshu.com/p/cada5ad68081)

- [Tutorial: How to Optimize OS X Yosemite in Virtualbox (PC)](https://www.youtube.com/watch?v=4w4KUUK2Fs8)

- [Optimize Mac OS X 10.10 Yosemite Faster on Virtualbox (All Version)](https://www.youtube.com/watch?v=kDjirnJcanw)

- [Optimize OS X 10.11 El Capitan Faster with Update Combo on VMware](https://www.youtube.com/watch?v=kDjirnJcanw)








# 参考文献
- [VMware Workstation 11.x.x Unlocker to Run Mac OS X Guests in Windows 8.1 and 7](http://iosgods.com/topic/10532-vmware-workstation-11xx-unlocker-to-run-mac-os-x-guests-in-windows-81-and-7/)
- [Donk](http://www.insanelymac.com/forum/user/142645-donk/)
- [UNLOCKER206](http://iosddl.com/a04110837e382c7c/unlocker206.zip)
- [Mac OS X Virtual Machine for VMware Player in Windows](http://www.pcsteps.com/2157-mac-os-x-virtual-machine-vmware-player/)
- [VMware Workstation 11, 10, 9 and 8 Unlocker to Run Mac OS X Guests in Windows 8.1 and 7](http://www.sysprobs.com/vmware-workstation-8-0-8-0-1-unlocker-to-run-mac-os-x-guest-in-windows-7)



# 问题

## 输入法切换

- [【已解决】（VirtualBox中的）Mac中，如何把输入法切换的快捷键，换成Ctrl+空格键](http://www.crifan.com/change_shortcut_of_input_method_in_mac_to_ctrl_space/)

- [mac键盘切换输入法能不能改变热键为“control+空格”呢？](http://bbs.feng.com/read-htm-tid-602773.html)

- [OS X Yosemite: 使用“键盘显示程序”](https://support.apple.com/kb/PH18449?locale=zh_CN&viewlocale=zh_CN)



## TODO

- [【已解决】实现VirtualBox中的（Guest OS）Mac和主机（Host OS）Win7之间的文件和文件夹共享](http://www.crifan.com/virtualbox_mac_and_win7_share_folder_and_file/)
