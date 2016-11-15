---
title: Git 常用命令
date: 2016-04-23
category: VCS
tags: VCS
---

# 创建版本库
- `git init`
- `git add readme.txt`
- `git commit -m "wrote a readme file"`

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

# 标签管理
TODO
