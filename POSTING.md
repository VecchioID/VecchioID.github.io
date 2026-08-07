# Writing a new Blog post

Create a Markdown file in `content/posts/`.

```markdown
---
title: "文章标题"
date: 2026-08-07T12:05:00+08:00
summary: "一句话摘要"
tags: ["LLM", "CUDA"]
categories: ["AI Systems"]
math: true
---

这里开始写正文。
```

Push to `main`; GitHub Actions publishes it automatically.

## Automatic typography

Future Markdown article body text is styled automatically:

- Chinese -> Songti SC / STSong / SimSun / 宋体
- English and digits -> Times New Roman when installed
- 12pt body font
- fixed 19pt line-height

Headings, code and MathJax are intentionally excluded from the fixed body typography.
