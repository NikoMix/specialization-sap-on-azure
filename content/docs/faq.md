---
title: "Frequently Asked Questions"
description: "Common questions from partners during the SAP on Microsoft Azure Advanced Specialization engagement."
weight: 90
---
## Pre-Qualification

### How do I know if we already meet the ACR threshold?

Check **Partner Center → Insights → Azure Revenue** and filter by the last 3 months. Note that Partner Center data typically lags by **2–4 weeks**. Your PDM can provide a more current view on request.

### Can we count ACR from CSP, DPOR, and PAL?

Yes. All three eligible association types count: **Digital Partner of Record (DPOR)**, **Partner Admin Link (PAL)**, and **Cloud Solution Provider (CSP)**. A single customer may have multiple association types, but only counts as one unique customer for the diversity requirement. Government subscriptions are **not** eligible for ACR via PAL.

### We have Infrastructure (Azure) as a Solutions Partner designation but no SAP-specific designation. Is that enough?

Yes — **Solutions Partner for Infrastructure (Azure)** is the required designation for this specialization. There is no SAP-specific Solutions Partner designation today.

### Do we have to take AZ-120, or can the learning path replace it?

Either satisfies the gate. The publicly documented option is **AZ-120 OR** completion of the **Run SAP on the Microsoft Cloud** learning path on Microsoft Learn. AZ-120 carries more weight with SAP customers — many partners use the learning path to pass the audit gate and book AZ-120 for the next cycle.

### How many people need the skilling evidence?

At least **one individual** with AZ-120 or the completed learning path satisfies the requirement.

---

## Audit Process

### How long does the audit take?

For well-prepared partners: **6–8 weeks** from request to badge. Unprepared partners gathering evidence inside the audit window typically take **12–16 weeks**.

### What format does the auditor want evidence in?

Auditors generally accept **PDF, Word, Excel, and PowerPoint** documents. Screenshots should be exported as PDF. All documents should be clearly named with control references (e.g. `B2.1_ACR_v2.pdf`).

### What happens if we fail the audit?

You receive a **remediation report** listing the specific controls and gaps. You have approximately **30 days** to address and resubmit. Failure to remediate in time may require restarting the audit cycle.

### Can we anonymise customer names in case studies?

Yes for internal audit documents. The auditor may verify customer references directly with Microsoft Partner Center data, so confirm anonymisation scope with your PDM if unsure.

---

## SAP-on-Azure delivery questions

### What's the difference between self-managed SAP on Azure and RISE with SAP for the audit?

Both are accepted for B.1.1 (Implementation Capability). For self-managed engagements your evidence is the full Basis-through-IaaS HLD/LLD/runbook stack. For RISE engagements your evidence is the Azure landing-zone, peering, identity integration, monitoring hand-off, and the RACI vs SAP ECS. Show at least one of each if you deliver both.

### What's the default HANA storage tier we should recommend?

**Azure NetApp Files** on M-series for data, log, and shared on most engagements. **Premium SSD v2** is a valid alternative when ANF isn't in-region or cost-optimisation is decisive — but document the IOPS / latency calc in the LLD and have it signed off.

### What HA design is the auditor most likely to ask about?

Zonal: M / Mv2 / Mv3 pair across two Availability Zones, HSR sync, Pacemaker + SBD, ASCS/ERS in a separate cluster, Azure Load Balancer with floating IP. Cross-region: HSR async + ASR for the app tier. Make sure your HLD shows the RTO/RPO commitment per tier.

### Where should we start with IaC?

Use the **SAP on Azure deployment automation framework** (Terraform + Ansible) as the baseline for every LLD. It produces the network, compute, storage, and OS layer; customer-specific customisations layer on top.

---

## Evidence

### What counts as proof of a customer satisfaction survey?

Accepted formats:

- Exported survey results from tools like Microsoft Forms, SurveyMonkey, Qualtrics
- CSAT data from your CRM (anonymised if needed)
- Email correspondence confirming customer satisfaction scores
- Reference letters from customers

The auditor is looking for a **systematic process**, not a one-off survey.

### Do we need ISO 27001 for the security control?

ISO 27001 is the gold standard and will satisfy A.3.3. Equivalent evidence is accepted, including:

- SOC 2 Type II report
- Internal InfoSec policy mapped to NIST or CIS
- Evidence the policy is actively maintained and communicated to staff

### What if our AZ-120 holder is leaving?

Have a second person book the AZ-120 exam **immediately** or complete the **Run SAP on the Microsoft Cloud** learning path. Either satisfies the gate. Microsoft Learn renewal exams are free for AZ-120 holders within their validity window.

---

## Post-Specialization

### How long is the specialization valid?

Advanced Specializations are valid for **one year** and must be renewed annually. The renewal process includes a re-audit or a lighter evidence update depending on Microsoft's renewal policy at the time.

### Where does the badge appear?

On your **Microsoft AppSource partner profile**, in **Microsoft Partner Finder**, and downloadable from Partner Center for use on your website and marketing materials.

### What benefits unlock?

- **Co-sell priority** with Microsoft sellers on SAP-on-Azure deals
- **Marketing through Microsoft (MtM)** eligibility on SAP workloads
- **Partner-funded marketing** opportunities aimed at SAP buyers
- Access to **Microsoft-led go-to-market programmes** for SAP

{{% alert type="note" %}}
Benefits change periodically. Confirm current benefits with your PDM or the
[Microsoft Partner Network benefits page](https://partner.microsoft.com/en-us/partnership/partner-network/benefits).
{{% /alert %}}
