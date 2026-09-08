---
title: "LLD Template"
description: "Low-Level Design template for SAP on Azure engagements."
linkTitle: "LLD Template"
weight: 20
---
{{% alert type="tip" title="Download the workfile" %}}
Word version of the LLD with cover, TOC, and SAP-specific sectioned tables.
{{% /alert %}}

{{< button href="templates/deliverables/lld-template.docx" icon="document" variant="outline" >}}Download lld-template.docx{{< /button >}}

## When to use this

Once HLD is signed. The LLD is what the build team and the customer's Basis team work from.

## Sections (mirrors the Word template)

1. **VM specifications per tier** — SAP-certified SKUs, vCPU, memory, NIC, accelerated networking.
2. **Disk layout** — managed disks per VM, IOPS / throughput per disk, host caching.
3. **ANF volumes** — `/hana/data`, `/hana/log`, `/hana/shared`, `/sapmnt`, `/usr/sap/trans`. QoS policy, snapshot policy.
4. **Network design** — VNet / subnet plan, NSGs, ASGs, UDRs, peering, ExpressRoute connection IDs.
5. **HSR configuration** — primary / secondary roles, replication mode, network ports, retention.
6. **Pacemaker / SBD** — config file, fencing strategy, watchdog, STONITH.
7. **ASCS / ERS cluster** — cluster name, virtual host, ALB rules, floating IP.
8. **Backup policies** — Azure Backup for SAP HANA vault, retention, log backup interval.
9. **Monitoring** — Azure Monitor for SAP solutions providers, alert rules, action groups.
10. **Patch management** — Azure Update Manager scopes, schedules, exclusion windows.
11. **IaC artefacts** — link to the **SAP on Azure deployment automation framework** repo + per-customer overlay.
12. **Operations runbook hand-off** — pointer to the runbook template.

## Reuse &amp; contribute back

{{% alert type="tip" %}}
When new HANA-certified VM SKUs or ANF features ship, add them to the SKU/QoS tables in the
template and open a PR.
{{% /alert %}}
