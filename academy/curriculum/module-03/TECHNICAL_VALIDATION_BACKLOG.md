# Module 3 Technical Validation Backlog

## Files + Data Access

**Status:** content complete; source/static + runtime validation required before release  
**Target:** PUB400 IBM i 7.5 for ordinary labs plus an approved journaled non-production IBM i for transaction execution when PUB400 is unsuitable

## Gate 1 — Prerequisite State

- [ ] Module 2 base objects validated or equivalent clean base documented.
- [ ] CATEGORY / PRODUCT / INVENTORY match Module 3 assumptions.
- [ ] Module 3 does not alter Module 2 canonical objects.

## Gate 2 — Order DDL

- [ ] `ORDER_HEADER` created with system name `ORDHDR` and record format `OHDRR`.
- [ ] `ORDER_LINES` created with system name `ORDLINE` and record format `OLINER`.
- [ ] explicit system column names match DDL.
- [ ] PK/FK/CHECK constraints verified.
- [ ] ORDER_LINES PRODUCT foreign key points to Module 2 PRODUCT.
- [ ] catalog/external-description evidence captured.

## Gate 3 — Seed

- [ ] header count = 3.
- [ ] line count = 4.
- [ ] 5001/5002/5003 line counts = 1/1/2.
- [ ] header totals reconcile to line totals.

## Gate 4 — Native External Description

For each RPGLE example:

- [ ] schema placeholder replaced correctly.
- [ ] EXTDESC resolves intended file at compile time.
- [ ] EXTFILE(*EXTDESC) opens intended runtime file.
- [ ] compile action creates intended program object.
- [ ] external fields/formats match the program source.

## Gate 5 — Native Reads

- [ ] CHAIN found case.
- [ ] CHAIN missing case and `%FOUND(ORDHDR)` behavior.
- [ ] SETLL + READE partial-key scan.
- [ ] 5001 count = 1; 5003 count = 2; missing count = 0.
- [ ] `%EOF(ORDLINE)` termination verified.

## Gate 6 — Native Changes / Locks

- [ ] disposable 5901 initially absent.
- [ ] WRITE creates one header.
- [ ] UPDATE changes only intended header.
- [ ] DELETE removes it after dependency proof.
- [ ] final absence proven.
- [ ] any lock observation is coordinated/time-bounded.
- [ ] ordinary record-lock behavior is not confused with commitment-control locks.

## Gate 7 — SELECT INTO

- [ ] SQLRPGLE action/precompiler path works.
- [ ] PRODUCT_ID 1001 maps expected values.
- [ ] missing key produces deliberate no-data path.
- [ ] one-row assumption tied to PK uniqueness.

## Gate 8 — Cursor

- [ ] DECLARE/OPEN/FETCH/CLOSE compiles.
- [ ] low-inventory IDs/results match validated Module 2 base.
- [ ] final +100/no-data behavior observed.
- [ ] negative errors are not treated as EOF.
- [ ] no stale host variables processed.

## Gate 9 — Diagnostics

- [ ] disposable diagnostic key/name preflight prevents collision.
- [ ] check-constraint failure captured.
- [ ] actual SQLSTATE and SQLCODE recorded.
- [ ] GET DIAGNOSTICS RETURNED_SQLSTATE/message behaves as documented.
- [ ] ROW_COUNT behavior captured on a successful DML statement.

## Gate 10 — Transaction Environment

- [ ] files journaled appropriately.
- [ ] journal/receiver identified.
- [ ] commitment-control start/end method confirmed.
- [ ] SQL compile/run commit setting confirmed.
- [ ] normal approved authority is sufficient or alternate instructor system selected.

## Gate 11 — Commit/Rollback

- [ ] clean disposable 5950 start.
- [ ] positive header + line commit together.
- [ ] positive data cleaned before failure run.
- [ ] invalid product line creates controlled failure.
- [ ] rollback removes partial header.
- [ ] commitment boundary/lock release evidence captured.

## Gate 12 — Engineering Choice

- [ ] no universal native-vs-SQL claim.
- [ ] set-oriented SQL example accurate.
- [ ] keyed native example accurate.
- [ ] mixed-access transaction/lock caveats explained.

## Gate 13 — Tooling

- [ ] local RPGLE Action validated.
- [ ] SQLRPGLE no-commit Action validated.
- [ ] transaction SQLRPGLE Action/commit option validated.
- [ ] `&RELATIVEPATH`, `&NAME`, `&CURLIB`, deploy-first behavior verified with delivery version.
- [ ] compile diagnostics appear as instructed.

## Gate 14 — Bob / Safety

- [ ] prompts contain no sensitive data.
- [ ] learner records finding dispositions.
- [ ] Bob does not invent runtime target/journal/lock evidence.
- [ ] capstone remains independently defensible.

## Gate 15 — Independent Reviewer

- [ ] setup from scratch
- [ ] create/seed/reset
- [ ] compile all RPGLE/SQLRPGLE
- [ ] reproduce native/SQL results
- [ ] reproduce diagnostics
- [ ] complete approved transaction matrix
- [ ] record defects

Reviewer: ____________________  Date: ____________________

## Gate 16 — Learner Pilot

- [ ] no hidden setup
- [ ] compile/runtime target explained
- [ ] native read termination understood
- [ ] SQL no-data/error distinguished
- [ ] transaction stop decision demonstrated
- [ ] engineering choice defended
- [ ] assessment unambiguous

## Release Blockers

Any unexplained compile failure, wrong runtime target, wrong data result, uncontrolled change, unsafe lock handling, transaction prerequisite mismatch, assessment/content mismatch, or hidden instructor dependency blocks release.

Validated commit/tag: ____________________