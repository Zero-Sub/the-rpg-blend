# Module 3 Lab — Order Access Increment

## Metadata

- **Estimated time:** 150–180 minutes
- **Tools:** VS Code, Code for IBM i, Db2 for IBM i; ACS optional
- **Prerequisite:** validated Module 2 base or instructor-approved equivalent
- **AI:** Bob review/reference only
- **Validation status:** design reviewed; pilot pending

## Scenario

Build and prove an RPG data-access increment over the Coffee Catalog. Demonstrate native I/O and embedded SQL, handle normal/failure conditions, and protect the environment when transaction prerequisites are uncertain.

## A — Context

Record host, profile, learner schema, build library, branch/commit, and Module 2 state. Stop if the base is not reconciled.

## B — Order Objects

Run `10_create_order_access.sql`, then prove:

- `ORDER_HEADER` / `ORDHDR` / `OHDRR`
- `ORDER_LINES` / `ORDLINE` / `OLINER`
- keys/constraints/system columns
- PRODUCT dependency

Seed with `11_seed_orders.sql`.

Expected static counts: 3 headers / 4 lines. Reconcile actual before continuing.

## C — Native Header Lookup

Compile `03_native_header_lookup.pgm.rpgle`. Test 5001 and a missing key. Record compile object proof, `%FOUND(ORDHDR)`, and output.

## D — Native Line Scan

Compile `03_native_line_scan.pgm.rpgle`. Predict/test 5001 (1 line) and 5003 (2). Explain partial ORDER_ID key, SETLL, READE, and EOF termination.

## E — Native Disposable Change

Prove 5901 unused, then compile/run `04_native_order_change.pgm.rpgle`. Evidence: absent → WRITE NEW → UPDATE READY → DELETE → absent. Stop on any mismatch.

## F — SELECT INTO

Compile/run `05_sql_product_lookup.pgm.sqlrpgle` for an existing and missing product. Record SQL condition and why the query is one-row-or-none.

## G — Cursor

Compile/run `06_sql_low_inventory.pgm.sqlrpgle`. Predict from validated Module 2 seed, record IDs/count, and prove normal no-data termination rather than treating every nonzero condition as EOF.

## H — Diagnostics

Compile/run `07_sql_diagnostics.pgm.sqlrpgle`. Capture the controlled CHECK failure: SQLSTATE, SQLCODE, diagnostic text/state, and protected rule. Do not weaken the constraint.

## I — Transaction Preflight

Complete `TRANSACTION_PREFLIGHT.md`.

If approved environment exists: run positive and rollback paths with 5950. Clean positive committed data before failure rerun. Prove success commits header+line and rollback leaves no partial rows.

If prerequisites are not proven: do not execute. Submit transaction design/failure matrix and use instructor execution evidence. This is the correct safety response.

## J — Engineering Decision

Design: display one order header and all its lines, including product name and current quantity on hand. Choose native, SQL, or mixed access and defend relationships, result shape, target resolution, errors, locks/transactions, tests, and any performance claim you refuse to make without evidence.

## Bob Review

Review two completed artifacts. Record accepted/corrected/rejected suggestion and evidence.

## Independent Defense

Explain compile/runtime target, CHAIN, READE termination, SELECT INTO cardinality, cursor no-data, SQL diagnostics, transaction prerequisites, and final access choice without Bob.

## Cleanup

Use `19_reset_module3.sql` only when instructed. Prove Module 2 CATEGORY/PRODUCT/INVENTORY remain.

## Pass

Reproducible evidence + required successful executions + safe transaction/alternate path + independent explanation + no critical safety failure.