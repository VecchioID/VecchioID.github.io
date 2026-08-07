---
title: "Understanding Flash Attention"
date: 2026-08-07T12:00:00+08:00
summary: "IO-aware attention, online softmax and tiling."
tags:
  - LLM
  - CUDA
  - Kernel
categories:
  - AI Systems
math: true
---

# Flash Attention

正文从这里开始。

## Online Softmax

$$
m_i = \max(m_{i-1}, x_i)
$$

...
