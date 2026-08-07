# Migration design

The legacy Blog is preserved as static output rather than re-converted from generated HTML to Markdown.

The one-click installer copies the existing generated pages and their dependencies into:

```text
static/posts/
static/categories/
static/tags/
static/css/
static/js/
static/lib/
static/svg/
```

The old top-level `posts/index.html` is intentionally omitted so Hugo can generate a new combined Blog index. Individual old article URLs remain unchanged.

GitHub Actions does **not** recover content from historical commits during normal deployment. Git history is used by the installer only as a one-time rescue fallback if the physical old site is incomplete.
