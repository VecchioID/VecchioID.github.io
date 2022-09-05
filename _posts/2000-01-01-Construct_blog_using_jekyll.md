---
layout: post
title: Ubuntu install kekyll to construct my own blog
date: 2000-01-01 
tags: front_end 
---

# Ubuntu install kekyll to construct my own blog

---
## (1) Prepare tools

---

- Ruby
- RubyGems

### install Ruby

    $ sudo apt install ruby-full build-essential zlib1g-dev
    $ sudo apt-get install ruby-dev
    $ gem -v
    $ gem update system

### set china ruby mirrors

    $ gem sources -r https://rubygems.org/ -a https://gems.ruby-china.com/
    $ gem sources -l


---
## (2) Install jekyll
---

    $ sudo gem install jekyll bundler
    $ jekyll -verison
    $ sudo gem update jekyll

maybe minima etc. is needed on your computer, just install it.

    $ sudo gem install 64-mingw32 tzinfo-data tzinfo minima

---
## (3) Blog preview
---

cd Blog folder, and then 

    $ jekyll server or jekyll s or jekyll serve


Jekyll 运行的时候提示错误 cannot load such file -- webrick (LoadError)

问题和解决

根据官方的项目的说明：

这是因为：
从 Ruby 3.0 开始 webrick 已经不在绑定到 Ruby 中了，请参考链接： Ruby 3.0.0 Released 中的说明。

webrick 需要手动进行添加。

添加的命令为：后就可以解决这个问题了

    $ bundler add webrick

