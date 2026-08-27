# PersonalPage

Academic homepage of **Yuan Huang (黄远)**, Northeastern University, China.

**Live:** https://yuan4629.github.io/PersonalPage/

| File | What it is |
| --- | --- |
| `index.html` | The homepage. Self-contained — all CSS and JS inline, no build step. |
| `cv.html` | Web version of the CV, styled to match the homepage. Print stylesheet included. |
| `cv.pdf` | Generated from `cv.html`. Linked from the homepage nav as *CV (PDF)*. |
| `cv.md` | Source of truth for CV content, kept in sync by hand. |
| `.nojekyll` | Tells GitHub Pages to serve files as-is instead of running Jekyll. |

Only external dependency is Google Fonts (IBM Plex Mono, Source Serif 4); both have local
fallbacks, so the page degrades cleanly if the CDN is blocked.

## Enabling GitHub Pages (one-time)

Settings → Pages → Source: **Deploy from a branch**, branch `main`, folder `/ (root)` → Save.
The site is live a minute or two later.

## Updating

```bash
git add -A && git commit -m "..." && git push
```

Pushing to `main` republishes automatically.

Note: this machine cannot reach `github.com` over HTTPS, so the remote is configured over SSH
via the `github.com-yuan4629` host alias in `~/.ssh/config`.

## Regenerating cv.pdf

Edit `cv.html`, then re-render with headless Chrome:

```bash
chrome --headless=new --disable-gpu --no-pdf-header-footer \
  --print-to-pdf=cv.pdf file:///ABSOLUTE/PATH/TO/cv.html
```

The `@media print` block in `cv.html` controls the PDF layout (A4, 13/15 mm margins,
currently 3 pages). Keep `cv.md` in sync when the content changes.

---

Working notes, open items, and the provenance table for every figure quoted on the site are kept
in `NOTES.local.md`, which is gitignored and stays off this repo.
