# Module 3 Lab — Instructor Solution and Scoring Guide

**Instructor only**  
**Status:** static expected behavior; target execution pending

## Expected Module 3 Seed

- ORDER_HEADER: 3
- ORDER_LINES: 4
- line counts 5001/5002/5003 = 1/1/2
- header states: 5001 NEW 29.90; 5002 READY 24.95; 5003 COMPLETE 28.95
- header totals reconcile to line sums

## Object Mapping

| SQL | System | Format |
|---|---|---|
| ORDER_HEADER | ORDHDR | OHDRR |
| ORDER_LINES | ORDLINE | OLINER |

Require metadata/compile evidence before treating mapping as validated.

## Native

5001 CHAIN should be found in untouched seed. Missing key should be not found and learner must not process stale fields.

5003 line scan should count 2. Missing order should count 0.

5901 disposable cycle: prove absent, WRITE, re-read, UPDATE READY, re-read, DELETE, final absent. A pre-existing 5901 means stop/reconcile.

## Embedded SQL

PRODUCT_ID 1001 should match the validated Module 2 base. Missing product takes no-data path.

Cursor expected low-inventory IDs under current Module 2 seed: 1003 and 2001, count 2. Reconcile against the actual validated Module 2 tag.

Diagnostics: canonical insert should hit the Module 2 ACTIVE CHECK after collision preflight. Record actual SQLSTATE/SQLCODE/message during runtime validation.

## Transaction

Never penalize a learner for refusing to execute on failed preflight.

Approved environment expectation:

- success 5950 commits header + valid line
- cleanup success data before next run
- failure mode uses PRODUCT_ID 9999
- rollback leaves no 5950 header/line

## Scoring

| Area | Points |
|---|---:|
| Environment/prerequisite | 10 |
| DDL/naming | 10 |
| Native reads | 15 |
| Native changes | 15 |
| SELECT INTO | 10 |
| Cursor | 10 |
| Diagnostics | 10 |
| Transaction judgment/execution | 10 |
| Engineering decision | 5 |
| Bob evidence/defense | 5 |
| **Total** | **100** |

Pass 80+ and no critical safety failure.