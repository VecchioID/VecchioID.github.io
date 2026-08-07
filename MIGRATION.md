# Migration design

## Why this package does not duplicate every old generated HTML file

The existing website stores Hugo's generated output rather than the original Markdown/Hugo source. Reconstructing all old posts from rendered HTML would risk damaging code blocks, equations, images, anchors, and exact URLs.

Instead, this package treats the old site as a **legacy static snapshot** and the new site as the **maintainable source site**.

Deployment sequence:

```text
existing git history
      │
      ├─ find historical legacy site commit
      │
      └─ restore old posts/assets into public/
                         │
new Hugo source ─────────┤
                         ▼
               hugo --cleanDestinationDir=false
                         │
                         ▼
                combined public/ artifact
                         │
                         ▼
                    GitHub Pages
```

## URL compatibility

The original article directories under `/posts/.../` are restored byte-for-byte from git history, so old links continue to work.

The new Hugo Blog index is written to `/posts/index.html`, while individual old article directories remain intact.

The broken/old CV location `/lib/mycv/` is overwritten by a redirect to the new `/cv/` page.

## What happens after you publish new Markdown posts

A new file in `content/posts/` becomes a new `/posts/<slug>/` directory during Hugo build. It coexists with the recovered legacy articles.

Do not intentionally reuse a legacy post slug unless you want the new Markdown post to replace that legacy page.

## If you later want a full Markdown migration

The compatibility design is deliberately conservative. You can progressively convert old posts into Markdown one at a time. When a converted post uses the same slug, Hugo will overwrite the legacy HTML for that post during build. Once all legacy posts have been migrated, remove the recovery step and the `data/legacy_posts.yaml` compatibility archive.
