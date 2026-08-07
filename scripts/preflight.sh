#!/usr/bin/env bash
set -euo pipefail

echo "== VecchioID.github.io preflight =="

required=(
  hugo.toml
  .github/workflows/deploy.yml
  scripts/recover_legacy.sh
  layouts/index.html
  layouts/posts/list.html
  content/cv/_index.md
  data/legacy_posts.yaml
)

for f in "${required[@]}"; do
  [[ -f "$f" ]] || { echo "Missing: $f"; exit 1; }
done

echo "Source files: OK"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  marker="posts/continual_learning/index.html"
  found=""
  while IFS= read -r commit; do
    if git cat-file -e "${commit}:${marker}" 2>/dev/null; then
      found="$commit"
      break
    fi
  done < <(git rev-list --all -- "$marker")

  if [[ -n "$found" ]]; then
    echo "Legacy blog history: OK ($found)"
  else
    echo "WARNING: legacy blog marker was not found in this repository's git history."
    echo "The new site will work, but old article bodies cannot be recovered automatically."
  fi
else
  echo "WARNING: not running inside a git repository; legacy-history check skipped."
fi

echo "Preflight complete."
