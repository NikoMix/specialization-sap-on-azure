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

- **Documentation site** (Astro 6 + Starlight 0.39) deployed to GitHub Pages
- **Downloadable workfiles** — Word, PowerPoint, Excel templates under `public/templates/`
- **GitHub Issues** as the audit task board (one issue per control, annual auto-refresh)
- **Engagement Agent** — a GitHub Custom Agent that knows every control, the SAP-on-Azure architectural surface, and the engagement playbook

---

## 🚀 Getting Started

This repo is designed to be used as a **GitHub Template**. Click **"Use this template"** to create your own copy.

### 1. Use this template

Click **Use this template → Create a new repository** and choose your GitHub organisation.

### 2. Enable GitHub Pages

Go to your repo → **Settings → Pages → Source** → select **GitHub Actions**.

Optionally override the site URL by adding `ASTRO_SITE` as a repo variable
(**Settings → Secrets and variables → Actions → Variables**). The default
derives the URL from `GITHUB_REPOSITORY` and works out-of-the-box for
`https://<org>.github.io/<repo>/`.

### 3. Create the engagement issues

Go to **Actions → Create Audit Engagement Issues → Run workflow**. This creates one issue per audit control + a pre-qualification gate issue under a milestone named `Audit <year>`.

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

```bash
npm install
npm run dev
```

Build:

```bash
npm run build
```

---

## 📁 Structure

```
├── .github/
│   ├── agents/engagement-agent.agent.md
│   ├── memories/mdx-content.md
│   ├── ISSUE_TEMPLATE/*.yml
│   ├── PULL_REQUEST_TEMPLATE.md
│   ├── scripts/create-issues.sh
│   └── workflows/
│       ├── deploy.yml
│       ├── create-issues.yml
│       └── copilot-setup-steps.yml
├── public/templates/
│   ├── engagement/       # offering/qualification/discovery/WAF/etc. workfiles
│   ├── deliverables/     # HLD/LLD/runbook/KT/hypercare workfiles
│   └── audit/            # evidence-tracker.xlsx + pre-qual checklist
└── src/content/docs/
    ├── index.mdx, overview.mdx, requirements.mdx, audit-process.mdx
    ├── evidence-tracker.mdx, faq.mdx
    ├── module-a/         # General audit controls
    ├── module-b/         # SAP on Azure-specific audit controls
    ├── engagement/       # Engagement playbook
    └── innersource/      # Contributing, governance, roadmap
```

---

## 🤝 Innersource

This is an innersource toolkit. Contribute back lessons learned, additional templates, and reference architectures via pull request. See [CONTRIBUTING.md](CONTRIBUTING.md) and the on-site **Innersource** section for the contribution lifecycle and content governance model.

---

## 📄 License

Content is provided for partner enablement purposes. Refer to your Microsoft Partner Agreement for usage terms. Microsoft, Azure, and SAP product names are trademarks of their respective owners.
