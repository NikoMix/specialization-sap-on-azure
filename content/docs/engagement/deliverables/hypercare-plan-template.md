---
title: "Hypercare Plan Template"
description: "Hypercare plan template for SAP on Azure engagements — staffing, SLAs, exit criteria."
linkTitle: "Hypercare Plan Template"
weight: 50
---
{{% alert type="tip" title="Download the workfile" %}}
Word version of the hypercare plan covering cutover-week staffing, defect triage SLAs,
performance baselining, and exit criteria.
{{% /alert %}}

{{< button href="templates/deliverables/hypercare-plan-template.docx" icon="document" variant="outline" >}}Download hypercare-plan-template.docx{{< /button >}}

## When to use this

Cutover week through hypercare exit (typically 2–6 weeks post-go-live, depending on system criticality).

## Sections (mirrors the Word template)

1. **Cutover-week staffing** — 24×7 coverage, named individuals, escalation chain, comms cadence.
2. **Defect triage** — severity matrix, SLAs (P1 acknowledge / resolve), war-room cadence.
3. **Performance baselining** — capture EWA + Azure Monitor for SAP metrics weekly; trend against pre-go-live baseline.
4. **Operations transition** — runbook walk-throughs with customer on-call, joint shadowing.
5. **Exit criteria**
   - X consecutive clean EarlyWatch Alerts (customer-defined, typically 4 weeks).
   - Zero open P1 defects.
   - DR drill executed and signed off.
   - KT signed off across all modules.
   - Customer's run team operating independently for at least 1 week.
6. **Sign-off** — see [Definition of Done](/docs/engagement/definition-of-done).

## Reuse &amp; contribute back

{{% alert type="tip" %}}
Hypercare patterns differ by customer criticality (24×7 banking vs business-hours manufacturing).
Add variants to the template so the next engagement can fork the closest match.
{{% /alert %}}
