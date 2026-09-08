---
title: "B.4.2 – Partner Onboarding Assets"
description: "Evidence requirements for control B.4.2 — SAP-on-Azure customer onboarding pack and delivery templates."
linkTitle: "4.2 Partner Onboarding"
weight: 60
---
## What the Auditor Checks

The auditor verifies you have a **repeatable customer onboarding pack** — not bespoke per engagement, but a productised set of templates and a migration playbook covering the full lifecycle from SOW to hypercare exit.

**Typical questions:**

- Where is your SAP-on-Azure migration playbook?
- Show me your HLD / LLD / runbook / KT / hypercare templates.
- Has this pack been applied to at least one real customer?

---

## Required Evidence Checklist

- [ ] **SAP migration / build playbook** — PDF / Word
- [ ] **HLD template** — PDF / Word
- [ ] **LLD template** — PDF / Word
- [ ] **Runbook template** (start/stop, patching, backup, DR) — PDF / Word
- [ ] **KT plan template** — PDF / Word
- [ ] **Hypercare plan template** — PDF / Word
- [ ] **Evidence the pack has been applied** to ≥ 1 customer (anonymised cover slide of the filled artefact) — PDF

{{% alert type="tip" %}}
This entire repository's `engagement/deliverables/` section ships with downloadable Word templates
for each deliverable. Use them as your baseline — partners are expected to extend, not replace.
{{% /alert %}}

---

## Evidence Guidance

### Migration / Build Playbook

The playbook should cover SAP Activate phases mapped to the Azure workstream, with the deliverable templates referenced at the right phase. Reference [Engagement Playbook → Discovery Workshop](/docs/engagement/discovery-workshop) and [Reference Architectures](/docs/engagement/reference-architectures) as the inputs.

### HLD / LLD

Use the downloadable [HLD template](/docs/engagement/deliverables/hld-template) and [LLD template](/docs/engagement/deliverables/lld-template) as the baseline. The auditor wants to see:

- Landing zone topology
- SAP application landscape
- HANA HA topology and DR
- Network + identity design
- VM SKUs per tier, ANF volumes, disk layout
- HSR config, Pacemaker config, ASCS/ERS cluster, backup policies

### Runbook / KT / Hypercare

Templates available at:

- [Runbook template](/docs/engagement/deliverables/runbook-template)
- [KT plan template](/docs/engagement/deliverables/kt-plan-template)
- [Hypercare plan template](/docs/engagement/deliverables/hypercare-plan-template)

### Evidence of Application

A single anonymised cover slide from a filled artefact (e.g. "Customer A S/4HANA on Azure — HLD v1.2") is enough.

---

## Evidence Status

| Item | Owner | Status | Last Updated | Notes |
|---|---|---|---|---|
| Migration playbook | | ⬜ Not started | | |
| HLD template | | ⬜ Not started | | |
| LLD template | | ⬜ Not started | | |
| Runbook template | | ⬜ Not started | | |
| KT plan template | | ⬜ Not started | | |
| Hypercare plan template | | ⬜ Not started | | |
| Evidence of application | | ⬜ Not started | | |

---

## Common Gaps

- **Templates are old or inconsistent:** swap to the latest downloadable versions in `static/templates/deliverables/`.
- **No evidence of application:** attach an anonymised cover slide or signed sign-off.
- **No SAP Activate mapping:** add a one-page mapping in the playbook intro.
