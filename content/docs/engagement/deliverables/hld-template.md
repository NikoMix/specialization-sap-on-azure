---
title: "HLD Template"
description: "High-Level Design template for SAP on Azure engagements."
linkTitle: "HLD Template"
weight: 10
---
{{% alert type="tip" title="Download the workfile" %}}
Word version of the HLD with cover, TOC, and sectioned headings. Italicised prompt prose under
each heading guides the author.
{{% /alert %}}

{{< button href="templates/deliverables/hld-template.docx" icon="document" variant="outline" >}}Download hld-template.docx{{< /button >}}

## When to use this

After discovery and WAF. The HLD is the technical contract with the customer's architecture board.

## Sections (mirrors the Word template)

1. **Executive summary** — outcome, scope, key decisions.
2. **Business context** — drivers, target dates, regulatory.
3. **Scope &amp; assumptions** — in / out, dependencies, RACI vs SAP and vs customer.
4. **Landing zone** — subscriptions, mgmt groups, tagging, policy.
5. **Network** — hub-spoke, ExpressRoute (single / dual circuit, Global Reach), firewall, DNS.
6. **Identity** — Entra ID, SAML / OIDC for Fiori SSO, PIM for Basis.
7. **SAP application landscape** — system list with role, target architecture per system.
8. **HANA topology** — VM SKU, ANF layout, HSR mode, cluster design.
9. **HA design** — zonal pair, ASCS / ERS, ALB floating IP, file-system HA.
10. **DR design** — secondary region, HSR async, ASR for app tier, drill cadence.
11. **Operations** — ACSS, Azure Monitor for SAP, Azure Backup for SAP HANA, Update Manager, alerting.
12. **Security** — Defender, encryption, secrets, network controls.
13. **Cost model** — Reserved Instances, dev/sandbox auto-shutdown, storage tiering.
14. **Risks &amp; mitigations**
15. **Sign-off**

## Reuse &amp; contribute back

{{% alert type="tip" %}}
If your engagement adds a section (e.g. SAP Copilot integration, AI extension on Azure OpenAI),
add it to the template and open a PR. Keep section ordering stable so reviewers know where to
look.
{{% /alert %}}
