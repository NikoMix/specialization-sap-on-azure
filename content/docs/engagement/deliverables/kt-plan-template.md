---
title: "KT Plan Template"
description: "Knowledge transfer plan template for SAP on Azure engagements."
linkTitle: "KT Plan Template"
weight: 40
---
{{% alert type="tip" title="Download the workfile" %}}
Word version of the KT plan with module breakdown and sign-off matrix.
{{% /alert %}}

{{< button href="templates/deliverables/kt-plan-template.docx" icon="document" variant="outline" >}}Download kt-plan-template.docx{{< /button >}}

## When to use this

Build phase. KT runs in parallel with build / cutover prep and concludes before hypercare exit.

## Sections (mirrors the Word template)

1. **KT objective** — operational independence for the customer's run team.
2. **Audience** — customer Basis, infra, monitoring, on-call.
3. **KT modules**
   - **SAP-side:** kernel patching, HSR ops, ASCS/ERS cluster, transport ops.
   - **Azure-side:** landing zone, networking, identity, ACSS, Azure Monitor for SAP, Azure Backup for SAP HANA, Update Manager.
   - **Joint:** runbook walkthrough, DR drill walkthrough, monitoring &amp; alerting walkthrough, on-call rota.
4. **Schedule** — module → date → trainer → attendees.
5. **Materials** — slides, recordings, hands-on labs.
6. **Sign-off matrix** — per module, attendee confirms understanding.
7. **Residual risks** — anything the customer is taking on with limited proficiency; mitigation plan.

## Reuse &amp; contribute back

{{% alert type="tip" %}}
Add new KT modules when you add new services (e.g. ACSS new feature, Azure Monitor for SAP new
provider) so customers stay current.
{{% /alert %}}
