# One-time deployment checklist

- [ ] Work inside the existing `VecchioID.github.io` clone (keep `.git`).
- [ ] Commit/push any old uncommitted changes first.
- [ ] Delete the old working-tree files, but **do not delete `.git`**.
- [ ] Copy all files from this package into the repository root.
- [ ] Run `./scripts/preflight.sh`.
- [ ] `git add -A`
- [ ] `git commit -m "Rebuild personal site with Hugo and GitHub Pages Actions"`
- [ ] `git push origin main`
- [ ] GitHub repository → Settings → Pages → Source: **GitHub Actions**.
- [ ] Open the Actions tab and confirm `Deploy GitHub Pages` is green.
- [ ] Verify `/`, `/posts/`, `/cv/`, and one legacy article such as `/posts/continual_learning/`.
- [ ] Edit `content/cv/_index.md` and resolve the remaining `TODO` items.

## Do not do this

Do not upload the ZIP as a single file into the repository. Extract/copy its contents.
Do not initialize a brand-new repository if you want automatic recovery of the old Blog bodies.
