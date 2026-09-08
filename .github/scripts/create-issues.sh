#!/usr/bin/env bash
# create-issues.sh
# Creates all audit engagement issues for the SAP on Microsoft Azure
# Advanced Specialization. Skips any issue whose title already exists (open or closed)
# to avoid duplicates across re-runs.
#
# Environment variables expected:
#   GH_TOKEN     - GitHub token with issues:write permission
#   CYCLE_LABEL  - e.g. "audit-2026"
#   MILESTONE    - milestone title (e.g. "Audit 2026") — passed by title for safety
#   REPO         - owner/repo

set -euo pipefail

# ─── helpers ──────────────────────────────────────────────────────────────────

create_issue() {
  local title="$1"
  local labels="$2"
  local body="$3"

  local existing
  existing=$(gh issue list \
    --repo "$REPO" \
    --state all \
    --label "$CYCLE_LABEL" \
    --limit 200 \
    --json title \
    --jq "[.[] | select(.title == \"$title\")] | length")

  if [ "${existing:-0}" -gt 0 ]; then
    echo "⏭  Skipping (exists): $title"
    return
  fi

  gh issue create \
    --repo "$REPO" \
    --title "$title" \
    --label "$labels" \
    --milestone "$MILESTONE" \
    --body "$body"

  echo "✅ Created: $title"
}

# ─── Pre-Qualification Gate ───────────────────────────────────────────────────

create_issue \
  "🎯 Pre-Qualification Gate" \
  "pre-qualification,$CYCLE_LABEL" \
  "## Pre-Qualification Gate

Confirm all pre-qualification requirements are met **before** requesting the audit from Partner Center.
Once every checkbox is ticked, close this issue and proceed to request the audit.

📖 See the **Pre-Qualification Requirements** page on the docs site for full guidance.

---

### 1 – Solutions Partner Designation

- [ ] Active **Solutions Partner for Infrastructure (Azure)** confirmed in Partner Center
- [ ] Screenshot of active designation exported from Partner Center → Overview → Membership

---

### 2 – Azure Consumed Revenue (≥ USD 7,500 / 3 months across SAP-eligible services)

- [ ] ACR confirmed ≥ USD 7,500 in Partner Center → Insights → Azure Revenue (trailing 3 months)
- [ ] ACR figure verified with PDM (data may lag 2–4 weeks)
- [ ] Partner Center ACR export saved for evidence

---

### 3 – Customer Diversity (≥ 3 unique customers)

- [ ] At least 3 unique customers contributing ACR via DPOR / PAL / CSP
- [ ] Customer list exported from Partner Center
- [ ] PAL set up for every SAP customer subscription where possible

---

### 4 – Skilling

- [ ] **At least one** individual holds **AZ-120** — Azure for SAP Workloads Specialty, **OR**
- [ ] At least one individual has completed the **\"Run SAP on the Microsoft Cloud\"** learning path on Microsoft Learn
- [ ] Microsoft Learn transcript exported as PDF for the AZ-120 holder(s) and/or learning-path completer(s)

---

### 5 – Audit Request

- [ ] Audit requested via Partner Center → Benefits → Advanced Specializations
- [ ] Auditor assigned and kickoff scheduled
- [ ] Evidence package linked to this milestone"

# ─── Module A – General Requirements ──────────────────────────────────────────

create_issue \
  "A.1.1 – Organisational Data" \
  "module-a,$CYCLE_LABEL" \
  "## Module A.1.1 – Organisational Data

Evidence required for legal identity and organisational structure.

- [ ] Certificate of incorporation (or equivalent registry extract)
- [ ] Company registration number visible in a document
- [ ] Organisational chart showing reporting lines and key roles
- [ ] List of key personnel with names, titles, responsibilities
- [ ] Registered address matching official records

📖 See \`docs/module-a/1-1-organizational-data\`."

create_issue \
  "A.1.2 – Financial Documentation" \
  "module-a,$CYCLE_LABEL" \
  "## Module A.1.2 – Financial Documentation

Evidence required for financial stability and professional indemnity cover.

- [ ] Most recent set of financial statements (audited where available)
- [ ] Professional indemnity insurance certificate (active, with cover amount visible)
- [ ] Public liability insurance certificate if applicable
- [ ] Statement of financial health signed by CFO or equivalent

📖 See \`docs/module-a/1-2-financial-documentation\`."

create_issue \
  "A.2.1 – Service Delivery Methodology" \
  "module-a,$CYCLE_LABEL" \
  "## Module A.2.1 – Service Delivery Methodology

Evidence required for repeatable delivery process.

- [ ] Documented delivery methodology (lifecycle, phases, gates)
- [ ] SOW or engagement contract template
- [ ] Sample project plan / WBS from a real engagement (anonymised)
- [ ] Sample status report / steering pack
- [ ] RACI for a typical engagement

📖 See \`docs/module-a/2-1-service-delivery-methodology\`."

create_issue \
  "A.2.2 – Quality Management" \
  "module-a,$CYCLE_LABEL" \
  "## Module A.2.2 – Quality Management

Evidence required for QMS, CSAT, and escalation.

- [ ] Quality Management System policy
- [ ] CSAT / NPS survey process and most recent run
- [ ] Escalation procedure document
- [ ] Evidence of management review of quality data
- [ ] ISO 9001 certificate (if held — optional)

📖 See \`docs/module-a/2-2-quality-management\`."

create_issue \
  "A.3.1 – Customer Satisfaction" \
  "module-a,$CYCLE_LABEL" \
  "## Module A.3.1 – Customer Satisfaction

Evidence required for measurable customer outcomes.

- [ ] CSAT or NPS results across at least 3 customers
- [ ] At least 2 reference customer testimonials or signed letters
- [ ] Methodology for collecting and reviewing CSAT
- [ ] Trend over at least 12 months

📖 See \`docs/module-a/3-1-customer-satisfaction\`."

create_issue \
  "A.3.2 – Complaint Handling" \
  "module-a,$CYCLE_LABEL" \
  "## Module A.3.2 – Complaint Handling

Evidence required for a working complaint-handling process.

- [ ] Documented complaint-handling process
- [ ] Complaint register (may be empty if signed declaration is attached)
- [ ] At least one resolved complaint with root cause analysis (anonymised)
- [ ] Evidence of corrective actions taken

📖 See \`docs/module-a/3-2-complaint-handling\`."

create_issue \
  "A.3.3 – Security & Privacy" \
  "module-a,$CYCLE_LABEL" \
  "## Module A.3.3 – Security & Privacy

Evidence required for InfoSec and data protection posture.

- [ ] Information Security policy (ISO 27001 / SOC 2 / NIST mapped)
- [ ] Data protection / GDPR statement
- [ ] Breach response procedure
- [ ] Staff security training records (most recent 12 months)
- [ ] ISO 27001 certificate / SOC 2 report (if held)

📖 See \`docs/module-a/3-3-security-privacy\`."

# ─── Module B – SAP on Azure Specific ─────────────────────────────────────────

create_issue \
  "B.1.1 – SAP on Azure Implementation Capability" \
  "module-b,$CYCLE_LABEL" \
  "## Module B.1.1 – SAP on Azure Implementation Capability

Evidence required for proven SAP-on-Azure delivery.

- [ ] At least 2 case studies describing SAP workload delivery on Azure
- [ ] Architecture diagrams from delivered SAP-on-Azure solutions (M-series / Mv2 / Mv3, ANF, AZs)
- [ ] Capability statement listing the SAP workloads + Azure services your team has delivered
- [ ] Sample anonymised deliverables — HLD, LLD, runbook, KT plan
- [ ] Mapping of SAP service + Azure service per customer

### SAP-on-Azure technology surface to evidence

Every item below is named in the audit checklist. Tick each one you can show in a delivered
customer solution; anything left unticked is a gap to close before the audit.

- [ ] Compute — SAP-certified M-series / Mv2-series / Mv3-series VMs
- [ ] Storage — Azure NetApp Files for \`/hana/data\`, \`/hana/log\`, \`/hana/shared\`
- [ ] Storage — Premium SSD v2 and/or Ultra Disk
- [ ] Resilience — Availability Zones
- [ ] Resilience — HANA System Replication (HSR), sync in-region
- [ ] Resilience — ASCS / ERS Pacemaker cluster with Azure Load Balancer floating IP
- [ ] Resilience — Azure Site Recovery for the application tier
- [ ] Network — ExpressRoute (and Global Reach where cross-region DR is in scope)
- [ ] Network — proximity placement group between HANA and the app tier
- [ ] Identity — Microsoft Entra ID, SAML for Fiori SSO, PIM for Basis elevation
- [ ] Management — Azure Center for SAP solutions (ACSS)
- [ ] Management — Azure Monitor for SAP solutions
- [ ] Management — Azure Backup for SAP HANA
- [ ] Automation — SAP on Azure deployment automation framework (Terraform + Ansible)

📖 See \`docs/module-b/1-1-sap-on-azure-implementation\`."

create_issue \
  "B.1.2 – Reference Architecture Alignment" \
  "module-b,$CYCLE_LABEL" \
  "## Module B.1.2 – Reference Architecture Alignment

Show that your delivered solutions trace back to a **published Microsoft reference architecture**,
and that any deviation was deliberate and documented. Auditors consistently rate evidence higher
when it cites a first-party architecture rather than a bespoke diagram alone.

The primary architecture to cite is
[SAP S/4HANA in Linux on Azure](https://learn.microsoft.com/en-us/azure/architecture/guide/sap/sap-s4hana),
which covers the widest part of the Module B technology surface (M-series compute, Azure NetApp
Files, Premium SSD v2 / Ultra Disk, Availability Zones, HSR, ASCS/ERS clustering, ExpressRoute,
ACSS, Azure Monitor for SAP, Azure Backup, Entra ID / Fiori SSO, Azure Site Recovery, and
proximity placement groups).

- [ ] Each customer architecture diagram names the published Microsoft architecture it derives from
- [ ] Deviations from the reference architecture are listed with the reason, in the HLD
- [ ] Coverage matrix completed: audit-checklist technology → where it appears in your design
- [ ] At least one engagement started from the **SAP on Azure deployment automation framework**

### Published architectures to map against

- [ ] [SAP S/4HANA in Linux on Azure](https://learn.microsoft.com/en-us/azure/architecture/guide/sap/sap-s4hana)
- [ ] [Run SAP HANA for Linux VMs in a scale-up architecture](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/sap/run-sap-hana-for-linux-virtual-machines)
- [ ] [Run SAP BW/4HANA with Linux virtual machines](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/sap/run-sap-bw4hana-with-linux-virtual-machines)
- [ ] [SAP whole landscape on Azure](https://learn.microsoft.com/en-us/azure/architecture/guide/sap/sap-whole-landscape)
- [ ] [SAP on Azure landing zone accelerator](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/sap/enterprise-scale-landing-zone) (RISE interop)
- [ ] [Disaster recovery overview for SAP workloads](https://learn.microsoft.com/en-us/azure/sap/workloads/disaster-recovery-overview-guide)

📖 See \`docs/engagement/reference-architectures\` for the full coverage matrix."

create_issue \
  "B.2.1 – ACR Performance (SAP-eligible Azure services)" \
  "module-b,$CYCLE_LABEL" \
  "## Module B.2.1 – ACR Performance

ACR must be ≥ USD 7,500 across SAP-on-Azure-eligible Azure services over the trailing 3 months.

- [ ] Partner Center → Insights → Azure Revenue export (last 3 months)
- [ ] Filter / annotate to show only SAP-on-Azure-eligible service spend
- [ ] PDM-confirmed reconciliation if any subscription category is borderline
- [ ] Trend chart showing ≥ 3 months above threshold

📖 See \`docs/module-b/2-1-acr-performance\`."

create_issue \
  "B.2.2 – Customer Diversity (≥ 3 SAP customers via DPOR/PAL/CSP)" \
  "module-b,$CYCLE_LABEL" \
  "## Module B.2.2 – Customer Diversity

- [ ] At least 3 unique customers running SAP workloads on Azure, with attribution
- [ ] PAL / DPOR / CSP association evidence per customer
- [ ] Customer list cross-referenced against the case studies for B.1.1

📖 See \`docs/module-b/2-2-customer-diversity\`."

create_issue \
  "B.3.1 – Skilling (AZ-120 or Run-SAP-on-MS-Cloud learning path)" \
  "module-b,$CYCLE_LABEL" \
  "## Module B.3.1 – Skilling

At least one individual holds AZ-120 **OR** has completed the Run-SAP-on-Microsoft-Cloud learning path.

- [ ] AZ-120 holder transcript (Microsoft Learn) — at least 1, **OR**
- [ ] Learning-path completion certificate — at least 1
- [ ] Skilling mapping table (Name → AZ-120 or learning path → completion date)
- [ ] All skilling validated in Partner Center if available

📖 See \`docs/module-b/3-1-skilling\`."

create_issue \
  "B.4.1 – Audit Readiness" \
  "module-b,$CYCLE_LABEL" \
  "## Module B.4.1 – Audit Readiness

- [ ] Evidence index spreadsheet (one row per control)
- [ ] Internal pre-audit review completed and signed off
- [ ] Single point-of-contact appointed for auditor communication
- [ ] Folder structure follows \`Module A / Module B / control ref /\`

📖 See \`docs/module-b/4-1-audit-readiness\`."

create_issue \
  "B.4.2 – Partner Onboarding Assets (SAP playbook + deliverables)" \
  "module-b,$CYCLE_LABEL" \
  "## Module B.4.2 – Partner Onboarding Assets

Demonstrate a repeatable SAP-on-Azure customer onboarding pack.

- [ ] SAP migration / build playbook
- [ ] HLD template
- [ ] LLD template
- [ ] Runbook template (start/stop, patching, backup, DR)
- [ ] KT plan template
- [ ] Hypercare plan template
- [ ] Evidence the pack has been applied to ≥ 1 customer

📖 See \`docs/module-b/4-2-partner-onboarding\`."

echo "✅ All issues created for cycle ${CYCLE_LABEL}."
