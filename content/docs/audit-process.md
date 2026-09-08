---
title: "Audit Process"
description: "End-to-end walkthrough of the SAP on Microsoft Azure Advanced Specialization third-party remote audit."
weight: 30
---
## Overview

The Advanced Specialization audit is conducted by a **Microsoft-approved third-party audit firm**. It is performed remotely (video call + document review) and typically takes **2–4 weeks** from first contact to result, depending on evidence readiness.

{{% alert type="tip" %}}
Partners who prepare their evidence package in advance (using this toolkit) consistently report
faster audit cycles and fewer remediation rounds. Aim to have all evidence collected **before**
requesting the audit.
{{% /alert %}}

---

## Audit Phases

The flow below mirrors the order that auditors typically follow.

### 1. Pre-Qualification Confirmation

Before requesting the audit, confirm you meet all five [pre-qualification requirements](/docs/requirements).

**Actions:**
- Run the Quick Readiness Checklist on the Requirements page
- Confirm ACR figures with your PDM (Insights data can lag by 2–4 weeks)
- Ensure AZ-120 or the learning-path completion is current and evidenced

### 2. Audit Request via Partner Center

Navigate to **Partner Center → Benefits → Advanced Specializations** and request the audit for *SAP on Microsoft Azure*.

What happens next:
- Microsoft routes your request to the assigned audit firm
- You receive an introductory email within 5–10 business days
- A kickoff call is scheduled with your assigned auditor

### 3. Kickoff Call with Auditor

The kickoff call is typically 30–60 minutes. Expect the auditor to:

- Introduce the audit process and timeline
- Confirm which controls will be assessed (Module A + Module B)
- Agree on an evidence submission format (SharePoint, email, or their portal)
- Set a deadline for evidence submission

**Tip:** bring your project lead, SAP Basis lead, Azure infra architect, and compliance/quality lead to this call.

### 4. Evidence Collection &amp; Submission

Use the [Evidence Tracker](/docs/evidence-tracker) to manage collection across all controls. Below are the control-level pointers.

{{< tabs >}}
{{% tab title="Module A – General" %}}
| Control | Key Evidence |
|---|---|
| [1.1 Organisational Data](/docs/module-a/1-1-organizational-data) | Articles of incorporation, org chart |
| [1.2 Financial Documentation](/docs/module-a/1-2-financial-documentation) | Financial statements, professional indemnity insurance |
| [2.1 Service Delivery Methodology](/docs/module-a/2-1-service-delivery-methodology) | Delivery methodology, SOW, project artefacts |
| [2.2 Quality Management](/docs/module-a/2-2-quality-management) | QMS policy, CSAT process, escalation procedure |
| [3.1 Customer Satisfaction](/docs/module-a/3-1-customer-satisfaction) | CSAT/NPS data, references, testimonials |
| [3.2 Complaint Handling](/docs/module-a/3-2-complaint-handling) | Complaint register, resolved case, RCA |
| [3.3 Security &amp; Privacy](/docs/module-a/3-3-security-privacy) | InfoSec policy, GDPR statement, training records |
{{% /tab %}}

{{% tab title="Module B – SAP on Azure" %}}
| Control | Key Evidence |
|---|---|
| [1.1 SAP on Azure Implementation](/docs/module-b/1-1-sap-on-azure-implementation) | Case studies, HANA architectures, capability statement |
| [2.1 ACR Performance](/docs/module-b/2-1-acr-performance) | Partner Center ACR reports for SAP-eligible services |
| [2.2 Customer Diversity](/docs/module-b/2-2-customer-diversity) | Customer list with DPOR/PAL/CSP attribution |
| [3.1 Skilling](/docs/module-b/3-1-skilling) | AZ-120 transcripts or Run-SAP-on-MS-Cloud learning-path completions |
| [4.1 Audit Readiness](/docs/module-b/4-1-audit-readiness) | Evidence package, index, pre-audit review |
| [4.2 Partner Onboarding Assets](/docs/module-b/4-2-partner-onboarding) | SAP migration playbook, HLD/LLD/runbook/KT/hypercare templates |
{{% /tab %}}
{{< /tabs >}}

### 5. Auditor Review

The auditor reviews submitted evidence against the checklist and may request clarifications or additional documents. Typical review duration: **5–10 business days**.

- Respond to queries promptly (target &lt; 2 business days)
- Assign a single point of contact for auditor communication
- Keep evidence version-controlled (use dated filenames like `B2.1_ACR_v2.pdf`)

### 6. Audit Interview (if required)

Some auditors request a short video call to walk through evidence for specific controls. Prepare your SAP Basis lead and Azure infra architect to discuss:

- How you deliver SAP workloads on Azure (S/4HANA HA, multi-region DR, ACSS)
- Quality management and complaint handling processes
- Real customer engagement examples (anonymised as needed)

### 7. Remediation (if applicable)

If the auditor identifies gaps, they provide a **remediation report** listing specific controls and missing evidence.

{{% alert type="warning" %}}
You typically have **30 days** to address remediation findings. Treat this as a priority — delays
can result in needing to restart the audit cycle.
{{% /alert %}}

- Address each finding systematically using the Module A/B pages
- Resubmit only the affected controls unless instructed otherwise

### 8. Audit Pass &amp; Specialization Award

Once the auditor confirms a pass, Partner Center is updated within **10–15 business days**. The specialization badge appears on your profile.

Next steps after passing:
- Download the specialization badge from Partner Center
- Update marketing materials, your website, and Partner Finder profile
- Notify your PDM to unlock co-sell and marketing benefits

---

## Timeline Summary

| Phase | Typical Duration |
|---|---|
| Pre-qualification confirmation | 1–2 weeks |
| Audit request to auditor assignment | 5–10 business days |
| Evidence collection (prepared) | 1–2 weeks |
| Evidence collection (unprepared) | 4–8 weeks |
| Auditor review | 5–10 business days |
| Remediation (if needed) | Up to 30 days |
| Specialization badge publication | 10–15 business days |
| **Total (well-prepared partner)** | **~6–8 weeks** |

---

## Key Contacts

| Role | Responsibility |
|---|---|
| **Microsoft PDM** | Pre-qualification confirmation, ACR data queries |
| **Audit firm** | Evidence submission, audit scheduling |
| **Internal engagement lead** | Evidence collection coordination |
| **SAP Basis lead** | Module B technical evidence (SAP-side) |
| **Azure infra architect** | Module B technical evidence (Azure-side: M-series, ANF, AZs, ExpressRoute, ACSS) |
| **Compliance/Quality lead** | Module A quality and security evidence |
