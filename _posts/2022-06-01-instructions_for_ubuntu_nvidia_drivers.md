---
layout: post
title: Instructions for install Nvidia drivers cuda and cudnn
date: 2022-06-01 
tags: Nvidia Drivers   
---


---
## 1. install ubuntu Nvidia drivers
---
'''python
    $ ubuntu-drivers devices # display alternaive version of nvidia drivers

    $ sudo apt install nvidia-driver-515
'''
or choose to install driver and cuda automatically:

    $ sudo ubuntu-drivers autoinstall


**Note: after reboot, choose enroll key to input your passwd, after this, nvidia-smi would work.**

enroll mok;continue;yes;input passwd;reboot;



---
## 2. install cuda manual, this tutorial is suitable for ubuntu22.04 x86_x64 deb(local)
---

> 补充：由于ubuntu22.04需要安装liburcu6软件包，不然cuda安装会少依赖。所以这里需要自己下载并安装
> https://ubuntu.pkgs.org/20.04/ubuntu-main-amd64/liburcu6_0.11.1-2_amd64.deb.html
> sudo dpkg -i xxxxx



### 2.1 visit the web to obey the instructions provided by nvidia:
   
https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_local

or

https://developer.nvidia.com/cuda-toolkit-archive


---
I also give the commands for 11.7 directly as follows:
#### 11.7
    $ wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin

    $ sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600

    $ wget https://developer.download.nvidia.com/compute/cuda/11.7.1/local_installers/cuda-repo-ubuntu2204-11-7-local_11.7.1-515.65.01-1_amd64.deb

    $ sudo dpkg -i cuda-repo-ubuntu2204-11-7-local_11.7.1-515.65.01-1_amd64.deb

    $ sudo cp /var/cuda-repo-ubuntu2204-11-7-local/cuda-*-keyring.gpg /usr/share/keyrings/

    $ sudo apt-get update

    $ sudo apt-get -y install cuda

---
#### 11.6.2
    $ wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin

    $ sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600

    $ wget https://developer.download.nvidia.com/compute/cuda/11.6.2/local_installers/cuda-repo-ubuntu2004-11-6-local_11.6.2-510.47.03-1_amd64.deb

    $ sudo dpkg -i cuda-repo-ubuntu2004-11-6-local_11.6.2-510.47.03-1_amd64.deb

    $ sudo apt-key add /var/cuda-repo-ubuntu2004-11-6-local/7fa2af80.pub

    $ sudo apt-get update

    $ sudo apt-get -y install cuda


---
环境编译

    sudo gedit ~/.bashrc

    export CUDA_HOME=/usr/local/cuda-11.7

    export LD_LIBRARY_PATH=${CUDA_HOME}/lib64

    export PATH=${CUDA_HOME}/BIN:${PATH}

    source ~/.bashrc

---

#### update environment variables
    sudo vim ~/.bashrc

    export PATH=/usr/local/cuda-11.7/bin${PATH:+:${PATH}}

    export LD_LIBRARY_PATH=/usr/local/cuda-11.7/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

    source ~/.bashrc

---
## 3. cuDNN
---
    $ sudo cp include/cudnn.h /usr/local/cuda/include/

    $ sudo cp include/cudnn_version.h /usr/local/cuda/include/

    $ sudo cp lib/libcudnn* /usr/local/cuda/lib64/

    $ sudo chmod a+r /usr/local/cuda/include/*

    $ sudo chmod a+r /usr/local/cuda/lib64/*

cuDNN安装完成，通过如下命令查看cudnn下版本信息

    $ cat /usr/local/cuda/include/cudnn_version.h | grep CUDNN_MAJOR -A 2

---
## 4.uninstall nvidia drivers:
---



    $ sudo apt-get --purge remove "*nvidia*"

uninstall cuda toolkit:

    $ sudo apt-get --purge remove "*cublas*" "cuda*"

---

---






