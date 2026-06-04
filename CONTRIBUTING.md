# Contributing

This is an **innersource** toolkit for the SAP on Microsoft Azure Advanced Specialization. Every consultant who runs an engagement is expected (and warmly invited) to contribute back.

## What to contribute

- **Audit control evidence guidance** — clarifications, additional examples, common gaps you've hit in the field.
- **Engagement playbook updates** — new qualification questions, sharper WAF prompts, better discovery agendas.
- **Reference architectures** — diagrams + decision rationale for SAP topologies you've delivered.
- **Customer deliverable templates** — HLD/LLD/runbook/KT/hypercare improvements.
- **Lessons learned** — anonymised "what tripped us up and what we'd do differently".

## How to contribute

1. **Open an Issue first** for non-trivial changes — pick the appropriate template (`control-improvement`, `template-improvement`, or `lesson-learned`).
2. **Branch from `main`** using the naming convention below.
3. **Open a PR** — the PR template asks you to link back to the engagement phase + audit control your change supports.
4. **Get review** — see CODEOWNERS for the practice lead who owns each content area.

## Branch naming

Use kebab-case prefixed with the change category:

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
- **Endorsement** (see content governance) after **at least one** delivered engagement has applied the change successfully.

## Code of conduct

Be precise, be kind, anonymise customer data. Public partners' names are fine when they've consented; otherwise use *Customer A / Customer B*.

## Quality bar

- MDX must build cleanly (`npm run build` with zero warnings).
- Follow `.github/memories/mdx-content.md` — especially the `&lt;` escaping rules and dot-free filenames.
- Update the **Evidence Tracker** workfile (`public/templates/audit/evidence-tracker.xlsx`) when you add or remove an audit control.
- If you change control evidence checkboxes, also update `.github/scripts/create-issues.sh` so the GitHub Issues stay in sync.
