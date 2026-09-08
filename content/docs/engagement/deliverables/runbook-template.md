---
title: "Runbook Template"
description: "Operations runbook template for SAP on Azure — start/stop, patching, backup, DR."
linkTitle: "Runbook Template"
weight: 30
---
{{% alert type="tip" title="Download the workfile" %}}
Word version of the runbook with cover, TOC, and SAP-specific procedure sections.
{{% /alert %}}

{{< button href="templates/deliverables/runbook-template.docx" icon="document" variant="outline" >}}Download runbook-template.docx{{< /button >}}

## When to use this

During build. Runbook is delivered alongside go-live and signed off at hypercare exit.

## Sections (mirrors the Word template)

1. **System inventory** — every SAP system, role, owner, on-call rota.
2. **Start / stop order** — database, then ASCS, then app servers; reverse for shutdown. Documented per system.
3. **Patching** — OS (Azure Update Manager schedules), HANA revision, SAP kernel, cluster software, ANF.
4. **Backup verification** — Azure Backup for SAP HANA restore drill cadence (recommended monthly to staging).
5. **DR failover &amp; failback** — step-by-step for HSR async secondary becoming primary; for app tier via ASR.
6. **BC drill cadence** — schedule, scope, success criteria, sign-off process.
7. **Monitoring &amp; alerting** — Azure Monitor for SAP alert routes, on-call rotations.
8. **Common operational tasks** — adding a work process, expanding ANF volume, adding a transport.
9. **Escalation matrix** — internal + Microsoft (PDM, FastTrack) + SAP (CSM, MaxAttention).
10. **Change-control process** — change request template, CAB cadence.

## Reuse &amp; contribute back

{{% alert type="tip" %}}
Field-tested procedures (e.g. a tricky kernel patch sequence on Mv3) belong in this template.
Open a PR with the `lesson-learned` label too so it's findable in the Issues backlog.
{{% /alert %}}
