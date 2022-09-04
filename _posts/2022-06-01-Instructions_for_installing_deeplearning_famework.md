---
layout: post
title: Instructions for  installing deeplearning library on ubuntu linux
date: 2022-06-01 
tags: DL_Framework    
---


# Instructions for  installing deeplearning library on ubuntu linux

---
## 1.Install TensorFlow-GPU
---
    pip install tensorflow-gpu==2.8.0 -i https://pypi.tuna.tsinghua.edu.cn/simple/

> Note: before install in pip, you should intstall NVIDIA drivers, cuda and cudnn in your computer

> or you should choose install tensoflow as follows: this operation will install cudatoolkit and cuda in conda environment to ensure TF-gpu works only in tf<2.4.

    conda install tensoflow-gpu==2.8.0

> test if gpu is available

    $ import tensorflow as tf
    $ print(tf.test.is_gpu_available())
    $ tf.config.list_physical_devices('GPU')


---
## 2.Install torch gpu
---
> Just following the insructions from offical website.
> 
> Another way is to download torch+gpu+cudnn version manually, and install by pip install xxx.

---
## 3. Conda 镜像使用帮助
---
各系统都可以修改用户目录下的 .condarc 文件

    channels:
    - defaults
    show_channel_urls: true
    default_channels:
    - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
    - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
    - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
    custom_channels:
    conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
    msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
    bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
    menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
    pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
    pytorch-lts: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
    simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud


即可添加 Anaconda Python 免费仓库。

运行 conda clean -i 清除索引缓存，保证用的是镜像站提供的索引。

运行 conda create -n myenv numpy 测试一下吧。

---
## 4. Pip 镜像使用帮助
---

修改 ~/.pip/pip.conf (没有就创建一个文件夹及文件。文件夹要加“.”，表示是隐藏文件夹)
内容如下：

    [global]
    index-url = https://pypi.tuna.tsinghua.edu.cn/simple
    [install]
    trusted-host = https://pypi.tuna.tsinghua.edu.cn

升级 pip 到最新的版本 (>=10.0.0) 后进行配置：

    $ python -m pip install --upgrade pip
    $ pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple


> pip trick: force install without dependenscies
> 
> pip install --force-reinstall --no-deps xxx==0.3.0

---










