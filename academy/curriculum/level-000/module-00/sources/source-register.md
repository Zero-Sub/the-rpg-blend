# Module 0 Source and Manual Register

**Canonical architecture review:** August 19, 2026  
**Scope:** IBM i Orientation / Coffee Company controlled-change workflow

Uploaded IBM, COMMON, and Academy materials are reference sources used to validate terminology, coverage, and technical claims. They are not Academy-owned course content unless explicitly identified as an Academy artifact. Examples, labs, explanations, and assessments in Module 0 are original Academy material.

## Primary technical sources

| Source | Provider | Release/date | Module 0 validation use | Status |
|---|---|---|---|---|
| ILE RPG Programmer's Guide, SC09-2507-12 | IBM | IBM i 7.6, 2025 edition | RPG program creation, IFS/source-file concepts, `CRTBNDRPG`, diagnostics, program objects | Primary current RPG manual supplied to Academy |
| ILE RPG Reference, SC09-2508-13 | IBM | IBM i 7.6, 2025 edition | RPG syntax and language semantics used by starter examples | Primary current RPG reference supplied to Academy |
| Introduction to IBM i | COMMON iBegin, Scott Klement | uploaded edition/date not stated in extracted cover | IBM i orientation, platform terminology, integrated-platform mental model | Supplemental training reference; do not copy session structure |
| Db2 for i | COMMON iBegin, Scott Forstie | uploaded edition | Db2 for i terminology and IBM i database orientation | Supplemental; deeper instruction belongs in Module 2 |
| Db2 for i — Tooling | COMMON iBegin, Scott Forstie | uploaded edition | ACS, VS Code database extension, SQL tool landscape | Supplemental; version-sensitive tool claims require current verification |
| Db2 for i — Programming | COMMON iBegin, Scott Forstie | uploaded edition | Modern development-tool recognition, VS Code/Code for IBM i context, database-access landscape | Supplemental; programming detail deferred |
| Introduction to the Integrated File System | IBM presentation, Margaret Fenlon | April 14, 2023 | IFS, stream files, directories, paths, file-system orientation | Primary IBM reference for conceptual coverage; revalidate release-sensitive details |
| Integrated File System Security Principles and Practices | IBM presentation, Margaret Fenlon | April 25, 2023 | IBM i/UNIX security semantics, authority awareness, least-privilege orientation | Primary IBM reference for security framing; deeper security deferred |
| iBegin Security Part 1 | COMMON iBegin, Margaret Fenlon | March 26, 2024 | Authorities, groups, authorization lists, object-security orientation | Supplemental |
| iBegin Security Part 2 | COMMON iBegin, Margaret Fenlon | April 2, 2024 | Security components, user profiles, object/resource security | Supplemental |
| Code for IBM i Quick Start Handbook v1.1 | The RPG Blend Academy | August 5, 2026 | Companion workflow for connection, navigation, editing, compile diagnostics, safety | Academy companion artifact; its product claims are version-sensitive |

## Supporting references

| Source | Provider | Module 0 use |
|---|---|---|
| The Power of SQL | COMMON SQL Bootcamp | Native/SQL terminology and Db2 for i orientation; SQL depth deferred to Module 2 |
| SELECT Statement Basics | COMMON SQL Bootcamp | Read-only SQL orientation; do not reuse bootcamp exercises |
| Integrated File System through SQL Services | IBM presentation | Recognition that SQL services can inspect IBM i/IFS state; detailed services deferred |
| Integrated File System: Real Life | IBM presentation | Tool/evidence selection and troubleshooting mindset |
| Real-Time Access to IFS Data Across the Network | IBM presentation | Security caution for shared IFS access; networking depth deferred |
| Strategies to Improve IFS Application Performance | IBM presentation | Recognition of performance evidence/tools; not a Module 0 tuning curriculum |

## Lesson validation map

| Canonical lesson | Sources used to validate terminology/coverage |
|---|---|
| 0.1 — Where Am I? | iBegin Introduction to IBM i; IFS Introduction; IBM i 7.6 RPG Programmer's Guide |
| 0.2 — Which Tool Do I Use? | iBegin Db2 for i Tooling; iBegin Db2 for i Programming; IFS Real Life; Code for IBM i Quick Start |
| 0.3 — Find the Coffee Company | IBM i 7.6 RPG Programmer's Guide; IBM i 7.6 RPG Reference; Code for IBM i Quick Start |
| 0.4 — First Controlled Change | IBM i 7.6 RPG Programmer's Guide; IBM i 7.6 RPG Reference; Code for IBM i Quick Start |
| 0.5 — Observe, Review, and Prove | Db2 for i Tooling; SELECT Statement Basics; Code for IBM i Quick Start; IFS Security references |
| 0.6 — Do It Without Me | Academy canonical curriculum requirements and pilot evidence; technical workflow validated by the same primary references above |

## Canonical technical decisions

- VS Code with Code for IBM i is the Academy development home base for Module 0.
- ACS remains an appropriate complementary tool for Run SQL Scripts, 5250, spooled files, data transfer, database tooling, and selected operational/performance workflows.
- Navigator for i is introduced for approved operational/admin observation, not as a primary coding environment.
- Learners recognize PDM, SEU, STRSQL, RDi, and other existing workflows without treating them as the Academy default.
- Coffee Company replaces HELLO-only exercises as the connected Academy application.
- The Module 0 starter program is `COFFEE00` and remains intentionally simple.
- The learner uses an assigned build library; the course does not hard-code a shared `RPGACADEMY` library as the learner contract.
- The source-member compile template uses `CRTBNDRPG` with `OPTION(*EVENTF)` and `DBGVIEW(*SOURCE)` when that is the configured classroom path. An IFS/local-source deployment path may use a different approved Code for IBM i action.
- A successful compile is evidence of build acceptance, not complete proof of requirement correctness, correct target, runtime behavior, approval, or production safety.
- AI-assisted engineering is the durable competency. IBM Bob may be used as the primary IBM i implementation example but is not the competency definition.

## Version-sensitive items requiring revalidation before delivery/publication

- Code for IBM i supported IBM i release, prerequisites, connection behavior, UI labels, Actions, and diagnostic workflow.
- Db2 for i VS Code extension prerequisites, connection architecture, UI, and feature coverage.
- ACS package/version, Run SQL Scripts behavior, and any security remediation requirements.
- Navigator for i and PDI navigation/labels used in screenshots or demonstrations.
- IBM Bob capabilities, command names, review workflow, data-handling guidance, and licensing/availability.
- Training-system compiler/PTF behavior and the exact Coffee Company source-transfer/build action.
- Organization-specific network, SSH, authentication, authority, and tool-installation requirements.

## Copyright and reuse boundary

- IBM, COMMON, vendor, community, and book materials remain third-party reference sources.
- Do not copy substantial passages, diagrams, exercises, slide sequences, or examples into Academy publications.
- Academy lessons, code, labs, troubleshooting cases, Coffee Company changes, assessments, and explain-back activities must remain original.
- Where a technical statement is release-sensitive, verify it against current primary documentation immediately before publication rather than silently extrapolating from an older presentation.
