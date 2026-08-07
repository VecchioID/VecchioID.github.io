#!/usr/bin/env bash
set -euo pipefail

echo "== Vecchio site preflight =="

required=(
  hugo.toml
  .github/workflows/deploy.yml
  layouts/index.html
  layouts/posts/list.html
  layouts/_default/single.html
  content/cv/_index.md
  data/legacy_posts.yaml
  static/assets/site.css
  static/assets/site.js
)

for f in "${required[@]}"; do
  [[ -f "$f" ]] || { echo "ERROR: missing $f"; exit 1; }
done

echo "Core source files: OK"

missing=0
count=0
while IFS= read -r url; do
  [[ -z "$url" ]] && continue
  count=$((count + 1))
  rel="${url#/}"
  rel="${rel%/}"
  f="static/${rel}/index.html"
  if [[ ! -f "$f" ]]; then
    echo "ERROR: legacy article missing from physical static snapshot: $url"
    missing=$((missing + 1))
  fi
done < <(sed -nE 's/^[[:space:]]*url:[[:space:]]*"([^"]+)".*/\1/p' data/legacy_posts.yaml)

if [[ "$count" -eq 0 ]]; then
  echo "ERROR: no legacy-post URLs found in data/legacy_posts.yaml"
  exit 1
fi

if [[ "$missing" -ne 0 ]]; then
  echo "ERROR: $missing of $count legacy posts are absent."
  echo "Run the one-click installer against the existing repository before pushing."
  exit 1
fi

echo "Legacy static archive: all $count posts present"
echo "Preflight complete."
