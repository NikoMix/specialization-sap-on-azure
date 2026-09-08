---
title: "Qualification Questionnaire"
description: "Customer qualification questionnaire covering SAP estate, HANA sizing inputs, RISE vs self-managed, and non-functionals."
linkTitle: "Qualification Questionnaire"
weight: 20
---
{{% alert type="tip" title="Download the workfile" %}}
Word version of the questionnaire — send to the customer before discovery.
{{% /alert %}}

{{< button href="templates/engagement/qualification-questionnaire.docx" icon="document" variant="outline" >}}Download qualification-questionnaire.docx{{< /button >}}

## When to use this

Before the discovery workshop. Send it 1–2 weeks ahead so the customer's SAP Basis and infra teams have time to gather inputs. Use the answers to shape the discovery agenda and pre-size the architecture.

## SAP estate inventory

For each SAP system in scope:

- Product (ECC, S/4HANA, BW/4HANA, SCM, GRC, PI/PO, SolMan, etc.)
- Version and SPS / FPS level
- Database (Oracle / DB2 / ASE / HANA) + version
- Unicode status
- Languages
- Modifications (Z-code volume, custom enhancements)
- Integrations (PI/PO, CPI, EDI, third-party gateways, printing, IDOC volume)

## HANA sizing inputs

- Existing memory footprint (GB)
- Growth percentage per year
- Peak concurrent online users
- Batch window (hours and timing)
- IOPS profile (data, log, backup)
- Replication topology (HSR sync / async, multi-tier, multi-target)
- Existing EarlyWatch Alert (EWA) attached?

## Delivery model

- Self-managed SAP on Azure
- RISE with SAP on Azure (partner-owned landing zone)
- Hybrid mix (some systems self-managed, some RISE)

The answer changes which Module A / Module B evidence and which engagement templates apply.

## Non-functional requirements

| Tier | RTO | RPO | Maintenance window | Notes |
|---|---|---|---|---|
| Production | | | | |
| QA | | | | |
| Dev / sandbox | | | | |

Regulatory constraints (GxP, GDPR, sovereignty, sector-specific) — list each and the affected system.

## Identity &amp; access

- Existing IdP (Entra ID, AD FS, third-party)
- Target Fiori SSO mechanism (SAML, OIDC, PrincipalPropagation)
- Basis admin population (count, location, time zones)
- PIM eligibility — which roles?

## Network &amp; connectivity

- Existing on-prem connectivity (ExpressRoute? Site-to-site VPN? None?)
- Target ExpressRoute SKU and circuit count
- Cross-region DR connectivity requirement (ExpressRoute Global Reach)
- Firewall ownership (customer central, partner-managed Azure Firewall, NVA)

## Output: discovery-ready brief

A 5–10 page filled questionnaire that becomes the discovery workshop pre-read.

## Reuse &amp; contribute back

{{% alert type="tip" %}}
Found a question that always reveals a blind spot in customer estates? Add it to the template and
open a PR — your colleagues will love you for it.
{{% /alert %}}
