---
title: Linux 双显示器
date: 2016-07-11
category: System
tags:
- System
- Linux
---

- [[原创]Nvidia显卡在Ubuntu超轻松实现双显示器（双头显示）](http://forum.ubuntu.org.cn/viewtopic.php?t=40666)
- [Ubuntu下外接显示器双屏显示的方法](http://www.linuxidc.com/Linux/2008-05/12860.htm)
- [Linux下使用 xrandr 命令设置屏幕分辨率](http://www.linuxidc.com/Linux/2012-10/72488.htm)


- xrandr --output VGA --off(auto) :这个命令是关闭(开启)外接的显示器.
- xrandr --output LVDS --off(auto)
- xrandr --output VGA --auto --right-of LVDS
