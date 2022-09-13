---
layout: post
title: python basic op.
date: 2022-09-01 
tags: basic_op    
---


---
# list -> ndarray
---
np.array(list)

---
# str -> 数字
---
float(str) or int(str)


---
# python 截取特定字符前或者后的字符串
---
可以借助`split()`函数来实现

    string.split()

分割后会返回一个列表，其中的元素是切割后的字符串。再提取其中元素，即可得到特定字符前或后的字符串。

下面来看一个例子

例子

    url = http://jwxk.ucas.ac.cn/courseManage/saveCourse?s=9aa012dd-f96a-47c7-ba1d-ed4c824b42b6

需要截取出：url后半段的
`9aa012dd-f96a-47c7-ba1d-ed4c824b42b`
用作下一步的参数提交

    print(url.split("s=")) # 未加序号
    print(url.split("s=")[1]) # 提取分割后的后半部分

结果分别是：

    ['http://jwxk.ucas.ac.cn/courseManage/saveCourse?', '9aa012dd-f96a-47c7-ba1d-ed4c824b42b6']
    '9aa012dd-f96a-47c7-ba1d-ed4c824b42b6'

`url.split(“s=”)[1]`实现了需要的功能

如果要提取前半部分，把代码中的数组下标由1替换为0即可



---
# python 字符串去空格
---

## 一、去除字符串空格，使用python内置方法
1、lstrip：删除左边的空格, `a = '    string    '`

    $ s.lstrip()
    output: 'string    '

2、rstrip：删除右连的空格
这个内置方法可以删除字符串末尾的所有空格，看下面演示代码：

    >>> s.rstrip()
    '    string'

3、strip：删除两端的空格
有的时候我们读取文件中的内容，每行2边都有空格，能不能一次性全部去掉呢，字符符有一个内置的strip()方法可以做到。

    >>> s = “   这是一个字符串    ”
    >>> s.strip()
    'string'

## 二、python去除字符串中间空格的方法
1、使用字符串函数replace

    >>> a = 'hello world'
    >>> a.replace(' ', '')
    'helloworld'

2、使用字符串函数split

    >>> a = ''.join(a.split())
    >>> print(a)
    helloworld

3、使用正则表达式

    >>> import re
    >>> strinfo = re.compile()
    >>> strinfo = re.compile(' ')
    >>> b = strinfo.sub('', a)
    >>> print(b)
    helloworld
