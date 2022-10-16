---
layout: post
title: Vision Transformers Tutorials
date: 2022-09-13 
tags: CV    
---


---
# (1)Self-Attention Module的作用
---

- 作为convolution的补充。绝大多数工作基本上都是从这个角度出发的，比如relation networks、non-local networks、DETR，以及后来的一大批改进和应用。其中一部分是从long-range dependency引入，某种程度上是在弥补convolution is too local；另一部分是从关系建模引入，例如建模物体之间或物体与像素之间的关系，也是在做一些conv做不了的事。

- 替代convolution。在这个方向上尝试不多，早期有LocalRelationNet、Stand-alone Self-attention Net。如果仅看结果，这些工作基本上已经可以做到替换掉3x3 conv不掉点，但有一个通病就是速度慢，即使是写kernel依然抵不过对conv的强大优化，导致这一类方法在当时并没有成为主流。

---
# (2) ViT
---

ViT 主要在两个方面与conv不同：`locality`和`translation invariance`。ViT并不直接具备这两个性质，但是依然work。

