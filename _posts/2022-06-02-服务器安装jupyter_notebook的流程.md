---
layout: post
title: 在远程服务器安装jupyter notebook并使用浏览器连接的方式
date: 2022-06-02 
tags: Dev_tools    
---

---
## 一、ubuntu 下安装jupyter notebook
---
1、使用conda安装

    conda install jupyter notebook

2、使用pip安装

    pip install jupyter notebook

---
## 二、Jupyter notebook配置
---
1、生成配置文件

    jupyter notebook --generate-config

2、创建密码

使用python中的 passwd() 创建密码，终端输入 ipython 打开 ipython 并输入：

    In [1]: from notebook.auth import passwd
    In [2]: passwd()
    Enter password: ******
    Verify password: ******
    Out [2]: 'sha1:...'

复制Out [2] 显示的密码（'sha1:...' 包括引号）。也可能不是sha开头的。

3、修改jupyter notebook的配置文件

打开配置文件

    vim ~/.jupyter/jupyter_notebook_config.py

在该文件中做如下修改或直接在文件尾端添加：

    c.NotebookApp.allow_remote_access = True #允许远程连接
    c.NotebookApp.ip='*' # 设置所有ip皆可访问
    c.NotebookApp.password = u'sha:..' #之前复制的密码,或者输入的字符
    c.NotebookApp.notebook_dir = '/usr/local/spark/mycode/Covid-19-Analysis' # 启动的默认目录
    c.NotebookApp.open_browser = False # 禁止自动打开浏览器
    c.NotebookApp.port =8888 #任意指定一个端口

4、启动 jupyter notebook

终端输入：

    jupyter notebook

或使用nohup后台运行 jupyter notebook:

    nohup jupyter notebook

使用 `ps  -ef | grep nohup.sh` 查看后台的任务

`kill -9 PID` 杀死任务， 使用 `ps aux | grep myScript.sh` 寻找PID

5、远程访问jupyter notebook

本地浏览器输入

http://(服务器地址):(配置文件中设定的端口)； 

假设服务器地址为192.168.1.129，配置的端口为8888，这里的浏览器输入地址应为

http://192.168.1.129:8888 

即可访问jupyter notebook。

---
## 三、在VSCODE中使用远程服务器的jupyter
---
1、在vscode中安装remote ssh， juoyter等插件

2、ctrl+shift+p 选择连接远程主机

3、建立起连接后在远程主机中安装 jupyter 插件

打开或新建一个 jupyter notebook 文件即可使用