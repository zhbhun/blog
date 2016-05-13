---
title: React Ant Design
date: 2016-04-020
category: React
tags: JavaScript React
---

- [官网](http://ant.design/)
- [GitHub 官网](https://github.com/ant-design/ant-design)
- [Antd-Bin](https://github.com/ant-design/antd-bin)
- [使用用户](https://github.com/ant-design/ant-design/issues/477)

# 开发进度
- [更新日志](https://github.com/ant-design/ant-design/blob/master/CHANGELOG.md)
- [组件开发计划](https://github.com/ant-design/ant-design/issues/9)
- [0.10.0](https://github.com/ant-design/ant-design/issues/276)


# 组件分析
## 导航菜单
水平导航菜单结构
- ul.ant-menu.ant-menu-horizontal.ant-menu-light.ant-menu-root
    - li.ant-menu-item[.ant-menu-item-active][.ant-menu-item-selected][.ant-menu-item-disabled]
        - 链接：a
        - 图标文本
            - i.anticon.anticon-xxx
            - span
    - li.ant-menu-submenu-horizontal.ant-menu-submenu[.ant-menu-submenu-open][.ant-menu-submenu-active]
        - div.ant-menu-submenu-title
            - 链接：a
            - 图标文本
                - span
                    - i.anticon.anticon-xxx
                    - span
        - ul.ant-menu.ant-menu-vertical.ant-menu-sub.ant-menu-hidden
            - li.ant-menu-item-group
                - div.ant-menu-item-group-title
                - ul.ant-menu-item-group-list
                    - li.ant-menu-item
                    - ...
            - ...
