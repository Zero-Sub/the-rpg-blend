# RPGBA-101 Module 2 — Source Validation Register

**Status:** Development Draft  
**Rule:** Reference material validates facts, terminology, and behavior. Academy explanations, code, diagrams, labs, assessments, and course sequence remain original.

## Source Baseline

| ID | Source | Authority | Module 2 use | Release sensitivity | Academy treatment |
|---|---|---|---|---|---|
| SRC-001 | IBM i 7.6 ILE RPG Programmer's Guide, SC09-2507-12, 2025 | Authoritative IBM manual | Procedures, prototypes, program structure, scope, calls, compile behavior | IBM i release/PTF and compiler behavior | Validate behavior and terminology only; do not reuse manual examples or sequence |
| SRC-002 | IBM i 7.6 ILE RPG Reference, SC09-2508-13, 2025 | Authoritative IBM reference | `DCL-DS`, `QUALIFIED`, `DIM`, `TEMPLATE`, `LIKEDS`, `LIKE`, `POS`, `DCL-PR`, `DCL-PI`, `CONST`, `VALUE`, `OPTIONS`, built-ins used by examples | Syntax availability and post-release/PTF changes | Primary syntax/semantics validator; all Academy source remains original |
| SRC-015 | The RPG Blend Academy Code for IBM i Quick Start Handbook v1.1, Aug. 5, 2026 | Canonical Academy operational reference | VS Code connection, editing, compile actions, diagnostics, target verification, evidence, security | Highly version-sensitive tooling | Use as course workflow baseline after live environment revalidation |
| SRC-011 | Code for IBM i documentation | Primary project documentation | Current Actions behavior, variables, deployment, diagnostics, navigation | Highly version-sensitive | Recheck before pilot and publication |
| SRC-012 | IBM Bob documentation | Primary product documentation | Current Bob modes, review workflow, product behavior, prerequisites | Highly version-sensitive | Recheck before pilot and publication; Academy prompts and validation workflow remain original |

## Claims Requiring Current Verification Before Pilot

| Topic | Proposed source | Required evidence | Status |
|---|---|---|---|
| Qualified data structure syntax and semantics | Current IBM RPG Reference | Exact current topic + compile test | Open |
| Nested data structures | Current IBM RPG Reference | Exact current topic + compile test | Open |
| Data-structure arrays and `DIM` | Current IBM RPG Reference | Exact current topic + boundary tests | Open |
| `%ELEM` behavior used by lab source | Current IBM RPG Reference | Exact current topic + runtime test | Open |
| `TEMPLATE` and `LIKEDS` | Current IBM RPG Reference | Exact current topic + compile test | Open |
| `LIKE` definition behavior | Current IBM RPG Reference | Exact current topic + compile test | Open |
| `POS` behavior and valid contexts | Current IBM RPG Reference | Exact current topic + recognition example review | Open |
| Subroutine syntax retained for legacy recognition | Current IBM RPG Reference | Exact topic + original Academy example | Open |
| Procedure prototype and interface matching | Current IBM RPG Reference / Programmer's Guide | Exact topics + deliberate mismatch diagnostic | Open |
| `CONST` parameter semantics | Current IBM RPG Reference | Exact topic + compile test attempting modification | Open |
| `VALUE` parameter semantics | Current IBM RPG Reference | Exact topic + caller/callee behavior test | Open |
| `OPTIONS(*NOPASS)` obligations | Current IBM RPG Reference | Exact topic + `%PARMS` safe-access example if included | Open |
| `OPTIONS(*OMIT)` obligations | Current IBM RPG Reference | Exact topic; decide recognition-only versus exercise | Open |
| `OPTIONS(*VARSIZE)` obligations | Current IBM RPG Reference | Exact topic; likely recognition-only at this level | Open |
| Code for IBM i compile Action workflow | Current Code for IBM i docs + live install | Screen/action labels and resolved command | Open |
| IBM Bob review behavior | Current IBM Bob docs + live install | Product workflow and prompt/output capture | Open |

## Stable Source-Supported Concepts Already Identified

The current Academy source library supports the following as a starting point for development, subject to exact topic mapping before release:

- Data structures, arrays, templates, `LIKEDS`, `LIKE`, prototypes, procedure interfaces, and parameter keywords are covered by the IBM i 7.6 RPG reference.
- The Programmer's Guide supports procedure-oriented application design, local data, prototypes, procedure calls, return values, and build/diagnostic context.
- The Academy Code for IBM i handbook supplies the current operational pattern for safe VS Code editing, reviewed compile actions, diagnostics, target verification, and evidence capture.
- The current Academy source register explicitly requires translation of historical SEU/RDi/fixed-form examples into VS Code-first, fully free-form Academy workflows.

## Copyright and Originality Controls

- Do not copy IBM or COMMON diagrams.
- Do not copy IBM manual code examples into public Academy lesson source.
- Do not use third-party lesson order as the Module 2 instructional structure.
- Build original Customer Validation examples and business data.
- Create original architecture diagrams and trace tables.
- Keep quotations brief and necessary; prefer original explanation.
- Keep downloaded manuals outside public source control unless redistribution rights are explicitly clear.

## Source Review Completion Criteria

The register is complete when every material technical claim in the module maps to an applicable source/topic or is explicitly labeled as Academy guidance, all release-sensitive claims have a current verification date, conflicts are recorded rather than silently merged, and every code example has corresponding compile/runtime evidence.
