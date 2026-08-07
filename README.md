# VecchioID.github.io — source repository

A lightweight personal research website for **Kai Zhao / Vecchio**.

This repository combines:

- a new research-oriented homepage;
- Research and Projects pages;
- a Personal CV page;
- the existing 2023 static blog, preserved at the original URLs;
- future Blog posts written in Markdown;
- automatic GitHub Pages deployment with GitHub Actions.

## Important: replace the existing repo, do not create a new repo

The legacy Blog bodies are preserved automatically from the **git history of the existing `VecchioID.github.io` repository**.

Therefore:

- keep the existing `.git` history;
- do **not** create a brand-new empty GitHub repository from this ZIP;
- do **not** squash/remove the old history before the first successful deployment.

The deploy workflow finds the latest historical commit containing:

`posts/continual_learning/index.html`

and restores the old generated `posts/`, images/assets, categories, tags, etc. into the deployment artifact. Hugo then writes the new homepage, Blog archive, Projects, Research, and CV pages on top.

## One-time replacement

From your existing local clone:

```bash
cd VecchioID.github.io

git status
# Make sure anything you care about is committed first.

# Remove old working-tree files but KEEP .git
find . -mindepth 1 -maxdepth 1 ! -name .git -exec rm -rf {} +

# Unzip/copy every file from this package into this directory.

git add -A
git commit -m "Rebuild personal site with Hugo and GitHub Pages Actions"
git push origin main
```

Then open the repository on GitHub → **Settings → Pages** and make sure the source is set to **GitHub Actions**.

## New Blog workflow

Create a file such as:

`content/posts/flash-attention.md`

```markdown
---
title: "Understanding Flash Attention"
date: 2026-08-07T12:00:00+08:00
summary: "IO-aware attention, online softmax, and tiling."
tags: ["LLM", "Kernel", "CUDA"]
categories: ["AI Systems"]
math: true
---

Your Markdown content starts here.
```

Commit and push. GitHub Actions builds and publishes the site automatically.

A ready-to-copy draft exists at `content/posts/hello-new-site.md`. It is not published because `draft: true`.

## Pages

- `/` — new homepage
- `/research/` — research directions
- `/projects/` — selected GitHub projects
- `/posts/` — combined new + legacy Blog index
- `/cv/` — Personal CV
- `/lib/mycv/` — redirect to `/cv/` for compatibility with the old site
- `/mycv/` — redirect to `/cv/`

## Edit the CV before treating it as final

Search `content/cv/_index.md` for `TODO`.

The page intentionally does not invent current affiliation/status, exact degree information, full publication history, experience, public email, Scholar/ORCID, or skill proficiency.

## Local preview (optional)

You do not need Hugo locally for normal GitHub-based publishing. If Hugo is installed:

```bash
hugo server -D
```

The legacy posts are recovered only during CI because they live in old git history. Locally, the new site will still preview normally; the old article bodies will return 404 unless you run:

```bash
rm -rf public && mkdir public
./scripts/recover_legacy.sh public
hugo --destination public --cleanDestinationDir=false
python3 -m http.server 8000 --directory public
```

## Safety / rollback

The old site is not destroyed by the replacement commit: it remains in git history. If necessary, you can restore any historical file or revert the replacement commit.

## Toolchain pinned by the workflow

The deployment workflow pins Hugo to **v0.164.0** and uses the current GitHub Pages action generation (`checkout@v6`, `configure-pages@v5`, `upload-pages-artifact@v5`, `deploy-pages@v5`).
