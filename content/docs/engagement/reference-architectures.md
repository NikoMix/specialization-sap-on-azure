---
title: "Reference Architectures"
description: "Curated SAP on Azure reference architectures for the engagement playbook."
linkTitle: "Reference Architectures"
weight: 60
---
## When to use this

After discovery. Pick the architecture closest to the target shape; deviate intentionally and document the deviation in the HLD.

## Which published Microsoft architecture do I cite in audit evidence?

**[SAP S/4HANA in Linux on Azure](https://learn.microsoft.com/en-us/azure/architecture/guide/sap/sap-s4hana)** (Azure Architecture Center) is the single published architecture that covers the widest part of the Module B technology surface. Cite it as the baseline in your B.1.1 capability statement, then attach your own customer diagrams showing where you deviated.

The table below maps each technology named in the audit checklist to that architecture. Every row was verified against the published page.

| Audit checklist technology | Covered by the S/4HANA architecture | Also see |
|---|---|---|
| SAP-certified VMs (M / Mv2 / Mv3) | ✅ compute tier sizing | [HANA scale-up architecture](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/sap/run-sap-hana-for-linux-virtual-machines) |
| Azure NetApp Files | ✅ `/hana/data`, `/hana/log`, `/hana/shared` | [HANA on ANF operations guide](https://learn.microsoft.com/en-us/azure/sap/workloads/hana-vm-operations-netapp) |
| Premium SSD v2 / Ultra Disk | ✅ storage options per tier | — |
| Availability Zones | ✅ zonal HA deployment | [SAP workload configurations with Availability Zones](https://learn.microsoft.com/en-us/azure/sap/workloads/high-availability-zones) |
| HANA System Replication (HSR) | ✅ sync within region, async cross-region | [HANA availability across regions](https://learn.microsoft.com/en-us/azure/sap/workloads/sap-hana-availability-across-regions) |
| ASCS / ERS clustering | ✅ Pacemaker cluster + load balancer floating IP | [ASCS/ERS with HANA on RHEL](https://learn.microsoft.com/en-us/azure/sap/workloads/high-availability-guide-rhel-with-hana-ascs-ers-dialog-instance) |
| ExpressRoute (incl. Global Reach) | ✅ hub-spoke connectivity | [SAP on Azure landing zone accelerator](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/sap/enterprise-scale-landing-zone) |
| Azure Center for SAP solutions (ACSS) | ✅ management plane | [ACSS overview](https://learn.microsoft.com/en-us/azure/sap/center-sap-solutions/overview) |
| Azure Monitor for SAP solutions | ✅ monitoring | [AMS overview](https://learn.microsoft.com/en-us/azure/sap/monitor/about-azure-monitor-sap-solutions) |
| Azure Backup for SAP HANA | ✅ backup design | [Backup for SAP HANA](https://learn.microsoft.com/en-us/azure/backup/sap-hana-database-about) |
| Microsoft Entra ID / Fiori SSO | ✅ identity + SAML for Fiori | — |
| Azure Site Recovery (app tier DR) | ✅ DR section | [SAP DR overview guide](https://learn.microsoft.com/en-us/azure/sap/workloads/disaster-recovery-overview-guide) |
| Proximity placement groups | ✅ latency between HANA and app tier | — |

## Curated set

Each pattern below now names the published Microsoft architecture it derives from, so the HLD and the audit evidence can both cite a first-party source.

| # | Architecture | When to use | Key Azure services | Published Microsoft architecture |
|---|---|---|---|---|
| 1 | **S/4HANA single-instance HA (zonal)** | Most common S/4HANA production target | M-series / Mv3 + ANF + AZs + HSR sync + ASCS/ERS cluster | [SAP S/4HANA in Linux on Azure](https://learn.microsoft.com/en-us/azure/architecture/guide/sap/sap-s4hana) |
| 2 | **Scale-out HANA** | BW/4HANA workloads exceeding single-VM memory | Mv2/Mv3 scale-out + ANF + ExpressRoute | [Run SAP HANA scale-up on Linux VMs](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/sap/run-sap-hana-for-linux-virtual-machines) |
| 3 | **Multi-region DR** | Regulated industries, RTO &lt; 4 h cross-region | HSR async to secondary region + ASR for app tier | [BCDR for an SAP migration](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/sap/eslz-business-continuity-and-disaster-recovery) |
| 4 | **BW/4HANA on Azure** | Analytics / planning workloads | Scale-out HANA + Power BI / Fabric integration | [Run SAP BW/4HANA with Linux VMs](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/sap/run-sap-bw4hana-with-linux-virtual-machines) |
| 5 | **RISE with SAP — Azure landing zone interop** | Customer chose RISE; partner owns Azure side | Hub-spoke landing zone + peering to RISE tenant + Entra ID SSO + monitoring hand-off | [SAP on Azure landing zone accelerator](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/sap/enterprise-scale-landing-zone) |
| 6 | **SAP on Azure deployment automation framework** | Default IaC starting point for every engagement | Terraform + Ansible producing network + compute + storage + OS | [Deployment automation framework](https://learn.microsoft.com/en-us/azure/sap/automation/get-started) |
| 7 | **Whole-landscape design** | Multi-system estates (DEV/QAS/PRD + solution managers) | Landscape-wide network, identity, and operations design | [SAP whole landscape on Azure](https://learn.microsoft.com/en-us/azure/architecture/guide/sap/sap-whole-landscape) |

## Reference architecture 1 — S/4HANA single-instance HA (zonal)

- **Baseline:** [SAP S/4HANA in Linux on Azure](https://learn.microsoft.com/en-us/azure/architecture/guide/sap/sap-s4hana).
- **Compute:** M-series or Mv3 HANA-certified VMs as primary + secondary across two Availability Zones.
- **Storage:** Azure NetApp Files for `/hana/data`, `/hana/log`, `/hana/shared`. Sized from EWA + Quick Sizer.
- **HA:** HANA System Replication (HSR) sync mode. Pacemaker + SBD on both nodes. ASCS / ERS cluster in a separate VM pair across AZs with Azure Load Balancer + floating IP.
- **Network:** Hub-spoke topology. ExpressRoute (dual-circuit recommended) for on-prem. Accelerated networking + proximity placement group for HANA + app tier.
- **Identity:** Entra ID for Fiori SSO (SAML). PIM for Basis admin elevation.
- **Operations:** ACSS onboarded. Azure Monitor for SAP solutions. Azure Backup for SAP HANA. Azure Update Manager for OS + SAP kernel.

## Reference architecture 2 — Scale-out HANA (BW/4HANA)

- **Baseline:** [Run SAP HANA for Linux VMs in a scale-up architecture](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/sap/run-sap-hana-for-linux-virtual-machines), extended to scale-out.
- **Compute:** Mv2 or Mv3 scale-out worker nodes + standby.
- **Storage:** Azure NetApp Files with HANA scale-out volumes.
- **Network:** ExpressRoute + low-latency intra-region routing.
- **Operations:** identical to architecture 1.

## Reference architecture 3 — Multi-region DR

- **Baseline:** [Disaster recovery overview for SAP workloads](https://learn.microsoft.com/en-us/azure/sap/workloads/disaster-recovery-overview-guide) and [BCDR for an SAP migration](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/sap/eslz-business-continuity-and-disaster-recovery).
- **Primary region:** as architecture 1.
- **Secondary region:** HANA secondary in async mode, app tier protected by Azure Site Recovery.
- **Network:** ExpressRoute Global Reach between primary and secondary regions.
- **Drills:** documented cadence (typically twice yearly), evidence captured in the runbook.

## Reference architecture 4 — BW/4HANA

- **Baseline:** [Run SAP BW/4HANA with Linux virtual machines on Azure](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/sap/run-sap-bw4hana-with-linux-virtual-machines).
- **Compute:** scale-out HANA worker nodes sized from the BW sizing report.
- **Downstream:** Power BI / Microsoft Fabric integration for reporting off the BW layer.

## Reference architecture 5 — RISE landing zone

- **Baseline:** [SAP on Azure landing zone accelerator](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/sap/enterprise-scale-landing-zone).
- **Scope partner-owned:** Azure landing zone, network, identity integration, monitoring hand-off, RACI vs SAP ECS.
- **Scope SAP-owned:** the SAP application + database layer.
- **Key boundaries:** peering between partner landing zone and SAP ECS tenant; SAML federation from customer IdP into SAP via Entra ID; log forwarding from SAP-managed components into the customer's Azure Monitor / Sentinel.

## External references

All links verified against Microsoft Learn.

- [SAP S/4HANA in Linux on Azure](https://learn.microsoft.com/en-us/azure/architecture/guide/sap/sap-s4hana) — the primary architecture to cite in Module B evidence
- [Run SAP HANA for Linux VMs in a scale-up architecture](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/sap/run-sap-hana-for-linux-virtual-machines)
- [Run SAP BW/4HANA with Linux virtual machines](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/sap/run-sap-bw4hana-with-linux-virtual-machines)
- [SAP whole landscape on Azure](https://learn.microsoft.com/en-us/azure/architecture/guide/sap/sap-whole-landscape)
- [SAP on Azure landing zone accelerator](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/sap/enterprise-scale-landing-zone)
- [SAP workload configurations with Azure Availability Zones](https://learn.microsoft.com/en-us/azure/sap/workloads/high-availability-zones)
- [Disaster recovery overview for SAP workloads](https://learn.microsoft.com/en-us/azure/sap/workloads/disaster-recovery-overview-guide)
- [SAP on Azure deployment automation framework](https://learn.microsoft.com/en-us/azure/sap/automation/get-started)
- [Azure Center for SAP solutions](https://learn.microsoft.com/en-us/azure/sap/center-sap-solutions/overview)
- [Azure Monitor for SAP solutions](https://learn.microsoft.com/en-us/azure/sap/monitor/about-azure-monitor-sap-solutions)
- [Azure Backup for SAP HANA databases](https://learn.microsoft.com/en-us/azure/backup/sap-hana-database-about)

{{% alert type="tip" %}}
Always start the LLD from the **SAP on Azure deployment automation framework**. It encodes
Microsoft + SAP joint best practice for naming, networking, OS prep, and HANA install — your
bespoke work goes on top.
{{% /alert %}}

## Reuse &amp; contribute back

{{% alert type="tip" %}}
Add a new architecture pattern by creating a new section above and (where possible) a matching
draw.io / Visio source under `static/templates/engagement/architectures/`. Open a PR with the
`reference-architecture` label.
{{% /alert %}}
