---
layout: post
title: Ubuntu firewall tool - ufw
date: 2022-09-01 
tags: Linux    
---



# Ubuntu firewall tool - ufw

The default firewall used in ubuntu is iptables.

For simplication, `ufw` is provided as a efficiency to manage ubuntu linux firewall.

If `ufw` is not installed in your computer, please install it using the follwing command:


    sudo apt-get install ufw


Then you can turn on firewall:

    sudo ufw enable

防火墙开启后，使用如下命令，设置一个缺省策略：

    sudo ufw default deny

这个缺省策略是默认拒绝一切请求。如果没有需要开放服务，那么这样就可以放心用了。

不过实际工作中，服务器总是要提供一些服务的。

下面介绍一些常用的设置。

---
## (1) 开放访问权限给指定主机IP

---

管理终端IP经常是固定的IP。所以这个设置方法经常用到。假设管理终端IP为192.168.1.66

    sudo ufw allow from 192.168.1.66

然后使用如下命令看下添加后的策略：

    sudo ufw status

---
## (2) 开放端口

---

这个情况也比较常见，比如开放`web`服务`80`端口。

命令如下：

    sudo ufw allow 80/tcp

这个命令允许使用`tcp`协议连接到服务器`80`端口。

如果不想限定协议，将`tcp`去除，即表示`80`端口可以在任意协议下连接。

    sudo ufw allow 80

除了使用`alllow`关键字设置允许访问的策略，还可以使用`deny`关键字设置拒绝访问的策略。

下面的语句将设置在`tcp`协议下拒绝`192.168.1.66`访问主机的端口22

    sudo ufw deny proto tcp from 192.168.1.66 to 192.168.1.242 port 22

另外一个省事且直观的方法就是直接使用服务的名字来定义策略。

比如`smtp`

    sudo ufw allow smtp

在`/etc/services`文件中定义了很多服务名对应的端口，只要里面有的服务名字，都可以用上面的方法来设置。

有时有要开放一段连续的端口访问权限，当然每个端口写一条是可以的。不过下面这中方法比较省事：

    sudo ufw allow 41901-41910

一条设置开放`41901-41910`十个端口。

---
## (3)删除策略

---

一口气设置了好几条策略，都是我服务器用不上的。现在我要删除这些策略。实际工作中也会遇到，不过建议执行之前要慎重。

删除一条策略要使用`delete`关键字，语法如下：

    sudo ufw delete allow smtp

    sudo ufw delete allow 22

    sudo ufw delete allow 22/tcp

    sudo ufw delete deny proto tcp from 192.168.1.66 to 192.168.1.11 port 22

策略修改过后，要使用`reload`重启生效。

    sudo ufw reload