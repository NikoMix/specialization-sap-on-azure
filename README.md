# SAP on Microsoft Azure — Advanced Specialization

> Engagement toolkit for Microsoft partners pursuing the **SAP on Microsoft Azure Advanced Specialization** audit, plus a ready-to-run engagement playbook (offering, qualification, discovery, WAF, reference architectures, customer deliverables).

---

## 🎯 Purpose

This repository is a complete partner-ready toolkit. It helps consultants:

1. **Pass the audit** — every control mapped to a documentation page with evidence guidance, plus auto-created GitHub Issues per audit cycle.
2. **Deliver to ≥3 reference customers** — offering one-pager, qualification questionnaire (SAP estate + HANA sizing + RISE vs self-managed), 3-day discovery workshop, WAF assessment, reference architectures, and signed HLD/LLD/runbook/KT/hypercare templates.
3. **Stand up a repeatable productised offering** — clear scope, definition of done, deliverable templates.
4. **Innersource continuous improvements** — every consultant who runs an engagement can contribute back controls, templates, and lessons learned.

The repo ships:

- **Documentation site** (Hugo + the [`NikoMix/ms-hugo-theme`](https://github.com/NikoMix/ms-hugo-theme) Microsoft Fluent theme) deployed to GitHub Pages
- **Downloadable workfiles** — Word, PowerPoint, Excel templates under `static/templates/`
- **GitHub Issues** as the audit task board (one issue per control, annual auto-refresh)
- **Engagement Agent** — a GitHub Custom Agent that knows every control, the SAP-on-Azure architectural surface, and the engagement playbook

---

## 🚀 Getting Started

This repo is designed to be used as a **GitHub Template**. Click **"Use this template"** to create your own copy.

### 1. Use this template

Click **Use this template → Create a new repository** and choose your GitHub organisation.

> The theme is a git submodule. If you clone rather than template, run
> `git submodule update --init --recursive`.

### 2. Enable GitHub Pages

Go to your repo → **Settings → Pages → Source** → select **GitHub Actions**.

No URL configuration is needed. The workflow passes the URL reported by
`actions/configure-pages` to Hugo as `--baseURL`, so a fork, a rename, or a
user/org page all publish correctly out of the box.

### 3. Create the engagement issues

Go to **Actions → Create Audit Engagement Issues → Run workflow**. This creates 15 issues — a
pre-qualification gate, 7 Module A controls, and 7 Module B controls — under a milestone named
`Audit <year>`. Re-running is safe: existing titles are skipped.

### 4. Done

- Issues appear as your engagement task board 📋
- The documentation site deploys automatically on push to `main` 🌐
- Workfiles are downloadable from each engagement playbook page 📄

---

## 🤖 Engagement Agent

The repo ships a **GitHub Custom Agent** purpose-built for this specialization — it knows every audit control, the SAP-on-Azure architectural surface (M/Mv2/Mv3 VMs, ANF, Premium SSD v2, Availability Zones, ExpressRoute, ACSS, Azure Monitor for SAP, Azure Backup for SAP HANA, HSR, ASCS/ERS clustering), and the full engagement playbook.

Agent profile: [`.github/agents/engagement-agent.agent.md`](.github/agents/engagement-agent.agent.md).

Use it on github.com/copilot, in VS Code Copilot Chat, or assigned directly to a GitHub Issue.

---

## 📅 Annual Audit Cycle

The `Create Audit Engagement Issues` workflow runs on a schedule (default March 1st) — 9 months after a typical June audit — giving your team 3 months to refresh evidence before re-audit.

Adjust the schedule in `.github/workflows/create-issues.yml` by editing the cron expression to match `<your audit month> + 9`.

---

## 🖥️ Local Development

Requires **Hugo extended** v0.146.0 or newer (CI pins 0.165.0). Dart Sass is optional locally but
recommended — without it Hugo falls back to the deprecated LibSass transpiler.

```bash
git submodule update --init --recursive
hugo server
```

Build exactly what CI builds:

```bash
hugo --minify --gc --panicOnWarning
```

Output goes to `public/` (git-ignored).

### Updating the theme

The [`NikoMix/ms-hugo-theme`](https://github.com/NikoMix/ms-hugo-theme) remote template is vendored
as a git submodule pinned to a tag:

```bash
git -C themes/ms-hugo-theme fetch --tags
git -C themes/ms-hugo-theme checkout v1.0.0
git add themes/ms-hugo-theme && git commit -m "Bump theme to v1.0.0"
```

> **Why a submodule and not a Hugo Module?** Go's module packer strips any directory named
> `vendor/`, which silently drops the theme's `assets/scss/vendor/_chroma.scss` and breaks the
> Sass build. The deploy workflow asserts that file is present so the failure can never be
> silent again.

---

## 📁 Structure

```
├── .github/
│   ├── agents/engagement-agent.agent.md
│   ├── memories/hugo-content.md      # content authoring rules
│   ├── ISSUE_TEMPLATE/*.yml
│   ├── PULL_REQUEST_TEMPLATE.md
│   ├── scripts/create-issues.sh
│   └── workflows/
│       ├── deploy.yml                # Hugo build + GitHub Pages deploy
│       ├── create-issues.yml
│       └── copilot-setup-steps.yml
├── config/_default/                  # hugo.toml, markup.toml, params.toml, menus.en.toml
├── themes/ms-hugo-theme/             # git submodule, pinned to a tag
├── static/templates/
│   ├── engagement/       # offering/qualification/discovery/WAF/etc. workfiles
│   ├── deliverables/     # HLD/LLD/runbook/KT/hypercare workfiles
│   └── audit/            # evidence-tracker.xlsx + pre-qual checklist
└── content/
    ├── _index.md                     # home page
    └── docs/
        ├── overview.md, requirements.md, audit-process.md
        ├── evidence-tracker.md, faq.md
        ├── module-a/                 # General audit controls
        ├── module-b/                 # SAP on Azure-specific audit controls
        ├── engagement/               # Engagement playbook
        └── innersource/              # Contributing, governance, roadmap
```

---

## 🤝 Innersource

This is an innersource toolkit. Contribute back lessons learned, additional templates, and reference architectures via pull request. See [CONTRIBUTING.md](CONTRIBUTING.md) and the on-site **Innersource** section for the contribution lifecycle and content governance model.

---

## 📄 License

Content is provided for partner enablement purposes. Refer to your Microsoft Partner Agreement for usage terms. Microsoft, Azure, and SAP product names are trademarks of their respective owners.
