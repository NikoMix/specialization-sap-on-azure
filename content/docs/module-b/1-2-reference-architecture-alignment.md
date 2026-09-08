---
title: "B.1.2 – Reference Architecture Alignment"
description: "Evidence requirements for control B.1.2 — showing that delivered SAP-on-Azure solutions trace back to a published Microsoft reference architecture."
linkTitle: "1.2 Reference Architecture Alignment"
weight: 15
---

## What the Auditor Checks

The auditor looks for evidence that your designs are **grounded in published Microsoft guidance**
rather than invented per engagement. A bespoke diagram alone is weak evidence; a bespoke diagram
that names the Microsoft reference architecture it derives from, and lists the deliberate
deviations, is strong evidence.

**Typical questions:**

- Which published Microsoft reference architecture does this customer design derive from?
- Where did you deviate from it, and why?
- How do you keep designs current as new HANA-certified SKUs and Azure services ship?

---

## Required Evidence Checklist

- [ ] **Architecture provenance** — each customer diagram names the published Microsoft architecture it derives from — PDF / Visio / draw.io
- [ ] **Deviation log** — deviations from the reference architecture with the reason, captured in the HLD — PDF / Word
- [ ] **Coverage matrix** — audit-checklist technology mapped to where it appears in your design — PDF / Excel
- [ ] **Automation evidence** — at least one engagement started from the SAP on Azure deployment automation framework — repo link / screenshots

{{% alert type="tip" %}}
Cite [SAP S/4HANA in Linux on Azure](https://learn.microsoft.com/en-us/azure/architecture/guide/sap/sap-s4hana)
as your baseline. It is the single published architecture covering the widest part of the Module B
technology surface, so one citation carries most of the checklist.
{{% /alert %}}

---

## Evidence Guidance

### Choosing the right baseline

| Customer shape | Cite this published architecture |
|---|---|
| S/4HANA production, zonal HA | [SAP S/4HANA in Linux on Azure](https://learn.microsoft.com/en-us/azure/architecture/guide/sap/sap-s4hana) |
| Single large HANA instance | [Run SAP HANA for Linux VMs in a scale-up architecture](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/sap/run-sap-hana-for-linux-virtual-machines) |
| BW/4HANA analytics | [Run SAP BW/4HANA with Linux virtual machines](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/sap/run-sap-bw4hana-with-linux-virtual-machines) |
| Multi-system estate (DEV/QAS/PRD) | [SAP whole landscape on Azure](https://learn.microsoft.com/en-us/azure/architecture/guide/sap/sap-whole-landscape) |
| RISE with SAP, partner owns Azure side | [SAP on Azure landing zone accelerator](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/sap/enterprise-scale-landing-zone) |
| Cross-region DR in scope | [Disaster recovery overview for SAP workloads](https://learn.microsoft.com/en-us/azure/sap/workloads/disaster-recovery-overview-guide) |

### Writing a deviation log

One row per deviation. Keep it short and defensible — the auditor is testing whether the deviation
was a decision or an accident.

| Deviation | Reference architecture says | We did | Reason |
|---|---|---|---|
| Storage for `/hana/log` | Azure NetApp Files | Ultra Disk | Customer had no ANF capacity in-region at cutover |

---

## Evidence Status

| Item | Owner | Status | Last Updated | Notes |
|---|---|---|---|---|
| Architecture provenance | | ⬜ Not started | | |
| Deviation log | | ⬜ Not started | | |
| Coverage matrix | | ⬜ Not started | | |
| Automation framework evidence | | ⬜ Not started | | |

---

## Common Gaps

- **Diagram cites nothing:** add a "derived from" line naming the published Microsoft architecture and its URL.
- **Deviations undocumented:** an undocumented deviation reads as a mistake. Log it with the reason.
- **Coverage matrix skipped:** without it the auditor has to hunt for each technology across your diagrams. Use the matrix on the [Reference Architectures](/docs/engagement/reference-architectures) page as the starting template.
- **Stale baseline:** re-check the published architecture each cycle — HANA-certified SKUs and Azure service names change.
