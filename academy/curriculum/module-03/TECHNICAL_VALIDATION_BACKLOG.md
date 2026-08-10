# Module 3 Technical Validation Backlog

## Files + Data Access

**Status:** required before release  
**Canonical branch:** `academy/module-3-files-data-access`  
**Target:** PUB400 IBM i 7.5 for ordinary labs plus an approved journaled non-production IBM i for transaction execution when PUB400 is unsuitable

This backlog separates source review from behavior proven on IBM i.

## Gate 1 — Prerequisite State

- [ ] Module 2 base objects validated or an equivalent clean base is documented.
- [ ] CATEGORY / PRODUCT / INVENTORY definitions match the Module 3 assumptions.
- [ ] Module 3 does not require altering Module 2 canonical objects.

## Gate 2 — Order DDL

Run `10_create_order_access.sql`.

- [ ] `ORDER_HEADER` created with system name `ORDHDR`.
- [ ] `ORDER_LINE` created with system name `ORDLINE`.
- [ ] record formats are `ORDHDR` and `ORDLINE` as requested.
- [ ] explicit system column names match design.
- [ ] primary/foreign/check constraints exist.
- [ ] PRODUCT foreign key points to Module 2 PRODUCT.
- [ ] system catalog verifies SQL name, system name, and column mapping.

## Gate 3 — Seed Data

- [ ] deterministic order seed inserts cleanly.
- [ ] documented row counts match actual.
- [ ] relationships and totals are internally consistent.
- [ ] reset restores the expected state.

## Gate 4 — Native External Description

For each `.rpgle` example:

- [ ] replace learner schema placeholder correctly.
- [ ] compile-time `EXTDESC` resolves the intended file.
- [ ] runtime `EXTFILE(*EXTDESC)` opens the intended file.
- [ ] compile action creates the intended program object.
- [ ] no library-list ambiguity remains undocumented.

## Gate 5 — Native Reads

- [ ] CHAIN found case verified.
- [ ] CHAIN not-found case verified with `%FOUND`.
- [ ] SETLL + READE loop begins at intended key.
- [ ] loop terminates using documented status behavior.
- [ ] `%EOF` interpretation matches current RPG behavior.
- [ ] result record values match seed data.

## Gate 6 — Native Changes and Locks

- [ ] disposable WRITE succeeds.
- [ ] duplicate/constraint failure is handled without weakening rules.
- [ ] UPDATE changes only intended disposable record.
- [ ] DELETE preview/target/cleanup proven.
- [ ] normal update-read record lock behavior observed safely where practical.
- [ ] any lock demonstration is time-bounded and does not disrupt shared users.

## Gate 7 — SQLRPGLE Single-Row

- [ ] source extension/action compiles through SQL precompiler/compiler.
- [ ] host variable mappings are correct.
- [ ] SELECT INTO returns expected product.
- [ ] no-row condition handled deliberately.
- [ ] more-than-one-row assumption is not hidden.

## Gate 8 — Cursor

- [ ] DECLARE/OPEN/FETCH/CLOSE sequence compiles.
- [ ] expected rows fetched in deterministic order.
- [ ] SQLCODE +100 / SQLSTATE no-data behavior is observed and documented.
- [ ] cursor closes on normal path.
- [ ] error path does not spin or continue with stale host variables.

## Gate 9 — Diagnostics

- [ ] SQLSTATE observed for success.
- [ ] SQLCODE observed for success/no data/error.
- [ ] controlled integrity failure captured.
- [ ] GET DIAGNOSTICS returns useful condition data on target release.
- [ ] ROW_COUNT after DML matches actual affected rows.
- [ ] learner material does not hard-code an unverified environment-specific message.

## Gate 10 — Transaction Environment

- [ ] journaled files confirmed.
- [ ] approved journal/receiver identified.
- [ ] commitment control start/end process confirmed.
- [ ] SQL compile/run commit setting confirmed.
- [ ] normal learner authority is sufficient, or alternate instructor environment is used.
- [ ] no course step requires authority escalation on PUB400.

## Gate 11 — Commit/Rollback

- [ ] successful unit commits header + lines together.
- [ ] controlled failure rolls back the entire unit.
- [ ] no partial order remains after rollback.
- [ ] commitment boundary/lock release evidence captured.
- [ ] transaction cleanup returns data to baseline.

## Gate 12 — Native vs SQL Decision Lesson

- [ ] examples accurately reflect both interfaces.
- [ ] no claim says one interface is always faster/modern/correct.
- [ ] set-oriented work is demonstrated with SQL.
- [ ] native keyed access is demonstrated without presenting it as obsolete.
- [ ] mixed-access caveats are explained.

## Gate 13 — Tooling

- [ ] Code for IBM i actions validated for RPGLE.
- [ ] SQLRPGLE compile action validated.
- [ ] deploy-first/local source behavior matches current extension.
- [ ] Problems/listing/diagnostic workflow matches learner instructions.
- [ ] current Db2 for IBM i extension behavior matches SQL setup instructions.

## Gate 14 — Bob

- [ ] Bob prompts contain no secrets or real data.
- [ ] Bob can explain access paths without inventing target resolution.
- [ ] learner records accepted/rejected findings.
- [ ] capstone independent section cannot be completed solely by copying Bob output.

## Gate 15 — Independent Reviewer

Reviewer other than the author must:

- [ ] follow setup from scratch
- [ ] create/reset order objects
- [ ] compile all required RPG/SQLRPGLE sources
- [ ] reproduce native/SQL results
- [ ] reproduce diagnostics
- [ ] complete the approved transaction path
- [ ] record defects/ambiguities

Reviewer: ____________________  Date: ____________________

## Gate 16 — Learner Pilot

- [ ] first-time learner completes setup without hidden steps
- [ ] learner can explain compile vs runtime target
- [ ] learner predicts keyed-read results
- [ ] learner handles SQL no-data without guessing
- [ ] learner stops on unknown transaction prerequisites
- [ ] learner can defend native-vs-SQL choice
- [ ] assessment wording is unambiguous

## Release Blockers

Block release for any unexplained compile failure, wrong runtime target, wrong row/record result, uncontrolled data change, unsafe lock behavior, transaction prerequisite mismatch, assessment/content mismatch, or hidden instructor dependency.

## Completion Record

Validated commit/tag: ____________________  
Technical reviewer: ____________________  
Instructional reviewer: ____________________  
Source reviewer: ____________________  
Release approver: ____________________  
Date: ____________________