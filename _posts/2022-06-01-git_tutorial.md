---
layout: post
title: Git tutorial
date: 2022-06-01 
tags: Git    
---



## Git Tutorial
### 首先查看git版本的版本
$ git version
### 接下来是配置git的选项
git config --global user.name "xxx"

git config --global user.email "x@x.com"

git init

### 如果选择git init会在文件夹下生成.git文件
git add test.txt

git add .
### 添加进去后，git会暂时保存，使用git commit -m "xxx"提交，使用git log查看每次提交的日志。

### git log后想会退到指定版本的命令如下：
git reset --hard commitID

## 分支管理
git branch xx 创建分支
### 之后git branch -a 查看分支， git checkout 分支名称切换分支， 使用git merge xx(xx表示分支名称)合并分支

# 如何参与开源项目
### 先fork，再git clone到本地，但是现在是基于个人仓库的，使用git remote -v可以看到只有自己仓库的链接。
### 还需要添加上游代码库，git remote add upstream xxx(xxx指的是上游代码库的链接)
### 如果要给别人加功能，建议先创建一个分支，使用git checkout -b xxx来创建并切换进入名为xxx的分支。
### 之后标准流程走一遍
git add .
git commit -m "xxx"
git push
#### 如果push失败了就需要使用git push -u origin xxx(xxx为分支名称)
### 回到自己仓库可以看到这个分支，点击pull requests，简称pr，拉取请求，进去后点new新建pr， 进去后选择base， 以及自己的分支，compare选择与自己比较的分支，如果显示绿色，则是可以add to merge的意思。之后点击create pr，填写pr信息，提交后选择评论通知，让上游仓库管理员去合并分支，第一次开源贡献就完成了。
### 如果没有显示绿色，可能是有人提交了新的commit，导致版本不一致，这时候需要更新本地版本，执行git fetch upstream，从上游更新代码，之后执行 git merge upstream/main, 把远程代码合并到自己分支中，再提交。重走流程就可以了。


## git指定分支提交
### 1、查看所有分支
git branch -a
### 2、创建分支
git branch 分支名称
### 3、切换分支
git checkout 分支名称
### 4、添加修改代码到缓存
git add .
### 5、添加提交代码的备注
git commit -m "xxx" (xxx为本次提交的代码的备注)
### 6、提交代码到指定分支
git push origin xxx
### 7、删除远程你所创建的分支
git push origin --delete xxx (xxx为你想删除的远程分支名称)
### 8、删除本地分支
git branch -D xxx (xxx为你想删除的本地分支名称)
### 9、拉取指定分支的代码
git clone -b 分支名称 远程仓库地址


## Github 提供的两种仓库初始化方式
### 第一种：使用命令行创建一个新的仓库
echo "# raven_code" >> README.md

git init

git add README.md

git commit -m "first commit"

git branch -M main

git remote add origin git@github.com:VecchioID/raven_code.git

git push -u origin main

### 第二种：从命令行推送一个当前仓库到github仓库
git remote add origin git@github.com:VecchioID/raven_code.git

git branch -M main

git push -u origin main