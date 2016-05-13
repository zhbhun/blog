---
title: Git 常用命令
date: 2016-04-23
category: Git
tags: Git
---

# 是什么
- [GitHub 是怎么火起来的？]( http://www.zhihu.com/question/19931404)

---

# 为什么
- [集中式vs分布式](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/001374027586935cf69c53637d8458c9aec27dd546a6cd6000)
- ...

---

# 安装配置
- [安装Git](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/00137396287703354d8c6c01c904c7d9ff056ae23da865a000)
- [Git在eclipse中的配置详细记录]( http://www.open-open.com/lib/view/open1409129597400.html)

---

# 创建版本库
- `git init`
- `git add readme.txt`
- `git commit -m "wrote a readme file"`

---

# 管理版本库
## 概念
- 工作区: 项目目录
- 版本库: `.git`
- 暂存区: `git add`
- 管理修改: `git commit` 只提交暂存区的内容

## 命令
- 查看状态: `git status`
- 查看差异: `git diff readme.txt`
- 添加暂存区: `git add readme.txt`
- 条件分支: `git commit readme.txt`
- 版本历史: `git log [--pretty=oneline]`, `git reflog`
- 版本回退: `git reset --hard HEAD^`, `git reset --hard 提交ID`
    - HEAD 当前版本
    - HEAD^ 上一个版本
    - HEAD^^ 上上一个版本
- 取消修改: `git checkout -- readme.txt`, `git reset HEAD readme.txt`
    - 还没添加到暂存区: 回到和版本库一致
    - 已添加到暂存区: 回到添加到暂存区的状态
- 删除文件: `git rm readme.txt` + `git commit -m "delete readme.txt"`
- 恢复删除: `git checkout -- readme.txt`

---

# 远程仓库
- SSH 配置
    - 创建 SSH Key: `ssh-keygen -t rsa -C "youremail@example.com"` --- 生成 id_rsa 和 id_rsa.pub
    - 配置 Github: 添加 SSH Key
    - 检查是否成功: ...
- 添加远程库
    - `git remote add origin git@github.com:account/repository.git`
    - `git push -u origin master`, `git push origin master`
- 克隆远程库: `git clone git@github.com:account/repository.git`
- 查看远程仓库: `git remote`, `git remote -v`

---

# 分支管理
- 创建分支: `git checkout -b dev`
    - `git branch dev`
    - `git checkout dev`
- 查看分支: `git branch`
- 切换分支: `git checkout master`
- 合并分支:
    - `git merge dev`
    - `git merge --no-ff -m "merge with no-ff" dev`
- 删除分支
    - `git branch -d dev`
    - `git branch -D dev`
- 解决冲突: ...
- 分支管理策略: master, dev, issue-xxx, feture-xxx...
- Bug 分支
    - `git stash`
    - `git checkout master`
    - `git add readme.txt `
    - `git commit -m "fix bug 101"`
    - `git checkout master`
    - `git merge --no-ff -m "merged bug fix 101" issue-101`
    - `git branch -d issue-101`
    - `git checkout dev`
    - `git status`
    - `git stash list`
    - `git stash apply`, `git stash drop` --- `git stash pop`
- Feture 分支
- 多人协作
    - 抓取分支:
        - `git clone git@github.com:michaelliao/learngit.git`
        - `git branch` --- 只有 master 分支
        - `git checkout -b dev origin/dev` --- 抓取 dev 分支
        - `git branch --set-upstream dev origin/dev`
        - `git pull` --- 如果推送失败，则因为远程分支比你的本地更新，需要先用git pull试图合并
    - 推送分支: `git push origin master`, `git push origin dev` --- 选择必要的分支进行推送

---

# 标签管理

---

# GitHub

---

# Git 服务器

---

# 图形界面工具
- [GUI Clients](http://git-scm.com/downloads/guis)
- [A1.1 其它环境中的 Git - 图形界面](http://git-scm.com/book/zh/v2/%E5%85%B6%E5%AE%83%E7%8E%AF%E5%A2%83%E4%B8%AD%E7%9A%84-Git-%E5%9B%BE%E5%BD%A2%E7%95%8C%E9%9D%A2)

# 其他
## 忽略文件

## 配置别名

## 常用命令
- `git config remote.origin.url`: 查看当前项目远程库 URL
-

---

# 问题
## 编码

---

# 开源项目
- [We Analyzed 30,000 GitHub Projects – Here Are The Top 100 Libraries in Java, JS and Ruby](http://blog.takipi.com/we-analyzed-30000-github-projects-here-are-the-top-100-libraries-in-java-js-and-ruby/ )
- [Learn Git Branching](http://pcottle.github.com/learnGitBranching/)

---

# 大事件
- [JavaScript击败Ruby成为Github第一大语言]( http://www.csdn.net/article/2014-05-06/2819636)

---

# 资源
## 官方文档
- https://help.github.com/
- [Generating SSH keys](https://help.github.com/articles/generating-ssh-keys/)
- [Personal API tokens](https://github.com/blog/1509-personal-api-tokens)

## 网站论坛
- [git-scm](https://git-scm.com/)
    - http://git-scm.com/blog
    - http://git-scm.com/doc
    - http://git-scm.com/downloads
    - http://git-scm.com/community
    - http://git-scm.com/about
- [git.wiki](https://git.wiki.kernel.org)

# 推荐书籍
- Pro Git
    - http://git-scm.com/book/en/v2
    - http://git-scm.com/book/zh/v2
- Git版本控制管理
- Version Control with Git
- Git权威指南
- Git Magic
- Git Internals
- Pragmatic Guide to Git

## 推荐博文
- [A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/)
    - http://www.juvenxu.com/2010/11/28/a-successful-git-branching-model/
- [Git教程](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)
- [Git 使用规范流程](http://www.ruanyifeng.com/blog/2015/08/git-use-process.html)
- [Git分支管理策略](http://www.ruanyifeng.com/blog/2012/07/git.html)
- [git - 简易指南](http://rogerdudler.github.io/git-guide/index.zh.html)
- [猴子都能懂的GIT入门](http://backlogtool.com/git-guide/cn/)
- [Git 参考手册](http://gitref.justjavac.com/)
- [Pro Git](http://git-scm.com/book/zh)
- [Pro Git 中文版](https://www.gitbook.com/book/0532/progit/details)
- [Git Magic](http://www-cs-students.stanford.edu/~blynn/gitmagic/intl/zh_cn/)
- [GotGitHub](http://www.worldhello.net/gotgithub/index.html)
- [Git Community Book 中文版](http://gitbook.liuhui998.com/index.html)
- [沉浸式学 Git](http://igit.linuxtoy.org/)
- [Git-Cheat-Sheet ](https://github.com/flyhigher139/Git-Cheat-Sheet)
- [GitHub秘籍](http://snowdream86.gitbooks.io/github-cheat-sheet/content/zh/index.html)
- [Github帮助文档](https://github.com/waylau/github-help)
- [git-flow 备忘清单](http://danielkummer.github.io/git-flow-cheatsheet/index.zh_CN.html)
- [GITLAB: Self Hosted Git Management Application](http://www.gitlabhq.com/)
- [git-flow 备忘清单](http://danielkummer.github.io/git-flow-cheatsheet/index.zh_CN.html)
- [nvie/gitflow · GitHub](https://github.com/nvie/gitflow)
- [图解Git](http://my.oschina.net/xdev/blog/114383)
- [Git Magic - 前言](http://www-cs-students.stanford.edu/~blynn/gitmagic/intl/zh_cn/index.html)

## Git-Doc
{GIT_HOME}/mingw64/share/doc/git-doc
- git-pull(1) Manual Page

## 开发工具
- msysgit
- tortoisegit
- sourcetreeapp: http://www.sourcetreeapp.com/
- [Git跟踪rename文件](https://github.com/hokein/Wiki/wiki/Git%E8%B7%9F%E8%B8%AArename%E6%96%87%E4%BB%B6)
