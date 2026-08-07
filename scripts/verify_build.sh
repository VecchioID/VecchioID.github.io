#!/usr/bin/env bash
set -euo pipefail

OUT="${1:-public}"

for f in \
  "$OUT/index.html" \
  "$OUT/posts/index.html" \
  "$OUT/research/index.html" \
  "$OUT/projects/index.html" \
  "$OUT/cv/index.html"; do
  [[ -f "$f" ]] || { echo "ERROR: generated page missing: $f"; exit 1; }
done

echo "New site pages: OK"

missing=0
count=0
while IFS= read -r url; do
  [[ -z "$url" ]] && continue
  count=$((count + 1))
  rel="${url#/}"
  rel="${rel%/}"
  f="$OUT/${rel}/index.html"
  if [[ -f "$f" ]]; then
    echo " OK legacy: $url"
  else
    echo "ERROR: built site is missing legacy post: $url"
    missing=$((missing + 1))
  fi
done < <(sed -nE 's/^[[:space:]]*url:[[:space:]]*"([^"]+)".*/\1/p' data/legacy_posts.yaml)

if [[ "$missing" -ne 0 ]]; then
  echo "ERROR: $missing of $count legacy posts are missing from the final Pages artifact."
  exit 1
fi

echo "Legacy archive: all $count posts verified in final build"
echo "Site verification complete."
