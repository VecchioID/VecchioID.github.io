#!/usr/bin/env bash
set -euo pipefail

OUT="${1:-public}"
MARKER="posts/continual_learning/index.html"
mkdir -p "$OUT"

legacy_commit=""
while IFS= read -r commit; do
  if git cat-file -e "${commit}:${MARKER}" 2>/dev/null; then
    legacy_commit="$commit"
    break
  fi
done < <(git rev-list --all -- "$MARKER")

if [[ -z "$legacy_commit" ]]; then
  echo "::warning::No legacy post snapshot found in git history. New Hugo pages will still build, but old generated blog bodies cannot be recovered automatically."
  exit 0
fi

echo "Recovering legacy generated site from commit: $legacy_commit"

legacy_paths=(
  posts
  categories
  tags
  page
  css
  js
  lib
  svg
  404.html
  index.xml
  sitemap.xml
  favicon.ico
  favicon-16x16.png
  favicon-32x32.png
  apple-touch-icon.png
  safari-pinned-tab.svg
  site.webmanifest
)

for path in "${legacy_paths[@]}"; do
  if git cat-file -e "${legacy_commit}:${path}" 2>/dev/null; then
    git archive "$legacy_commit" "$path" | tar -x -C "$OUT"
    echo "  restored $path"
  fi
done

echo "Legacy recovery complete. Hugo will now overwrite new top-level/index pages while preserving individual legacy post URLs."
