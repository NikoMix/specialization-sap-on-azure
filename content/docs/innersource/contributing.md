---
title: "Contributing"
description: "How to contribute back to this SAP on Azure engagement toolkit."
linkTitle: "Contributing"
weight: 10
---
This toolkit is **innersource**. Every consultant who runs an engagement is expected (and warmly invited) to contribute back.

## What to contribute

- **Audit control evidence guidance** — clarifications, additional examples, common gaps you've hit in the field.
- **Engagement playbook updates** — new qualification questions, sharper WAF prompts, better discovery agendas.
- **Reference architectures** — diagrams + decision rationale for SAP topologies you've delivered.
- **Customer deliverable templates** — HLD, LLD, runbook, KT, hypercare improvements (Word / PowerPoint / Excel sources under `static/templates/`).
- **Lessons learned** — anonymised "what tripped us up and what we'd do differently".

## How to contribute

1. **Open an Issue first** for non-trivial changes — pick the appropriate template (`control-improvement`, `template-improvement`, or `lesson-learned`).
2. **Branch from `main`** using the naming convention below.
3. **Open a PR** — the PR template asks you to link back to the engagement phase + audit control your change supports.
4. **Get review** — see `CODEOWNERS` for the practice lead who owns each content area.

## Branch naming

```
control/a-2-1-add-evidence-example
playbook/discovery-add-rise-questions
arch/multi-region-dr-update
template/runbook-add-patching-section
lesson/cutover-weekend-staffing
```

## Review SLA

- **Practice lead** acknowledges within **2 business days**.
- **First review pass** within **5 business days**.
- **Endorsement** (see [Content Governance](/docs/innersource/content-governance)) after at least one delivered engagement has applied the change.

## Quality bar

{{% alert type="tip" %}}
Before opening a PR, run `hugo --minify --gc --panicOnWarning` locally. The build must succeed with
zero warnings, and the table gate must report every Markdown table rendering as a real table.
Follow `.github/memories/hugo-content.md` — especially the rule that tables must sit flush at
column 0 inside shortcodes, and the dot-free filename rule.
{{% /alert %}}

## Confidentiality

Anonymise customer data. Public partners' names are fine when they've consented; otherwise use *Customer A / Customer B*. Never commit live ACR numbers, certification names with personal IDs, or unredacted EarlyWatch reports.
