# Module 3 Source Validation Register

**Module:** 3 — Files + Data Access  
**Review start:** 2026-08-10  
**Target executable environment:** IBM i 7.5 (PUB400 for normal labs)  
**Status:** source mapping established; execution validation pending

The Academy uses these materials to validate terminology, syntax, platform behavior, and coverage. Lesson prose, code, diagrams, labs, prompts, assessments, and sequence are original Academy work.

## Authority Order

1. IBM i 7.5 primary product documentation for behavior executed on the public learner target.
2. Current Code for IBM i / Db2 for IBM i project documentation for VS Code workflow.
3. IBM i 7.6 ILE RPG manuals as a current/forward language cross-check where the target behavior is also supported on 7.5.
4. COMMON/iBegin material for coverage and terminology validation.
5. Academy recommendations for safety, sequencing, evidence, and learner independence.

## Primary Sources

| ID | Source | Scope used | Sensitivity | Status |
|---|---|---|---|---|
| M3-IBM-01 | IBM i 7.5 ILE RPG — free-form file definitions / DCL-F | External files, USAGE, KEYED | Release/PTF | Reviewed |
| M3-IBM-02 | IBM i RPG EXTDESC / EXTFILE rules | Compile-time vs runtime file target | Medium | Reviewed |
| M3-IBM-03 | IBM i RPG CHAIN, SETLL, READE, %FOUND, %EOF | Native keyed reads and status | Low/medium | Reviewed |
| M3-IBM-04 | IBM i RPG WRITE, UPDATE, DELETE, locking | Native changes and record access | Environment-sensitive | Reviewed |
| M3-IBM-05 | Db2 for i embedded SQL — SELECT INTO and host variables | Single-row application SQL | Low/medium | Reviewed |
| M3-IBM-06 | Db2 for i cursor / FETCH | Multi-row embedded SQL | Low/medium | Reviewed |
| M3-IBM-07 | Db2 for i SQLSTATE / SQLCODE / SQLCA | Result and error status | Low/medium | Reviewed |
| M3-IBM-08 | Db2 for i GET DIAGNOSTICS | ROW_COUNT and condition evidence | Release-sensitive | Reviewed |
| M3-IBM-09 | IBM i commitment control | Transaction boundaries and locks | High/environment | Reviewed |
| M3-IBM-10 | IBM i CREATE TABLE | SQL/system names, system columns, keys | Release-sensitive | Reviewed |
| M3-TOOL-01 | Code for IBM i project documentation | RPGLE/SQLRPGLE local source, Actions, deployment | High | Recheck before delivery |
| M3-ENV-01 | PUB400 service documentation | Public learner host/release/SSH/private libraries | High | Recheck before pilot |

## Uploaded Supplemental Sources

| ID | Source | Provider | Coverage supported | Academy use |
|---|---|---|---|---|
| M3-SUP-01 | IBM i 7.6 ILE RPG Programmer's Guide (SC09-2507-12) | IBM | File processing, native I/O, commitment control, locking | Terminology/behavior cross-check; examples not copied |
| M3-SUP-02 | IBM i 7.6 ILE RPG Reference (SC09-2508-13) | IBM | DCL-F, file operations, BIFs, COMMIT/ROLBK syntax | Syntax cross-check; examples original |
| M3-SUP-03 | iBegin — Db2 for i Programming | Scott Forstie / COMMON | Native access and embedded SQL coexistence | Coverage validation only |
| M3-SUP-04 | Module 2 canonical Coffee Catalog | The RPG Blend Academy | Base data model and safe SQL behaviors | Direct prerequisite/canonical Academy source |
| M3-SUP-05 | Code for IBM i Quick Start Handbook v1.1 | The RPG Blend Academy | Connection, actions, diagnostics, evidence | Academy workflow baseline |

## Source-Supported Facts vs Academy Recommendations

Source-supported platform facts include:

- free-form RPG defines external files with `DCL-F`
- `EXTDESC` can identify the external description used at compile time, while `EXTFILE` controls runtime file resolution
- native RPG supports keyed file operations such as CHAIN/SETLL/READE and status BIFs such as `%FOUND`/`%EOF`
- embedded SQL uses host variables for application data and cursors for multi-row results
- RPG receives SQLCA automatically and can evaluate SQLSTATE/SQLCODE
- commitment control affects only changes made under commitment control and requires platform/environment preparation

Academy recommendations include:

- explicitly qualify training targets rather than relying on ambient library-list assumptions
- predict access/result behavior before execution
- use disposable rows for change labs
- do not request broad authority as a troubleshooting shortcut
- use SQLSTATE as the primary application-facing SQL condition signal while retaining SQLCODE/diagnostics for investigation
- require runtime evidence before calling a transaction workflow safe
- teach both native and SQL access and choose based on the problem rather than ideology

## Version / Conflict Flags

- Public-course executable behavior must remain IBM i 7.5 compatible unless the delivery target changes.
- The uploaded RPG manuals are 7.6 references and must not silently introduce 7.6-only requirements.
- Lock behavior depends on access mode, commitment definition, job/activation-group scope, and environment.
- SQL precompiler/compiler options and Code for IBM i Actions must be validated against delivery versions.
- PUB400 journaling/commitment-control authority is not assumed.
- Generated SQL system names are avoided in the Module 3 order tables by assigning explicit names; actual created attributes still require catalog verification.

## Copyright / Reuse

IBM and COMMON materials remain third-party references. Do not copy substantial prose, diagrams, samples, lab flows, or slide structures. Preserve correct IBM terminology and cite validation sources. Academy examples and scenario data remain original.