# VecchioID.github.io

Personal research website built with Hugo and deployed by GitHub Actions.

## Important

This source tree expects the old Blog archive to be physically embedded under `static/posts/`.
Do not copy the `site/` directory into the repository by itself on the first migration.
Use the top-level `install.sh` from the one-click package; it preserves and verifies the legacy archive before replacing the working tree.

After migration:

- `content/posts/` = future Markdown posts
- `static/posts/` = preserved legacy HTML posts
- `layouts/` = new site templates
- `static/assets/` = new visual theme
- `.github/workflows/deploy.yml` = automatic GitHub Pages build/deploy

Run `./scripts/preflight.sh` before pushing if you want a local integrity check.
