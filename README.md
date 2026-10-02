# PersonalPage

Academic homepage of **Yuan Huang (黄远)**, Northeastern University, China.

**Live:** https://yuan4629.github.io/PersonalPage/

| File | What it is |
| --- | --- |
| `index.html` | The homepage. Short by design: about, news, publications, education, awards. A fixed bar across the top jumps to each section and marks the one you are reading. |
| `pub/` | The papers as PDFs, as posted to arXiv, named by their short names (`EditJudgeBias`, `LS-B`, `WereBench`, `Geolocation`). Each entry under *Publications* links its PDF here. |
| `cv.html` | Web version of the CV, styled to match the homepage. Print stylesheet included. |
| `cv.pdf` | Generated from `cv.html`. Linked from the CV page as *Download PDF*. |
| `cv.md` | Source of truth for CV content, kept in sync by hand. |
| `make-cv-pdf.ps1` | One command to re-render `cv.pdf` from `cv.html`. Not part of the site. |
| `photo.jpg` | Portrait shown in the pinned identity block. **Not committed yet** — drop the file in and it appears; until then a dashed placeholder holds the space. `photo.png` works too. |
| `.nojekyll` | Tells GitHub Pages to serve files as-is instead of running Jekyll. |

Only `cv.md`, `cv.html` and `cv.pdf` are published. Any other CV variant (`cv_*.html`,
`cv_*.pdf`) stays on this machine, and `.gitignore` keeps it out of the repo.

Every page is self-contained — CSS and JS inline, no build step. The only external dependency is
Google Fonts (IBM Plex Mono, Source Serif 4); both have local fallbacks, so the pages degrade
cleanly if the CDN is blocked. Layout follows the conventions of
[Minimal-Academic-Website](https://github.com/yuhui-zh15/Minimal-Academic-Website) — narrow
measure, ruled section headings, no chrome. The CSS is original.

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

## Adding the portrait

Save a 3:4 portrait as `photo.jpg` in this folder and push it. No markup change is needed: the
identity block already reserves a 112&nbsp;px-wide slot for it, and the image is loaded with a
fallback chain — `photo.jpg` → `photo.png` → dashed placeholder. Around 600&times;800&nbsp;px is
plenty; anything larger is wasted bytes on every page load.

To hide the placeholder instead of showing it while the file is missing, add
`.photo.empty{display:none}` to the stylesheet in `index.html`.

## Regenerating cv.pdf

`cv.pdf` is a committed file, not something Pages builds on push — so it goes stale the moment
you edit `cv.html` and forget to re-render. After any CV edit, from the repo root:

```powershell
powershell -ExecutionPolicy Bypass -File .\make-cv-pdf.ps1
```

`-Name` renders another basename in this folder instead (it defaults to `cv`).

That is headless Chrome printing `cv.html`. The script exists because three details are easy to
get wrong by hand, and each one fails **silently — no error, no file**:

- `--print-to-pdf` needs an **absolute** path. A relative one is dropped.
- `--user-data-dir` must point somewhere writable **and unlocked**. A headless Chrome left over
  from an earlier run keeps the lock and the next run quietly does nothing, so the script gives
  each run its own profile directory and deletes it afterwards.
- Chrome returns **before** the file is flushed, so the write has to be polled for.

By hand, if you would rather not use the script:

```bash
chrome --headless=new --disable-gpu --no-pdf-header-footer \
  --user-data-dir=C:/Temp/cv-pdf-profile --virtual-time-budget=8000 \
  --print-to-pdf=D:/ABSOLUTE/PATH/cv.pdf file:///D:/ABSOLUTE/PATH/cv.html
```

Chrome's own Ctrl&#8209;P dialog works too, but it bakes in the browser's margin preset and its
“Headers and footers” setting, so the output will not match. Prefer the script.

The `@media print` block in `cv.html` controls the PDF layout (A4, 14/17 mm margins,
currently 2 pages). Type size and leading there are set for reading comfort, not to fit a page
count &mdash; two pages is fine, shrinking the text to reach one is not.

The full CV loop, then: edit `cv.html` → mirror the change into `cv.md` by hand → run the
script → commit `cv.html`, `cv.md` and `cv.pdf` together.

---

Working notes, open items, and the provenance table for every figure quoted on the site are kept
in `NOTES.local.md`, which is gitignored and stays off this repo.
