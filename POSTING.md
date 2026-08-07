# Publishing a new post

## Browser-only workflow

1. Open the GitHub repository.
2. Go to `content/posts/`.
3. Choose **Add file → Create new file**.
4. Name it, for example, `flash-attention.md`.
5. Add front matter and Markdown content.
6. Commit to `main`.
7. GitHub Actions builds and deploys automatically.

Template:

```markdown
---
title: "Post title"
date: 2026-08-07T12:00:00+08:00
summary: "One-sentence summary."
tags: ["tag1", "tag2"]
categories: ["AI Systems"]
math: false
---

## Section

Write in Markdown.
```

Set `math: true` if the post uses TeX/LaTeX equations.

## Drafts

Use `draft: true` to keep a post out of production. GitHub Pages builds without drafts by default.
