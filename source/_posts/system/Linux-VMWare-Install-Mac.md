---
title: Linux's VirtualBox 安装 Mac 虚拟机
date: 2015-09-19
category: System
tags:
- System
- Mac
- VMWare
---

1. 下载资源
    - OS X 10.11 El Capitan Retail by TechReviews
        - Google Drive (1 part): https://goo.gl/DIIFv4
        - Google Drive (7 part): https://goo.gl/PcIQRC
        - Google Drive (4 part): https://goo.gl/jkS1zL
        - https://archive.org/details/OSX10.11ElCapitanRetailByTechReviews
    - All Tool: https://goo.gl/DpMe9o
    - VMware Player: https://goo.gl/XBDCJH
2. 安装 unrar：`sudo apt-get install unrar`
3. 解压 "OS X 10.11 El Capitan Retail by TechReviews.rar"
4. 授权安装 VMware Player:
    - `sudo chmod +x VMware-Player-7.1.2-2780323.x86_64.bundle`
    - `sudo VMware-Player-7.1.2-2780323.x86_64.bundle`
5. 解压安装 unlock: `sudo lnx-install.sh`
    - `sudo chmod +x lnx-install.sh`
    - `sudo lnx-install.sh`
6. 创建配置虚拟机
    1. Install operating system from：I will install the opreating system later
    2. Guest Opreating System：Apple OS X 10.10
    3. Virtual Machine Name: 自定义
    4. Disk Size：Store virtual disk as a single file
    5. Edit virtual Machine settings
        - Memory: Maximum
        - process: 自定义
        - Hard Disk：先删除，再添加
            1. Remove
            2. Add
            3. Hardware Type： Hard Disk
            4. Disk Type: SATA
            5. Disk：Use an existing virtual disk
            6. Existing Virtual Disk: ...
        - ...
    6. Play virtual machine：...
    7. Install VMWare Tool
    8. ...


- [Install OS X El Capitan 10.11 on Ubuntu on VMware](https://www.youtube.com/watch?v=ckwXXvziXfk)
- [Install Intel HD Graphics 4400, 4600 to 6000 on El Capitan (Full QE/CI)](https://www.youtube.com/watch?v=LBCkvM1MHUo)
- [求助：如何解决ubuntu14.04 64位装vmware for linux 10.0.2 64位 错误](http://forum.ubuntu.org.cn/viewtopic.php?f=65&t=458702)
- [How do I uninstall VMWare Workstation?](http://askubuntu.com/questions/131045/how-do-i-uninstall-vmware-workstation)
