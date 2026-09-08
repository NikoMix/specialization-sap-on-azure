---
title: "Pre-Qualification Requirements"
description: "Checklist of requirements your organisation must meet before applying for the SAP on Microsoft Azure Advanced Specialization audit."
weight: 20
---
{{% alert type="warning" %}}
All four requirement categories below must be satisfied **before** requesting an audit. Review each
section carefully and confirm readiness with your Microsoft Partner Development Manager (PDM).
Thresholds are summarised from the publicly documented SAP on Azure specialization requirements —
always reconcile against your Partner Center dashboard before submission.
{{% /alert %}}

## Requirement 1 – Active Solutions Partner Designation

Your organisation must hold an **active Solutions Partner for Infrastructure (Azure)** designation.

- Verify in Partner Center → **Overview → Membership**.
- Confirm the partner capability score remains above the qualifying threshold for the entire audit window.

> ✅ **Evidence needed:** Screenshot of active designation from Partner Center, or the Partner Center PDF report showing designation status.

---

## Requirement 2 – Azure Consumed Revenue (ACR)

Your organisation must demonstrate **≥ USD 7,500 of ACR over the last three months**, aggregated across SAP-on-Azure-eligible Azure services.

The eligible service set covers the Azure surface used to deliver SAP workloads — SAP-certified VM families (M-series, Mv2-series, Mv3-series), the surrounding storage (Azure NetApp Files, Premium SSD v2, Ultra Disk), networking (ExpressRoute, virtual networks), and management services (ACSS, Azure Monitor for SAP solutions, Azure Backup for SAP HANA).

{{% alert type="tip" %}}
Confirm the exact eligible service list with your PDM at the start of the cycle — Microsoft updates
it periodically. A common ACR gap is unattributed SAP customer spend; check that **PAL** is set up
on every SAP customer subscription.
{{% /alert %}}

> ✅ **Evidence needed:** ACR report from Partner Center → Insights → Azure Revenue, filtered to the trailing 3 months and annotated to show the SAP-on-Azure-eligible service breakdown.

---

## Requirement 3 – Customer Diversity

Your organisation must have **at least 3 unique customers** contributing to ACR over the trailing 3 months from the eligible Azure service set above.

Eligible association types:

| Association Type | Abbreviation |
|---|---|
| Digital Partner of Record | DPOR |
| Partner Admin Link | PAL |
| Cloud Solution Provider | CSP |

> Government subscriptions are not eligible for ACR via PAL. Confirm the customer list with your PDM if any subscriptions are sovereign or government.

---

## Requirement 4 – Skilling

At least **one individual** from your organisation must satisfy **one** of:

1. Hold the **Microsoft Certified: Azure for SAP Workloads Specialty** (**AZ-120**) certification, **or**
2. Have completed the **Run SAP on the Microsoft Cloud** learning path on Microsoft Learn.

{{% alert type="tip" %}}
AZ-120 carries the most weight with customers, but the learning-path option is the fastest route to
the audit gate. Have your most experienced SAP-Basis-meets-Azure-infra consultant complete the
learning path **first**, then book AZ-120 for the next cycle.
{{% /alert %}}

> ✅ **Evidence needed:** Microsoft Learn transcript exported as PDF for the AZ-120 holder(s) and/or the learning-path completer(s). Validate the same data in Partner Center where possible.

---

## Requirement 5 – Third-Party Remote Audit

Your organisation must **pass a third-party remote audit** conducted by a Microsoft-approved audit firm.

1. Confirm pre-qualification (Requirements 1–4 above are met)
2. Request audit via Partner Center → Benefits → Advanced Specializations
3. Receive auditor assignment and kickoff call scheduling
4. Submit evidence package to the auditor
5. Complete the audit interview / review session
6. Address any remediation findings (if required)
7. Receive audit pass confirmation

> ✅ **Evidence needed:** This entire repository constitutes your evidence preparation package. Use the [Module A](/docs/module-a/1-1-organizational-data) and [Module B](/docs/module-b/1-1-sap-on-azure-implementation) pages for control-level evidence.

---

## Quick Readiness Checklist

- [ ] Active **Solutions Partner for Infrastructure (Azure)** designation confirmed
- [ ] ACR **≥ USD 7,500** over the trailing 3 months, SAP-on-Azure-eligible services
- [ ] **≥ 3 unique customers** contributing ACR via DPOR / PAL / CSP
- [ ] At least one individual holds **AZ-120** **or** completed the **Run SAP on the Microsoft Cloud** learning path
- [ ] Microsoft Learn transcript exported for each skilling evidence holder
- [ ] Internal pre-audit review completed against the Evidence Tracker
- [ ] Audit requested via Partner Center and auditor kickoff scheduled
