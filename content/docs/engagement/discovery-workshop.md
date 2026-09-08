---
title: "Discovery Workshop"
description: "3-day discovery workshop kit for SAP on Azure engagements — agenda, pre-reads, whiteboard kits."
linkTitle: "Discovery Workshop"
weight: 30
---
{{% alert type="tip" title="Download the workfiles" %}}
PowerPoint deck (agenda + facilitation slides) and Excel workbook (sizing, RTO/RPO, decisions log) used during the workshop.
{{% /alert %}}

{{< button href="templates/engagement/discovery-workshop-deck.pptx" icon="document" variant="outline" >}}Download discovery-workshop-deck.pptx{{< /button >}}
{{< button href="templates/engagement/discovery-workshop-workbook.xlsx" icon="document" variant="outline" >}}Download discovery-workshop-workbook.xlsx{{< /button >}}

## When to use this

After the qualification questionnaire is returned. The workshop is the moment where we move from *what does the customer have* to *what will we build*.

## 3-day agenda

### Day 1 — Estate &amp; landscape

- Walk-through of the SAP estate inventory (from the qualification questionnaire)
- EarlyWatch Alert review (where available)
- Current pain points and triggers (HW lease end, S/4HANA conversion, performance, cost)
- Stakeholder map (business, IT, SAP Basis, security, network)

### Day 2 — Target architecture + network + identity

- Reference architecture selection (S/4HANA HA, scale-out HANA, BW/4HANA, RISE landing zone)
- Azure landing zone (subscriptions, mgmt groups, networking topology)
- ExpressRoute design (single / dual circuit, Global Reach for DR)
- Identity (Entra ID, Fiori SSO, PIM, conditional access)
- Naming and tagging standards

### Day 3 — Migration approach + cutover + DR

- Migration strategy (lift-and-shift, classical migration, DMO, BLU)
- Cutover plan outline + acceptable downtime
- HA topology (zonal HSR sync + Pacemaker + SBD; ASCS/ERS)
- DR topology (HSR async cross-region; ASR for app tier)
- BC / DR drill cadence
- Operations model (ACSS, Azure Monitor for SAP, Azure Backup for SAP HANA, Update Manager)

## Pre-reads to send the customer

- Latest **SAP on Azure reference architectures** (Microsoft Azure Architecture Center)
- Customer's most recent **EarlyWatch Alert** (EWA)
- Customer's **SAP Quick Sizer** output (if available)
- This documentation site's [Reference Architectures](/docs/engagement/reference-architectures) page

## Whiteboard kits

Bring printed or Miro/Lucidspark templates for:

- Landing zone (subscriptions, mgmt groups, peering)
- ExpressRoute topology (circuits, peering, Global Reach, regional design)
- HANA HA pair (zonal, HSR, Pacemaker, SBD, ALB floating IP)
- Multi-region DR (HSR async, ASR app tier, network connectivity)

## Workshop facilitation

1. Send the qualification questionnaire 2 weeks ahead.
2. Send pre-reads 1 week ahead — make sure the customer's Basis lead reads them.
3. Run the 3-day workshop, ideally on-site or in a single video room with whiteboard.
4. Capture decisions in the **discovery workshop workbook** (one tab per topic, decisions log on the front sheet).
5. Within 5 business days, produce an HLD v0.1 using the [HLD template](/docs/engagement/deliverables/hld-template) seeded from the decisions log.

## Output: discovery report + HLD v0.1

A short discovery summary (3–5 slides) + HLD v0.1 ready for technical review with the customer's architecture board.

## Reuse &amp; contribute back

{{% alert type="tip" %}}
Spotted a question that consistently surfaces hidden complexity? Add it to the deck and the
workbook and open a PR. The next consultant running discovery will thank you.
{{% /alert %}}
