# Hugo content authoring rules

**Scope:** `content/**/*.md`

The site is built with **Hugo** (extended edition, pinned to 0.165.0 in CI) using the
[`NikoMix/ms-hugo-theme`](https://github.com/NikoMix/ms-hugo-theme) remote template, vendored as a
git submodule at `themes/ms-hugo-theme` and pinned to a tag.

Control pages follow a **strict template** so the Engagement Agent and the auto-generated GitHub
Issues stay synchronised. Follow these rules whenever editing or creating content.

## ⚠️ Tables — the one rule that matters most

Every audit control page carries an evidence-status table, so tables are a hard requirement.

**Write every table flush at column 0, with a blank line before and after it.**

A table indented by four or more spaces stops being a table. CommonMark treats it as an indented
code block, and Goldmark emits it as literal `|` text. This is exactly how the previous Astro/MDX
site broke: tables nested inside `<Tabs>`/`<TabItem>` were indented seven spaces and every one of
them shipped as raw pipes.

The same trap exists in Hugo inside shortcodes:

```md
<!-- WRONG: indented inside the shortcode, renders as literal pipes -->
{{%/* tab title="Module A" */%}}
  | Control | Evidence |
  |---|---|
{{%/* /tab */%}}

<!-- RIGHT: flush at column 0 -->
{{%/* tab title="Module A" */%}}
| Control | Evidence |
|---|---|
{{%/* /tab */%}}
```

Other table rules:

- Escape a literal `|` inside a cell as `\|`.
- Keep cells short. Restructure tables wider than ~6 columns into definition lists or split tables.
- Prefer `- [ ] Item` checklists over tables-of-checkboxes so they render on the GitHub raw view too.
- `[markup.goldmark.extensions] table = true` in `config/_default/markup.toml` is what enables GFM
  tables. Do not remove it. The build fails if fewer than 30 tables render (see `deploy.yml`).

## Shortcodes

The theme provides these. Prefer them over raw HTML.

| Shortcode | Delimiters | Use for |
|---|---|---|
| `alert` | `{{%/* alert type="tip" title="..." */%}}` | Callouts. `type` is note, tip, important, warning, caution |
| `tabs` + `tab` | `{{</* tabs */>}}` outer, `{{%/* tab title="..." */%}}` inner | Tabbed panels |
| `cards` + `card` | `{{</* cards */>}}` / `{{</* card title="..." href="..." icon="..." */>}}` | Link card grids |
| `button` | `{{</* button href="..." icon="document" variant="outline" */>}}` | Download links and calls to action |
| `accordion`, `badge`, `columns`, `icon`, `figure`, `video` | `{{</* ... */>}}` | See the theme docs |

Two rules about shortcodes:

1. **Use `{{%  %}}` when the body is Markdown**, `{{< >}}` when it is not. `alert` and `tab` bodies
   are Markdown; `cards`, `card` and `button` are not.
2. **Never nest a `{{< >}}` shortcode inside a `{{%  %}}` shortcode.** The inner shortcode's HTML is
   inlined into the parent's Markdown pass, where the typographer rewrites its quotes into smart
   quotes and the tag is escaped as visible text. Put download buttons *after* the closing
   `{{% /alert %}}`, not inside it.

## Links

- **Internal page links use absolute logical paths with no trailing slash**: `/docs/module-a/1-1-organizational-data`.
  The theme's link render hook resolves these through `.Page.GetPage` and substitutes `.RelPermalink`,
  which applies the site's `/specialization-sap-on-azure/` base path. A relative `../foo/` link does
  **not** resolve and will warn; `--panicOnWarning` then fails the build.
- **Shortcode `href`/`url` parameters must NOT start with `/`**: write `templates/audit/x.xlsx`, not
  `/templates/audit/x.xlsx`. Those params go through `relURL`, which in Hugo 0.165 leaves a
  leading-slash path untouched and so drops the base path — the link 404s on the deployed site.
- **Filenames must not contain dots.** Use `2-1-foo.md` (URL `/docs/module-a/2-1-foo/`).
- Control numbers in prose always use dots: `A.2.1`, `B.3.1`.
- Never link to GitHub Issues by hard-coded number — they vary per fork.

## Front matter

```yaml
---
title: "B.1.1 – SAP on Azure Implementation Capability"
description: One-sentence summary used by the theme and search engines.
linkTitle: "1.1 SAP on Azure Implementation"   # label in the sidebar
weight: 10                                     # ordering within the section
---
```

Sections need an `_index.md` with a `title`, `linkTitle`, `description` and `weight`. The left-hand
docs sidebar is generated automatically from the `content/docs/` tree ordered by `weight` — there is
no sidebar list to maintain.

## Control page template (Module A / Module B)

Every file in `content/docs/module-a/` and `content/docs/module-b/` must follow this structure:

```md
## What the Auditor Checks

<Short prose paragraph>

**Typical questions:**
- <Q1>

---

## Required Evidence Checklist

- [ ] **<Item>** — accepted formats: PDF, Word, Excel

{{%/* alert type="tip" */%}}
<Optional shortcut or pro tip>
{{%/* /alert */%}}

---

## Evidence Guidance

### <Item name>
<How to produce / collect it>

---

## Evidence Status

| Item | Owner | Status | Last Updated | Notes |
|---|---|---|---|---|
| <Item> | | ⬜ Not started | | |

---

## Common Gaps

- **<Gap>:** <Why it fails the audit and how to prevent it>
```

## Status icons (mandatory)

Use only these in the `Status` column:

| Icon | Meaning |
|---|---|
| `⬜` | Not started |
| `🟡` | In progress |
| `✅` | Complete |

## Downloadable workfiles

Workfiles live under `static/templates/…` and are served from `/templates/…`. Surface them at the
top of the page as a button **outside** the alert:

```md
{{%/* alert type="tip" title="Download the workfile" */%}}
What the workfile contains and when to use it.
{{%/* /alert */%}}

{{</* button href="templates/engagement/<file>" icon="document" variant="outline" */>}}Download <file>{{</* /button */>}}
```

## When evidence requirements change

If you add, remove, or reword an evidence item in a control page, you **must** make the matching
edit to `.github/scripts/create-issues.sh`, and add the control to the Evidence Tracker table in
`content/docs/evidence-tracker.md`. The doc, the tracker and the issue are one source of truth in
three forms.

## Local build

```sh
git submodule update --init --recursive
hugo server                            # preview
hugo --minify --gc --panicOnWarning    # what CI runs
```

Hugo **extended** is required (the theme compiles SCSS). Dart Sass is optional locally but is
installed in CI; without it Hugo falls back to the deprecated LibSass transpiler and emits a
warning, which `--panicOnWarning` treats as a failure.
