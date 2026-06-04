# MDX content authoring rules

**Scope:** `src/content/docs/**/*.mdx`

This repository's documentation pages follow a **strict template** for control pages so that the Engagement Agent and the auto-generated GitHub Issues stay synchronised. Follow these rules whenever editing or creating MDX files.

## ⚠️ MDX syntax gotchas

MDX 3 (Astro 6 / Starlight 0.39) parses `<` followed by a letter, digit, or space as the start of a JSX tag. This breaks the build with `Unexpected character '...' before name`.

**Always escape these patterns:**

| ❌ Wrong | ✅ Right |
|---|---|
| `target <2 business days` | `target &lt; 2 business days` |
| `latency <100ms` | `latency &lt; 100ms` |
| `<6 months coverage` | `&lt; 6 months coverage` |
| `if x < 5 then` (in prose) | `if x &lt; 5 then` |
| `&` standalone in prose | `&amp;` |

Inside fenced code blocks (triple backticks) characters are NOT parsed as MDX — so you don't need to escape there.

## Control page template (Module A / Module B)

Every file in `src/content/docs/module-a/` and `src/content/docs/module-b/` must follow this exact structure:

```mdx
---
title: "<MODULE>.<SECTION>.<ITEM> – <Short Title>"
description: <One-sentence summary used by Starlight + search engines>
sidebar:
  label: "<SECTION>.<ITEM> <Short Title>"
  order: <integer>
---

import { Aside } from '@astrojs/starlight/components';

## What the Auditor Checks

<Short prose paragraph>

**Typical questions:**
- <Q1>
- <Q2>
- <Q3>

---

## Required Evidence Checklist

- [ ] **<Item 1 name>** — accepted formats: PDF, Word, Excel
- [ ] **<Item 2 name>** — accepted formats: PDF, PowerPoint
- [ ] ...

<Aside type="tip">
  <Optional shortcut or pro tip>
</Aside>

---

## Evidence Guidance

### <Item 1 name>
<How to produce / collect it>

### <Item 2 name>
...

---

## Evidence Status

| Item | Owner | Status | Last Updated | Notes |
|---|---|---|---|---|
| <Item 1> | | ⬜ Not started | | |

---

## Common Gaps

- **<Gap>:** <Why it fails the audit and how to prevent it>
```

## Status icons (mandatory)

Use only these three icons in the `Status` column:

| Icon | Meaning |
|---|---|
| `⬜` | Not started |
| `🟡` | In progress |
| `✅` | Complete |

## Cross-references

- Control numbers in prose always use dots: `A.2.1`, `B.3.1`. Never `A2.1` or just `2.1`.
- Cross-link controls with **relative** paths (Astro doesn't auto-prefix base on absolute markdown links): from a docs page at depth 1 like `src/content/docs/audit-process.mdx`, link to `../module-a/2-1-service-delivery-methodology/` (not `/module-a/...`).
- **Filenames must NOT contain dots** — Starlight strips them from URL slugs. Use `2-1-foo.mdx` (slug `/module-a/2-1-foo/`) not `2.1-foo.mdx` (which becomes `/module-a/21-foo/`).
- Never link to GitHub Issues by hard-coded number — they vary per fork.

## Tables

- Always leave a blank line **before and after** a table.
- Keep cells short — restructure tables wider than ~5 columns into definition lists, nested headings, or split tables.
- Escape `|` inside cells as `\|`.
- Replace tables-of-checkboxes with `- [ ] Item` checklists so they render natively on the GitHub raw view and on the rendered site.

## Curly braces in prose

MDX treats `{...}` as a JavaScript expression. Wrap any literal braces in prose with backticks: `` `{example}` ``.

## When evidence requirements change

If you add, remove, or reword an evidence item in a control page, you **must** make the matching edit to `.github/scripts/create-issues.sh` so the auto-created issue checkboxes stay aligned. The doc and the issue are a single source of truth in two forms.

## Starlight components allowed

Currently in use and safe to import:

```mdx
import { Aside, Steps, Card, CardGrid, Tabs, TabItem } from '@astrojs/starlight/components';
```

Precede each component with a short prose sentence so the raw GitHub view still makes sense to readers who don't render Starlight.

Do not introduce React components, MDX expressions that fetch data at build time, or third-party widgets without explicit need — partners may build this on locked-down CI runners.

## Downloadable workfiles

Each engagement playbook page that has an associated workfile under `public/templates/...` must surface it at the top with:

```mdx
<Aside type="tip" title="Download the workfile">
  [📄 Download the workfile](/templates/engagement/<file>)
</Aside>
```

Use Astro's `${import.meta.env.BASE_URL}` prefix only inside JSX expressions; for plain markdown links use the root-relative path — Astro rewrites it against the configured `base` at build time.
