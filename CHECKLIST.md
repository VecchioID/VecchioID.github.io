# Deployment checklist

1. Run the top-level one-click installer against the existing cloned repository.
2. Confirm installer output says `all 13 legacy posts verified`.
3. Run `git status` and review the replacement.
4. Commit and push to `main`.
5. In GitHub: Settings -> Pages -> Source -> GitHub Actions.
6. In Actions, the build must pass `Preflight source tree` and `Verify complete site`.
7. Open `/posts/` and check both the new Markdown section and Legacy archive.
8. Open at least `Graph_Networks` and `OpenMMLab_tutorials_2` to confirm the two newest legacy pages work.
9. Open `/cv/`, `/research/`, and `/projects/`.
